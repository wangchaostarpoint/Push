<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCEstimateValueSplit.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.UCEstimateValueSplit" %>
<zhongsoft:TreeGridView ID="gvSplitDetail" runat="server" AutoGenerateColumns="False"
    PowerPageCount="0" PowerPageIndex="0" RecordsCount="0" SelfIdColumn="PARAMSPLITITEMID"
    ParentIdColumn="PARENTID" UseDefaultDataSource="true" OnRowDataBound="gvSplitDetail_RowDataBound"
    ShowFooter="true">
    <FooterStyle HorizontalAlign="Right" />
    <PagerStyle HorizontalAlign="Right"></PagerStyle>
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px"  ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# gvSplitDetail.CreateHeader(Container.DataItem)%>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="PARAMSPLITITEMNAME" HeaderText="分项名称" ItemStyle-HorizontalAlign="Left"
            ItemStyle-Width="150px" />
        <zhongsoft:LightTemplateField HeaderText="合同额(万元)<span class='req-star'>*</span>" ItemStyle-Width="150px">
            <ItemTemplate>
                <zhongsoft:LightTextBox ID="tbContractAmount" runat="server" class="kpms-textbox-money"
                    Regex="^([1-9]\d{0,8}|[0])(\.\d{1,6})?$" EnableTheming="false" Text='<%# Eval("ITEMVALUE") %>'
                     index="1" errmsg="请输入正数，最多8位整数，6位小数" Style="text-align: right; width: 100px"></zhongsoft:LightTextBox><asp:Label
                        ID="lbUnit" runat="server"></asp:Label>
                <input type="hidden" runat="server" id="hiParamID" value='<%#Eval("PARAMSPLITITEMID") %>' />
            </ItemTemplate>
            <FooterTemplate>
                <asp:Label runat="server" ID="lbSum"></asp:Label>
            </FooterTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:TreeGridView>
<input type="hidden" runat="server" id="hiContractValue" />
<script>
    function estimateValue_Init() {
        $("#<%=gvSplitDetail.ClientID %> [id$=tbContractAmount]").live("change", function () { autoComputeSum($(this)); })
        $("#<%=gvSplitDetail.ClientID %> [id$=tbContractAmount]").each(function () { autoCompleteValue($(this)); })
    }


    //自动计算合计值
    function autoCompleteValue() {
        var firstLevelID = "gvSplitDetail_";
        var $firstlevelInput = $('div[id^=' + firstLevelID + '][level=0]').parent('td').parent('tr').find('input[id$=tbContractAmount]');
        var levelsum = 0;
        levelsum = addNum($firstlevelInput, levelsum);
        var lbSum = $("#<%=gvSplitDetail.ClientID %>").find("[id$=lbSum]");
        lbSum.text(levelsum);

        if ($('#<%=hiContractValue.ClientID %>').val() != "") {
            //要赋值的控件信息
            var payCtrls = $('#<%=hiContractValue.ClientID %>').val().split('|');
            $("#" + payCtrls[0]).val(levelsum);
        }
    }

    //计算合计值，逐级累加
    function autoComputeSum(thisAdjust) {
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
        autoCompleteValue();
    }

    function addNum($twolevel, levelsum) {
        var twolevelarray = new Array();
        for (k = 0; k < $twolevel.length; k++) {//以列为单位计算二级的总合
            twolevelarray[k] = $twolevel.eq(k).val();
            $twolevel.eq(k).css('color', 'black');
            if (twolevelarray[k] == '') {
                twolevelarray[k] = 0;
            }

            levelsum += parseFloat(twolevelarray[k]) * 10000;
        }
        return parseFloat(parseFloat(levelsum) / 10000).toFixed(6);
    }
</script>
