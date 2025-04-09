<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivityAttachAclMgr.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Acl.ActivityAttachAclMgr" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <zhongsoft:LightObjectSelector runat="server" ID="lbosFormName" SourceMode="SelectorPage"
        ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" Writeable="false"
        IsMutiple="true" PageUrl="~/Sys/Workflow/WfFormSelector.aspx"></zhongsoft:LightObjectSelector>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvAclSetting" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="12" OnBeforeExporting="gvAclSetting_BeforeExporting"
        UseDefaultDataSource="true" AllowSorting="true" BindGridViewMethod="BindgvAclSetting"
        DataKeyNames="PortalActivityAttachACLID" OnRowCommand="gvAclSetting_RowCommand"
        OnRowDataBound="gvAclSetting_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="流程名称" ItemStyle-Width="250px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFormName" Text='<%#Eval("FormName") %>'></asp:Label>
                    <zhongsoft:LightObjectSelector runat="server" ID="lbosSelCustomer" SourceMode="SelectorPage"
                        IsMutiple="true" Text="选择步骤" OnlyShowButton="true" ShowJsonRowColName="true"
                        DoCancel="false" ResultAttr="name" Writeable="false" OnClick="lbtnSelCustomer_Click"
                        ShowAttrs="name" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
                    <%--  <input type="hidden" runat="server" id="hiMapping" value='<%#Eval("MAPPINGID") %>' />--%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="步骤名称" DataField="ActivityName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除吗？">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
