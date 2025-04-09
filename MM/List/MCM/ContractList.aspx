<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractList"
    MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">合同编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractInfo" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">合同类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">合同相对方</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractCustomer" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">收费状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlChargeState" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">合同额（万元）</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractValueStart" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
            Width="70" errmsg="合同额请输入正数，最多8位整数，6位小数" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        <zhongsoft:LightTextBox runat="server" ID="tbContractValueEnd" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
            Width="70" errmsg="合同额请输入正数，最多8位整数，6位小数" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">承办人</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbUndertakeUserName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">承办部门</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbUndertakeDeptName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">签订日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtSignDateStart" class="kpms-textbox-comparedate"
            readonly="readonly" compare="1">
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText runat="server" ID="txtSignDateEnd" class="kpms-textbox-comparedate"
            readonly="readonly" compare="1">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block"><span class="filter-block-lb">所属板块</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBelongPlate" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目编号</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectPhaseCode" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">执行情况</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvContract" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="8" UseDefaultDataSource="true"
        AllowSorting="true" AllowFrozing="true" FrozenColNum="2" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" DataKeyNames="CONTRACTID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="CONTRACTCODE" Width="100"
                SortExpression="CONTRACTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同名称" DataField="CONTRACTNAME" Width="350"
                ShowToolTip="true" SortExpression="CONTRACTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同额<br/>（万元）" DataField="CONTRACTVALUE" ItemStyle-HorizontalAlign="Right"
                HtmlEncode="false" SortExpression="CONTRACTVALUE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="应收款<br/>（万元）" DataField="SPLITCOMPLETEVALUE" ItemStyle-HorizontalAlign="Right"
                SortExpression="HADCHARGE" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="已收款<br/>（万元）" DataField="HADCHARGE" ItemStyle-HorizontalAlign="Right"
                SortExpression="HADCHARGE" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="应收款-已收款<br/>（万元）" DataField="COMPLETE-HADCHARGE" ItemStyle-HorizontalAlign="Right"
                SortExpression="COMPLETE-HADCHARGE" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同额-已收款<br/>（万元）" DataField="CONTRACTVALUE-HADCHARGE" ItemStyle-HorizontalAlign="Right"
                SortExpression="CONTRACTVALUE-HADCHARGE" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="已开票金额<br/>（万元）" DataField="SUMINVOICEMN" HtmlEncode="false"
                SortExpression="SUMINVOICEMN" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="已开票未回款金额<br/>（万元）" DataField="SUMINVOICEMN-HADCHARGE" HtmlEncode="false"
                SortExpression="SUMINVOICEMN-HADCHARGE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同相对方" DataField="CUSTOMERNAME" Width="250"
                ShowToolTip="true" SortExpression="CUSTOMERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同类型" DataField="TYPENAME" SortExpression="TYPENAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="承办人" DataField="UNDERTAKEUSERNAME" SortExpression="UNDERTAKEUSERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="承办部门" DataField="UNDERTAKEDEPTNAME" SortExpression="UNDERTAKEDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="签订日期" DataField="SIGNDATE" SortExpression="SIGNDATE"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <%--   <zhongsoft:LightBoundField HeaderText="地域" DataField="REGION" SortExpression="REGION">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="勘测拆分额<br/>（万元）" DataField="SPLITVALUE" ItemStyle-HorizontalAlign="Right"
                HtmlEncode="false" SortExpression="SPLITVALUE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同结算金额<br/>（万元）" DataField="SETTLEVALUE" HtmlEncode="false"
                SortExpression="SETTLEVALUE" ItemStyle-HorizontalAlign="Right" Visible="False">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同执行情况" DataField="CONTRACTSTATE" SortExpression="CONTRACTSTATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="收费状态" DataField="CHARGESTATE" SortExpression="CHARGESTATE">
            </zhongsoft:LightBoundField>

            <%--   <zhongsoft:LightBoundField HeaderText="完成合同额<br/>（万元）" DataField="HADCOMPLETEVALUE"
                SortExpression="HADCOMPLETEVALUE" ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="变更合同额<br/>（万元）" DataField="CHANGESETTLEVALUE"
                SortExpression="CHANGESETTLEVALUE" ItemStyle-HorizontalAlign="Right" HtmlEncode="false" Visible="False">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Label runat="server" ID="lbContractInfo"></asp:Label>
    <script>

        $gridCheckedClientID = "<%=this.gvContract.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
