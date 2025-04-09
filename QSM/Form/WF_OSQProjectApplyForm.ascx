<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_OSQProjectApplyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.QSM.Form.OSQProjectApplyForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            发起人
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiUserId" field="UserID" tablename="QSM_OSQProjectApplyForm" />
            <input type="hidden" runat="server" id="hiUserCode" field="UserCode" tablename="QSM_OSQProjectApplyForm" />
            <zhongsoft:XHtmlInputText ID="txtUserName" runat="server" readonly="readonly" field="UserName"
                tablename="QSM_OSQProjectApplyForm" activestatus="(23.通知各部门编制申报材料)(23.通知各部门编制申报材料)" MaxLength="36"
                class="kpms-textbox" />
        </td>
        <td class="td-l">
            发起部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" readonly="readonly" field="UserDeptName"
                tablename="QSM_OSQProjectApplyForm" activestatus="(23.通知各部门编制申报材料)(23.修改计划通知)" MaxLength="36"
                class="kpms-textbox" />
            <input type="hidden" id="hiDeptID" runat="server" field="UserDeptID" tablename="QSM_OSQProjectApplyForm" />
            <input type="hidden" id="hiDeptCODE" runat="server" field="UserDeptCode" tablename="QSM_OSQProjectApplyForm" />
        </td>
        <td class="td-l">
            发起时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" readonly="readonly" field="StartDate"
                tablename="QSM_OSQProjectApplyForm" req="1" activestatus="(23.通知各部门编制申报材料)(23.修改计划通知)"
                class="kpms-textbox-date" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            报优年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYearOfApplication" req="1" activestatus="(23.通知各部门编制申报材料)(23.修改计划通知)"
                field="YearOfApplication" tablename="QSM_OSQProjectApplyForm">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            要求提交日期<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtApplyDueDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" field="ApplyAueDate" tablename="QSM_OSQProjectApplyForm"
                req="1" activestatus="(23.通知各部门编制申报材料)(23.修改计划通知)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提交报优项目部门<span class="req-star">*</span>
        </td>
        <td colspan="5">
            <asp:CheckBoxList ID="cblSendToDept" runat="Server" RepeatDirection="Vertical" RepeatColumns="6"
                activestatus="(23.通知各部门编制申报材料)(23.修改计划通知)" req="1">
            </asp:CheckBoxList>
            <input type="hidden" id="hiSendToDept" runat="server" field="UndertakeDeptIDs" tablename="QSM_OSQProjectApplyForm" />
            <input type="hidden" id="hiApplyDept" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            报优要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbApplyReq" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                req="1" TextMode="MultiLine" maxtext="1024" field="ApplicationReq" tablename="QSM_OSQProjectApplyForm"
                activestatus="(23.通知各部门编制申报材料)(23.修改计划通知)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="1024" field="Memo" tablename="QSM_OSQProjectApplyForm"
                activestatus="(23.通知各部门编制申报材料)(23.修改计划通知)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server" displaystatus="(1.*)(23.编制申报材料)(23.审核)(3.审核申报材料)(23.汇总申报材料)(3.评审)(3.审批)(3.汇总评审意见，安排出版)">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            项目报优计划
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.编制申报材料)">
        <td colspan="6" align="right">
            <asp:LinkButton runat="server" ID="btnAddNew" OnClientClick="return showDetail('2','')"
                OnClick="btnNew_Click" displaystatus="(23.编制申报材料)"><span>新建</span></asp:LinkButton>
        </td>
    </tr>
    <tr runat="server" displaystatus="(1.*)(23.编制申报材料)(23.审核)(23.汇总申报材料)(3.审核申报材料)(3.评审)(3.审批)(3.汇总评审意见，安排出版)">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindDataGrid" ShowExport="true"
                ShowPageSizeChange="true" DataKeyNames="OSQProjectApplyDetailID" OnRowCommand="gvList_RowCommand"
                HideFieldOnExport="查看,编辑,删除">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DisplayIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="项目类别" DataField="ProjectType" SortExpression="ProjectType" />
                    <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode" />
                    <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName" />
                    <zhongsoft:LightBoundField HeaderText="报送单位" DataField="AssessDeptName" SortExpression="AssessDeptName" />
                    <zhongsoft:LightBoundField HeaderText="填报部门" DataField="ApplyDeptName" SortExpression="ApplyDeptName" />
                    <zhongsoft:LightBoundField HeaderText="项目责任人" DataField="ProjectManagerName" SortExpression="ProjectManagerName"
                        ItemStyle-Width="70px" />
                    <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" SortExpression="Memo"
                        ShowToolTip="true" />
                    <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" DataParamFields="OSQProjectApplyDetailID"
                        CommandName="EditData" Visible="false" />
                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" DataParamFields="OSQProjectApplyDetailID"
                        CommandName="ViewData" />
                    <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" DeleteText="您确认删除该计划吗？" Visible="false" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiOSProjApplyFormID" field="OSQProjectApplyFormID"
    tablename="QSM_OSQProjectApplyForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    //查看、编辑
    function showDetail(actionType, bizId) {
        var formID = $("#<%=hiOSProjApplyFormID.ClientID%>").val();
        var json = { actionType: actionType, bizId: bizId, ApplyID: formID, action: actionType };
        var url = buildQueryUrl('QSM/List/OSQProjectApplyEditor.aspx', json);
        showDivDialog(url, null, 850, 300, afterEditor);
        return false;        
    }

    function editDetail(bizId) {
        return showDetail(3,bizId);
    }

    function viewDetail(bizId) {        
        return showDetail(1,bizId);
    }

    //批量选择案卷CallBack方法
    function afterEditor() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddNew,"")%>;
    }

    function checkForm() {  
        if ($formAction == 0) {
           if ($action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Update %>" && $actName == "编制申报材料") {
               var grid = $('#<%=gvList.ClientID %>')[0];
               if (grid.rows.length < 3) {
                   alert("请添加计划申报项目！")
                   return false;
              }
           }
       }
       return true;
    }
</script>
