<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OtherBidUnit.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.OtherBidUnit" %>
<table class="tz-table">
    <tr id="Tr1" runat="server" displaystatus="(3.*)">
        <td colspan="6" style="text-align: right">
            新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>
            <asp:Button runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            投标单位
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvOtherUnit" runat="server" ShowExport="true" UseDefaultDataSource="true"
                DataKeyNames="OTHERBIDUNITID" AllowPaging="true" BindGridViewMethod="BindOtherUnit"
                OnRowCommand="gvOtherUnit_RowCommand" OnRowDataBound="gvOtherUnit_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="投标<br/>单位" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText type="text" ID="txtOtherBiddingName" runat="server" req="1"
                                activestatus="(3.*)" maxlength="64" class="kpms-textbox" value='<%#Eval("BIDUNITNAME") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="投标<br/>报价（万元）" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbOtherBiddingUnitPrice" runat="server" CssClass="kpms-textbox-money"
                                MaxLength="13" Style="text-align: right;" Text='<%#Eval("BIDDINGUNITPRICE") %>'
                                activestatus="(3.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="其他投标单位报价请输入正数，最多8位整数，6位小数">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="修正<br/>报价（万元）" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbRevisedQuotation" runat="server" CssClass="kpms-textbox-money"
                                MaxLength="13" Style="text-align: right;" Text='<%#Eval("RevisedQuotation") %>'
                                activestatus="(3.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="修正报价请输入正数，最多8位整数，6位小数">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="报价得分" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbQuotationScore" runat="server" CssClass="kpms-textbox"
                                MaxLength="13" Style="text-align: right;" Text='<%#Eval("QuotationScore") %>'
                                activestatus="(3.*)" regex="^([1-9][0-9]?(\.[0-9]{1,2})?)$|^(0\.[1-9][0-9]?)$|^(0\.[0-9][1-9])$|^100(\.00)?$"
                                errmsg="报价得分请输入1-100之间的数字">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="工期（日历天）" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbWorkTerm" runat="server" CssClass="kpms-textbox" MaxLength="5"
                                Style="text-align: right;" Text='<%#Eval("WorkTerm") %>' activestatus="(3.*)"
                                Regex="^([1-9]\d{0,7}|[0])(\.\d{1,1})?$" errmsg="工期请输入正数，最多8位整数，1位小数">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="质量" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbQuality" runat="server" CssClass="kpms-textbox" MaxLength="64"
                                Text='<%#Eval("Quality") %>' activestatus="(3.*)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该{0}吗？"
                        DeleteTipField="BIDUNITNAME">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
