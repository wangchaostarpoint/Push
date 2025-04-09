<%@ Page Title="仪表板部件" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="DashboardCtrlEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.DashboardCtrlEditor" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        标识
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbKey" DataType="EnNumStr" MaxLength="20"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        类型
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlType" req="1" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlType_Change">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        加载方式
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlLoadMode" req="1">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        打开方式
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlOpenMode" req="1">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        部件名
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbName" MaxLength="64" req="1">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr id="trList">
                    <td class="td-l">
                        页面
                    </td>
                    <td class="td-m">
                        <input type="hidden" runat="server" id="hiListId" />
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsel" PageUrl="~/Custom/List/ListSelector.aspx"
                            AfterSelect="afterSelect()" ShowJsonRowColName="true" Filter="{'PageType':'0'}"
                            ResultForControls="{'hiListId':'id'}" OnClick="lbsel_Click" />
                    </td>
                </tr>
                <tr id="trView">
                    <td class="td-l">
                        视图
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlView" />
                    </td>
                </tr>
                <tr id="trUrl">
                    <td class="td-l">
                        Url
                    </td>
                    <td class="td-m"><!--regex="^[\w/.]+$" errmsg="Url只能包含数字、字母、“_”、“.”和“/”" 去掉规则验证 xiedx 1212 可以输入http-->
                        <zhongsoft:LightTextBox runat="server" ID="tbUrl" 
                            MaxLength="256">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr id="tr1">
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
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                        OnClick="btnSetParam_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        显示标题
                    </td>
                    <td class="td-m">
                        <asp:RadioButtonList runat="server" ID="rbtnShowTitle" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        标题图标
                    </td>
                    <td class="td-m">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <zhongsoft:LightTextBox runat="server" ID="tbIcon" MaxLength="256" Style="width: 100%; height: 16px;">
                                    </zhongsoft:LightTextBox>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="LinkButton2" OnClientClick="return GetIcon('bt');"
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        显示页签标题
                    </td>
                    <td class="td-m">
                        <asp:RadioButtonList runat="server" ID="rbtnShowTabTitle" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        页签图标
                    </td>
                    <td class="td-m">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <zhongsoft:LightTextBox runat="server" ID="tbTabIcon" MaxLength="256" Style="width: 100%; height: 16px;">
                                    </zhongsoft:LightTextBox>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="LinkButton1" OnClientClick="return GetIcon('yq');"
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        显示内部工具条
                    </td>
                    <td class="td-m">
                        <asp:RadioButtonList runat="server" ID="rbtnShowToolbar" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        部件高度
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbHeight" regex="^((100|([1-9]?[0-9]?))%)|\d+$"
                            MaxLength="64" errmsg="“高度”只能填写百分数或者正整数">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr style="display: none">
                    <td class="td-l">
                        部件宽度
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbWidth" regex="^((100|([1-9]?[0-9]?))%)|\d+$"
                            MaxLength="64" Text="100%" errmsg="“宽度”只能填写百分数或者正整数">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        部件权限
                    </td>
                    <td class="td-m">
                        <asp:RadioButtonList ID="rblIsPublic" runat="server" ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        说明
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbMemo" MaxLength="256">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnSure" OnClientClick="return saveData();">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function afterSelect() {
            if ($("#<%=tbName.ClientID %>").val() == "") {
                $("#<%=tbName.ClientID %>").val($("#<%=lbsel.ClientID %>").val());
            }
        }
        function setAcl() {
            var url = buildQueryUrl("sys/Acl/AclMgr.aspx", { secObjId: "<%=BusinessObjectId%>", secObjName: encodeURI($("#<%=tbName.ClientID %>").val()), ObjSecurityType: "<%=ObjectSecurityType.WebPart %>" });
            showModal(url, null, 980, 590);
            return false;
        }
        function setParam() {
            var param = $("#<%=hiParam.ClientID %>").val();
            var id = $("#<%=hiListId.ClientID %>").val();
            var viewId = $("#<%=ddlView.ClientID %>").val();
            var type = $("#<%=ddlType.ClientID %>").val();
            var json = { FieldType: "BDDataSet", DataSetId: id, ListId: id, ViewId: viewId, DashboardCtrlType: type };
            var url = buildQueryUrl("sys/CommonExpEditor.aspx", json);
            var re = showModal(encodeURI(url), param, 900, 400);
            if (re != undefined) {
                $("#<%=hiParam.ClientID %>").val(re);
                return true;
            }
            return false
        }
        function initCustomerPlugin() {
            setDisplay();
        }
        function setDisplay() {
            var type = $("#<%=ddlType.ClientID %>").val();
            if (type == "ListView" || type == "Dashboard" || type == "ChartView" || type == "PortalPage") {
                $("#trList").show();
                if (type != "ListView") {
                    $("#trUrl").hide();
                }
                $("#<%=lbsel.ClientID %>").attr("req", "1");
                $("#<%=tbUrl.ClientID %>").removeAttr("req");

                if (type != "PortalPage") {
                    $("#trView").show();
                    $("#<%=ddlView.ClientID %>").attr("req", "1");
                }
                else {
                    $("#trView").hide();
                    $("#<%=ddlView.ClientID %>").removeAttr("req");
                }
            }
            else {
                $("#trList").hide();
                $("#trUrl").show();
                $("#trView").hide();
                $("#<%=ddlView.ClientID %>").removeAttr("req");
                $("#<%=lbsel.ClientID %>").removeAttr("req");
                $("#<%=tbUrl.ClientID %>").attr("req", "1");
            }

        }
        $("#<%=ddlType.ClientID %>").live("change", function () {
            setDisplay();
            $("#<%=lbsel.HiddenClientID %>").val("");
            $("#<%=lbsel.ClientID %>").val("");
            $("#<%=tbUrl.ClientID %>").val("");
        });
        function saveData() {
            if (!checkReqField()) {
                return false;
            }
            var json = { WebPartId: "<%=BusinessObjectId%>",
                Key: $("#<%=tbKey.ClientID %>").val(),
                WebPartName: $("#<%=tbName.ClientID %>").val(),
                Type: $("#<%=ddlType.ClientID %>").val(),
                LoadMode: $("#<%=ddlLoadMode.ClientID %>").val(),
                OpenMode: $("#<%=ddlOpenMode.ClientID %>").val(),
                ListId: $("#<%=hiListId.ClientID %>").val(),
                ViewId: $("#<%=ddlView.ClientID %>").val(),
                ListName: $("#<%=lbsel.HiddenClientID%>").val(),
                ShowTitle: $("#<%=rbtnShowTitle.ClientID%>").find("input:checked").val(),
                ShowToolbar: $("#<%=rbtnShowToolbar.ClientID%>").find("input:checked").val(),
                IsPublic: $("#<%=rblIsPublic.ClientID%>").find("input:checked").val(),
                Url: $("#<%=tbUrl.ClientID%>").val(),
                Param: $("#<%=tbParam.ClientID%>").val(),
                Icon: $("#<%=tbIcon.ClientID%>").val(),
                Height: $("#<%=tbHeight.ClientID%>").val(),
                Width: $("#<%=tbWidth.ClientID%>").val(),
                ShowTabTitle: $("#<%=rbtnShowTabTitle.ClientID%>").find("input:checked").val(),
                TabIcon: $("#<%=tbTabIcon.ClientID%>").val(),
                Memo: $("#<%=tbMemo.ClientID%>").val()
            };
            parent.returnValue = JSON.stringify(json);
            closeWindow();
            return false;
        }
        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }

        var flg = 'bt';
        function GetIcon(f) {
            flg = f;
            var url = buildQueryUrl("Metro/Obsolete/MetroIconSelector.aspx", { "IconType": "CycleIcon" });
            showDivDialog(encodeURI(url), null, 1000, 600, afterParamFilter);
            return false;
        }
        function afterParamFilter(re) {
            var u = "~/" + "<%=EDPortal.BLL.Sys.SysConfig.Instance.CycleIconStorageUrl %>";
            if (flg == "bt") {
                $("#<%=tbIcon.ClientID %>").val(u + re);
            }
            else {
                $("#<%=tbTabIcon.ClientID %>").val(u + re);
            }
            return false;
        }
    </script>
</asp:Content>
