<%@ Page Language="C#" AutoEventWireup="true" Title="人员资质设置" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="QualificOfUserList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.QualificOfUserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">人员信息</span> <span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span><span class="filter-block-lb">资质类型</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlQualificType" CssClass="kpms-ddlsearch" />
    </span>
        <span class="filter-block-lb">工程类别</span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" CssClass="kpms-ddlsearch" /></span>
        <span class="filter-block-lb">部门</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlDept" CssClass="kpms-ddlsearch" /></span>
        <span class="filter-block-lb">专业</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" CssClass="kpms-ddlsearch" /></span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" Style="word-break: break-all; word-wrap: break-word;"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true"
        AllowSorting="true" DataKeyNames="UserID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="LoginID" HeaderText="工号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="部门" HeaderStyle-Width="120px">
                <ItemTemplate>
                    <asp:Label ID="lbDeptName" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="资格信息">
                <ItemTemplate>
                    <asp:Label ID="lbQualificName" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <%--选择专业模式：专业、专业类型--%>
    <input type="hidden" runat="server" id="hiSpeMode" value="SpeType" />

    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

        function beforeDialog(actionType, bizId) {
            var url = buildBizUrl(actionType, bizId, "EPMS/List/OBS/QualificOfUserEditor.aspx", null);
            switch (actionType) {
                case "1":
                    showDivDialog(encodeURI(url), null, 1000, 600, null);
                    break;
                case "3":
                case "2":
                    showDivDialog(encodeURI(url), null, 1000, 600, rebindGridData);
                    break;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

