<%@ Page Language="C#" AutoEventWireup="true" Title="选择任务" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="WBSSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.WBSSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>任务编号/名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
                <div style="display: none">
                    任务类型
                    <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" class="kpms-ddlsearch"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </div>
                专业
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialtyID" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                <asp:LinkButton runat="server" ID="lbtnAddWBS" CssClass="subtoolbarlink" EnableTheming="false"
                    Visible="false" ToolTip="WBS任务分解" OnClientClick="return addWBS()">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="WBS任务分解" width="16"
                            height="16" />WBS任务分解</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnMore" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="lbtnMore_Click" Visible="false">
                     <span>更多</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="WBSID" ShowJsonRowColName="true"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemStyle Width="40px" />
                <HeaderTemplate>
                    <asp:CheckBox ID="cBoxSelAll" onclick="allChecked(this)" runat="server" /><asp:Label
                        ID="lbSel" runat="server"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="cbSelect" runat="server" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业（系统）方式" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongDeptName" HeaderText="部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="主设人">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPutUserName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="设计人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="任务状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="出版状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPublishState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindWbs" OnClick="btnBindWbs_Click" Style="display: none" />
    <!---勘测事业部部门编号--->
    <input type="hidden" runat="server" id="hiSurveryDeptCode" value="01017016" />
    <!---初可阶段--->
    <input type="hidden" runat="server" id="hiSpecialPhaseName" value="初可" />
    <!---独立勘察板块--->
    <input type="hidden" runat="server" id="hiSpecialPlateName" value="独立勘察" />
    <input type="hidden" runat="server" id="hiOrganizationID" />
    <script type="text/javascript">

        //添加任务信息
        function addWBS() {
            var json = { OrganizationID: '<%=OrganizationID %>' };
            var url = buildBizUrl(2, null, "/EPMS/List/WBS/WBSSplitEditor.aspx", json);
            showDivDialog(encodeURI(url), "", 1050, 600, bindWbs);
            return false;
        }

        //绑定WBS列表
        function bindWbs() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindWbs,"")%>;
        }

        //是否换行显示
        if ('<%=IsEnterShow %>' == '1') {
            $EnterShow = true;
        }

        function allChecked(obj) {
            //全选
            var $gvChecked = $("#<%=gvList.ClientID %> [id$=cbSelect]");
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
            //阻止执行外部事件
            stopPropagation(event);

            var checked = $("#" + cb).attr("checked");
            if (checked) {
                addObj(json, true)
            }
            else {
                removeMyObject(id)
            }
        }

        //阻止事件执行
        function stopPropagation(e) {
            if (e.stopPropagation)
                e.stopPropagation();
            else
                e.cancelBubble = true;
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

                //单选、多选逻辑判断
                if (inputObj.mode == "s") {
                    if (isBlock)
                        setEmpty();
                    else
                        $("#objContainer").empty();
                    outputObj.removeAllParam();
                    $outHiParam.val(outputObj.xmlObj.xml());
                }
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
            $p.appendTo($selPart); $c.appendTo($selPart);
            $selPart.appendTo($('#selParts'));
            if ($EnterShow != undefined && $EnterShow) {//换行显示
                //$b.appendTo($('#selParts'));
                $selPart.css('float', 'none');
                //设置宽度
                $selPart.css('width', $p.width() + $c.width());
            }

            if (1 == 1) {
                //选中
                var $gvCheckBoxRemoveCheck = $("#<%=gvList.ClientID %> [rowId='" + id + "']");
                if ($gvCheckBoxRemoveCheck.length > 0) {
                    $gvCheckBoxRemoveCheck.find("[id$=cbSelect]").attr("checked", true);
                }
            }

            $c.click(function () {//删除选中
                var id = $(this).parent('.xpdl-sel-widget-part').attr('id');
                $(this).parent('.xpdl-sel-widget-part').remove();
                outputObj.removeParam(id);
                $outHiParam.val(outputObj.xmlObj.xml());
                //删除时，同时将gvList中的checkBox置为未选中
                var $gvCheckBoxRemoveCheck = $("#<%=gvList.ClientID %> [rowId='" + id + "']");
                if ($gvCheckBoxRemoveCheck.length > 0) {
                    $gvCheckBoxRemoveCheck.find("[id$=cbSelect]").removeAttr("checked");
                }
            });
        }
    </script>
</asp:Content>
