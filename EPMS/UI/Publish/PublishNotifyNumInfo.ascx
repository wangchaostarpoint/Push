<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishNotifyNumInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishNotifyNumInfo" %>
<table class="tz-table" width="100%" id="Table1">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('publishNumDetail')">
            出版份数信息&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="publishNumDetail">
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                PermissionStatus="true" PageSize="10" AutoGenerateColumns="false" Width="100%"
                OnRowDataBound="gvList_RowDataBound" DataKeyNames="PublishNotifyNumID" EmptyDataText="没有出版份数信息"
                BindGridViewMethod="UserControl.BindInfo" ShowExport="true" ShowPageSizeChange="true">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="PartType" HeaderText="份数类型" HeaderStyle-Width="6%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="合同<br/>份数" ItemStyle-HorizontalAlign="right">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtContractCount" runat="server" Regex="^[0-9]\d*$"
                                Style="width: 30px" content="contractCount" errmsg="数量必须填写整数" MaxLength="6" class="kpms-textbox-money"
                                EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "ContractCount") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="收费<br/>份数" ItemStyle-HorizontalAlign="right">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtChargeCount" runat="server" Regex="^[0-9]\d*$" content="chargeCount"
                                Style="width: 30px" errmsg="数量必须填写整数" MaxLength="6" class="kpms-textbox-money"
                                EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "ChargeCount") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="<font style='font-weight:bold'>小计</font>"
                        ItemStyle-HorizontalAlign="right" ItemStyle-Font-Bold="true">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtSum1" runat="server" class="kpms-textbox-money"
                                content="sum1" Style="width: 30px; font-weight: bold;" EnableTheming="false"
                                readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="归档<br/>份数" ItemStyle-HorizontalAlign="right">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtPigeonholeCount" runat="server" Regex="^[0-9]\d*$"
                                Style="width: 30px" content="pigeonholeCount" errmsg="数量必须填写整数" MaxLength="6"
                                class="kpms-textbox-money" EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "PigeonholeCount") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="工代<br/>份数" ItemStyle-HorizontalAlign="right">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtBuildingCount" runat="server" Regex="^[0-9]\d*$"
                                Style="width: 30px" content="buildingCount" errmsg="数量必须填写整数" MaxLength="6" class="kpms-textbox-money"
                                EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "BuildingCount") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="设总<br/>份数" ItemStyle-HorizontalAlign="right">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtProjectManagerCount" runat="server" class="kpms-textbox-money"
                                Regex="^[0-9]\d*$" errmsg="数量必须填写整数" Style="width: 30px" content="projectManagerCount"
                                EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "ProjectManagerCount") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="其他" ItemStyle-HorizontalAlign="right">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtOtherCount" runat="server" Regex="^[0-9]\d*$" content="otherCount"
                                Style="width: 30px" errmsg="数量必须填写整数" MaxLength="6" class="kpms-textbox-money"
                                EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "OtherCount") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="<font style='font-weight:bold'>小计</font>"
                        ItemStyle-HorizontalAlign="right" ItemStyle-Font-Bold="true">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtSum2" runat="server" Style="width: 30px; font-weight: bold;"
                                content="sum2" class="kpms-textbox-money" EnableTheming="false" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="<font style='font-weight:bold'>合计</font>"
                        ItemStyle-HorizontalAlign="right" ItemStyle-Font-Bold="true">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtSumCount" runat="server" class="kpms-textbox-money"
                                Style="width: 30px; font-weight: bold;" content="sumCount" EnableTheming="false"
                                readonly="readonly" value='<%# DataBinder.Eval(Container.DataItem, "SumCount") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiPublishNotifyID" name="PublishNotifyID" runat="server" />
<%--整套，归档份数，默认值为1--%>
<input type="hidden" id="hiType" name="type" runat="server" value="整套" />
<script type="text/javascript">
    function initNumPlugin() {
        $("#<%=gvList.ClientID %>").find("[id$=txtContractCount]").live("blur", function () { total1($(this)); });
        $("#<%=gvList.ClientID %>").find("[id$=txtChargeCount]").live("blur", function () { total1($(this)); });

        $("#<%=gvList.ClientID %>").find("[id$=txtPigeonholeCount]").live("blur", function () { total2($(this)); });
        $("#<%=gvList.ClientID %>").find("[id$=txtBuildingCount]").live("blur", function () { total2($(this)); });
        $("#<%=gvList.ClientID %>").find("[id$=txtProjectManagerCount]").live("blur", function () { total2($(this)); });
        $("#<%=gvList.ClientID %>").find("[id$=txtOtherCount]").live("blur", function () { total2($(this)); });

    }
    //小计1
    function total1(obj) {
        var contractCount = 0;
        var chargeCount = 0;
        var sum1 = 0;
        var sum2 = 0;
        var sumCount = 0;
        //合同份数
        var $contractCount = $(obj).parent('td').parent('tr').find('input[content="contractCount"]');
        //收费份数
        var $chargeCount = $(obj).parent('td').parent('tr').find('input[content="chargeCount"]');
        //小计1
        var $sum1 = $(obj).parent('td').parent('tr').find('input[content="sum1"]');
        //小计2
        var $sum2 = $(obj).parent('td').parent('tr').find('input[content="sum2"]');
        //合计
        var $sumCount = $(obj).parent('td').parent('tr').find('input[content="sumCount"]');

        if ($contractCount != null) {
            contractCount = $contractCount.val();
            if (contractCount == "") {
                contractCount = 0;
            }
        }
        if ($chargeCount != null) {
            chargeCount = $chargeCount.val();
            if (chargeCount == "") {
                chargeCount = 0;
            }
        }
        if ($sum2 != null) {
            sum2 = $sum2.val();
            if (sum2 == "") {
                sum2 = 0;
            }
        }

        //小计1
        sum1 = parseInt(contractCount) + parseInt(chargeCount);
        $sum1.val(sum1);
        //合计
        sumCount = parseInt(sum1) + parseInt(sum2);
        $sumCount.val(sumCount);
    }

    //小计2
    function total2(obj) {
        var pigeonholeCount = 0;
        var buildingCount = 0;
        var projectManagerCount = 0;
        var otherCount = 0;
        var sum1 = 0;
        var sum2 = 0;
        var sumCount = 0;
        //归档份数
        var $pigeonholeCount = $(obj).parent('td').parent('tr').find('input[content="pigeonholeCount"]');
        //工代份数
        var $buildingCount = $(obj).parent('td').parent('tr').find('input[content="buildingCount"]');
        //设总份数
        var $projectManagerCount = $(obj).parent('td').parent('tr').find('input[content="projectManagerCount"]');
        //其他
        var $otherCount = $(obj).parent('td').parent('tr').find('input[content="otherCount"]');
        //小计1
        var $sum1 = $(obj).parent('td').parent('tr').find('input[content="sum1"]');
        //小计2
        var $sum2 = $(obj).parent('td').parent('tr').find('input[content="sum2"]');
        //合计
        var $sumCount = $(obj).parent('td').parent('tr').find('input[content="sumCount"]');

        if ($pigeonholeCount != null) {
            pigeonholeCount = $pigeonholeCount.val();
            if (pigeonholeCount == "") {
                pigeonholeCount = 0;
            }
        }
        if ($buildingCount != null) {
            buildingCount = $buildingCount.val();
            if (buildingCount == "") {
                buildingCount = 0;
            }
        }

        if ($projectManagerCount != null) {
            projectManagerCount = $projectManagerCount.val();
            if (projectManagerCount == "") {
                projectManagerCount = 0;
            }
        }
        if ($otherCount != null) {
            otherCount = $otherCount.val();
            if (otherCount == "") {
                otherCount = 0;
            }
        }
        if ($sum1 != null) {
            sum1 = $sum1.val();
            if (sum1 == "") {
                sum1 = 0;
            }
        }

        //小计2
        sum2 = parseInt(pigeonholeCount) + parseInt(buildingCount) + parseInt(projectManagerCount) + parseInt(otherCount);
        $sum2.val(sum2);
        //合计
        sumCount = parseInt(sum1) + parseInt(sum2);
        $sumCount.val(sumCount);
    }
</script>
