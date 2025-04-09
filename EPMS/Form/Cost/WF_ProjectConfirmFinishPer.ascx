<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectConfirmFinishPer.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Cost.WF_ProjectConfirmFinishPer" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            年度
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbPlanYear" tablename="EPMS_ProjConfirmFinishPerForm"
                field="PlanYear" ReadOnly="true" activestatus="(23.分配任务)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            月度
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbPlanMonth" tablename="EPMS_ProjConfirmFinishPerForm"
                field="PlanMonth" ReadOnly="true" activestatus="(23.分配任务)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            计划管理岗
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbMasterUserName" tablename="EPMS_ProjConfirmFinishPerForm"
                field="MasterUserName" ReadOnly="true" activestatus="(23.分配任务)"></zhongsoft:LightTextBox>
            <input runat="server" type="hidden" id="hiMasterUserID" tablename="EPMS_ProjConfirmFinishPerForm"
                field="MasterUserID" />
        </td>
    </tr>
    <tr id="Tr1" displaystatus="(3.分配任务)" runat="server">
        <td class="td-m" colspan="6" style="text-align: right">
            <asp:Button ID="btnModifyConfirmPeople" Text="进度确认人更新为设总" ForeColor="Black" runat="server"
                activestatus="(3.分配任务)" ToolTip="批量更新项目进度确认人为设总" OnClientClick="return checkModifyConfirmPeople();"
                OnClick="btnModifyConfirmPeople_Click" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" style="text-align: center">
            <b>本月有交出卷册项目列表</b>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvComList" AllowPaging="true"
                PageSize="30" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
                BindGridViewMethod="UserControl.BindComList" ShowHeader="true" ShowFooter="false"
                DataKeyNames="ThisProjectValueID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" Width="200px"
                        MaxLength="20">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectType" Width="40px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName" Width="40px" MaxLength="4">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目设总" DataField="ManagerUserName" Width="40px"
                        MaxLength="4">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目设总B" DataField="ManagerUserNameB">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="计划工程师" DataField="PlanUserName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="本月交出<br/>卷册数" DataField="Count" ItemStyle-HorizontalAlign="Right"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="项目天数">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbProjectDays" Text='<%#Eval("ProjectDays") %>'
                                Style="text-align: right;" regex="^\d+$" errmsg="请输入整数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="外业天数">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbProjectWYDays" Text='<%#Eval("ProjectWYDays") %>'
                                Style="text-align: right;" regex="^\d+$" errmsg="请输入整数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="是否<br>已确认">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbIsConfirm"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="进度确认人" HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <input runat="server" type="hidden" id="hiOrganizationID" value='<%#Eval("OrganizationID") %>' />
                            <input runat="server" type="hidden" id="hiThisProjectValueID" value='<%#Eval("ThisProjectValueID") %>' />
                            <input runat="server" id="hiConfirmUserID" type="hidden" value='<%#Eval("ConfirmUserID") %>' />
                            <zhongsoft:LightObjectSelector runat="server" ID="tbConfirmUserName" Value='<%#Eval("ConfirmUserName") %>'
                                IsMutiple="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                Style="width: 100px !important" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                                ResultForControls="{'hiConfirmUserID':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField HeaderText="详细<br/>信息" CommandName="EditorData" DataParamFields="ThisProjectValueID"
                        EditItemClick="editDetail">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" style="text-align: center">
            <b>本月没有交出卷册项目列表</b>
        </td>
    </tr>
    <tr id="Tr2" displaystatus="(3.分配任务)(3.处理)(3.审核)(3.接收确认)" runat="server">
        <td class="td-m" colspan="6" style="text-align: right">
            <span class="req-star">批量更新本月交出卷册数为0的项目确认状态</span>
            <asp:Button ID="btnUpdate" Text="批量更新" ForeColor="Black" runat="server" activestatus="(3.分配任务)(3.处理)(3.审核)(3.接收确认)"
                ToolTip="批量更新本月交出卷册数为0的项目确认状态" OnClientClick="return check();" OnClick="btnUpdate_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvNoComList" AllowPaging="true"
                PageSize="30" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
                BindGridViewMethod="UserControl.BindNoComList" ShowHeader="true" ShowFooter="false"
                DataKeyNames="ThisProjectValueID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" Width="200px"
                        MaxLength="20">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectType" Width="40px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName" Width="40px" MaxLength="4">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目设总" DataField="ManagerUserName" Width="40px"
                        MaxLength="4">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目设总B" DataField="ManagerUserNameB">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="计划工程师" DataField="PlanUserName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="本月交出<br/>卷册数" DataField="Count" ItemStyle-HorizontalAlign="Right"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="项目天数">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbProjectDays" Text='<%#Eval("ProjectDays") %>'
                                Style="text-align: right;" regex="^\d+$" errmsg="请输入整数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="外业天数">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbProjectWYDays" Text='<%#Eval("ProjectWYDays") %>'
                                Style="text-align: right;" regex="^\d+$" errmsg="请输入整数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="是否<br>已确认">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbIsConfirm"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="进度确认人" HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <input runat="server" type="hidden" id="hiOrganizationID" value='<%#Eval("OrganizationID") %>' />
                            <input runat="server" type="hidden" id="hiThisProjectValueID" value='<%#Eval("ThisProjectValueID") %>' />
                            <input runat="server" id="hiConfirmUserID" type="hidden" value='<%#Eval("ConfirmUserID") %>' />
                            <zhongsoft:LightObjectSelector runat="server" ID="tbConfirmUserName" Value='<%#Eval("ConfirmUserName") %>'
                                IsMutiple="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                Style="width: 100px !important" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                                ResultForControls="{'hiConfirmUserID':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField HeaderText="详细<br/>信息" CommandName="EditorData" DataParamFields="ThisProjectValueID"
                        EditItemClick="editDetail">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<asp:Button ID="btnConfirm" runat="server" content="Refresh" Style="display: none"
    OnClick="btnConfirm_Click" />
<input runat="server" type="hidden" id="hiProjConfirmFinishPerFormID" tablename="EPMS_ProjConfirmFinishPerForm"
    field="ProjConfirmFinishPerFormID" />
<input runat="server" type="hidden" id="hiThisProjectValueIDs" />
<input runat="server" type="hidden" id="hiZeroProjValueIds" />
<!-- 卷册数为0未确认的项目-->
<input type="hidden" runat="server" id="hiZeroNoConfirmIds" />
<script type="text/javascript" language="javascript">
    //项目进度详细信息编写
    function editDetail(bizId) {
        var activeName = "<%=CurrentActivityName %>";
        var param = "{'ActivityName':'" + activeName + "'}";
        var url = buildBizUrl(3, bizId, "EPMS/List/Cost/ProjectValueConfirmDetail.aspx", null);
        url = url + "&ActivityName=" + activeName;
        showDivDialog(encodeURI(url), null, 1000, 600, afterConfirm);
    }

    function afterConfirm(re) {
         <%=Page.ClientScript.GetPostBackEventReference(this.btnConfirm,"") %>
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "处理"||$actName == "审核"||$actName == "接收确认") {
                var state = "true";
                var ids = $("#<%=hiThisProjectValueIDs.ClientID %>").val();
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/EPMS/List/Cost/ProjectValueConfirmDetail.aspx", null),
                    data: { asyfunc: "IsAllProjectConfirm", bizId: ids },
                    async: false,
                    dataType: "json",
                    success: function (res) {
                        state = res;
                    },
                    error: function (err) {
                    }
                });
                if (state == true) {
                    alert("存在未确认的项目，请确认后再发送下一步");
                    return false;
                }
                else {
                    return true;
                }
            }
            else if($actName == "分配任务"){
                var noConfirm=$('#<%=hiZeroNoConfirmIds.ClientID %>').val();
                if(noConfirm!='') {
                   return confirm('本月没有交出卷册项目列表有未确认的项目，您确认发送流程吗？');
                }
            }
        }
        return true;
    }

    function check() {
        return confirm("确定将所有“本月交出卷册数”为0的项目“确认状态”改为“已确认”吗？");
    }

    function checkModifyConfirmPeople() {
        return confirm("确定将所有项目“进度确认人”改为设总吗？");
    }

    
</script>
