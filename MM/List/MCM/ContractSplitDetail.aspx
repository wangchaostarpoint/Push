<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSplitDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ContractSplitDetail" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="合同拆分详细" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="<%=WebAppPath %>/FM/UI/Script/FMGeneralScript.js"></script>
    <table class="tz-table" style="width: 100%">
        <%--   <tr>
            <td class="td-l" nowrap>
                标准库拆分比例模板
            </td>
            <td colspan="3">
                <a href="<%=this.WebAppPath %>/Sys/Download/标准库拆分比例.doc" target="_blank" style="text-decoration: underline;
                    color: Blue">标准库拆分比例</a>
            </td>
        </tr> --%>
        <tr>
            <td class="td-l">
                模板<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rbSplitTemplate" RepeatDirection="Horizontal"
                    activestatus="(23.*)" AutoPostBack="true" OnSelectedIndexChanged="rbSplitTemplate_SelectedIndexChanged"
                    req="1">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <asp:Label runat="server" ID="lbShowName"></asp:Label>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtProjectName" readonly="readonly"
                    activestatus="(23.*)" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <asp:Label runat="server" ID="lbShowCode"></asp:Label>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtProjectCode" readonly="readonly"
                    activestatus="(23.*)" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
                <%--  <asp:Button runat="server" ID="btnAutoGetValue" OnClick="btnAutoGetValue_Click" Text="自动提取项目预估合同额" />--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <zhongsoft:LightPowerGridView ID="gvSplitDetail" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SPLITPHASEVALUEID" PowerPageCount="0" PowerPageIndex="0" RecordsCount="0"
                    UseDefaultDataSource="true" OnRowDataBound="gvSplitDetail_RowDataBound" ShowFooter="true">
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                    <Columns>
                        <asp:BoundField DataField="PARAMSPLITITEMNAME" HeaderText="分项名称" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Width="150px" FooterText="合计" />
                        <asp:TemplateField HeaderText="合同额（万元）<span class='req-star'>*</span>" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbContractAmount" runat="server" class="kpms-textbox-money"
                                    EnableTheming="false" Text='<%# Eval("ITEMVALUE") %>' Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                                    Style="text-align: right; width: 100px" errmsg="请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox><asp:Label
                                        ID="lbUnit" runat="server"></asp:Label>
                                        <input type="hidden" runat="server" id="hidOrganizationID" value='<%#Eval("OrganizationNew") %>'/>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <FooterTemplate>
                                <asp:Label runat="server" ID="lbSum"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
            <td class="2">
            </td>
        </tr>
        <tr displaystatus="(23.*)" runat="server">
            <td colspan="4" class="td-m">
                新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                    Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行
                <asp:Button runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkFillNum()" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvComplete" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SPLITPHASEVALUEID,FIRSTCARRYFORWARDID" PowerPageCount="0" PowerPageIndex="0" RecordsCount="0"
                    OnRowDataBound="gvComplete_RowDataBound" UseDefaultDataSource="true" OnRowCommand="gvComplete_RowCommand"
                    ShowFooter="true">
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                    <Columns>
                        <asp:TemplateField HeaderText="分项名称<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlParamItem" req="1" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                            <FooterTemplate>
                                合计
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="合同额（万元）"  ItemStyle-Width="100px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbContractAmount" runat="server" class="kpms-textbox-money"
                                    EnableTheming="false" Text='<%# Eval("ITEMVALUE") %>' Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                                    activestatus="(23.*)"  Style="text-align: right" errmsg="合同额请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                                    <input runat="server" type="hidden" id="hidOrganizationIDCom" value='<%#Eval("OrganizationNew") %>'/>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <FooterTemplate>
                                <asp:Label runat="server" ID="lbSum"></asp:Label>
                            </FooterTemplate>

<ItemStyle Width="100px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="结转条件">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList Width="50%" ID="ddlPhase" runat="server" 
                                    activestatus="(23.*)" AutoPostBack="True" 
                                    onselectedindexchanged="ddlPhase_SelectedIndexChanged">
                                </zhongsoft:LightDropDownList>
                                <zhongsoft:LightDropDownList Width="50%" runat="server" ID="ddlCarryForward" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                                <input type="hidden" runat="server" id="hifirstShowType" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="进度完成情况" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbFirstCompleteRate" runat="server" class="kpms-textbox-money"
                                    EnableTheming="false" Text='<%# Eval("FIRSTRATE") %>' Regex="^([1-9][0-9]?(\.[0-9]{1,2})?)$|^(0\.[1-9][0-9]?)$|^(0\.[0-9][1-9])$|^100(\.00)?$"
                                    Style="text-align: right; width: 90%" show="firstRate" errmsg="请输入1-100之间的数字,最多两位小数"></zhongsoft:LightTextBox>
                                <asp:Label runat="server" ID="lbFirstRate" show="firstRate">%</asp:Label>
                            </ItemTemplate>

<ItemStyle Width="80px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="根据进度完成情况<br/>应收款（万元）" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbShouldGetValue" Text='<%#Eval("COMPLETEVALUE") %>'></asp:Label>
                                <input type="hidden" runat="server" id="hiShouldGetValue" value='<%#Eval("COMPLETEVALUE") %>' />
                            </ItemTemplate>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:TemplateField>
                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该记录吗？">
<HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiTechContractName" value="科技项目" />
    <input type="hidden" runat="server" id="hiContractValue" />
    <script>
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            if ("<%=Enabled %>".toLocaleLowerCase() == "true") {
                $("#<%=gvSplitDetail.ClientID %> [id$=tbContractAmount]").live("change", function () { autoCompleteValue("<%=gvSplitDetail.ClientID %>", true, this); })
                $("#<%=gvComplete.ClientID %> [id$=tbContractAmount]").live("change", function () { autoCompleteValue("<%=gvComplete.ClientID %>", true, this); })
                $("#<%=gvComplete.ClientID %> [id$=tbContractAmount]").live("change", function () { autoCompleteRateValue(this); })
                $("#<%=gvComplete.ClientID %> [id$=tbFirstCompleteRate]").live("change", function () { autoCompleteRateValue(this); })
            }
            $("#<%=gvSplitDetail.ClientID %> [id$=tbContractAmount]").each(function () { autoCompleteValue("<%=gvSplitDetail.ClientID %>", false, null); })
            $("#<%=gvComplete.ClientID %> [id$=tbContractAmount]").each(function () { autoCompleteValue("<%=gvComplete.ClientID %>", false, null); })

        }

        //自动计算合计值
        function autoCompleteValue(gvDetail, isCheck, obj) {
            var $array = $("#" + gvDetail).find("[id$=tbContractAmount]");
            var lbSum = $("#" + gvDetail).find("[id$=lbSum]");
            var sumValue = 0;
            for (i = 0; i < $array.length; i++) {
                var thisValue = $($array[i]).val();
                thisValue = floatParse(thisValue);
                thisValue = accMulLeaveNum(thisValue, 10000, 2);
                sumValue = accAddFloat6(thisValue, sumValue);
            }

            if (isCheck) {
                var contractValue = $("#<%=hiContractValue.ClientID %>").val();
                if (accSub(floatParse(contractValue), floatParse(sumValue)) < 0) {
                    alert("拆分额之和已大于合同额，请检查！");
                    sumValue = accSub(floatParse(sumValue), floatParse(accMulLeaveNum($(obj).val(), 10000, 2)));
                    lbSum.text(accDivLeaveNum(sumValue, 10000, 6));
                    $(obj).val("");
                    $(obj).focus();
                    autoCompleteRateValue(obj);
                    return;
                }
            }
            lbSum.text(accDivLeaveNum(sumValue, 10000, 6));
        }

        //自动计算合计值
        function autoCompleteRateValue(tbAmountObj) {
            var amountObj = $(tbAmountObj).parent('td').parent('tr').find("[id$=tbContractAmount]");
            var rate = $(tbAmountObj).parent('td').parent('tr').find("[id$=tbFirstCompleteRate]");
            var shouldGetValue = $(tbAmountObj).parent('td').parent('tr').find("[id$=lbShouldGetValue]");
            var hishouldGetValue = $(tbAmountObj).parent('td').parent('tr').find("[id$=hiShouldGetValue]");
            if (amountObj != null && amountObj != undefined && rate != null && rate != undefined) {
                if (amountObj.val() != "" && rate.val() != "") {
                    var value = accMul(accMulLeaveNum(floatParse(amountObj.val()), 10000), floatParse(rate.val()));
                    if (shouldGetValue != null && amountObj != undefined) {
                        shouldGetValue.text(accDivLeaveNum(value, 1000000, 6));
                        hishouldGetValue.val(accDivLeaveNum(value, 1000000, 6));
                    }
                }
                else {
                    shouldGetValue.text("");
                    hishouldGetValue.val("");
                }
            }
        }

        function checkFillNum() {
            var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
            if (fillNum == "") {
                alert("请输入要添加的行数");
                return false;
            }
            return true;
        }
 
    </script>
</asp:Content>
