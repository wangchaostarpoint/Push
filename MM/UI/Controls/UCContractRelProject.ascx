<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCContractRelProject.ascx.cs" Inherits="Zhongsoft.Portal.MM.UI.Controls.UCContractRelProject" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<asp:ScriptManager runat="server" ID="ScriptManager1">
</asp:ScriptManager>
<asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
    <ContentTemplate>
        <table class="tz-table" style="width: 100%">
            <tr id="Tr1" runat="server" class="trAddProject">
                <td colspan="6" style="text-align: right">
                    <asp:Button ID="btnChooseProject" Text="添加关联合同" runat="server" EnableTheming="false"
                        OnClientClick="return selContract()" />
                </td>
            </tr>
            <tr>
                <td colspan="6">

                    <zhongsoft:LightPowerGridView ID="gvContract" runat="server" AllowPaging="true" 
                        AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="CONTRACTRELMAKRTID"
                        BindGridViewMethod="UserControl.BindContract" ShowExport="false" OnRowCommand="gvContract_RowCommand"
                        OnRowDataBound="gvContract_RowDataBound" ShowPageSizeChange="true">
                        <Columns>
                            <zhongsoft:LightBoundField DataField="ContractCode" HeaderText="合同编号" ItemStyle-Wrap="false" />

                            <zhongsoft:LightBoundField DataField="ContractName" HeaderText="合同名称" ShowToolTip="true"
                                Width="150" />
                            <zhongsoft:LightBoundField DataField="ContractValue" HeaderText="合同额（万元）" ShowToolTip="true"
                                Width="150" ItemStyle-HorizontalAlign="Right" />
                            <zhongsoft:LightTemplateField HeaderText="项目合同额（万元）" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="txtFactValue" runat="server" class="kpms-textbox-money" flag="FactValue"
                                        EnableTheming="false" OnTextChanged="CalculateSum" AutoPostBack="true" Text='<%# Eval("FACTVALUE") %>' Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                                        Style="text-align: right;" errmsg="项目合同额请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                        EnableTheming="false" CommandArgument='<%#Eval("CONTRACTRELMAKRTID") %>'><img id="btDelete" src="../../../Themes/Images/btn_dg_delete.gif" title="删除" style="CURSOR: hand" attr="delete"  border="0"></asp:LinkButton>
                                    <input type="hidden" runat="server" id="hiProjectID" value='<%#Eval("PROJECTID") %>' />
                                    <input type="hidden" runat="server" id="hiContractID" value='<%#Eval("CONTRACTID") %>' />
                                    <input type="hidden" runat="server" id="hiContractCode" value='<%#Eval("ContractCode") %>' />
                                    <input type="hidden" runat="server" id="hiContractName" value='<%#Eval("ContractName") %>' />
                                    <input type="hidden" runat="server" id="hiContractValue" value='<%#Eval("ContractValue") %>' />
                                </ItemTemplate>

                            </zhongsoft:LightTemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>

                </td>
            </tr>
            <tr>
                <td class="td-l">项目合同额（万元）</td>
                <td class="td-m" colspan="5">
                    <zhongsoft:LightTextBox runat="server" ID="tbContractValue"
                        EnableTheming="False" ReadOnly="True" DataType="Decimal6"
                        CssClass="kpms-textbox-money" ActiveStatus="(?.*)" />
                </td>
            </tr>
        </table>

        <!---存储项目XML-->
        <input type="hidden" runat="server" id="hiContractXML" />

        <asp:LinkButton ID="lbtnSelContract" runat="server" alt="" EnableTheming="false"
            OnClick="btnChooseContract_Click" Style="display: none"></asp:LinkButton>
    </ContentTemplate>
</asp:UpdatePanel>
<script>


    //选择合同
    function selContract() {
        var param = new InputParamObject("m");
        var json = null;
        getDivContractNew('<%=this.hiContractXML.ClientID%>', param, json, afterSelContract);
        return false;
    }

    function afterSelContract() {
       <%=Page.ClientScript.GetPostBackEventReference(this.lbtnSelContract,"") %>
        return false;
    }

</script>
