<%@ Page Title="功能设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="ActionEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ActionEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
            <table class="tz-table">
                <tr>
                    <td class="tz-title" colspan="2">
                        基本信息
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        标签<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbLabel" runat="server" req="1" ActiveStatus="(23.*)"
                            MaxLength="50"></zhongsoft:LightTextBox>
                        <input type="hidden" runat="server" id="hiID" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        图标<span class="req-star" flag="req">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbIcon" runat="server" req="1" ActiveStatus="(23.*)"
                            MaxLength="250"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        命令<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbCommand" runat="server" req="1" ActiveStatus="(23.*)"
                            MaxLength="20"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag='hide'>
                    <td class="td-l">
                        权限级别<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlAccessLevel" ActiveStatus="(23.*)" req="1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr flag='hide'>
                    <td class="td-l">
                        扩展权限
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsExAction" DictCode="PortalExAction"
                            ResultAttr="name" ActiveStatus="(23.*)" />
                    </td>
                </tr>
                <tr flag='hide'>
                    <td class="td-l">
                        脚本
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbClientScript" runat="server" EnableTheming="false"
                            CssClass="kpms-textarea" TextMode="MultiLine" ActiveStatus="(23.*)" MaxLength="2000"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag='hide'>
                    <td class="td-l">
                        弹出窗口
                    </td>
                    <td class="td-r">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiDialogPage" />
                                    <zhongsoft:XHtmlInputText type="text" ID="txtDialogPage" runat="server" readonly="readonly"
                                        style="width: 100%" MaxLength="250" class="kpms-textbox">
                                    </zhongsoft:XHtmlInputText>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnDialogPage" OnClientClick="return setDialogPage();"
                                        OnClick="btnDialogPage_Click" Style="height: 18px; width: 20px; padding: 0px"
                                        CssClass="btn-look-up" EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr flag='fixed'>
                    <td class="td-l">
                        父级按钮
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlParenId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr flag='fixed'>
                    <td class="td-l">
                        过滤条件
                    </td>
                    <td class="td-r">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <asp:TextBox runat="server" ID="tbFixedFilter" Height="16px" ReadOnly="true" Width="100%"
                                        CssClass="kpms-textbox"></asp:TextBox>
                                    <input type="hidden" runat="server" id="hiFixedFilter" />
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnSetFilter" OnClientClick="return setFixedFilter();"
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                        OnClick="btnSetFilter_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr flag='fixed'>
                    <td class="td-l">
                        是否默认筛选
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList runat="server" ID="rblIsDefaultFilter" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="tz-title" colspan="2">
                        <span id="func">调用方法</span>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        插件信息
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsPlugin" PageUrl="~/Sys/Plugins/PluginSelector.aspx"
                            ShowJsonRowColName="true" ResultForControls="{'hiPluginId':'id'}" ResultAttr="name"
                            Filter="{IsGlobal:'0'}" ActiveStatus="(23.*)" />
                        <input type="hidden" runat="server" id="hiPluginId" />
                    </td>
                </tr>
                <tr flag="hide">
                    <td class="tz-title" colspan="2">
                        按钮构造接口
                    </td>
                </tr>
                <tr flag="hide">
                    <td class="td-l">
                        插件信息
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsPlugin4Btn" PageUrl="~/Sys/Plugins/PluginSelector.aspx"
                            ShowJsonRowColName="true" ResultForControls="{'hiPluginId4Btn':'id'}" ResultAttr="name"
                            Filter="{IsGlobal:'0'}" ActiveStatus="(23.*)" />
                        <input type="hidden" runat="server" id="hiPluginId4Btn" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bottomBar" runat="server">
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

        function setDialogPage() {
            var url = buildQueryUrl("Custom/List/ActionDialogEditor.aspx", { ListId:"<%=ListId%>",DialogType:"FieldAction",ViewCol:"1"});
            var re = showModal(encodeURI(url), $("#<%=hiDialogPage.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiDialogPage.ClientID%>").val(re);
                return true;
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
            var addFilter='<%=AddFilter %>';
            if(parseBool(addFilter)) {
                //部分内容在固定筛选按钮配置中不显示
                $("[flag='hide']").hide();
                $('#<%=ddlAccessLevel.ClientID %>').removeAttr('req');
                $('#func').text('按钮构造接口');
                $("[flag='req']").hide();
                $('#<%=tbIcon.ClientID %>').removeAttr('req');
            }
            else {
                $("[flag='fixed']").hide();
            }
        }



        function saveData() {
            return checkReqField();
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

        function setFixedFilter() {
            var xml = $("#<%=hiFixedFilter.ClientID %>").val();
            var url = buildQueryUrl("Sys/ConditionEditor.aspx", { "ExpType": "DefaultFilter", "DataSetId": "<%=ListId%>" });
            var re = showModal(encodeURI(url), xml, 900, 400);
            if (checkReturn(re)) {
                $("#<%=hiFixedFilter.ClientID %>").val(re);
                return true;
            }
            return false
        }
    
    </script>
</asp:Content>
