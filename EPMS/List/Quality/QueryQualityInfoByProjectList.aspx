<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryQualityInfoByProjectList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Quality.QueryQualityInfoByProjectList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">分院</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目名称/编号</span>
        <span>
            <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
                CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
            <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
    <span class="filter-block"><span class="filter-block-lb">设计阶段</span><span>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <asp:LinkButton runat="server" ID="lbtnReBindPhase" OnClick="ddlProjectType_SelectedIndexChanged"
        Style="display: none"></asp:LinkButton>
    <span class="filter-block"><span class="filter-block-lb">校审完成时间</span>
        <span>
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSProjectFormDate"
                runat="server" readonly="readonly" comapre="1" />
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFProjectFormDate"
                runat="server" readonly="readonly" compare="1" />
        </span></span>

    <!--隐藏高级查询-->
    <span class="filter-block" flag="conditionHide"><span class="filter-block-lb">实际室交出</span>
        <span>
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSFactRecheckTime1"
                runat="server" readonly="readonly" compare="1" />
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFFactRecheckTime1"
                runat="server" readonly="readonly" compare="1" />
        </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <asp:Label runat="server" ID="lbTitle" Style="font-weight: bold"></asp:Label>&nbsp;
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjQuality" AutoGenerateColumns="false" AllowFrozing="true" FrozenColNum="5" FrozenHeight="430px"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        UseDefaultDataSource="true" ShowPageSizeChange="true" OnRowDataBound="gvProjQuality_RowDataBound"
        PageSize="10" FooterStyle-ForeColor="Red" ShowFooter="true" OnRowCreated="gvProjQuality_RowCreated">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="BelongDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ShowToolTip="true"
                Width="300">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务数" DataField="RollSum" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="标准张<br/>合计" DataField="NewStandardMapSum"
                HtmlEncode="false" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="重要技术" DataField="ImportantTechnicalMistakeSum" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="一般性" DataField="CommonMistakeSum" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="一般性差错率" DataField="CommonMistakeSumRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="优" DataField="QualityLevelIsY" ItemStyle-HorizontalAlign="Right" Visible="false">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="良" DataField="QualityLevelIsL" ItemStyle-HorizontalAlign="Right" Visible="false">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合格" DataField="QualityLevelIsHG" ItemStyle-HorizontalAlign="Right" Visible="false">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="不合格" DataField="QualityLevelIsBHG" ItemStyle-HorizontalAlign="Right" Visible="false">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="优等品<br/>率%" DataField="YLevelRate" ItemStyle-HorizontalAlign="Right" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="优良品<br/>率%" DataField="YLLevelRate" ItemStyle-HorizontalAlign="Right" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合格品<br/>率%" DataField="HGLevelRate" ItemStyle-HorizontalAlign="Right" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="利用质量<br/>信息条数" HtmlEncode="false" DataField="UseQualityInfoSum"
                ItemStyle-HorizontalAlign="Right" Visible="false">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="活用图率" DataField="AverageActiveRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            setConditionHide();
            $("#<%=ddlProjectType.ClientID %>").live("change", function () { afterProjectTypeChange(); });
        }
        function afterProjectTypeChange() {
            <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnReBindPhase, "")%>;
        }
        // 隐藏筛选条件
        function setConditionHide() {
            $('[flag="conditionHide"]').hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
