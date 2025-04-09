<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RiskHistorySelector.aspx.cs" 
Inherits="Zhongsoft.Portal.EPMS.Obsolete.RiskHistorySelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <!-- 工程号与工程名称合并为“项目编号/名称”
    工程类型
    设总 -->
    <asp:Label runat="server" ID="lbProjectInfo">项目编号/名称</asp:Label>
    <zhongsoft:LightTextBox ID="tbProjectInfo" runat="server" Width="100px"></zhongsoft:LightTextBox>
    <asp:Label runat="server" ID="lbProjectType">工程类型</asp:Label>
    <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
        Width="100px" EnableTheming="false">
    </zhongsoft:LightDropDownList>
    <asp:Label runat="server" ID="lbManagerInfo">设总工号/名称</asp:Label>
    <zhongsoft:LightTextBox ID="tbManagerInfo" runat="server" Width="100px"></zhongsoft:LightTextBox>
    <asp:Label runat="server" ID="lbFormPrstType">流程来源</asp:Label>
    <zhongsoft:LightDropDownList runat="server" ID="ddlFormPrstType" class="kpms-ddlsearch"
        Width="100px" EnableTheming="false">
    </zhongsoft:LightDropDownList>
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">

<!-- SELECT 不要用* -->
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObj" JsonClickMode="onclick"
        DataKeyNames="ProjectID" ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
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

            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ShowToolTip="true" Width="350px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="项目类型" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FormPrstType" HeaderText="流程来源">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="设总">
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
