<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectMonthPlanMrgFill.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_ProjectMonthPlanMrgFill" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table">
    <tr>
        <td class="td-l">填报年份
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPlanYear" class="kpms-textbox" activestatus="(23.？)" field="PlanYear"
                tablename="EPMS_PlanActivity">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">填报月份
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPlanMonth" class="kpms-textbox" activestatus="(23.？)" field="PlanMonth"
                tablename="EPMS_PlanActivity">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="flexible">
            <span>项目计划列表</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" AllowFrozing="true" FrozenColNum="6"
                DataKeyNames="PlanActivityOfProjectID" OnRowDataBound="gvList_RowDataBound" BindGridViewMethod="UserControl.BindGrid"
                OnRowCommand="gvList_RowCommand">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField HeaderText="卷册计划" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                <img alt="编辑" id="ImgEdit"   src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand"
                                                 onclick='return EditWBSDetail("<%#DataBinder.Eval(Container.DataItem,"OrganizationID") %>");'/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="工程进度填报" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnProgressFill" runat="server" CommandName="EditData" EnableTheming="false">
                                                <img alt="编辑" id="ImgProgressFill"   src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand"
                                                 onclick='return EditProgressFill("<%#DataBinder.Eval(Container.DataItem,"PlanActivityOfProjectID") %>");'/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="通知状态" DataField="PlanState">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="设总">
                        <ItemTemplate>
                            <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ManagerDeptName")))?"":Eval("ManagerDeptName")+"：" )+Eval("ManagerUserName") %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="工程类别" DataField="ProjectType">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectLevel">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="项目状态">
                        <ItemTemplate>
                            <asp:Label ID="lbProjectState" runat="server" Text='<%# Eval("ProjectState") %>' psFlag='<%# Eval("PlanActivityOfProjectID") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="估工总工日" DataField="EstimateWorkday" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="上月实际完成累计工作量" DataField="PreFactTotalRate" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="本月实际完成工作量">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbThisFactFinishRate" field="ThisFactFinishRate" flag="changeRate" keyID='<%#Eval("PlanActivityOfProjectID") %>'
                                Text='<%# Eval("ThisFactFinishRate")==DBNull.Value?"": (Convert.ToDecimal(Eval("ThisFactFinishRate") )).ToString("F2") %>'
                                CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                            <input type="hidden" runat="server" id="hiPlanActivityOfProjectID" value='<%#Eval("PlanActivityOfProjectID") %>' />
                            <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("OrganizationID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="本月计划完成工作量" DataField="ThisPlanFinishRate" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="下月计划完成工日" DataField="NextPlanFinishWorkday" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="下月计划完成工作量">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbNextPlanFinishRate" field="NextPlanFinishRate" flag="changeRate" keyID='<%#Eval("PlanActivityOfProjectID") %>'
                                Text='<%# Eval("NextPlanFinishRate")==DBNull.Value?"": (Convert.ToDecimal(Eval("NextPlanFinishRate") )).ToString("F2") %>'
                                CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%-- <zhongsoft:LightBoundField HeaderText="下月计划完成累计工作量" DataField="NextPlanTotalRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="下月计划完成累计工作量" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbNextPlanTotalRate" Text='<%#Eval("NextPlanTotalRate") %>' keyID='<%#Eval("PlanActivityOfProjectID") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="总卷册" DataField="TotalRollNum" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="上月实际出版" DataField="PreFactPublishRollNum" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="本月计划出版" DataField="ThisPlanPublishRollNum" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="已出版卷册" DataField="PublishedRollNum" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="项目暂停" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnClose" runat="server" CommandName="CloseProject" EnableTheming="false" ToolTip="暂停"
                                CommandArgument='<%#DataBinder.Eval(Container.DataItem,"OrganizationID") %>' Visible="false"> 
                                             <img alt="暂停" id="ImgClose"  border="0" onclick="return confirm('确定暂停？');" src="../../Themes/Images/btn-ban.gif" style="cursor: grabbing" />
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbtnStart" runat="server" CommandName="StartProject" EnableTheming="false" ToolTip="启动"
                                CommandArgument='<%#DataBinder.Eval(Container.DataItem,"OrganizationID") %>' Visible="false">
                                             <img alt="启动" id="ImgStart"  border="0" onclick="return confirm('确定启动？');" src="../../Themes/Images/btn_empty.gif" style="cursor:grabbing" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="进度及协议办理情况" DataField="ScheduleAndRequire" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="存在问题及解决措施" DataField="ThisImportance" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="需要业主协调的问题" DataField="ProblemOfNeedOuter" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="需要我院协调的问题" DataField="ProblemOfNeedInner" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input runat="server" type="hidden" id="hiPlanActivityID" tablename="EPMS_PlanActivity"
    field="PlanActivityID" />
<asp:Button runat="server" ID="btnBindPlan" OnClick="btnBindPlan_Click" Style="display: none" />
<input type="hidden" runat="server" id="hiKeyID" />
<input type="hidden" runat="server" id="hiChangeValue" />
<input type="hidden" runat="server" id="hiChangeField" />
<input type="hidden" runat="server" id="hiTotalChangeField" />
<input type="hidden" runat="server" id="hiNextTotalChangeField" />
<asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Style="display: none" />
<script type="text/javascript">   
    function initCustomerPlugin() {
        if ($action =="<%= AccessLevel.Update.GetHashCode()%>" && $actName == "设总填报计划" && parseBool("<%=IsCanEdit%>")) {
            $('[flag="changeRate"]').each(function () {
                $(this).bind('blur', function () {
                    var changeobj = $(this);
                    var changeValue = $(this).val();
                    var keyID = $(this).attr("keyID");
                    var changeField = $(this).attr("field");
                    if (changeField == "ThisFactFinishRate") {
                        $('#<%=hiTotalChangeField.ClientID %>').val("ThisFactTotalRate");
                        $('#<%=hiNextTotalChangeField.ClientID %>').val("NextPlanTotalRate");
                    }
                    else if (changeField == "NextPlanFinishRate") {
                        $('#<%=hiTotalChangeField.ClientID %>').val("");
                        $('#<%=hiNextTotalChangeField.ClientID %>').val("NextPlanTotalRate");
                    }
                    $('#<%=hiKeyID.ClientID %>').val(keyID);
                    $('#<%=hiChangeValue.ClientID %>').val(changeValue);
                    $('#<%=hiChangeField.ClientID %>').val(changeField);

                    //$('#<%=btnSave.ClientID %>').click();
                    $.ajax({
                        type: 'POST',
                        url: buildQueryUrl("/EPMS/List/Plan/ProjectMonthPlanList.aspx", null),
                        data: {
                            asyfunc: "SaveRateInfoNew", keyID: $('#<%=hiKeyID.ClientID %>').val(), changeField: $('#<%=hiChangeField.ClientID %>').val(), changeValue: $('#<%=hiChangeValue.ClientID %>').val(), totalChangeField: $('#<%=hiTotalChangeField.ClientID %>').val(), nextTotalChangeField: $('#<%=hiNextTotalChangeField.ClientID %>').val()
                        },
                        async: false,
                        dataType: "json",
                        success: function (res) {
                            if (res != "" && res != null && res != undefined) {

                                changeobj.parent().parent().find("span").each(function () {
                                    if ($(this).attr("keyID") == keyID) {
                                        $(this).context.innerText = res.NextPlanTotalRate;
                                    }
                                });

                                changeobj.parent().parent().find("span").each(function () {
                                    if ($(this).attr("psFlag") == keyID) {
                                        if (res.ProjectState != undefined && res.ProjectState != "") {
                                            $(this).context.innerText = res.ProjectState;
                                        }
                                    }
                                });

                            }
                        },
                        error: function (err) {
                            $(changeobj).val("");
                            alert(err.responseText);
                        }
                    });
                });
            });
        }
    }

    function EditWBSDetail(bizId) {
        var param = { actionType: 3, OrganizationID: bizId };
        var url = buildQueryUrl("/EPMS/List/Plan/ProjectMonthPlanWBSEditor.aspx", param);
        showDivDialog(url, "", 1000, 600, bindPlan);
        return false;
    }

    function EditProgressFill(bizId) {
        var param = { actionType: 3, bizId: bizId };
        var url = buildQueryUrl("/EPMS/List/Plan/PlanProgressFillEditor.aspx", param);
        showDivDialog(url, "", 800, 600, bindPlan);
        return false;
    }

    //刷新列表
    function bindPlan() {
        $("#<%=btnBindPlan.ClientID %>").click();
    }

</script>
