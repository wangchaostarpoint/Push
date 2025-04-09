<%@ Page Title="人员扩展信息编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="OrganizationUsersExtendEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.OrganizationUsersExtendEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="OrganizationUsersExtend" />
                <input type="text" runat="server" id="txtUserName" class="kpms-textbox" readonly="readonly"
                    req="1" style="width: 70px" />
                <input type="hidden" runat="server" id="hiUserXml" />
                <img src="/Portal/Themes/Images/btn_select.gif" onclick="getUser()" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门名称
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiUnitId" field="UnitId" tablename="OrganizationUsersExtend" />
                <input type="text" runat="server" id="txtUnitName" class="kpms-textbox" readonly="readonly"
                    req="1" style="width: 200px" />
                <input type="hidden" runat="server" id="hiDeptXml" />
                <img src="/Portal/Themes/Images/btn_select.gif" onclick="getDept()" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserExtendId" field="UserExtendId" tablename="OrganizationUsersExtend" />

    <script type="text/javascript">

        function getUser() {
            var param = new InputParamObject("s");
            var reObj = null;
            reObj = getUsers("<%=hiUserXml.ClientID %>", param, "");
            if (reObj != null) {
                $("#<%=hiUserId.ClientID %>").val(reObj.buildAttrJson("o", "id"));
                $("#<%=txtUserName.ClientID %>").val(reObj.buildAttrJson("o", "name"));
            }
        }

        function getDept() {
            var param = new InputParamObject("s");
            var reObj = null;
            reObj = getOrgs("<%=hiDeptXml.ClientID %>", param, "2");
            if (reObj != null) {
                $("#<%=hiUnitId.ClientID %>").val(reObj.buildAttrJson("o", "id"));
                $("#<%=txtUnitName.ClientID %>").val(reObj.buildAttrJson("o", "name"));
            }
        }
    
    </script>

</asp:Content>
