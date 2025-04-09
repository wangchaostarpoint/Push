<%@ Page Language="C#" AutoEventWireup="true" Title="质量信息利用台帐" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="QualityInfoUseList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.QualityInfoUseList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>项目编号/名称 </span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject"  CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span>卷册编号/名称 </span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbRoll"  CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span>项目类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>卷册负责人 </span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbRollOwner"  CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span>申请日期 </span><span>
        <zhongsoft:XHtmlInputText ID="txtStartTime" runat="server" class="kpms-textbox-date"
            readonly="readonly" />
        -
        <zhongsoft:XHtmlInputText ID="txtEndTime" runat="server" class="kpms-textbox-date"
            readonly="readonly" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="WBSID"
        UseDefaultDataSource="false" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="卷册状态">
                <ItemTemplate>
                    <%# Enum.GetName(typeof(DAL.EPMS.WBSState), Eval("WBSState"))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="FactStartTime" HeaderText="实际开始日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="可利用的质量信息条数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <%# Eval("CanUseNum")%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已利用的质量信息条数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <%# Eval("UsedNum")%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
