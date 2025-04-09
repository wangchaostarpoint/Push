<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegulationItemSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.RegulationItemSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    填写部门
    <zhongsoft:LightDropDownList runat="server" ID="ddlFillDept" class="kpms-ddlsearch"
        Width="100px" EnableTheming="false">
    </zhongsoft:LightDropDownList>
    <asp:Label runat="server" ID="lbSpecialty">专业</asp:Label>
    <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" class="kpms-ddlsearch"
        Width="100px" EnableTheming="false">
    </zhongsoft:LightDropDownList>
    <asp:Label runat="server" ID="lbClassification">法律法规分类</asp:Label>
    <zhongsoft:LightDropDownList runat="server" ID="ddlClassification" class="kpms-ddlsearch"
        Width="100px" EnableTheming="false">
    </zhongsoft:LightDropDownList>
    <asp:Label runat="server" ID="lbName">名称</asp:Label>
    <zhongsoft:LightTextBox ID="tbName" runat="server" Width="80px"></zhongsoft:LightTextBox>
    <asp:Label runat="server" ID="lbQueryInfo">发布/批准部门</asp:Label>
    <zhongsoft:LightTextBox ID="tbQueryInfo" runat="server" Width="80px"></zhongsoft:LightTextBox>
    <asp:Label runat="server" ID="lbVersion" Visible="false">替代文件或版本</asp:Label>
    <zhongsoft:LightTextBox ID="tbVersion" runat="server" Width="80px" Visible="false"></zhongsoft:LightTextBox>
    <asp:Label runat="server" ID="lbCode">应急预案编号</asp:Label>
    <zhongsoft:LightTextBox ID="tbCode" runat="server" Width="80px"></zhongsoft:LightTextBox>
    级别
    <zhongsoft:LightDropDownList runat="server" ID="ddlLevel" class="kpms-ddlsearch"
        EnableTheming="false" Width="80px">
    </zhongsoft:LightDropDownList>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObj" JsonClickMode="onclick"
        DataKeyNames="ParamRegulationItemID" ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
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
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Classification" HeaderText="法律法规分类">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="应急预案编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemName" HeaderText="名称" ShowToolTip="true"
                Width="250">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VersionInfo" HeaderText="版本号" ShowToolTip="true"
                Width="100">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ImplementationDate" HeaderText="发布日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApprovalDepartment" HeaderText="发布/批准部门" Width="120"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ReplaceFile" HeaderText="替换文件或版本" Width="120"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiHignLevel" value="院级" />
    <input type="hidden" runat="server" id="hiLowLevel" value="部门级" />
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
