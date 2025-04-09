<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAccountDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ContractAccountDetail" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr runat="server" Visible="False">
            <td class="td-l">
                标准库拆分比例模板
            </td>
            <td colspan="3">
                <a href="<%=this.WebAppPath %>/Sys/Download/标准库拆分比例.doc" target="_blank" style="text-decoration: underline;
                    color: Blue">标准库拆分比例</a>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <asp:Label runat="server" ID="lbShowName"></asp:Label>
            </td>
            <td class="td-m" colspan="5">
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
                <asp:Button runat="server" ID="btnAutoGetValue" OnClick="btnAutoGetValue_Click" Text="自动提取项目预估合同额" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <zhongsoft:TreeGridView ID="gvSplitDetail" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SPLITPHASEVALUEID" PowerPageCount="0" PowerPageIndex="0" RecordsCount="0"
                    SelfIdColumn="PARAMSPLITITEMID" ParentIdColumn="PARENTID" UseDefaultDataSource="true"
                    OnRowDataBound="gvSplitDetail_RowDataBound" ShowFooter="true">
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%# gvSplitDetail.CreateHeader(Container.DataItem)%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="PARAMSPLITITEMNAME" HeaderText="分项名称" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Width="150px" />
                        <zhongsoft:LightTemplateField HeaderText="合同额（万元）<span class='req-star'>*</span>"
                            ItemStyle-Width="150px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbContractAmount" runat="server" class="kpms-textbox-money"
                                    Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="合同额请输入正数，最多8位整数，6位小数" EnableTheming="false"
                                    Text='<%# Eval("ITEMVALUE") %>' index="1" Style="text-align: right; width: 100px"></zhongsoft:LightTextBox><asp:Label
                                        ID="lbUnit" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label runat="server" ID="lbSum"></asp:Label>
                            </FooterTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:TreeGridView>
            </td>
            <td colspan="3" id="tdAccount">
                <zhongsoft:TreeGridView ID="gvCompleteDetail" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SPLITPHASEVALUEID" PowerPageCount="0" PowerPageIndex="0" RecordsCount="0"
                    SelfIdColumn="PARAMSPLITITEMID" ParentIdColumn="PARENTID" UseDefaultDataSource="true"
                    OnRowDataBound="gvSplitDetail_RowDataBound" ShowFooter="true">
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%# gvCompleteDetail.CreateHeader(Container.DataItem)%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="PARAMSPLITITEMNAME" HeaderText="分项名称" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Width="150px" />
                        <zhongsoft:LightTemplateField HeaderText="结算额（万元）<span class='req-star'>*</span>"
                            ItemStyle-Width="150px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbContractAmount" runat="server" class="kpms-textbox-money"
                                    EnableTheming="false" Text='<%# Eval("COMPLETEVALUE") %>' Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                                    index="1" Style="text-align: right; width: 100px" errmsg="结算额请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label runat="server" ID="lbSum"></asp:Label>
                            </FooterTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:TreeGridView>
            </td>
        </tr>
    </table>
    <script>
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            //不是结算拆分时，不显示拆分信息
            if (!checkIsAccount()) {
                $("tdAccount").hide();
            }
            $("#<%=gvCompleteDetail.ClientID %> [id$=tbContractAmount]").live("change", function () { autoComputeSum($(this), "gvCompleteDetail", "<%=gvCompleteDetail.ClientID %>"); })
            $("#<%=gvSplitDetail.ClientID %> [id$=tbContractAmount]").live("change", function () { autoComputeSum($(this), "gvSplitDetail", "<%=gvSplitDetail.ClientID %>"); })
            $("#<%=gvCompleteDetail.ClientID %> [id$=tbContractAmount]").each(function () { autoCompleteValue($(this), "gvCompleteDetail", "<%=gvCompleteDetail.ClientID %>"); })
            $("#<%=gvSplitDetail.ClientID %> [id$=tbContractAmount]").each(function () { autoCompleteValue($(this), "gvSplitDetail", "<%=gvSplitDetail.ClientID %>"); })
        }

//        function checkForm() {
////            if (checkIsAccount() && !checkFillIsRight()) {
////                alert("合同额数值不相符，请认真查看！");
////                return false;
////            }
////            return true;
//        }

        //自动计算合计值
        function autoCompleteValue(obj, detailName, gvDetail) {
            var firstLevelID = detailName + "_";
            var $firstlevelInput = $('div[id^=' + firstLevelID + '][level=0]').parent('td').parent('tr').find('input');
            var levelsum = 0;
            levelsum = addNum($firstlevelInput, levelsum);
            var lbSum = $("#" + gvDetail).find("[id$=lbSum]");
            lbSum.text(levelsum);
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

        //判断是否结算拆分
        function checkIsAccount() {
            return "<%=IsAccount %>" == "<%=Boolean.TrueString %>";
        }

        //计算合计值，逐级累加
        function autoComputeSum(thisAdjust, detailName, gvDetail) {
            var text = thisAdjust.val()
            var reg = thisAdjust.attr("regex");


            if (text != "" && reg != "") {
                if (!text.match(reg)) {
                    alert(thisAdjust.attr("errmsg"))
                    thisAdjust.focus();
                    thisAdjust.val("0.00");
                    return;
                }
            }

            var blurlevelid = thisAdjust.parent('td').parent('tr').find('td:eq(0) div').attr('id');
            var index = thisAdjust.attr('index'); //取得当前的索引值，便于计算综合
            //取得离开的文本框ID中最后一个_出现的位置
            var levelpreindex = blurlevelid.lastIndexOf('_');
            //获取上一级的文本框ID
            var prelevelid = blurlevelid.slice(0, levelpreindex);
            var prelevelidRecord = prelevelid;
            //获取最底级共有的ID
            var levelidlower = thisAdjust.parents('tr').find('td:eq(0) div').attr('id').slice(0, levelpreindex + 1);
            var levelsum = 0;

            //上一级级别大于等于一级
            while (prelevelid.split('_').length - 1 >= 1) {
                //获取上一级文本框
                var $prelevelinput = $('div[id=' + prelevelid + ']').parent('td').parent('tr').find('input[index=' + index + ']'); //取得父级的父级所有input
                $div = $('div[id=' + prelevelid + ']');
                var level = parseInt($div.attr('level'), 10) + 1;
                var parentSum = new Number();
                //获取所有底级文本框集合
                var $lowerlevel = $('div[id^=' + levelidlower + '][level=' + level + ']').parent('td').parent('tr').find('input[index=' + index + ']'); //用于计算列总和
                var levelsum = 0;
                levelsum = addNum($lowerlevel, levelsum);
                $prelevelinput.val(levelsum);
                var levelpreindex = prelevelid.lastIndexOf('_');
                //将上一级文本框设置为底级文本框
                levelidlower = $lowerlevel.parents('tr').find('td:eq(0) div').attr('id').slice(0, levelpreindex + 1);
                //将prelevelid设置为上上级预计文本框的ID
                prelevelid = prelevelid.slice(0, prelevelid.lastIndexOf('_'));
            }
            autoCompleteValue(thisAdjust, detailName, gvDetail);
        }

        function addNum($twolevel, levelsum) {
            var twolevelarray = new Array();
            for (k = 0; k < $twolevel.length; k++) {//以列为单位计算二级的总合
                twolevelarray[k] = $twolevel.eq(k).val();
                $twolevel.eq(k).css('color', 'black');

                twolevelarray[k] = floatParse(twolevelarray[k]);
                levelsum = accAddFloat6(accMulLeaveNum(twolevelarray[k], 10000, 2), levelsum);
            }
            return accDivLeaveNum(levelsum, 10000, 6);
        }
    
    </script>
</asp:Content>
