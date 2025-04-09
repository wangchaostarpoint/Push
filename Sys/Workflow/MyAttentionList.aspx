<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAttentionList.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.MyAttentionList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">标题</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbTitle" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox></span></span> <span class="filter-block">
                <span class="filter-block-lb">发起人</span><span>
                    <zhongsoft:LightTextBox runat="server" ID="tbUser" CssClass="kpms-textboxsearch"
                        EnableTheming="false"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">关注日期</span><span>
        <zhongsoft:XHtmlInputText ID="txtStart" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
            compare="1">
        </zhongsoft:XHtmlInputText>
        至<zhongsoft:XHtmlInputText ID="txtEnd" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
            compare="1">
        </zhongsoft:XHtmlInputText>
    </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="lpgMyAttention" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowFooter="false" ShowExport="true"
        DataKeyNames="ProcessInstanceId" BindGridViewMethod="BindGrid" UseDefaultDataSource="true"
        OnRowCommand="lpgMyAttention_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField>
                <HeaderTemplate>
                    序号
                </HeaderTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <%#Container.DisplayIndex+1 %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="流程标题">
                <ItemTemplate>
                    <%#  Eval("WORKFLOWURL").ToString()%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="发起人" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AttentionDate" HeaderText="关注日期" DataFormatString="{0:yyyy-MM-dd }"
                ItemStyle-Width="70px" ItemStyle-Wrap="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="取消关注" CommandName="DeleteData" DeleteText="是否取消关注"
                DataParamFields="ProcessInstanceId">
            </zhongsoft:LightButtonField>
        </Columns>
        <FooterStyle HorizontalAlign="Right" ForeColor="Red" Font-Bold="true" />
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=lpgMyAttention.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
