<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishCostDetail.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishCostDetail" %>

<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table">
    <tr>
        <td class="td-m" colspan="3">
            <table style="width: 100%">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>A4（单面）</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvA4" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvA4_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="类别">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        页数
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="Decimal2"
                                            CssClass="kpms-textbox-money" Style="width: 50%; text-align: right" flag="cadCopyNum"
                                            Text='<%# Eval("CopyNum") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        A4（单面）合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="金额(元)" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyCost" Text='<%# Eval("CopyCost") %>' Style="width: 50%; text-align: right" CssClass="kpms-textbox-money">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbA4Sum" flag="totalCad"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
        <td class="td-m" colspan="3" style="vertical-align: top">
            <table style="width: 100%;">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>A3（单面）</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvA3" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvA4_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="类别">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        页数
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="Decimal2" flag="blueCopyNum"
                                            Style="width: 50%; text-align: right;" CssClass="kpms-textbox-money"
                                            Text='<%# Eval("CopyNum") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        A3（单面）合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="金额(元)" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyCost" Text='<%# Eval("CopyCost") %>' Style="width: 50%; text-align: right" CssClass="kpms-textbox-money">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbA3" flag="totalBlue"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="3">
            <table style="width: 100%">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>黑白工程复图
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvWB" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvA4_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="规格">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="页数" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="PositiveInteger"
                                            CssClass="kpms-textbox-money" Style="width: 50%; text-align: right" flag="colorCopyNum"
                                            Text='<%# Eval("CopyNum") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        黑白工程复图合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="金额(元)" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyCost" Text='<%# Eval("CopyCost") %>' Style="width: 50%; text-align: right" CssClass="kpms-textbox-money">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbWBSum" flag="totalColor"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
        <td class="td-m" colspan="3" style="vertical-align: top">
            <table style="width: 100%;">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>彩图/页</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvColor" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvA4_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="规格">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderText="页数">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="PositiveInteger"
                                            CssClass="kpms-textbox-money" Style="width: 80%; text-align: right" flag="copyCopyNum"
                                            Text='<%# Eval("CopyNum") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        彩图/页合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="金额(元)" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyCost" Text='<%# Eval("CopyCost") %>' Style="width: 50%; text-align: right" CssClass="kpms-textbox-money">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbColorSum" flag="totalCopy"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td>总计：
        </td>
        <td colspan="2">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTotalCost" readonly="readonly"
                class="kpms-textbox" activestatus="(23.?)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td>大写：
        </td>
        <td colspan="2">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTotalCostBig" readonly="readonly"
                class="kpms-textbox" activestatus="(23.?)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiAddNum" value="5" />
<script type="text/javascript">

</script>
