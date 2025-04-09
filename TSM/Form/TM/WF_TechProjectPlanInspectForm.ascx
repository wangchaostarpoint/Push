<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TechProjectPlanInspectForm.ascx.cs"
    Inherits="Zhongsoft.Portal.TSM.Form.TM.WF_TechProjectPlanInspectForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" field="ProjectName"
                req="1" tablename="SRPM_ProjectPlanInspectForm" IsMutiple="false" EnableTheming="false"
                ResultForControls="{ 'hiProjectListID':'ProjectListID',
                 'tbProjectManagerName':'ProjectManagerName','hiProjectManagerID':'ProjectManagerID' }"
                ResultAttr="name" ShowJsonRowColName="true" activestatus="(23.填写项目进展情况)(23.修改项目变更申请)"
                SelectPageMode="Dialog" PageUrl="~/TSM/Obsolete/TechProjectTaskSelector.aspx" />
            <input type="hidden" runat="server" id="hiProjectListID" field="ProjectListID" tablename="SRPM_ProjectPlanInspectForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                style="width: 120px" tablename="SRPM_ProjectPlanInspectForm" field="ContractCode"
                readonly="readonly" activestatus="(23.填写项目进展情况)(23.修改项目变更申请)" />
        </td>
        <td class="td-l">
            合同名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="ContractName"
                tablename="SRPM_ProjectPlanInspectForm" activestatus="(23.填写项目进展情况)(23.修改项目变更申请)"
                SourceMode="SelectorPage" SelectPageMode="Dialog" ShowJsonRowColName="true" DoCancel="false"
                ResultAttr="name" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE', 'tbContractName':'name'}"
                PageWidth="850" PageUrl="~/MM/Obsolete/ContractSelector.aspx" ></zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="ContractID" runat="server" tablename="SRPM_ProjectPlanInspectForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目负责人
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="tbProjectManagerName" runat="server" readonly="readonly"  ActiveStatus="(23.填写项目进展情况)"
                Field="SpecialCommitteeLeaderName" TableName="SRPM_ProjectPlanInspectForm" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiProjectManagerID" field="SpecialCommitteeLeaderID"
                tablename="SRPM_ProjectPlanInspectForm" />
        </td>
        <td class="td-l">
            填报时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" readonly="readonly" ActiveStatus="(23.填写项目进展情况)"
                Field="ApplyDate" TableName="SRPM_ProjectPlanInspectForm" class="kpms-textbox-date">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            主要进展及取得的成果
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbInspectReason" runat="server" CssClass="kpms-textarea" EnableTheming="false" 
                TextMode="MultiLine" maxtext="128" Field="InspectReason" TableName="SRPM_ProjectPlanInspectForm"
                Height="30px" ActiveStatus="(23.填写项目进展情况)(23.修改项目变更申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            科研经费使用情况
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbInspectContent" runat="server" CssClass="kpms-textarea" EnableTheming="false" 
                TextMode="MultiLine" maxtext="128" Field="InspectContent" TableName="SRPM_ProjectPlanInspectForm"
                Height="30px" ActiveStatus="(23.填写项目进展情况)(23.修改项目变更申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            存在的问题、建议及需要说明的情况
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbFundUseSituation" runat="server" CssClass="kpms-textarea" EnableTheming="false" 
                TextMode="MultiLine" maxtext="128" Field="FundUseSituation" TableName="SRPM_ProjectPlanInspectForm"
                Height="30px" ActiveStatus="(23.填写项目进展情况)(23.修改项目变更申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" height="25" style="text-align: left">
            下一步的工作计划及时间安排
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbSolutionMeasures" runat="server" CssClass="kpms-textarea" EnableTheming="false" 
                TextMode="MultiLine" maxtext="128" Field="SolutionMeasures" TableName="SRPM_ProjectPlanInspectForm"
                Height="30px" ActiveStatus="(23.填写项目进展情况)(23.修改项目变更申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.填写项目进展情况)(3.立项修改)">        
        <td class="td-m" colspan="5" style="border-left: none; text-align: right;">
            <asp:Button ID="btnAddWorkArrange" runat="server" OnClientClick="return detailOfSchedule('2','')"
                Text="添加计划进度安排" OnClick="btnAddWorkArrange_Click" ActiveStatus="(23.填写项目进展情况)(3.立项修改)" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvScheduleList" AllowPaging="True"
                PageSize="30" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" OnRowCommand="gvScheduleList_RowCommand"
                DataKeyNames="PhaseScheduleID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindScheduleListGrid" HideFieldOnExport="编辑,删除">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="时间段" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <%#Convert.ToDateTime(Eval("StartDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("FinishDate")).ToString("yyyy-MM-dd") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="工作任务内容" DataField="WorkContent" />
                    <asp:BoundField HeaderText="阶段成果" DataField="WorkResult" />
                    <asp:BoundField HeaderText="阶段检查" DataField="PhaseCheck" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="70px" />
                    <asp:TemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEditWorkArrange" EnableTheming="false" runat="server" CommandName="EditData">
                                <img alt="编辑进度计划安排" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif" title="点击编辑该进度计划安排"
                                 onclick="return detailOfSchedule('3','<%#Eval("PhaseScheduleID") %>')"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDel" EnableTheming="false" runat="server" CommandName="DeleteData"
                                CommandArgument='<%#Eval("PhaseScheduleID") %>'>
                                <img alt="删除进度计划安排" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif"
                                 onclick="return confirm('-删除进度计划安排同时删除计划月度数据，确定删除进度计划安排吗？');" title="点击删除该进度计划安排" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<%--流程主键  --%>
<input type="hidden" runat="server" id="hiSRPMProjectPlanInspectID" field="SRPMProjectPlanInspectID"
    tablename="SRPM_ProjectPlanInspectForm" />
<script type="text/javascript">

    //计划进度安排维护
    function detailOfSchedule(actType, bizId) {
        var projectListID = $("#<%= hiProjectListID.ClientID %>").val();
        if(projectListID!=""){
         var wFlowID="<%=BusinessObjectId %>";
          var url = buildQueryUrl("<%=WebAppPath %>/TSM/List/TSM/SRPMProjectWorkArrangeEditor.aspx", { actionType: actType, bizId: bizId,  projectListId: projectListID,workFlowID: wFlowID});
       
         showDivDialog(url, null, 650, 500, editProjectCallBack);
        return false;}else{
        alert("请先选择项目！");
        }
    }

    function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddWorkArrange,"") %>
            return true;
        }
</script>
