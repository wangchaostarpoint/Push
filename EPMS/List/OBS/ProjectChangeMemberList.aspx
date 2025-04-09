<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectChangeMemberList.aspx.cs"
    Title="项目组成员变更记录" MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EPMS.List.OBS.ProjectChangeMemberList" %>
    <%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>    
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeProject" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeProject_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工号/姓名</span> <span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《项目组成员变更》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" AllowPaging="True" PageSize="15" ID="gvAll"
        runat="server" AllowSorting="true" AutoGenerateColumns="False" ShowExport="true"
        DataKeyNames="OrganizationUsersInRolesID" UseDefaultDataSource="true" OnRowDataBound="gvAll_RowDataBound"
        BindGridViewMethod="BindGrid">
        <Columns>
            <asp:BoundField DataField="UnitPostName" HeaderText="角色" ItemStyle-Width="120px" />
            <asp:BoundField DataField="LoginId" HeaderText="工号" ItemStyle-Width="50px" />
            <asp:BoundField DataField="UserName" HeaderText="姓名" ItemStyle-Width="60px" />
            <asp:TemplateField HeaderText="部门" ItemStyle-Width="160px">
                <ItemTemplate>
                    <asp:Label ID="lbDept" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LeaveDate" HeaderText="卸任时间" ItemStyle-Width="80px" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="MobilePhone" HeaderText="手机" ItemStyle-Width="140px" />
            <asp:BoundField DataField="Phone" HeaderText="座机" ItemStyle-Width="80px" />
            <asp:BoundField DataField="Email" HeaderText="邮箱" ItemStyle-Width="80px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function InitCustomerPlugin() {
        }

        function ShowLoadStatisticDetailList(userID, loginID, userName) {
            var url = "../ProjectHR/LoadStatisticDetailList.aspx?UserID=" + userID + "&LoginID=" + loginID + "&UserName=" + escape(userName) + "&OrganizationId=" + "<%=OrganizationId %>";
            var stringFeatures = "dialogHeight: 700px; dialogWidth: 900px; edge: Raised; center: Yes; help: Yes; resizable: Yes; scroll: Yes; status: Yes;";
            window.showModalDialog(url, "", stringFeatures);
            return false;
        }

        function DetailOfWork(userID) {
            var url = "../ProjectHR/CurrentTaskDetailList.aspx?userId=" + userID; //  + "&OrganizationId=<%=OrganizationId %>";
            var stringFeatures = "dialogHeight: 700px; dialogWidth: 900px; edge: Raised; center: Yes; help: Yes; resizable: Yes; scroll: Yes; status: Yes;";
            window.showModalDialog(url, "", stringFeatures);
            return false;
        }
        //发起《项目组成员变更》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSProjMemberChange.xpdl', xpdlId: 'ProjMemberChange_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProjMemberChange.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationId%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
