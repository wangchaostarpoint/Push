<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContChargePlanAndControl.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ContChargePlanAndControl" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">合同编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractInfo" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">合同类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="lbtnbtnSave" OnClick="btnSave_Click" EnableTheming="false"
        Style="display: none" CssClass="btn-query">
        <span>
            <img runat="server" id="img2" src="~/Themes/Images/btn_new.gif" alt="保存" height="16" />保存</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvContract" runat="server" AutoGenerateColumns="false"
        ShowExport="false" AllowPaging="true" PageSize="15" UseDefaultDataSource="true"
        AllowSorting="true" BindGridViewMethod="BindContract" ShowPageSizeChange="true"
        OnRowCommand="gvContract_RowCommand" OnRowDataBound="gvContract_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="序号" ItemStyle-HorizontalAlign="Center" Width="40">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="CONTRACTCODE" SortExpression="CONTRACTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同名称" DataField="CONTRACTNAME" Width="200"
                ShowToolTip="true" SortExpression="CONTRACTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同额<br/>（万元）" DataField="CONTRACTVALUE" ItemStyle-HorizontalAlign="Right"
                HtmlEncode="false" SortExpression="CONTRACTVALUE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="市场项目名称" DataField="MarketProjectName" Width="150"
                ShowToolTip="true" SortExpression="MarketProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同约定的收款条件" DataField="CARRYFORWARDNAME" Width="150"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="金额<br/>（万元）" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbItemValue" Text='<%#Eval("ITEMVALUE") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="进度完成情况<br/>(%)" ItemStyle-Width="80px">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiContractID" value='<%#Eval("ContractID") %>' />
                    <input type="hidden" runat="server" id="hiMarketProjectID" value='<%#Eval("MarketProjectID") %>' />
                    <zhongsoft:LightTextBox ID="tbFirstCompleteRate" runat="server" class="kpms-textbox-money"
                        EnableTheming="false" Text='<%# Eval("FIRSTRATE") %>' Regex="^([1-9][0-9]?(\.[0-9]{1,2})?)$|^(0\.[1-9][0-9]?)$|^(0\.[0-9][1-9])$|^(100|0)(\.00)?$"
                        Style="text-align: right; width: 70px" show="firstRate" showerrmsg="请输入1-100之间的数字,最多两位小数"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="根据进度<br/>完成情况<br/>应收款（万元）" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbShouldGetValue" Text='<%#Eval("COMPLETEVALUE") %>'></asp:Label>
                    <input type="hidden" runat="server" id="hiSplitPhaseValueID" value='<%#Eval("SpLitPhaseValueID") %>' />
                    <input type="hidden" runat="server" id="hiShouldGetValue" value='<%#Eval("COMPLETEVALUE") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="累计已收款<br/>（万元）" DataField="HADCHARGE" ItemStyle-HorizontalAlign="Right"
                HtmlEncode="false" SortExpression="CONTRACTVALUE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="未收款<br/>（万元）" ItemStyle-HorizontalAlign="Right"
                HtmlEncode="false">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            $("#<%=gvContract.ClientID%> [id$=tbFirstCompleteRate]").live("change", function () {
                autoCompleteRateValue(this);
            });
        }

        //自动计算合计值
        function autoCompleteRateValue(tbAmountObj) {
            var text = $(tbAmountObj).val()
            var reg = $(tbAmountObj).attr("regex")
            if (text != "" && reg != "") {
                if (!text.match(reg)) {
                     var msg=$(tbAmountObj).attr("showerrmsg");
                     alert(msg);
                    $(tbAmountObj).val("");
                }
            }
            var amountObj = $(tbAmountObj).parent('td').parent('tr').find("[id$=lbItemValue]");
            var rate = $(tbAmountObj).parent('td').parent('tr').find("[id$=tbFirstCompleteRate]");
            var shouldGetValue = $(tbAmountObj).parent('td').parent('tr').find("[id$=lbShouldGetValue]");
            var hishouldGetValue = $(tbAmountObj).parent('td').parent('tr').find("[id$=hiShouldGetValue]");
            if (amountObj != null && amountObj != undefined && rate != null && rate != undefined) {
                if (amountObj.text() != "" && rate.val() != "") {
                    var value = accMul(accMulLeaveNum(floatParse(amountObj.text()), 10000), floatParse(rate.val()));
                    if (shouldGetValue != null && amountObj != undefined) {
                        shouldGetValue.text(accDivLeaveNum(value, 1000000, 6));
                        $("#" + hishouldGetValue.attr("id")).val(accDivLeaveNum(value, 1000000, 6));
                        //后台保存
                        saveChangeData();
                    }
                }
                else {
                    shouldGetValue.text("");
                    hishouldGetValue.val("");
                    //后台保存
                    saveChangeData();
                }
            }
        }
        //鼠标移开后保存时数据
        function saveChangeData() { 
          <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnbtnSave, "")%>;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
