<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IdentiyItemSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.IdentiyItemSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                填写部门
                <zhongsoft:LightDropDownList runat="server" ID="ddlFillDept" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                <asp:Label runat="server" ID="lbPlace">活动／生产／服务场所</asp:Label>
                <zhongsoft:LightTextBox ID="tbPlace" runat="server" Width="120px"></zhongsoft:LightTextBox>
                <asp:Label runat="server" ID="lbItemReource">危险源</asp:Label>
                <zhongsoft:LightTextBox ID="tbItemReource" runat="server" Width="120px"></zhongsoft:LightTextBox> 
                <asp:Label runat="server" ID="lbQueryName"></asp:Label>
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskLevelOrImportant" class="kpms-ddlsearch"
                                             EnableTheming="false" Width="70px">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr style="display: none">
            <td>
                <asp:Label runat="server" ID="lbRegion" Visible="False">活动／生产／服务区域</asp:Label>
                <zhongsoft:LightDropDownList runat="server" ID="ddlRegion" class="kpms-ddlsearch"
                                             EnableTheming="false" Visible="False">
                </zhongsoft:LightDropDownList>
                状态
                <zhongsoft:LightDropDownList runat="server" ID="ddlItemState" class="kpms-ddlsearch"
                    EnableTheming="false" Width="70px">
                </zhongsoft:LightDropDownList>
                时态
                <zhongsoft:LightDropDownList runat="server" ID="ddlItemTense" class="kpms-ddlsearch"
                    EnableTheming="false" Width="70px">
                </zhongsoft:LightDropDownList>
                
                级别
                <zhongsoft:LightDropDownList runat="server" ID="ddlLevel" class="kpms-ddlsearch"
                    EnableTheming="false" Width="70px">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                <zhongsoft:LightDropDownList runat="server" ID="ddlControlMode" class="kpms-ddlsearch"
                    EnableTheming="false" Visible="false">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObj" JsonClickMode="onclick"
        DataKeyNames="ParamIdentiyItemID" OnRowDataBound="gvList_RowDataBound" ShowJsonRowColName="true">
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
            <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Place" HeaderText="活动／生产／<br/>服务场所" ShowToolTip="true"
                Width="100" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemReource" HeaderText="危险源" ShowToolTip="true"
                Width="150">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemRiskAndInfluence" HeaderText="风险（可能产生的影响）"
                ShowToolTip="true" Width="100">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Important" HeaderText="重要性">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskLevel" HeaderText="风险等级">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ControlDetailInfo" HeaderText="控制措施" ShowToolTip="true"
                Width="100">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FurtherControl" HeaderText="进一步控制措施" ShowToolTip="true"
                Width="100" Visible="false">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiLowLevel" value="" />
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
