<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneralContractSplitDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.GeneralContractSplitDetail" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtProjectName" readonly="readonly"
                    activestatus="(23.*)" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtProjectCode" readonly="readonly"
                    activestatus="(23.*)" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <zhongsoft:TreeGridView runat="server" DataKeyNames="GENERALSPLITDETAILID" AutoGenerateColumns="False"
                    ID="tgvSplitDetail" AllowPaging="True" PageSize="100" ShowExport="true" OnExport="tgvSplitDetail_Export"
                    UseDefaultDataSource="true" SelfIdColumn="PARAMGENERALCONSPLITID" ParentIdColumn="PARENTID"
                    OnRowDataBound="tgvSplitDetail_DataBound" OnRowCommand="tgvSplitDetail_RowCommand"
                    AllowFrozing="true">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%# tgvSplitDetail.CreateHeader(Container.DataItem)%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="分项" DataField="GENERALSPLITNAME" ItemStyle-Width="80px" />
                        <asp:TemplateField HeaderText="本期金额" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbItemValue" CssClass="kpms-textbox-money"
                                    needCal="true" regex="(^[1-9]\d{0,7}(\.\d{1,4})?$)|(^[0](\.\d{1,4})?$)" errmsg="请输入正数，最多8位整数4位小数"
                                    Text='<%#Eval("ITEMVALUE") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:TreeGridView>
            </td>
            <td colspan="2">
                <zhongsoft:TreeGridView runat="server" DataKeyNames="GENERALSPLITDETAILID" AutoGenerateColumns="False"
                    ID="tgvCompleteDetail" AllowPaging="True" PageSize="100" ShowExport="true" OnExport="tgvSplitDetail_Export"
                    UseDefaultDataSource="true" SelfIdColumn="PARAMGENERALCONSPLITID" ParentIdColumn="PARENTID"
                    OnRowDataBound="tgvSplitDetail_DataBound" OnRowCommand="tgvSplitDetail_RowCommand"
                    AllowFrozing="true">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%# tgvSplitDetail.CreateHeader(Container.DataItem)%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="分项" DataField="GENERALSPLITNAME" ItemStyle-Width="80px" />
                        <asp:TemplateField HeaderText="本期金额" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbItemValue" CssClass="kpms-textbox-money"
                                    needCal="true" regex="(^[1-9]\d{0,7}(\.\d{1,4})?$)|(^[0](\.\d{1,4})?$)" errmsg="请输入正数，最多8位整数4位小数"
                                    Text='<%#Eval("ITEMVALUE") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:TreeGridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lbContractValue"></asp:Label>
                <asp:Label runat="server" ID="lbCompleteValue"></asp:Label>
            </td>
        </tr>
    </table>
    <script>
    
     <script>
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            $("#<%=gvCompleteDetail.ClientID %> [id$=tbContractAmount]").live("change", function () { autoCompleteValue("<%=gvCompleteDetail.ClientID %>"); })
            $("#<%=gvSplitDetail.ClientID %> [id$=tbContractAmount]").live("change", function () { autoCompleteValue("<%=gvSplitDetail.ClientID %>"); })
            $("#<%=gvCompleteDetail.ClientID %> [id$=tbContractAmount]").each(function () { autoCompleteValue("<%=gvCompleteDetail.ClientID %>"); })
            $("#<%=gvSplitDetail.ClientID %> [id$=tbContractAmount]").each(function () { autoCompleteValue("<%=gvSplitDetail.ClientID %>"); })
        }

        function checkForm() {
            if (!checkFillIsRight()) {
                alert("合同额数值不相符，请认真查看！");
                return false;
            }
            return true;
        }

        //自动计算合计值
        function autoCompleteValue(gvDetail, lbSum) {
            var $array = $("#" + gvDetail).find("[id$=tbContractAmount]");
            var sumValue = 0;
            for (i = 0; i < $array.length; i++) {
                var thisValue = $($array[i]).val();
                if (thisValue == "") {
                    thisValue = 0;
                }
                else {
                    thisValue = parseFloat(thisValue) * 10000;
                }
                sumValue += thisValue;
            }

            var lbSum = $("#" + gvDetail).find("[id$=lbSum]");
            lbSum.text(parseFloat(parseFloat(sumValue) / 10000).toFixed(6));
        }

        //判断合同额列表中合计与完成合同额中合同额是否相等
        function checkFillIsRight() {
            var contractValue = $("#<%=gvSplitDetail.ClientID %>").find("[id$=lbSum]").text();
            var contractComValue = $("#<%=gvCompleteDetail.ClientID %> ").find("[id$=lbSum]").text();

            if (contractValue == "") {
                contractValue = 0;
            }
            else {
                contractValue = parseFloat(contractValue) * 10000;
            }
            if (contractComValue == "") {
                contractComValue = 0;
            }
            else {
                contractComValue = parseFloat(contractComValue) * 10000;
            }
            if (contractValue != contractComValue) {
                return false;
            }
            return true;
        }
    
    </script>
    </script>
</asp:Content>
