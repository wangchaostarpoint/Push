<%@ Page Title="新增数据源" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="XFormDataSourceEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XFormDataSourceEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                数据表
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiDictXml" />
                <input type="hidden" runat="server" id="hiTableCode" />
                <input type="text" runat="server" id="tbTableName" readonly="readonly" class="kpms-textbox"
                    style="width: 120px" req="1" />
                <asp:LinkButton runat="server" ID="btnChooseDict" OnClientClick="return chooseDict();"
                   OnClick="btnChooseDict_Click"  CausesValidation="false">
                    <img alt ="" src="../../Themes/Images/btn_select.gif"/>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主键
            </td>
            <td class="td-r">
                <input type="text" runat="server" id="tbPKCode" readonly="readonly" class="kpms-textbox"
                    style="width: 120px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                数据集类型
            </td>
            <td class="td-r">
                <asp:DropDownList runat="server" ID="ddlDataSourceType" Width="100px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="trConnect">
            <td class="td-l">
                关联主表
            </td>
            <td class="td-r">
                <asp:DropDownList runat="server" ID="ddlConnectTableCode" Width="100px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
            <hr />
                <asp:LinkButton runat="server" ID="btnSave" class="kpms-btn" OnClientClick="Save();return false;">
                            <img alt =""  src="../../Themes/Images/btn_save.gif"/><span>确定</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnCancel" class="kpms-btn" OnClientClick="window.close();return false;">
                            <img alt =""  src="../../Themes/Images/btn_cancel.gif"/><span>取消</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <div id="divDataSource" style="display: none">
    </div>
    <input type="hidden" runat="server" id="hiXml" />

    <script>

        function initCustomerPlugin() {
            checkRegex();
            if ("<%=Page.IsPostBack %>" == "False") {
                var args = window.dialogArguments;
                if ("<%=ActionType %>" == "Create") {
                    $("#<%=hiXml.ClientID %>").val(args);
                }
                else {
                    $("#<%=hiXml.ClientID %>").val(args.html());
                    var ctrl = args.children();
                    getCtrlAttr(ctrl);
                }
            }
            setHiddenReq();
            $("#divDataSource").html($("#<%=hiXml.ClientID %>").val());
        }


        function getCtrlAttr(ctrl) {
            $("#<%=hiTableCode.ClientID %>").val(ctrl.attr("TableCode"));
            $("#<%=tbTableName.ClientID %>").val(ctrl.attr("TableName"));
            $("#<%=tbPKCode.ClientID %>").val(ctrl.attr("PKCode"));
            $("#<%=ddlDataSourceType.ClientID %>").val(ctrl.attr("DataSourceType"))
            $("#<%=ddlConnectTableCode.ClientID %>").val(ctrl.attr("ConnectTableCode"));
        }


        function Save() {
            if (!checkReqField()) {
                return false;
            }

            var ctrl = $("#divDataSource").children();
            if (!saveCtrlAttr(ctrl)) return false;
            $("#<%=hiXml.ClientID %>").val($("#divDataSource").html());
            if (window.opener != undefined) {
                window.opener.returnValue = $("#<%=hiXml.ClientID %>").val();
            }
            else {
                window.parent.returnValue = $("#<%=hiXml.ClientID %>").val();
            }
            window.close();
        }

        function saveCtrlAttr(ctrl) {
            var tablecode = $("#<%=hiTableCode.ClientID %>").val();
            var tableName = $("#<%=tbTableName.ClientID %>").val();
            var pkcode = $("#<%=tbPKCode.ClientID %>").val();
            var connecttablecode = $("#<%=ddlConnectTableCode.ClientID %>").val();
            var type = $("#<%=ddlDataSourceType.ClientID %>").val();
            var tablecodes = "<%=OtherCodes%>".split(',');
            for (var i = 0; i < tablecodes.length; i++) {
                if ("'" + tablecode + "'" == tablecodes[i]) {
                    alert("已存在该数据集，数据集不能重复添加！");
                    return false;
                }
            }
            ctrl.attr({ TableCode: tablecode, TableName: tableName, PKCode: pkcode, ConnectTableCode: connecttablecode, Value: tableName, DataSourceType: type });
            return true;
        }

        function setHiddenReq() {
            if ($("#<%=ddlDataSourceType.ClientID %>").val() == "从表") {
                $("#trConnect").show();
                $("#<%=ddlConnectTableCode.ClientID %>").attr("req", "1");
            }
            else {
                $("#trConnect").hide();
                $("#<%=ddlConnectTableCode.ClientID %>").removeAttr("req");
                $("#<%=ddlConnectTableCode.ClientID %>").val("");
            }
        }

        $("#<%=ddlDataSourceType.ClientID %>").change(function() {
            setHiddenReq();
        })

        function chooseDict() {
            var param = new InputParamObject("s");
            var re = getDict("<%=hiDictXml.ClientID %>", param, "");
            if (re != null) {
                if ($("#<%=hiTableCode.ClientID %>").val() != re.buildAttrJson("o", "att3")) {
                    $("#<%=tbTableName.ClientID %>").val(re.buildAttrJson("o", "name"));
                    $("#<%=hiTableCode.ClientID %>").val(re.buildAttrJson("o", "att3"));
                    return true;
                }
            }
            return false;
        }


    </script>

</asp:Content>
