<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanAndPurchaseContractList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.PlanAndPurchaseContractList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">合同编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractInfo" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">合同大类</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBaseType" class="kpms-ddlsearch" OnSelectedIndexChanged="ddlBaseType_SelectedIndexChanged" AutoPostBack="true"
            EnableTheming="false">
            <asp:ListItem Value="全部">
                全部
            </asp:ListItem>
            <asp:ListItem Value="合同">
                合同
            </asp:ListItem>
            <asp:ListItem Value="外委合同">
                外委合同
            </asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">合同类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">合同相对方</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractCustomer" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">承办人</span><span>
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
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">合同额（万元）</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractValueStart" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
            Width="70" errmsg="合同额请输入正数，最多8位整数，6位小数" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        <zhongsoft:LightTextBox runat="server" ID="tbContractValueEnd" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
            Width="70" errmsg="合同额请输入正数，最多8位整数，6位小数" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">

    <zhongsoft:LightPowerGridView ID="gvContractList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true"
        AllowSorting="true" BindGridViewMethod="BindDataGrid" OnRowDataBound="gvContractList_RowDataBound"
        ShowPageSizeChange="true" DataKeyNames="CONTRACTID" ShowFooter="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnChakan" runat="server" EnableTheming="false">
						<img alt="查看" onclick='return ViewContract("<%#Eval("CONTRACTID")%>","<%#Eval("BASETYPE")%>");' src="<%=WebAppPath %>/Themes/Images/btn_dg_view.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="CONTRACTCODE"
                SortExpression="CONTRACTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同名称" DataField="CONTRACTNAME" HeaderStyle-Width="500px" ShowToolTip="true" SortExpression="CONTRACTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同大类" DataField="BASETYPE" SortExpression="BASETYPE" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同类型" DataField="CONTRACTTYPENAME" SortExpression="CONTRACTTYPENAME" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同金额<br/>（万元）" DataField="CONTRACTVALUE" ItemStyle-HorizontalAlign="Right"
                HtmlEncode="false" SortExpression="CONTRACTVALUE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同相对方" DataField="CUSTOMERNAME"
                ShowToolTip="true" SortExpression="CUSTOMERNAME" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="200">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="相对方联系人及电话" DataField="CONTACTINFO"
                SortExpression="CONTACTINFO" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="承办部门及联系人" DataField="UNDERTAKEINFO" SortExpression="UNDERTAKEINFO" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="100">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="签订日期" DataField="SIGNDATE" SortExpression="SIGNDATE"
                DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function ViewContract(contractid, basetype) {
            if (basetype == "合同") {  //计划项目合同
                var url = buildQueryUrl('/MM/List/MCM/ContractEditor.aspx', { 'actionType': 1, 'bizId': contractid });
                showDivDialog(url, "", 1000, 600, null);
            } else {    //采购合同
                var url = buildQueryUrl('/MM/List/MBM/PurchaseContractEditor.aspx', { 'actionType': 1, 'bizId': contractid });
                showDivDialog(url, "", 850, 500, null);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
