<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true"
    CodeBehind="UserComFunctEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.UserComFunctEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
     <%--   <tr>
            <td class="tz-title" colspan="2">
                <img id="imgInfo" src="../../Themes/Images/btn_title.gif" /><%=this.Title %>
            </td>
        </tr>--%>
        <tr>
            <td class="td-l">
                <asp:Label runat="server" ID="lblName"></asp:Label>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiXML" />
                <input type="hidden" runat="server" id="hiObjectId" field="ObjectId" tablename="UserComFunction" />
                <input type="text" runat="server" id="tbName" readonly="readonly" style="width: 200px"
                    activestatus="(23.*)" req="1" class="kpms-textbox" />
                <asp:LinkButton runat="server" ID="btnChoose" DisplayStatus="(23.?)" EnableTheming="false">
                    <img title="选择" src="../../Themes/Images/btn_select.gif"/>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" Field="Sort" TableName="UserComFunction"
                    Width="100px" Style="text-align: right" MaxLength="3" ActiveStatus="(23.*)" regex="^\d*$"
                    errMsg="排序顺序只能填写非负整数！" req="1" CssClass="kpms-textbox"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiComFunctionId" field="ComFunctionId" tablename="UserComFunction" />
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="UserComFunction" />
    <input type="hidden" runat="server" id="hiFunctType" field="FunctType" tablename="UserComFunction" />
    <script src="../../UI/Script/portal.objselector.js" type="text/javascript"></script>
    <script>
        function InitCustomerPlugin() {
            checkRegex();
        }

        function chooseList() {
            var param = new InputParamObject("s");
            var re = getUserList("<%=hiXML.ClientID %>", param, "");
            if (re != null) {
                $("#<%=hiObjectId.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=tbName.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }

        function chooseForm() {
            var param = new InputParamObject("s");
            var re = getUserForm("<%=hiXML.ClientID %>", param, "");
            if (re != null) {
                $("#<%=hiObjectId.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=tbName.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }
        
        function getUserForm(reid, param, filter) {
            var url = $appCtx.appPath + "/Sys/UserComFunction/UserFormSelector.aspx";
            return buildSelector(reid, param, filter,url, 600, 650);
        }
        function getUserList(reid, param, filter) {
            var fea = "dialogHeight: 600px; dialogWidth:650 px;resizable: yes;scroll:yes;";
            var url = $appCtx.appPath + "/Sys/UserComFunction/UserListSelector.aspx";
            return buildSelector(reid, param, filter, url, 600, 650);
        }

    </script>

</asp:Content>
