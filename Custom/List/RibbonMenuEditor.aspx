<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    CodeBehind="RibbonMenuEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.RibbonMenuEditor" %>

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
                <%-- <tr>
                    <td class="td-l">
                        字典名称
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbDictName" runat="server" ReadOnly="true"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        字典编码
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbDictCode" runat="server" ReadOnly="true"></zhongsoft:LightTextBox>
                    </td>
                </tr>--%>
                <tr>
                    <td class="td-l">
                        命令<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbCommand" runat="server" tablename="BD_DictAction" field="Command"
                            req="1" ActiveStatus="(23.*)" MaxLength="20"></zhongsoft:LightTextBox>
                        <input type="hidden" runat="server" id="hiID" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        标签<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbLabel" runat="server" tablename="BD_DictAction" field="Label"
                            req="1" ActiveStatus="(23.*)" MaxLength="50"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        图标
                    </td>
                    <td class="td-r">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <zhongsoft:LightTextBox ID="tbIcon" runat="server" tablename="BD_DictAction" field="Icon" Style="width: 100%; height: 16px;"
                                        ActiveStatus="(23.*)" MaxLength="250"></zhongsoft:LightTextBox>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="lbtnGetIcon" OnClientClick="return GetIcon();"
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        显示类型<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlMenuType" ActiveStatus="(23.*)" tablename="BD_DictAction"
                            req="1" field="CtrlType" Width="85%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        所属分组<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlGroup" ActiveStatus="(23.*)" tablename="BD_DictAction"
                            req="1" field="GroupId" Width="85%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        父级按钮
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlParenId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        动作范围<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlScope" ActiveStatus="(23.*)" tablename="BD_DictAction"
                            req="1" field="Scope" Width="85%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        按钮可用类型<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlEnableScope" ActiveStatus="(23.*)" tablename="BD_DictAction"
                            req="1" field="EnableScope" Width="85%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        权限级别<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlAccessLevel" ActiveStatus="(23.*)" tablename="BD_DictAction"
                            req="1" field="AccessLevel" Width="85%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        扩展权限
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsExAction" DictCode="PortalExAction"
                            ResultAttr="name" ActiveStatus="(23.*)" tablename="BD_DictAction" field="ExAction" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        排序<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbSort" runat="server" tablename="BD_DictAction" field="Sort"
                            req="1" ActiveStatus="(23.*)" MaxLength="4"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        脚本
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbClientScript" runat="server" tablename="BD_DictAction"
                            EnableTheming="false" CssClass="kpms-textarea" TextMode="MultiLine" field="ClientScript"
                            ActiveStatus="(23.*)" MaxLength="2000"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tz-title" colspan="2">
                        弹出窗口会话
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        会话Url
                    </td>
                    <td class="td-r">
                        <input runat="server" id="hiDialog" type="hidden" tablename="BD_DictAction" field="Dialog" />
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
                <tr>
                    <td class="tz-title" colspan="2">
                        调用后台方法
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
                        <input runat="server" id="hiAction" type="hidden" tablename="BD_DictAction" field="Action" />
                    </td>
                </tr>
                <tr>
                    <td class="tz-title" colspan="2">
                        按钮构造接口
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        插件信息
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsPlugin4Btn" PageUrl="~/Sys/Plugins/PluginSelector.aspx"
                            ShowJsonRowColName="true" ResultForControls="{'hiPluginId4Btn':'id'}" ResultAttr="name"
                            Filter="{IsGlobal:'0'}" ActiveStatus="(23.*)" />
                        <input type="hidden" runat="server" id="hiPluginId4Btn" />
                        <input runat="server" id="hiActionStruct" type="hidden" tablename="BD_DictAction"
                            field="ActionStruct" />
                    </td>
                </tr>
            </table>
            <input runat="server" id="hiDictActionId" type="hidden" tablename="BD_DictAction"
                field="DictActionId" />
            <input runat="server" id="hiDictId" type="hidden" tablename="BD_DictAction" field="DictId" />
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

        function GetIcon() {
            var url = buildQueryUrl("Metro/Obsolete/MetroIconSelector.aspx", { "IconType": "BtnIcon" });
            showDivDialog(encodeURI(url), null, 800, 600, afterParamFilter);
            return false;
        }
        function afterParamFilter(re) {
            var u = "~/" + "<%=EDPortal.BLL.Sys.SysConfig.Instance.BtnIconStorageUrl %>";
            $("#<%=tbIcon.ClientID %>").val(u + re);
            return false;
        }
    
    </script>
</asp:Content>
