<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSScheduleGrid.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSScheduleGrid" %>
<tr>
    <td colspan="6" class="td-m flexible">
        <asp:Label ID="lbTitle" runat="server"></asp:Label>
        <span style="float: right">
            <table>
                <tr>
                    <td colspan="4">
                        <span id="spNotPlan" runat="server" style="float: right">
                            <asp:Button ID="btnNotPlanWork" runat="server" Text="添加非计划工作" OnClientClick="return addNotPlanWork()"
                                class="btn" /></span>
                    </td>
                    <td>
                        <zhongsoft:LightDropDownList ID="ddlTeskType" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlTeskType_SelectedIndexChanged">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td>
                        <span id="spPlan" runat="server" style="float: right">
                            <asp:Button ID="btnComplete" runat="server" Text="批量完成" OnClientClick="return setWBSComplete()"
                                OnClick="btnComplete_Click" />
                        </span>
                    </td>
                </tr>
            </table>
        </span>
    </td>
</tr>
<tr>
    <td colspan="6">
        <zhongsoft:LightPowerGridView runat="server" ID="gvWBSScjedule" AutoGenerateColumns="false"
            AllowSorting="true" DataKeyNames="ScheduleOfWBSID,ProjectName,ProjectCode" UseDefaultDataSource="true"
            EmptyDataText="没有找到任务信息" OnRowCommand="gvWBSScjedule_RowCommand" ShowExport="true"
            HideFieldOnExport="删除" ShowPageSizeChange="true" AllowPaging="true" PageSize="5"
            OnRowDataBound="gvWBSScjedule_RowDataBound">
            <Columns>
                <zhongsoft:LightCheckField HeaderText="全部">
                    <HeaderStyle Width="40px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </zhongsoft:LightCheckField>
                <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                    Visible="false">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField ItemStyle-Width="80px" HeaderText="类型">
                    <ItemTemplate>
                        <zhongsoft:LightDropDownList ID="ddlIsProjectWork" runat="server">
                        </zhongsoft:LightDropDownList>
                    </ItemTemplate>
                    <ItemStyle Width="80px"></ItemStyle>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="项目">
                    <ItemTemplate>
                       
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField ItemStyle-Width="100px" HeaderText="工作分类">
                    <ItemTemplate>
                        <zhongsoft:LightDropDownList ID="ddlWorkType" runat="server">
                        </zhongsoft:LightDropDownList>
                    </ItemTemplate>
                    <ItemStyle Width="100px"></ItemStyle>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" MaxLength="15">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PartakerUserName" HeaderText="参与人">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="累计完成%">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox type="text" ID="tbTotalComplete" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Text='<%#Eval("CompleteRate")%>' Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$"
                            errmsg="请输入正数，最多12位整数，2位小数" content="TotalComplete">
                        </zhongsoft:LightTextBox>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="完成日期">
                    <ItemTemplate>
                        <zhongsoft:XHtmlInputText type="text" ID="txtCompleteDate" runat="server" readonly="readonly"
                            class="kpms-textbox-date" value='<%#Eval("CompleteDate")%>' flag="copyValue"
                            onBlur="changeDateTime(this)">
                        </zhongsoft:XHtmlInputText>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="完成工天">
                    <ItemTemplate>
                        <zhongsoft:XHtmlInputText type="text" ID="txtWorkDayOfComplete" runat="server" readonly="readonly"
                            class="kpms-textbox-money" value='<%#Eval("WorkDayOfComplete")%>'>
                        </zhongsoft:XHtmlInputText>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="存在的问题">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbExistProblems" Maxtext="1024" CssClass="kpms-textarea"
                            EnableTheming="false" runat="server" TextMode="MultiLine" Text='<%#Eval("ExistProblems") %>'
                            Width="120"></zhongsoft:LightTextBox>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="解决措施">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbMeasures" Maxtext="1024" CssClass="kpms-textarea" EnableTheming="false"
                            runat="server" TextMode="MultiLine" Text='<%#Eval("Measures") %>' Width="120"></zhongsoft:LightTextBox>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="卷册负责人">
                    <ItemTemplate>
                        <span wbsownername='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="设计工天">
                    <ItemTemplate>
                        <span workdayofdesign='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="校核工天">
                    <ItemTemplate>
                        <span workdayofcheck='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="审核工天">
                    <ItemTemplate>
                        <span workdayofrecheck='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="批准工天">
                    <ItemTemplate>
                        <span workdayofconfirm='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="计划开始日期">
                    <ItemTemplate>
                        <span planstarttime='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="实际开始日期">
                    <ItemTemplate>
                        <span factstarttime='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="计划个人交出">
                    <ItemTemplate>
                        <span planhandtime='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="实际个人交出">
                    <ItemTemplate>
                        <span facthandtime='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="计划室交出">
                    <ItemTemplate>
                        <span planrechecktime1='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="实际室交出">
                    <ItemTemplate>
                        <span factrechecktime1='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="计划完成日期">
                    <ItemTemplate>
                        <span plancompletetime='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="实际完成日期">
                    <ItemTemplate>
                        <span factcompletetime='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="备注">
                    <ItemTemplate>
                        <%#Eval("Memo") %>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="删除">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEditReview" ImageUrl="/Portal/Themes/Images/btn_dg_delete.gif"
                            OnClientClick="return beforDel()" runat="server" CommandName="Del" Style="height: 16px"
                            OnClick="ibtnEditReview_Click" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </zhongsoft:LightTemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Right"></PagerStyle>
        </zhongsoft:LightPowerGridView>
    </td>
</tr>
<input type="hidden" id="hiCheckedValue" runat="server" />
<asp:Button ID="btnAddWork" runat="server" Visible="false" OnClick="btnAddWork_Click" />
<input type="hidden" id="hiAdd" runat="server" value="0" />
<script type="text/javascript">

    $gridCheckedClientID = "<%=gvWBSScjedule.CheckedClientID %>";

    function setWBSComplete() {
        var wbsIDs = $("#" + $gridCheckedClientID).val();
        if (wbsIDs.length < 36) {
            alert("请勾选工作任务");
        } else {
            if (confirm('是否把勾选的工作批量设置为完成')) {
                return true;
            } else {
                return false
            }
        }
    }

    function beforDel() {
        if (confirm("是否确认删除")) {
            $("#<%=hiAdd.ClientID %>").val("1");
            return true;
        }
        return false;
    }

    function changeDateTime(obj) {
        $("#" + $(obj).attr("id")).val($(obj).val());
    }

    //新建非计划工作
    function addNotPlanWork() {
        var url = buildQueryUrl("EPMS/List/WBS/WBSScheduleEditor.aspx", { "actionType": 2 });
        showDivDialog(url, null, 800, 500, resetaddNotPlanWork);
        return false;
    }

    function resetaddNotPlanWork() {
        $("#<%=hiAdd.ClientID %>").val("1");
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddWork,"") %>
    }

    //完成日期为"0001-01-01"则至为空
    function setCompleteDate() {
        $("[id$='txtCompleteDate']").each(function () {
            if ($(this).val() == "0001-01-01") {
                $(this).val("");
            }
        });
    }

    function loadPlanControl() {
        setCompleteDate();
        var $ids = "";
        //#<%=gvWBSScjedule.ClientID %>
        $("[id$='gvWBSScjedule'] span[wbsownername]").each(function () {
            $ids += $(this).attr("wbsownername") + "|";
        });
        $.post("/Portal/EPMS/List/WBS/C_RollList.aspx",
                 { asyfunc: "GetGridViewData", strWBSids: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //卷册负责人
                     $("[id$='gvWBSScjedule'] span[wbsownername]").each(function () {
                         var $wbsID = $(this).attr("wbsownername");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $wbsownername = $l[i][1];
                             if ($wbsID == $id) {
                                 if ($wbsownername == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($wbsownername);
                                 }
                             }
                         }
                     });
                     //设计工天
                     $("[id$='gvWBSScjedule'] span[workdayofdesign]").each(function () {
                         var $wbsID = $(this).attr("workdayofdesign");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $workdayofdesign = $l[i][2];
                             if ($wbsID == $id) {
                                 if ($workdayofdesign == "")
                                     $(this).html("0");
                                 else {
                                     $(this).html($workdayofdesign);
                                 }
                             }
                         }
                     });
                     //校核工天
                     $("[id$='gvWBSScjedule'] span[workdayofcheck]").each(function () {
                         var $wbsID = $(this).attr("workdayofcheck");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $workdayofcheck = $l[i][3];
                             if ($wbsID == $id) {
                                 if ($workdayofcheck == "")
                                     $(this).html("0");
                                 else {
                                     $(this).html($workdayofcheck);
                                 }
                             }
                         }
                     });
                     //审核工天
                     $("[id$='gvWBSScjedule'] span[workdayofrecheck]").each(function () {
                         var $wbsID = $(this).attr("workdayofrecheck");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $workdayofrecheck = $l[i][4];
                             if ($wbsID == $id) {
                                 if ($workdayofrecheck == "")
                                     $(this).html("0");
                                 else {
                                     $(this).html($workdayofrecheck);
                                 }
                             }
                         }
                     });
                     //批准工天
                     $("[id$='gvWBSScjedule'] span[workdayofconfirm]").each(function () {
                         var $wbsID = $(this).attr("workdayofconfirm");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $workdayofconfirm = $l[i][5];
                             if ($wbsID == $id) {
                                 if ($workdayofconfirm == "")
                                     $(this).html("0");
                                 else {
                                     $(this).html($workdayofconfirm);
                                 }
                             }
                         }
                     });
                     //计划开始
                     $("[id$='gvWBSScjedule'] span[planstarttime]").each(function () {
                         var $wbsID = $(this).attr("planstarttime");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $planstarttime = $l[i][6];
                             if ($wbsID == $id) {
                                 if ($planstarttime == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($planstarttime);
                                 }
                             }
                         }
                     });
                     //实际开始
                     $("[id$='gvWBSScjedule'] span[factstarttime]").each(function () {
                         var $wbsID = $(this).attr("factstarttime");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $factstarttime = $l[i][7];
                             if ($wbsID == $id) {
                                 if ($factstarttime == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($factstarttime);
                                 }
                             }
                         }
                     });
                     //计划个人出手
                     $("[id$='gvWBSScjedule'] span[planhandtime]").each(function () {
                         var $wbsID = $(this).attr("planhandtime");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $planhandtime = $l[i][8];
                             if ($wbsID == $id) {
                                 if ($planhandtime == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($planhandtime);
                                 }
                             }
                         }
                     });
                     //实际个人出手
                     $("[id$='gvWBSScjedule'] span[facthandtime]").each(function () {
                         var $wbsID = $(this).attr("facthandtime");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $facthandtime = $l[i][9];
                             if ($wbsID == $id) {
                                 if ($facthandtime == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($facthandtime);
                                 }
                             }
                         }
                     });
                     //计划室交出
                     $("[id$='gvWBSScjedule'] span[planrechecktime1]").each(function () {
                         var $wbsID = $(this).attr("planrechecktime1");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $planrechecktime1 = $l[i][10];
                             if ($wbsID == $id) {
                                 if ($planrechecktime1 == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($planrechecktime1);
                                 }
                             }
                         }
                     });
                     //实际室交出
                     $("[id$='gvWBSScjedule'] span[factrechecktime1]").each(function () {
                         var $wbsID = $(this).attr("factrechecktime1");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $factrechecktime1 = $l[i][11];
                             if ($wbsID == $id) {
                                 if ($factrechecktime1 == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($factrechecktime1);
                                 }
                             }
                         }
                     });
                     //计划完成 12
                     $("[id$='gvWBSScjedule'] span[plancompletetime]").each(function () {
                         var $wbsID = $(this).attr("plancompletetime");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $plancompletetime = $l[i][12];
                             if ($wbsID == $id) {
                                 if ($plancompletetime == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($plancompletetime);
                                 }
                             }
                         }
                     });
                     //实际完成 13
                     $("[id$='gvWBSScjedule'] span[factcompletetime]").each(function () {
                         var $wbsID = $(this).attr("factcompletetime");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $factcompletetime = $l[i][13];
                             if ($wbsID == $id) {
                                 if ($factcompletetime == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($factcompletetime);
                                 }
                             }
                         }
                     });
                 }
                );

    }

    //计算加载gridview中的数据

    //控制页面按钮和列的显隐

    window.onload=function(){
        var handlerUrl = "http://<%= Request.Url.Authority%><%=WebAppPath %>/EPMS/Handler/ScheduleHandler.ashx"; 
        $("[content='TotalComplete']").each(function(){
            $(this).autocomplete({
                source: function (request, response) {
                    $.getJSON(handlerUrl, {
                        term: request.term + ',user'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                     var split = ui.item.id.split(',');
                     $tempId = split[0];
                     $tempObj =this;
                     window.setTimeout(setLoginId, 200);
                    }
                }
            }).click(function () {
            $(this).autocomplete("search");
             });
            });
        }

        function setLoginId(obj) {
            $($tempObj).val($tempId);
        }
    
</script>
