--�׶β������ӽ׶μ�Ʊ���
ALTER TABLE EPMS_ParamProjectPhase ADD PhaseDrawCode NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�׶μ�Ʊ���' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_ParamProjectPhase', @level2type=N'COLUMN',@level2name=N'PhaseDrawCode'
GO

--רҵ��������רҵ��Ʊ���,רҵ���
ALTER TABLE EPMS_ParamSpecialty ADD SpecialityDrawCode NVARCHAR(32),SpecialityDrawName NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'רҵ��Ʊ���' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_ParamSpecialty', @level2type=N'COLUMN',@level2name=N'SpecialityDrawCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'רҵ���' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_ParamSpecialty', @level2type=N'COLUMN',@level2name=N'SpecialityDrawName'
GO