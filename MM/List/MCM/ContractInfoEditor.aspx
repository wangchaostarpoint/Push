<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractInfoEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="合同信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">合同编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectName" EnableTheming="false" req="1" CssClass="kpms-textbox" activestatus="(23.*)" Text="SXS2020001">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">合同名称<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" EnableTheming="false" req="1" CssClass="kpms-textbox" activestatus="(23.*)" Text="陕西省西咸新区泾河水电站合同">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同预估额（万元）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox1" EnableTheming="false" req="1" CssClass="kpms-textbox" activestatus="(23.*)" Text="900">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">合同实签金额（万元）<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox2" EnableTheming="false" req="1" CssClass="kpms-textbox" activestatus="(23.*)" Text="900">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同签订日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox3" EnableTheming="false" req="1" CssClass="kpms-textbox" activestatus="(23.*)" Text="2020-10-10">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">项目合同额（万元）<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox4" EnableTheming="false" req="1" CssClass="kpms-textbox" activestatus="(23.*)" Text="900">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同文件
            </td>
            <td class="td-m" colspan="3">
                <a>陕西省西咸新区泾河水电站合同.pdf</a>
            </td>

        </tr>
        <tr>
            <td class="td-l">业主单位
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbFileResource" runat="server" TextMode="MultiLine" MaxLength="1024" activestatus="(23.*)" CssClass="kpms-textarea"
                    EnableTheming="false" Text="陕西省西咸新区泾河水利局"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">联系人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox5" EnableTheming="false" req="1" CssClass="kpms-textbox" activestatus="(23.*)" Text="王宝强">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">联系电话<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox6" EnableTheming="false" req="1" CssClass="kpms-textbox" activestatus="(23.*)" Text="13988982834">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" colspan="2" style="text-align:center">
                <h3>收款节点</h3>
            </td>
            <td class="td-l" colspan="2" style="text-align:center">
                <h3>收款记录</h3>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="2">
                <zhongsoft:LightPowerGridView ID="gvReceiptNodeList" runat="server" UseDefaultDataSource="true"
                    DataKeyNames="" BindGridViewMethod="BindReceiptNodeList" ShowFooter="true" OnRowDataBound="gvReceiptNodeList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="NodeRequest" HeaderText="节点要求">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ReceiptMoney" HeaderText="收款金额（万元）" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>

            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightPowerGridView ID="gvReceivedRecordList" runat="server" UseDefaultDataSource="true"
                    DataKeyNames="" BindGridViewMethod="BindReceivedRecordList" ShowFooter="true"  OnRowDataBound="gvReceivedRecordList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="ReceivedDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="到账日期">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ReceiveMoney" HeaderText="到账金额（万元）" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="PrincipalName" HeaderText="负责人">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hiOrganizationID" type="hidden" tablename="EPMS_ProjectEntity" field="OrganizationID" runat="server" />
    <script type="text/javascript">
</script>
</asp:Content>
