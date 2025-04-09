<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="MoneyApplyList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.MoneyApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">发送部门</span><span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">发送人</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" MaxLength="20" CssClass="kpms-textboxsearch"
            EnableTheming="false">
        </zhongsoft:LightTextBox></span></span><span class="filter-block"><span class="filter-block-lb">
            标题</span><span>
                <zhongsoft:LightTextBox ID="tbTitle" runat="server" CssClass="kpms-textboxsearch"
                    EnableTheming="false">
                </zhongsoft:LightTextBox>
            </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">申请时间</span><span>
        <asp:CheckBox Text="" ID="cbApplyDate" runat="server" />
        <zhongsoft:XHtmlInputText runat="server" ID="txtBeginDate" class="kpms-textbox-date"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
        <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-date"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block"><span class="filter-block-lb">金额:</span><span>
        <asp:CheckBox Text="" ID="cbApplyMoney" runat="server" />
        <zhongsoft:LightTextBox ID="tbApplyMoney" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
            errmsg="金额必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="13" CssClass="kpms-textboxsearch"
            EnableTheming="false" Style="text-align: right">
        </zhongsoft:LightTextBox>
        至
        <zhongsoft:LightTextBox ID="tbMaxApplyMent" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
            errmsg="金额必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="13" CssClass="kpms-textboxsearch"
            EnableTheming="false" Style="text-align: right">
        </zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvMoney" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" PageSize="12" UseDefaultDataSource="true" BindGridViewMethod="BindMoneyGrid"
        DataKeyNames="MONEYAPPLYID">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="APPLYDEPTNAME" ItemStyle-HorizontalAlign="Left">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="APPLYUSERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="标题" DataField="TITLE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="上期资金余额(元)" DataField="APPLYMONEY">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本期申请金额(元)" DataField="LASTLEAVEMONEY">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="核定金额(元)" DataField="CONFIRMMONEY">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请时间" DataField="APPLYDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成时间" DataField="FINISHDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="协议单" EditItemClick="viewForm" DataParamFields="FId,PId"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif">
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
