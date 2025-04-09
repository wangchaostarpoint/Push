<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master" AutoEventWireup="true"
    CodeBehind="DashboardRelationEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.DashboardRelationEditor" %>

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
                        触发部件
                    </td>
                    <td class="td-m">
                        <input type="hidden" runat="server" id="hiTtrigListId" />
                        <zhongsoft:LightDropDownList runat="server" ID="ddlTrigger" req="1" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlTrigger_Change">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        目标部件
                    </td>
                    <td class="td-m">
                        <input type="hidden" runat="server" id="hiType" />
                        <input type="hidden" runat="server" id="hiViewId" />
                        <input type="hidden" runat="server" id="hiTargListId" />
                        <zhongsoft:LightDropDownList runat="server" ID="ddlTarget" req="1" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlTarget_Change">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        参数
                    </td>
                    <td class="td-m">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiParamRule" />
                                    <asp:TextBox runat="server" ID="tbParamRule" Height="16px" ReadOnly="true" Width="100%"
                                        EnableTheming="false" CssClass="kpms-textbox" req="1"></asp:TextBox>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnParamRule" OnClientClick="return setParamRule();"
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                        OnClick="btnParamRule_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
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
            <asp:LinkButton runat="server" ID="btnSure" OnClientClick="return saveData();">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>

        function setParamRule() {
            var param = $("#<%=hiParamRule.ClientID %>").val();
            var trigListId = $("#<%=hiTtrigListId.ClientID %>").val()
            var targListId = $("#<%=hiTargListId.ClientID %>").val();
            var viewId = $("#<%=hiViewId.ClientID %>").val();
            var type = $("#<%=hiType.ClientID %>").val();
            var json = { FieldType: "BDDataSet", DataSetId: trigListId, ListId: targListId, ViewId: viewId, DashboardCtrlType: type };
            var url = buildQueryUrl("sys/CommonExpEditor.aspx", json);
            var re = showModal(encodeURI(url), param, 900, 400);
            if (re != undefined) {
                $("#<%=hiParamRule.ClientID %>").val(re);
                return true;
            }
            return false;
        }
        function saveData() {
            if (!checkReqField()) {
                return false;
            }
            var json = { RelationId: "<%=BusinessObjectId %>",
                TriggerId: $("#<%=ddlTrigger.ClientID %>").val(),
                TriggerName: $("#<%=ddlTrigger.ClientID %> option:selected").text(),
                TargetId: $("#<%=ddlTarget.ClientID %>").val(),
                TargetName: $("#<%=ddlTarget.ClientID %> option:selected").text(),
                ParamRule: $("#<%=hiParamRule.ClientID %>").val()
            };
            window.returnValue = JSON.stringify(json);
            window.close();
            return false;
        }
        function cancelEdit() {
            window.returnValue = null;
            window.close();
        }
    </script>
</asp:Content>
