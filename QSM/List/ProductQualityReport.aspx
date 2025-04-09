<%@ Page Title="产品质量统计报表" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ProductQualityReport.aspx.cs" Inherits="Zhongsoft.Portal.QSM.List.ProductQualityReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" style="display: none;"><span class="filter-block-lb">项目名称/编号</span>
        <span>
            <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
                CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span>
    <span class="filter-block"><span class="filter-block-lb">任务名称/编号</span>
        <span>
            <zhongsoft:LightTextBox ID="tbWbsInfo" search="1" runat="server" MaxLength="64"
                CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvRollQuality" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindData"
        UseDefaultDataSource="True" ShowPageSizeChange="true" 
        PageSize="15" FooterStyle-ForeColor="Red" AutoReCreateHeaderRow="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectNameNew" ShowToolTip="true"
                Width="250" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode" />
            <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName" />
            <zhongsoft:LightBoundField HeaderText="自然张数&&图纸" DataField="ImgCount" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="自然张数&&其他" DataField="WBCount" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="折表张数<br>（总计）" DataField="NewStandardAllSum" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="差错个数&&原则性" DataField="PrincipledMistakeSum" ItemStyle-HorizontalAlign="Right" Visible="false">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="差错个数&&一般性" DataField="CommonMistakeSum" ItemStyle-HorizontalAlign="Right"
                Width="70">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="差错个数&&重要技术" DataField="TechnicalMistakeSum" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="质量等级" DataField="CommonMistakeSumRate" ItemStyle-HorizontalAlign="Right" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="审批时间" DataField="VerifyEndDate" DataFormatString="{0:yyyy-MM-dd}" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
