<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrgUsersList.aspx.cs" MasterPageFile="~/UI/Master/ObjectList.Master"
    Inherits="Zhongsoft.Portal.Sys.OrgUsers.OrgUsersList" %>

<%@ Register Src="~/UI/Controls/OrgTree.ascx" TagName="OrgTree" TagPrefix="uc" %>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
    <div>
        <uc:OrgTree ID="orgTree" Flag="1" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工号/姓名(拼音简写)</span> <span>
        <asp:TextBox ID="tbUserCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">是否在职</span> <span>
        <asp:RadioButtonList ID="rbFlag" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Value="1" Selected="True">在职</asp:ListItem>
            <asp:ListItem Value="0">不在职</asp:ListItem>
        </asp:RadioButtonList>
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnBatch" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return BatchAdd()" OnClick="btnBatch_Click"><span>
         <img  src="../../Themes/Images/btn_subtoolbarnew.gif" width="16" height="16"/>批量添加用户</span></asp:LinkButton>
    </div>
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnAddOffical1" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return EditOffical('2')"><span>添加下级部门</span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnModifyOffical1" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return EditOffical('3')"><span> 编辑当前部门</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="lpgUser" runat="server"
        BindGridViewMethod="DataGridBind" ShowExport="True" Width="100%" DataKeyNames="UserId" AllowSorting="true"
        OnRowCommand="UserProfile_RowCommand" OnRowDataBound="UserProfile_RowDataBound" HideFieldOnExport="编辑">
        <Columns>
            <asp:BoundField DataField="LoginId" SortExpression="LoginId" HeaderText="工号" HeaderStyle-Width="10%" />
            <asp:BoundField DataField="UserName" HeaderText="姓名" HeaderStyle-Width="10%" />
            <asp:BoundField DataField="Sex" HeaderText="性别" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="OrgAllPath" HeaderText="组织机构" HeaderStyle-Width="20%" />
           <%-- <asp:BoundField DataField="OrganizationName" HeaderText="部门" HeaderStyle-Width="20%" />--%>
            <asp:TemplateField HeaderText="扩展部门" HeaderStyle-Width="20%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblOrgExtend"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Phone" HeaderText="工作电话" HeaderStyle-Width="10%" />
            <asp:BoundField DataField="MobilePhone" HeaderText="手机" HeaderStyle-Width="10%" />
            <asp:BoundField DataField="Email" HeaderText="邮箱" HeaderStyle-Width="10%" />
            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" CausesValidation="False" runat="server" EnableTheming="false"
                        CommandName="EditData">
									<img id="imgEdit" alt="" title="编辑" style="CURSOR: hand" 
									onclick="return UserEditor('3','<%#Eval("UserId") %>');"
									 src="../../Themes/Images/btn_dg_edit.gif"border="0"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript" language="javascript">
        function UserEditor(actionType, bizId) {
            var url = "<%=WebAppPath %>/sys/OrgUsers/UserEditor.aspx?actionType=" + actionType;

            if (actionType == '3'
                || actionType == '1') {
                url += "&bizId=" + bizId;
            }

            var dom = showDivDialog(url, "", "650", "420", afterUserEditor);
            if (dom != undefined) {
                return true;
            }
            return false;
        }

        function afterUserEditor(re) {
            if (re != null) {
                <%=this.Page.ClientScript.GetPostBackEventReference(this.btnBatch, "")%>;
            }
            return false;
        }

        function BatchAdd() {
            var url = "BatchAddUser.aspx?officalId=<%=OrganiztionId.ToString() %>&officalname=" + escape('<%=OrganizationName %>');
            var stringFeatures = "dialogHeight: 250px; dialogWidth: 550px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;";

            if ('<%=OrganiztionId.ToString()%>' == '') {
                alert("请先选择一个部门！");
            }
            else {
                url = "/sys/OrgUsers/" + url;
                showDivDialog(url, null, 550, 350, null);
                //                var returnVal = window.showModalDialog(url, null, stringFeatures);
                //                if (returnVal != null)
                //                    return true;
            }

            return false;
        }

        function EditOffical(actionType) {
            var orgId = '<%=OrganiztionId.ToString()%>';
            var url = "OfficalEditor.aspx?actionType=" + actionType + "&parentId=" + orgId;
            var stringFeatures = "dialogHeight: 350px; dialogWidth: 550px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;";

            if (actionType == '3') {
                url += "&bizId=" + orgId
            }

            if (orgId == '') {
                alert("请先选择一个部门！");
            }
            else {
                url = "/sys/OrgUsers/" + url;
                //var result = window.showModalDialog(url, null, stringFeatures);
                showDivDialog(url, null, 550, 350, reloadTree);
                return false;
            }

            return false;
        }
        function reloadTree(rr) {
            window.location.href = window.location;;
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
