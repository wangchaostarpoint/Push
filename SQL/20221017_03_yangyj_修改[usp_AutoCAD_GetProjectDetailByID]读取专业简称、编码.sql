 

-- =============================================
-- Author:		huangf
-- Create date: 2010-7-15
-- Description:	autoCAD WebService 使用
-- =============================================
ALTER PROCEDURE [dbo].[usp_AutoCAD_GetProjectDetailByID] 
	@Login_id varchar(36),			--用户工号
	@ProjectPhaseId varchar(36)		--项目编号
AS 
BEGIN
	--用户
	SELECT LoginId,UserName FROM OrganizationUsers WHERE LoginId=@Login_id;
	
	----项目
	SELECT OrganizationId,ProjectCode,ProjectName,ProjectType,a.FormDate,
    CASE WHEN a.ProjectState=0 THEN '新建未立项' WHEN a.ProjectState=1 THEN '已立项' 
    WHEN a.ProjectState=2 THEN '已启动' WHEN a.ProjectState=3 THEN '正在进行' WHEN a.ProjectState=4 THEN '暂停'
    WHEN a.ProjectState=5 THEN '终止' WHEN a.ProjectState=6 THEN '撤销' WHEN a.ProjectState=7 THEN '已完成'
    WHEN a.ProjectState=8 THEN '结束' END ProjectState,PhaseName Phase
    FROM EPMS_ProjectEntity a WHERE a.OrganizationId =@ProjectPhaseId
   
	--卷册唯一
	SELECT DISTINCT WBS.OrganizationID,WBSID,WBSCode,WBSName,SerialCode,ISNULL(SpecialityDrawName, ExecSpecialtyName) ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,PP.Authority,ExecSpecialtyID,WBSOwnerID
	INTO #ROLL
	FROM EPMS_WBSEntity WBS
	LEFT JOIN EPMS_ProjectPermision PP ON WBS.WBSID=PP.ObjectID AND PP.LoginID =@Login_id
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.Flag=1 AND ParamWBSTypeID IN (
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSMode IN('任务管理','成品管理')) AND 
	PP.OrganizationID =@ProjectPhaseId
	UNION
	SELECT DISTINCT WBS.OrganizationID,WBSID,WBSCode,WBSName,SerialCode,ISNULL(SpecialityDrawName, ExecSpecialtyName)  ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,Authority,ExecSpecialtyID,WBSOwnerID
	FROM EPMS_WBSEntity WBS
	LEFT JOIN EPMS_ProjectPermision PP ON WBS.WBSID=PP.ObjectID AND PP.LoginID =@Login_id
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.Flag=1 AND WBS.Flag=1 AND ParamWBSTypeID IN (
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSMode IN('任务管理','成品管理'))  
	AND WBS.WBSOwnerCode=@LOGIN_ID
	ORDER BY WBSCode
	
	SELECT * FROM #ROLL ORDER BY WBSCode

	--成品
	SELECT P.OrganizationId,P.WBSID,p.ProductID,REPLACE(p.ProductCode,'.dwg','.dwg') AS ProductCode,p.ProductName,
	ISNULL(PM.Length,0) as Length,ISNULL(PM.Width,0) as Width,SignState,PltState,PdfState,TifState,
	--套用图的权限是浏览，如果成品没有对应权限则默认为卷册的权限
	CASE WHEN P.IsReuse=1 THEN 3 WHEN PP1.Authority IS NULL THEN PP.Authority ELSE PP1.Authority END Authority,P.FileFormat
	FROM EPMS_ProductEntity P
	LEFT JOIN EPMS_ProjectPermision PP  ON PP.ObjectID=P.WBSID
	LEFT JOIN EPMS_ProjectPermision PP1 ON P.ProductID=PP1.ObjectID AND PP1.LoginID=@Login_id
	LEFT JOIN EPMS_ParamMapsize PM ON P.ParamMapsizeID=PM.ParamMapsizeID
	WHERE P.OrganizationID=@ProjectPhaseId AND pp.LoginID =@Login_id AND pp.OrganizationId =@ProjectPhaseId AND P.Flag=1
	
	--内部提出资料
	SELECT WBSID,WBSCode,WBSCode+'-'+WBSName WBSName,ISNULL(SpecialityDrawName, ExecSpecialtyName) ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,WBS.OrganizationID,WBS.ParentId,
	ExecSpecialtyID,WBSOwnerID--增加专业ID、任务负责人ID
	INTO #OutMutual
	FROM EPMS_WBSEntity WBS
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.ParamWBSTypeID IN(
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSType='内部专业间提资') AND WBS.Flag<>2
	--AND WBS.ParentId IN(SELECT WBSID FROM #ROLL)
	AND WBS.ExecSpecialtyID IN(SELECT DISTINCT R.ExecSpecialtyID FROM #ROLL R)--按照专业筛选
	
	SELECT * FROM #OutMutual
	
	SELECT F.FileId,ISNULL(FileCode,FileName) FileCode,FileName,R.ObjectId FileSourceId
	FROM PortalFileStorage F
	LEFT JOIN PortalFileRelation R ON F.FileId=R.FileId
	WHERE R.ObjectId IN (SELECT WBSID FROM #OutMutual)
	
	--内部接收资料
	SELECT RELE.FileItemID WBSID,WBSCode,WBSCode+'-'+WBSName WBSName,ISNULL(SpecialityDrawName, ExecSpecialtyName) ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,WBS.OrganizationID,'' ParentId,
	RELE.ParamSpecialtyID ExecSpecialtyID--增加专业ID
	INTO #InMutual
	FROM EPMS_WBSEntity WBS
	JOIN EPMS_FileReceiveSpecialty RELE ON WBS.WBSID=RELE.FileItemID
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.ParamWBSTypeID IN(
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSType='内部专业间提资') AND WBS.Flag<>2
	--AND RELE.ReleWBSID IN(SELECT WBSID FROM #ROLL)
	AND RELE.ParamSpecialtyID IN(SELECT DISTINCT R.ExecSpecialtyID FROM #ROLL R)--按照专业筛选
	
	SELECT * FROM #InMutual
	
	SELECT F.FileId,ISNULL(FileCode,FileName) FileCode,FileName,R.ObjectId FileSourceId
	FROM PortalFileStorage F
	LEFT JOIN PortalFileRelation R ON F.FileId=R.FileId
	WHERE R.ObjectId IN (SELECT WBSID FROM #InMutual)
	
	--外部资料
	SELECT WBSID,WBSCode,WBSCode+'-'+WBSName WBSName,ISNULL(SpecialityDrawName, ExecSpecialtyName) ExecSpecialtyName,
	ISNULL(SpecialityDrawCode, ExecSpecialtyCode) ExecSpecialtyCode,WBS.OrganizationID,WBS.ParentId,
	ExecSpecialtyID,WBSOwnerID--增加专业ID、任务负责人ID
	INTO #EXTERNAL
	FROM EPMS_WBSEntity WBS
	LEFT JOIN EPMS_ParamSpecialty PS ON WBS.ExecSpecialtyID=PS.ParamSpecialtyID 
	WHERE WBS.OrganizationID=@ProjectPhaseId AND WBS.ParamWBSTypeID IN(
		SELECT ParamWBSTypeID FROM EPMS_ParamWBSType WHERE WBSType='外部接口资料接收') AND WBS.Flag<>2
	--AND WBS.ParentId IN(SELECT WBSID FROM #ROLL)
	AND WBS.ExecSpecialtyID IN(SELECT DISTINCT R.ExecSpecialtyID FROM #ROLL R)--按照专业筛选
	
	SELECT * FROM #EXTERNAL
	
	SELECT F.FileId,ISNULL(FileCode,FileName) FileCode,FileName,R.ObjectId FileSourceId
	FROM PortalFileStorage F
	LEFT JOIN PortalFileRelation R ON F.FileId=R.FileId
	WHERE R.ObjectId IN (SELECT WBSID FROM #EXTERNAL)
	
	--删除临时表
	DROP TABLE #ROLL
	DROP TABLE #OutMutual
	DROP TABLE #InMutual
	DROP TABLE #EXTERNAL
	
END

GO


