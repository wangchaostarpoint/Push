--�׶���Ŀ��������Ŀ��Ʊ���
ALTER TABLE EPMS_ProjectEntity ADD ProjectDrawCode NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��Ʊ���' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_ProjectEntity', @level2type=N'COLUMN',@level2name=N'ProjectDrawCode'
GO

--�г���Ŀ��������Ŀ��Ʊ���
ALTER TABLE MM_MarketProjectEntity ADD ProjectDrawCode NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��Ʊ���' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MM_MarketProjectEntity', @level2type=N'COLUMN',@level2name=N'ProjectDrawCode'
GO

--����֪ͨ��������Ŀ��Ʊ���
ALTER TABLE EPMS_SurveyDesignProjForm ADD ProjectDrawCode NVARCHAR(32)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��Ʊ���' , 
@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EPMS_SurveyDesignProjForm', @level2type=N'COLUMN',@level2name=N'ProjectDrawCode'
GO