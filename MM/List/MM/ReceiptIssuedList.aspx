<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ReceiptIssuedList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.ReceiptIssuedList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">收据编号</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectInfo" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">交款人</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" MaxLength="20" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">交款部门</span><span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">交款日期</span><span>
        <asp:CheckBox Text="" ID="cbRentDay" runat="server" />
        <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtBeginDate" class="kpms-textbox-date"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
        <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtEndDate" class="kpms-textbox-date"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block"><span class="filter-block-lb">交款金额</span><span><asp:CheckBox
        Text="" ID="cbPayMent" runat="server" />
        <zhongsoft:LightTextBox ID="tbPayMent" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
            errmsg="金额必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="13" CssClass="kpms-textboxsearch"
            EnableTheming="false" Style="text-align: right"></zhongsoft:LightTextBox>
        至
        <zhongsoft:LightTextBox ID="tbMaxPayMent" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
            errmsg="金额必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="13" CssClass="kpms-textboxsearch"
            EnableTheming="false" Style="text-align: right"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">交款类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlLoanType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvLoan" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" PageSize="12" UseDefaultDataSource="true" BindGridViewMethod="BindLoanGrid"
        DataKeyNames="RECEIPTISSUEDID">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="收据编号" DataField="RECEIPTCODE" ItemStyle-HorizontalAlign="Left">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="交款人" DataField="APPLYUSERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="交款部门" DataField="APPLYDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="交款时间" DataField="PAYMENTTIME" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="交款金额(小写/元)" DataField="SMALLPAYMENT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="交款金额(大写/元)" DataField="LARGEPAYMENT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="收款类型" DataField="RECEIVABLESTYPEID">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="收款事由" DataField="RECEIVABLEREASON">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="协议单" EditItemClick="viewForm" DataParamFields="FId,PId"
                ItemStyle-Width="40px" ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程页面
        function viewForm(FId, PId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + FId + "&prcInstId=" + PId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
