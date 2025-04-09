--阶段参数增加阶段简称编码
ALTER TABLE EPMS_ParamProjectPhase ADD PhaseDrawCode NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阶段简称编码' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_ParamProjectPhase', @level2type=N'COLUMN',@level2name=N'PhaseDrawCode'
GO

--专业参数增加专业简称编码,专业简称
ALTER TABLE EPMS_ParamSpecialty ADD SpecialityDrawCode NVARCHAR(32),SpecialityDrawName NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专业简称编码' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_ParamSpecialty', @level2type=N'COLUMN',@level2name=N'SpecialityDrawCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专业简称' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_ParamSpecialty', @level2type=N'COLUMN',@level2name=N'SpecialityDrawName'
GO