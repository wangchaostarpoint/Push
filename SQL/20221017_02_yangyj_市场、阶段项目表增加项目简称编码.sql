--阶段项目表增加项目简称编码
ALTER TABLE EPMS_ProjectEntity ADD ProjectDrawCode NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目简称编码' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_ProjectEntity', @level2type=N'COLUMN',@level2name=N'ProjectDrawCode'
GO

--市场项目表增加项目简称编码
ALTER TABLE MM_MarketProjectEntity ADD ProjectDrawCode NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目简称编码' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MM_MarketProjectEntity', @level2type=N'COLUMN',@level2name=N'ProjectDrawCode'
GO

--勘测通知单增加项目简称编码
ALTER TABLE EPMS_SurveyDesignProjForm ADD ProjectDrawCode NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目简称编码' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_SurveyDesignProjForm', @level2type=N'COLUMN',@level2name=N'ProjectDrawCode'
GO