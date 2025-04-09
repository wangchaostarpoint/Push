<%@ Page Title="映射配置" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="FormRuleMappingEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormRuleMappingEditor" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.Controls" TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                类型
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRuleType" AutoPostBack="true"
                    ActiveStatus="(2.*)" OnSelectedIndexChanged="ddlRuleType_Change" Width="600px"
                    req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                业务对象
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlObj" Width="600px" req="1" ActiveStatus="(2.*)">
                    <asp:ListItem Value="" Text="请选择"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                规则
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiRuleId" />
                <zhongsoft:LightObjectSelector runat="server" SelectPageMode="Dialog" ID="lbsRule" PageUrl="~/Sys/Rule/RuleSelector.aspx"
                    BeforeSelect="beforeSelect();" FilterFunction="getFilter();" ActiveStatus="(23.*)"
                    req="1" ResultForControls="{'hiRuleId':'id'}" Width="600px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                异步调用
            </td>
            <td class="td-m">
                <asp:CheckBox runat="server" ID="cbIsASync" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                启用
            </td>
            <td class="td-m">
                <asp:CheckBox runat="server" ID="cbFlag" ActiveStatus="(23.*)" Checked="true" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                MacthFlag标识
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbFlag" Width="600px" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr id="MacthFlagTr" runat="server" visible="false">
            <td class="td-l">
                MacthFlag规则
            </td>
            <td>
                <table width="600px">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView runat="server" ID="gvMatchRule" AutoGenerateColumns="false"
                                ShowAddData="true" OnAddData="gvMatchRule_AddData" 
                                OnRowDataBound="gvMatchRule_RowDataBound" OnRowCommand="gvMatchRule_RowCommand"
                                Width="600px" UseDefaultDataSource="true" EmptyDataText="没有规则定义">
                                <Columns>
                                    <asp:TemplateField HeaderText="名称" HeaderStyle-Width="25%">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbName" Text='<%#Eval("Name")%>' req="1"></zhongsoft:LightTextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="表达式" HeaderStyle-Width="65%">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="tbExp" req="1" EnableTheming="false" TextMode="MultiLine"
                                                ReadOnly="true" CssClass="kpms-textarea"></asp:TextBox>
                                            <input type="hidden" runat="server" id="hiExpXml" />
                                            <asp:LinkButton runat="server" ID="btnSetExp" CommandName="SetCondition" CssClass="selector-btnconfirm"><span>设置</span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" HeaderStyle-Width="10%">
                                    </zhongsoft:LightButtonField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script>
        function setCondition(hiXmlId) {
            var xml = $("#" + hiXmlId).val();
            var url = buildBizUrl(null, null, "Sys/ConditionEditor.aspx", { ExpType: 'MatchFlag' });
            var re = showModal(url, xml, 900, 400);
            if (re != undefined) {
                $("#" + hiXmlId).val(re);
                return true;
            }
            return false
        }

        function beforeSelect() {
            if ($("#<%=ddlRuleType.ClientID %>").val() == "") {
                alert("请先选择规则类型。");
                return false;
            }
            return true;
        }

        function getFilter() {
            return $("#<%=ddlRuleType.ClientID %>").val();
        }
    
    </script>
</asp:Content>
