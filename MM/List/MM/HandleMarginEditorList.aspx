<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="HandleMarginEditorList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.HandleMarginEditorList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">保函工程名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbGuaranteeProject" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox></span></span><span class="filter-block">
                <span class="filter-block-lb">受益人名称</span><span>
                    <zhongsoft:LightTextBox runat="server" ID="tbBeneficiaryName" CssClass="kpms-textboxsearch"
                        EnableTheming="false"></zhongsoft:LightTextBox>
                </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">保函金额(元)</span><span>
        <asp:CheckBox Text="" ID="cbPayMent" runat="server" />
        <zhongsoft:LightTextBox ID="tbPayMent" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
            errmsg="请输入正数，最多10位整数" MaxLength="10" CssClass="kpms-textboxsearch" EnableTheming="false"
            Style="text-align: right"></zhongsoft:LightTextBox>
        至
        <zhongsoft:LightTextBox ID="tbMaxPayMent" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
            errmsg="请输入正数，最多10位整数" MaxLength="10" CssClass="kpms-textboxsearch" EnableTheming="false"
            Style="text-align: right"></zhongsoft:LightTextBox></span></span><span class="filter-block">
                <span class="filter-block-lb">开具日期</span><span>
                    <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartDate" class="kpms-textbox-date"
                        readonly="readonly">
                    </zhongsoft:XHtmlInputText>
                </span></span><span class="filter-block"><span class="filter-block-lb">到期日期</span><span>
                    <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtEndDate" class="kpms-textbox-date"
                        readonly="readonly">
                    </zhongsoft:XHtmlInputText>
                </span></span><span class="filter-block"><span class="filter-block-lb">保函状态</span><span>
                    <zhongsoft:LightDropDownList ID="ddlGuaranteeState" runat="server" class="kpms-ddlsearch"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span></span><span class="filter-block"><span class="filter-block-lb">是否到期</span><span>
                    <zhongsoft:LightDropDownList ID="ddlIsExpire" runat="server" class="kpms-ddlsearch"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvHandle" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" PageSize="15" UseDefaultDataSource="true" BindGridViewMethod="BindHandleGrid"
        DataKeyNames="HANDLEMARGINID" AllowFrozing="true" FrozenColNum="2" AllowSorting="true"
        ShowExport="true" OnExport="gvHandle_Export">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="APPLYUSERNAME" ItemStyle-HorizontalAlign="left">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="APPLYDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="APPLYDATE" DataFormatString="{0:yyyy-MM-dd}">
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
            <zhongsoft:LightBoundField HeaderText="开户银行" DataField="ACCOUNTBANK">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="银行账号" DataField="BANKACCOUNT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开具时间" DataField="STARTDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="到期时间" DataField="ENDDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保证金比例(%)" DataField="MARGINSCALE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保证金金额" DataField="MARGINVALUE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="领用人" DataField="RECIPIENT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保函状态" DataField="GUARANTEESTATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否到期" DataField="ISEXPIRE">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvHandle.CheckedClientID %>";

        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
