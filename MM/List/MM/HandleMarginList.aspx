<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="HandleMarginList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.HandleMarginList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                保函工程名称
                <zhongsoft:LightTextBox runat="server" ID="tbGuaranteeProject" Width="200px"></zhongsoft:LightTextBox>
                受益人名称
                <zhongsoft:LightTextBox runat="server" ID="tbBeneficiaryName" Width="200px"></zhongsoft:LightTextBox>
                <asp:CheckBox Text="交款金额(万元)" ID="cbPayMent" runat="server" />
                <zhongsoft:LightTextBox ID="tbPayMent" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                    errmsg="金额必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="13" CssClass="kpms-textbox-money"
                    Style="text-align: right" Width="90px"></zhongsoft:LightTextBox>
                至
                <zhongsoft:LightTextBox ID="tbMaxPayMent" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                    errmsg="金额必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="13" CssClass="kpms-textbox-money"
                    Style="text-align: right" Width="90px"></zhongsoft:LightTextBox>
            </td>
            <td>
                <asp:CheckBox Text="交款日期" ID="cbRentDay" runat="server" />
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtBeginDate" class="kpms-textbox-date"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtEndDate" class="kpms-textbox-date"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
                保函状态
                <zhongsoft:LightDropDownList ID="ddlGuaranteeState" runat="server">
                </zhongsoft:LightDropDownList>
                是否到期
                <zhongsoft:LightDropDownList ID="ddlIsExpire" runat="server">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvHandle" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" PageSize="12" UseDefaultDataSource="true" BindGridViewMethod="BindHandleGrid"
        DataKeyNames="HANDLEMARGINID">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="APPLYUSERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="APPLYDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="APPLYDATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保函工程名称" DataField="GUARANTEEPROJECT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保函种类" DataField="GUARANTEETYPEID">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保函格式" DataField="GUARANTEEFORMID">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保函金额(元)" DataField="GUARANTEEVALUESMALL">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保函期限(月)" DataField="GUARANTEETERM">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="受益人名称" DataField="BENEFICIARYNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="受益人地址" DataField="BENEFICIARYADDRESS">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="受益人联系电话" DataField="BENEFICIARYPHONE">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="开户银行" SortExpression="AccountBank">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="tbAccountBank" CssClass="kpmsp-textbox" Text='<%#Eval("AccountBank") %>'
                        EnableTheming="false"></asp:TextBox>
                    <asp:Label runat="server" ID="lbAccountBank" Text='<%#Eval("AccountBank") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="银行账号" SortExpression="BankAccount">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="tbBankAccount" CssClass="kpmsp-textbox" Text='<%#Eval("BankAccount") %>'
                        MaxLength="19" EnableTheming="false"></asp:TextBox>
                    <asp:Label runat="server" ID="lbBankAccount" Text='<%#Eval("BankAccount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="开具时间" SortExpression="STARTDATE">
                <ItemTemplate>
                    <input type="text" runat="server" id="txtStartDate" readonly="readonly" class="kpms-textbox-date"
                        value='<%#Eval("STARTDATE","{0:yyyy-MM-dd}") %>' enabletheming="false" />
                    <asp:Label runat="server" ID="lbStartDate" Text='<%#Eval("STARTDATE","{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="到期时间" SortExpression="ENDDATE">
                <ItemTemplate>
                    <input type="text" runat="server" id="txtEndDate" readonly="readonly" class="kpms-textbox-date"
                        compare='<%#Eval("UserId") %>' value='<%#Eval("ENDDATE","{0:yyyy-MM-dd}") %>'
                        enabletheming="false" />
                    <asp:Label runat="server" ID="lbEndDate" Text='<%#Eval("ENDDATE","{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="保证金比例(%)" SortExpression="MarginScale">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="tbMarginScale" CssClass="kpmsp-textbox" Text='<%#Eval("MarginScale") %>'
                        regex="^\+?[1-9][0-9]*$" errmsg="请输入正整数" EnableTheming="false"></asp:TextBox>
                    <asp:Label runat="server" ID="lbMarginScale" Text='<%#Eval("MarginScale") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="保证金金额" SortExpression="MarginValue"></asp:TemplateField>
            <asp:TemplateField HeaderText="领用人" SortExpression="Recipient">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="tbRecipient" CssClass="kpmsp-textbox" Text='<%#Eval("Recipient") %>'
                        EnableTheming="false"></asp:TextBox>
                    <asp:Label runat="server" ID="lbRecipient" Text='<%#Eval("Recipient") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="保函状态" SortExpression="GuaranteeState">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="tbGuaranteeState" CssClass="kpmsp-textbox" Text='<%#Eval("GuaranteeState") %>'
                        EnableTheming="false"></asp:TextBox>
                    <asp:Label runat="server" ID="lbGuaranteeState" Text='<%#Eval("GuaranteeState") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="是否到期" SortExpression="IsExpire">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="tbIsExpire" CssClass="kpmsp-textbox" Text='<%#Eval("IsExpire") %>'
                        EnableTheming="false"></asp:TextBox>
                    <asp:Label runat="server" ID="lbIsExpire" Text='<%#Eval("IsExpire") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="保存">
                <ItemStyle HorizontalAlign="Center" Width="30px" />
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnSave" CommandName="save" EnableTheming="false">
                                <img alt="保存" title="保存" src="../../../Themes/Images/btn_tb_save.gif"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField HeaderText="协议单"  DataParamFields="FId,PId"
                ItemStyle-Width="40px" ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

        //查看流程页面
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
