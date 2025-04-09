 

-- =============================================
-- Author:		huangf
-- Create date: 2010-7-15
-- Description:	autoCAD WebService ʹ��
-- =============================================
ALTER PROCEDURE [dbo].[usp_AutoCAD_GetProjectDetailByID] 
	@Login_id varchar(36),			--�û�����
	@ProjectPhaseId varchar(36)		--��Ŀ���
AS 
BEGIN
	--�û�
	SELECT LoginId,UserName FROM OrganizationUsers WHERE LoginId=@Login_id;
	
	----��Ŀ
	SELECT OrganizationId,ProjectCode,ProjectName,ProjectType,a.FormDate,
    CASE WHEN a.ProjectState=0 THEN '�½�δ����' WHEN a.ProjectState=1 THEN '������' 
    WHEN a.ProjectState=2 THEN '������' WHEN a.ProjectState=3 THEN '���ڽ���' WHEN a.ProjectState=4 THEN '��ͣ'
    WHEN a.ProjectState=5 THEN '��ֹ' WHEN a.ProjectState=6 THEN '����' WHEN a.ProjectState=7 THEN '�����'
    WHEN a.ProjectState=8 THEN '����' END ProjectState,PhaseName Phase
    FROM EPMS_ProjectEntity a WHERE a.OrganizationId =@ProjectPhaseId
   
	--���Ψһ
	SELECT DISTINCT WBS.OrganizationID,WBSID,WBSCode,WBSName,SerialCode,ISNULL(SpecialityDrawName, ExecSpecialtyName) ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,PP.Authority,ExecSpecialtyID,WBSOwnerID
	INTO #ROLL
	FROM EPMS_WBSEntity WBS
	LEFT JOIN EPMS_ProjectPermision PP ON WBS.WBSID=PP.ObjectID AND PP.LoginID =@Login_id
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.Flag=1 AND ParamWBSTypeID IN (
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSMode IN('�������','��Ʒ����')) AND 
	PP.OrganizationID =@ProjectPhaseId
	UNION
	SELECT DISTINCT WBS.OrganizationID,WBSID,WBSCode,WBSName,SerialCode,ISNULL(SpecialityDrawName, ExecSpecialtyName)  ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,Authority,ExecSpecialtyID,WBSOwnerID
	FROM EPMS_WBSEntity WBS
	LEFT JOIN EPMS_ProjectPermision PP ON WBS.WBSID=PP.ObjectID AND PP.LoginID =@Login_id
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.Flag=1 AND WBS.Flag=1 AND ParamWBSTypeID IN (
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSMode IN('�������','��Ʒ����'))  
	AND WBS.WBSOwnerCode=@LOGIN_ID
	ORDER BY WBSCode
	
	SELECT * FROM #ROLL ORDER BY WBSCode

	--��Ʒ
	SELECT P.OrganizationId,P.WBSID,p.ProductID,REPLACE(p.ProductCode,'.dwg','.dwg') AS ProductCode,p.ProductName,
	ISNULL(PM.Length,0) as Length,ISNULL(PM.Width,0) as Width,SignState,PltState,PdfState,TifState,
	--����ͼ��Ȩ��������������Ʒû�ж�ӦȨ����Ĭ��Ϊ����Ȩ��
	CASE WHEN P.IsReuse=1 THEN 3 WHEN PP1.Authority IS NULL THEN PP.Authority ELSE PP1.Authority END Authority,P.FileFormat
	FROM EPMS_ProductEntity P
	LEFT JOIN EPMS_ProjectPermision PP  ON PP.ObjectID=P.WBSID
	LEFT JOIN EPMS_ProjectPermision PP1 ON P.ProductID=PP1.ObjectID AND PP1.LoginID=@Login_id
	LEFT JOIN EPMS_ParamMapsize PM ON P.ParamMapsizeID=PM.ParamMapsizeID
	WHERE P.OrganizationID=@ProjectPhaseId AND pp.LoginID =@Login_id AND pp.OrganizationId =@ProjectPhaseId AND P.Flag=1
	
	--�ڲ��������
	SELECT WBSID,WBSCode,WBSCode+'-'+WBSName WBSName,ISNULL(SpecialityDrawName, ExecSpecialtyName) ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,WBS.OrganizationID,WBS.ParentId,
	ExecSpecialtyID,WBSOwnerID--����רҵID����������ID
	INTO #OutMutual
	FROM EPMS_WBSEntity WBS
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.ParamWBSTypeID IN(
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSType='�ڲ�רҵ������') AND WBS.Flag<>2
	--AND WBS.ParentId IN(SELECT WBSID FROM #ROLL)
	AND WBS.ExecSpecialtyID IN(SELECT DISTINCT R.ExecSpecialtyID FROM #ROLL R)--����רҵɸѡ
	
	SELECT * FROM #OutMutual
	
	SELECT F.FileId,ISNULL(FileCode,FileName) FileCode,FileName,R.ObjectId FileSourceId
	FROM PortalFileStorage F
	LEFT JOIN PortalFileRelation R ON F.FileId=R.FileId
	WHERE R.ObjectId IN (SELECT WBSID FROM #OutMutual)
	
	--�ڲ���������
	SELECT RELE.FileItemID WBSID,WBSCode,WBSCode+'-'+WBSName WBSName,ISNULL(SpecialityDrawName, ExecSpecialtyName) ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,WBS.OrganizationID,'' ParentId,
	RELE.ParamSpecialtyID ExecSpecialtyID--����רҵID
	INTO #InMutual
	FROM EPMS_WBSEntity WBS
	JOIN EPMS_FileReceiveSpecialty RELE ON WBS.WBSID=RELE.FileItemID
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.ParamWBSTypeID IN(
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSType='�ڲ�רҵ������') AND WBS.Flag<>2
	--AND RELE.ReleWBSID IN(SELECT WBSID FROM #ROLL)
	AND RELE.ParamSpecialtyID IN(SELECT DISTINCT R.ExecSpecialtyID FROM #ROLL R)--����רҵɸѡ
	
	SELECT * FROM #InMutual
	
	SELECT F.FileId,ISNULL(FileCode,FileName) FileCode,FileName,R.ObjectId FileSourceId
	FROM PortalFileStorage F
	LEFT JOIN PortalFileRelation R ON F.FileId=R.FileId
	WHERE R.ObjectId IN (SELECT WBSID FROM #InMutual)
	
	--�ⲿ����
	SELECT WBSID,WBSCode,WBSCode+'-'+WBSName WBSName,ISNULL(SpecialityDrawName, ExecSpecialtyName) ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,WBS.OrganizationID,WBS.ParentId,
	ExecSpecialtyID,WBSOwnerID--����רҵID����������ID
	INTO #EXTERNAL
	FROM EPMS_WBSEntity WBS
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.ParamWBSTypeID IN(
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSType='�ⲿ�ӿ����Ͻ���') AND WBS.Flag<>2
	--AND WBS.ParentId IN(SELECT WBSID FROM #ROLL)
	AND WBS.ExecSpecialtyID IN(SELECT DISTINCT R.ExecSpecialtyID FROM #ROLL R)--����רҵɸѡ
	
	SELECT * FROM #EXTERNAL
	
	SELECT F.FileId,ISNULL(FileCode,FileName) FileCode,FileName,R.ObjectId FileSourceId
	FROM PortalFileStorage F
	LEFT JOIN PortalFileRelation R ON F.FileId=R.FileId
	WHERE R.ObjectId IN (SELECT WBSID FROM #EXTERNAL)
	
	--ɾ����ʱ��
	DROP TABLE #ROLL
	DROP TABLE #OutMutual
	DROP TABLE #InMutual
	DROP TABLE #EXTERNAL
	
END

GO


