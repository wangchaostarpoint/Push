<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectUserList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectUserList" Title="项目人员负荷预警"
    MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
        <div style="background-color: #EFF2F7;" id="divQuery">
            <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span><span>
                <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox></span>
            </span><span class="filter-block"><span class="filter-block-lb">姓名/工号</span><span>
                <asp:TextBox ID="tbUserInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox></span>
            </span><span class="filter-block"><span class="filter-block-lb">所在部门</span><span>
                <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvProjUser" AutoGenerateColumns="false" AllowFrozing="true"
        FrozenColNum="2" runat="server" BindGridViewMethod="BindDataGrid" AllowPaging="true"
        PageSize="10" ShowPageSizeChange="true" UseDefaultDataSource="true" AllowSorting="true"
        OnSorting="gvProjUser_Sorting" OnRowDataBound="gvProjUser_RowDataBound" Width="100%">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="工号/姓名" SortExpression="UserName" ItemStyle-Width="40%">
                <ItemTemplate>
                    <%#string.Format("{0}/{1}", Eval("LoginId"), Eval("UserName"))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="部门" ItemStyle-Width="30%">
                <ItemTemplate>
                    <asp:Label ID="lbDept" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Phone" HeaderText="座机" ItemStyle-Width="20%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="当前工作">
                <ItemTemplate>
                    <a id="work" onclick="viewUserState('<%#Eval("UserId")%>')">
                        <asp:Label ID="lbTask" runat="server" Text=""></asp:Label>
                    </a><a>
                        <asp:Label ID="lbMyPlan" runat="server"></asp:Label></a> <a>
                            <asp:Label ID="lbOtherPlan" runat="server"></asp:Label></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvProjUser.CheckedClientID %>";

        //查看人员状态
        function viewUserState(userID) {
            var url = "/EPMS/List/OBS/CurrentTaskDetailList.aspx";
            var json = { userid: userID, secid: "C3455630-E393-4F75-B471-0E9151C39A6B" };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }
        //查看卷册
        function viewDetail(rollID) {
            var url = "/EPMS/List/WBS/C_RollList.aspx";
            var json = { RollIds: rollID, secid: "9dd62921-edc5-4767-b46a-817756ea5ca7" };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }
    </script>
</asp:Content>
