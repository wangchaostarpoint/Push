<%@ Page Title="链接页面设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="ActionDialogEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ActionDialogEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
            <table id="tableDrilling" class="tz-table">
                <tr>
                    <td class="td-l">
                        链接页面类型
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlType">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        打开方式
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlOpenMode">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr id="width" style="display: none">
                    <td class="td-l">
                        宽度
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbWidth" DataType="Integer" Text="800"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr id="height" style="display: none">
                    <td class="td-l">
                        高度
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbHeight" DataType="Integer" Text="500"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="UserPage" style="display: none">
                    <td class="td-l">
                        Url
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbUrl"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="PortalPage" style="display: none">
                    <td class="td-l">
                        Url
                    </td>
                    <td class="td-m">
                        <input type="hidden" runat="server" id="hiPageId" />
                        <zhongsoft:LightObjectSelector runat="server" ID="selPage" PageUrl="~/Sys/Menu/PageSelector.aspx"
                            ResultAttr="att3" ResultForControls="{'hiPageId':'id'}" />
                    </td>
                </tr>
                <tr id="trParam" style="display: none">
                    <td class="td-l">
                        参数
                    </td>
                    <td class="td-m">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiParam" />
                                    <asp:TextBox runat="server" ID="tbParam" Height="16px" ReadOnly="true" Width="100%"
                                        CssClass="kpms-textbox"></asp:TextBox>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnSetParam" OnClientClick="return setParam();"
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <input type="hidden" runat="server" id="hiExpJson" />
            <asp:LinkButton runat="server" ID="btnSure" OnClick="btnSure_Click" OnClientClick="return saveData();">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>

        function setParam() {
            var json;
            var viewId="<%=ViewId %>";
            if ("<%=DialogType %>" == "DictFeature" || "<%=DialogType %>" == "DictAction") {
                json = { DictCode: "<%=DictCode%>", FieldType: "BDDict" };
            } 
            else if(parseBool("<%=ChartDialog %>")&& viewId!="")
            {
                json = { ViewId: viewId, DashboardCtrlType: "ChartView" };
            }
            else{
              json = { ViewListId:"<%=ListId%>", DataSetId: "<%=ListId%>", FieldType: "BDDataSet",ViewCol:"<%=ViewCol%>" };
            }
            if ($("#<%=ddlType.ClientID %>").val() == "PortalPage") {
                var pageId = $("#<%=hiPageId.ClientID %>").val();
                json = $.extend(json, { PageId: pageId });
            }
            var url = buildQueryUrl("sys/CommonExpEditor.aspx", json);
            var re = showModal(url, $("#<%=hiParam.ClientID %>").val(), 800, 400);
            if (checkReturn(re)) {
                $("#<%=tbParam.ClientID %>").val(re);
                $("#<%=hiParam.ClientID %>").val(re);
            }
            return false;
        }

        $(document).ready(function () {
            if (!parseBool("<%=IsPostBack %>")) {
                if (window.dialogArguments != undefined) {
                    $("#<%=hiExpJson.ClientID %>").val(window.dialogArguments);
                   <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
                }
            }
        })

        function initCustomerPlugin() {
            setDisplay();
            setMode();
        }

        $("#<%=ddlType.ClientID %>").live("change", function () {
            setDisplay();
        })


        $("#<%=ddlOpenMode.ClientID %>").live("change", function () {
            setMode();
        })

        function setMode() {
            var openMode = $("#<%=ddlOpenMode.ClientID %>").val();
            if (openMode == "Modal" || openMode == "Dialog") {
                $("#width").show();
                $("#height").show();
                $("#<%=tbWidth.ClientID %>").attr("req", "1");
                $("#<%=tbHeight.ClientID %>").attr("req", "1");
            }
            else {

                $("#width").hide();
                $("#height").hide();
                $("#<%=tbWidth.ClientID %>").removeAttr("req");
                $("#<%=tbHeight.ClientID %>").removeAttr("req");
            }

        }

        function setDisplay() {
            var flag = $("#<%=ddlType.ClientID %>").val();
            var $flags = $("#tableDrilling").find('[flag]');
            $flags.hide();
            $("#tableDrilling").find('[flag=' + flag + ']').show();
            clearAttr();
            if (flag == "PortalPage") {
                $("#<%=selPage.ClientID %>").attr("req", "1");
                $("#trParam").show();
            }
            else if (flag == "UserPage") {
                $("#<%=tbUrl.ClientID %>").attr("req", "1");
                $("#trParam").show();
            }
            else {
                $("#trParam").hide();
            }
        }

        function clearAttr() {
            $("#<%=tbUrl.ClientID %>").removeAttr("req");
            $("#<%=selPage.ClientID %>").removeAttr("req");

        }

        function saveData() {
            if ($("#<%=ddlType.ClientID %>").val() != "") {
                return checkReqField();
            }
            return true;
        }


        function closeExpWindow() {
            window.returnValue = $("#<%=hiExpJson.ClientID %>").val();
            window.close();
            return false;
        }

        function cancelEdit() {
            window.returnValue = null;
            window.close();
        }
    
    </script>
</asp:Content>
