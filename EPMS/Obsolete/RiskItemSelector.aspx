<%@ Page Language="C#" AutoEventWireup="true" Title="套用模板风险点" CodeBehind="RiskItemSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.RiskItemSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">风险控制和机遇来源</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbName" CssClass="kpms-textareasearch" EnableTheming="False"/>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">风险等级</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRiskRank" class="kpms-ddlsearch"
                                     EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">发生概率</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlProbability" class="kpms-ddlsearch"
                                     EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">影响程度</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlExpectedResult" class="kpms-ddlsearch"
                                     EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <!-- 风险类别　风险名称　风险描述　风险等级　风险处理方式　预期结果　应对措施　填写部门 -->
    <!-- SELECT 不要用* -->
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObj" JsonClickMode="onclick"
        DataKeyNames="ParamRiskControlID" ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Center">
                <ItemStyle Width="40px" />
                <HeaderTemplate>
                    <asp:CheckBox ID="cBoxSelAll" onclick="allChecked(this)" runat="server" /><asp:Label
                        ID="lbSel" runat="server"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="cBoxItemSelected" runat="server" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="RiskName" HeaderText="风险和机遇来源" Width="120" ShowToolTip="true"
                                       SortExpression="RiskName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskDescribe" HeaderText="风险和机遇描述" ShowToolTip="true"
                                       Width="150" SortExpression="RiskDescribe">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskRank" HeaderText="风险等级" Width="50" SortExpression="RiskRank">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Probability" HeaderText="发生概率" Width="70"
                                       SortExpression="RiskProcessMode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExpectedResult" HeaderText="影响程度" Width="70"
                                       SortExpression="ExpectedResult">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CounterMeasure" HeaderText="控制措施" Width="150"
                                       SortExpression="CounterMeasure" ShowToolTip="true">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function allChecked(obj) {
            //全选
            var $gvChecked = $("#<%=gvList.ClientID %> [id$=cBoxItemSelected]");
            if ($(obj).attr("checked") == "checked") {
                for (i = 0; i < $gvChecked.length; i++) {
                    $($gvChecked[i]).attr("checked", "checked");
                    var jsonAttr = $($gvChecked[i]).parent('td').parent('tr').attr("json");
                    addObj(JSON.parse(jsonAttr), true)
                }
            } else {
                for (i = 0; i < $gvChecked.length; i++) {
                    $($gvChecked[i]).removeAttr("checked");
                    var id = $($gvChecked[i]).parent('td').parent('tr').attr("rowId");
                    removeMyObject(id);
                }
                return false;
            }
        }

        //id-DeptID
        function removeMyObject(id) {
            if (isBlock) {
                var $removeDiv = $("div [id='" + id + "']");
                $removeDiv.remove();
            }
            else {
                $option = $("#objContainer option");
                for (i = 0; i < $option.length; i++) {
                    if ($($option[i]).val() == id) {
                        $($option[i]).remove();
                    }
                }
            }
            outputObj.removeParam(id);
            $outHiParam.val(outputObj.xmlObj.xml());
        }

        //单个checkbox选择
        function singleCheck(cb, id, json) {
            var checked = $("#" + cb).attr("checked");
            if (checked) {
                addObj(json, true)
            }
            else {
                removeMyObject(id)
            }
        }

        function addMyObject(json) {
            addObj(json, true);
        }

        function addObj(json, b) {
            if (b != true) {
                return;
            }
            var useKey = typeof (json[0]) == 'undefined'; //用key:value,兼容
            var keys = [];
            if (useKey) {
                for (var k in json) { keys.push(k); }
                if (outputObj.xmlObj.isExistById(json[keys[0]], "o")) return;
                var tObjName = "";
                if (json[keys[2]] != "" && json[keys[2]] != undefined)//显示标示
                    tObjName = json[keys[1]] + "[" + json[keys[2]] + "]";
                else
                    tObjName = json[keys[1]];
                if (isBlock)
                    addMyPart(json[keys[0]], tObjName);
                else
                    createOption("objContainer", tObjName, json[keys[0]]);
                outputObj.addJsonParam(json);
            }
            $outHiParam.val(outputObj.xmlObj.xml());
        }

        function addMyPart(id, name) {
            var $selPart = $("<div class='ui-state-default xpdl-sel-widget-part' id='" + id + "'></div>");
            var $p = $("<div class='xpdl-sel-part' style='color:#000; font-size:14px;'>" + name + "</div>");
            var $c = $("<span class='ui-icon ui-icon-close' title='点击删除'></span>");
            var $b = $("<br/><br/><br/>");
            $p.appendTo($selPart); $c.appendTo($selPart);
            $selPart.appendTo($('#selParts'));

            $c.click(function () {//删除选中
                var id = $(this).parent('.xpdl-sel-widget-part').attr('id');
                $(this).parent('.xpdl-sel-widget-part').remove();
                outputObj.removeParam(id);
                $outHiParam.val(outputObj.xmlObj.xml());
                //删除时，同时将gvList中的checkBox置为未选中
                var $gvCheckBoxRemoveCheck = $("#<%=gvList.ClientID %> [rowId='" + id + "']");
                if ($gvCheckBoxRemoveCheck.length > 0) {
                    $gvCheckBoxRemoveCheck.find("[id$=cBoxItemSelected]").removeAttr("checked");
                }
            });
        }
    </script>
</asp:Content>
