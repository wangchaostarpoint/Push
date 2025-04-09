<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="UserGroupMgr.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserGroupMgr" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="toolBar">
 
    <span class="filter-block"><span class="filter-block-lb">分组名</span> <span>
        <asp:TextBox ID="tbGroup" runat="server" Cssclass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">权&nbsp;限</span> <span>
        <asp:DropDownList runat="server" ID="ddlISPUBLIC" class="kpms-ddlsearch" EnableTheming="false">
                    <asp:ListItem Value="" Text="全部"></asp:ListItem>
                    <asp:ListItem Value="0" Text="私有"></asp:ListItem>
                    <asp:ListItem Value="1" Text="公有"></asp:ListItem>
                </asp:DropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <table class="tz-table" style="border-collapse: collapse;">
            <tr>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="LinkButton1"
                        OnClientClick="return newDetail('2');" ToolTip='新建' OnClick="btnNew_Click">
                        <span>
                            <img src="../../Themes/Images/btn_new.gif" width="16" height="16" />新建</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnEdit"
                        AccessLevel="4" OnClientClick="return newDetail('3')" ToolTip='编辑' OnClick="btnEdit_Click"
                        Style="display: none">
                        <span>
                            <img src="../../Themes/Images/btn_editor.gif" width="16" height="16" />编辑</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnView"
                        OnClientClick="return newDetail('1');" ToolTip='查看' Style="display: none">
                        <span>
                            <img src="../../Themes/Images/btn_chakan.gif" width="16" height="16" />查看</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnDelete"
                        OnClick="btnDelete_Click" OnClientClick="return confirm('确定删除?');" ToolTip='删除'
                        Style="display: none">
                        <span>
                            <img src="../../Themes/Images/btn_delete.gif" width="16" height="16" />删除</span>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div class="subtoolbarbg">
        <table>
            <tr>
                <td>
                    <span class="req-star">分组管理(双击行维护分组员工)</span>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="listGrid">
    <zhongsoft:LightPowerGridView ID="gvGroup" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" DataKeyNames="USERGROUPID" AllowPaging="true" PageSize="10"
        AllowSorting="true" ShowExport="true" BindGridViewMethod="BindGroupGrid" OnRowCommand="gvGroup_RowCommand"
        OnRowDataBound="gvGroup_RowDataBound" BindJsonClick="true" OnJsonClick="selGroup">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="setRowIds">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="分组名" DataField="USERGROUPNAME" SortExpression="USERGROUPNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="权限" DataField="ISPUBLIC2">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="管理人" DataField="OWNERNAME" SortExpression="OWNERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否启用" DataField="FLAG2">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiRowIds" />
    <input type="hidden" runat="server" id="hiPublicIds" />
    <script>
        var $hiRowIds = $("#<%=hiRowIds.ClientID %>");
        var $hiPublicIds = $("#<%=hiPublicIds.ClientID %>");
        var $btnEdit = $("#<%=btnEdit.ClientID %>");
        var $btnView = $("#<%=btnView.ClientID %>");
        var $btnDelete = $("#<%=btnDelete.ClientID %>");
        $gridCheckedClientID = "<%=gvGroup.CheckedClientID %>";
        function initCustomerPlugin() {
            //兼容"先加载分组人员列表,再选中编辑某个分组后,编辑、查看等按钮消失"的问题
            //统一用$gridCheckedClientID，获得实时当前选中项
            setRowIds(buildGirdRowIds($gridCheckedClientID));
        }

        function setRowIds(arry) {
            //$hiRowIds.val(arry.toString());
            var publicIds = $hiPublicIds.val();
            if (arry.length == 0) {
                $btnEdit.hide();
                $btnView.hide();
                $btnDelete.hide();
            }
            else if (arry.length == 1) {
                $btnView.show();
                if (publicIds.indexOf(arry[0]) >= 0) {
                    $btnEdit.hide();
                    $btnDelete.hide();
                }
                else {
                    $btnEdit.show();
                    $btnDelete.show();
                }
            }
            else if (arry.length > 1) {
                $btnView.hide();
                $btnEdit.hide();
                var show = true;
                for (var i = 0; i < arry.length; i++) {
                    if (publicIds.indexOf(arry[i]) >= 0) {
                        show = false;
                    }
                }
                if (show) {
                    $btnDelete.show();
                }
                else {
                    $btnDelete.hide();
                }
            }
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="detailContent">
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td class="tz-title">
                        <asp:Label ID="lbGroup" runat="server" Font-Bold="true"></asp:Label>
                        <asp:LinkButton ID="btnAddUser" runat="server" OnClientClick="return selUser();"
                            OnClick="btnAddUser_Click" CssClass="btn-link" Visible="false"><span>添加分组员工</span></asp:LinkButton>
                        <asp:LinkButton ID="btnUpdateUser" runat="server" CssClass="btn-link" OnClick="btnUpdateUser_Click" Visible="false"  >
                            <span>更新分组员工</span></asp:LinkButton>
                        <input type="hidden" id="hiUsers" runat="server" />
                        <input type="hidden" id="hiGroupId" runat="server" />
                        <input type="hidden" id="hiOwnerId" runat="server" />
                        <input type="hidden" id="hiName" runat="server" />
                        <asp:LinkButton ID="btnLoadUser" runat="server" OnClick="btnLoadUser_Click" Style="display: none">
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
            <zhongsoft:LightPowerGridView ID="gvUser" runat="server" AutoGenerateColumns="false"
                UseDefaultDataSource="true" DataKeyNames="GROUPUSERID" AllowPaging="true" PageSize="15"
                AllowSorting="true" ShowExport="true" BindGridViewMethod="BindUserGrid" OnRowCommand="gvUser_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DisplayIndex+1  %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField HeaderText="工号" DataField="LoginId" SortExpression="LoginId">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" SortExpression="UserName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="部室" DataField="OrgUnitName" SortExpression="OrgUnitName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" DeleteTipField="LoginId"
                        DeleteText="确定要删除分组员工【{0}】吗？" Visible="false">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        //添加分组员工
        function selUser() {
            if ($("#<%=lbGroup.ClientID %>").attr("GroupId") == "") {
                alert("请先选择分组！");
                return false;
            }
            var param = new InputParamObject("m");
            var re = getUsers("<%=hiUsers.ClientID %>", param, null);
            if (re != null) {
                return true;
            }
            return false;
        }
        //新建分组
        function newDetail(actionType) {
            var bizId = "";
            if (actionType != "2") {
                var ids = $("#" + $gridCheckedClientID).val();
                if (ids.length > 36 && ids.length < 72) {
                    ids = ids.replace("[", "").replace("]", "").replace(/\"/g, "");
                    bizId = ids;
                }
            }
            var url = buildBizUrl(actionType, bizId, "sys/RoleUser/UserGroupEditor.aspx", null);
            showDivDialog(url, "", 550, 450, rebindGridData);
            return false;
        }
        //双击分组行显示分组员工
        function selGroup(json) {
            var groupId = json[0];
            var groupName = json[1];
            var owner = json[3];
           
            if (groupId != "") {
                $("#<%=hiGroupId.ClientID %>").val(groupId);
                $("#<%=hiOwnerId.ClientID %>").val(owner);
                $("#<%=hiName.ClientID %>").val(groupName);
                $("#<%=btnLoadUser.ClientID %>")[0].click();
            }
        }
    </script>
</asp:Content>
