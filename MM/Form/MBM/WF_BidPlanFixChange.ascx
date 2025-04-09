<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BidPlanFixChange.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_BidPlanFixChange" %>
<%@ Register TagPrefix="uc1" TagName="MarketProjectInfo" Src="../../UI/Controls/MarketProjectInfo.ascx" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
TagPrefix="uc3" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbosProjectName" field="ProjectName"
                tablename="MM_TenderEntity" activestatus="(23.编制工作策划)" PageWidth="800px"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiTenderEntityID':'id','ddlUndertakeDeptName':'DutyDeptID','hiUndertakeDeptName':'DutyDeptName','txtStartBidDay':'BidOpenDate'}"
                AfterSelect="formateDate()" PageUrl="~/MM/Obsolete/TenderEntitySelector.aspx"
                req="1" OnClick="lbosProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiTenderEntityID" field="TenderEntityID"
                tablename="MM_BidWorkPlan" />
        </td>
        <td class="td-l">
            投标承办部门
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlUndertakeDeptName" Field="DutyDeptID" tableName="MM_TenderEntity"
                req="1" activestatus="(23.编制工作策划)(3.修改《投标工作计划表》)" runat="server">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiUndertakeDeptName" runat="server" field="DutyDeptName"
                tablename="MM_TenderEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            开标日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDay" req="1"
                tablename="MM_TenderEntity" readonly="readonly" class="kpms-textbox-date" field="BidOpenDate"
                activestatus="(23.编制工作策划)(3.修改《投标工作计划表》)" />
        </td>
        <td class="td-l">
            计划编制人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lboPlanWriteUser" field="PlanWriteUserName"
                tablename="MM_BidWorkPlan" activestatus="(23.编制工作策划)(3.修改《投标工作计划表》)" PageWidth="800px"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiPlanWriteUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPlanWriteUserID" field="PlanWriteUserID"
                tablename="MM_BidWorkPlan" />
        </td>
        <td class="td-l">
            编标时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtFormulateBidDate" req="1"
                tablename="MM_BidWorkPlan" readonly="readonly" class="kpms-textbox-comparedate"
                field="FormulateBidDate" compare="1" activestatus="(23.编制工作策划)(3.修改《投标工作计划表》)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            编标截止时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtFormulateBidEndDate"
                req="1" tablename="MM_BidWorkPlan" readonly="readonly" class="kpms-textbox-comparedate"
                compare="1" field="FormulateBidEndDate" activestatus="(23.编制工作策划)(3.修改《投标工作计划表》)" />
        </td>
        <td class="td-l">
            编标地点
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbFormulateBidPlace" field="FormulateBidPlace"
                tablename="MM_BidWorkPlan" MaxLength="128" activestatus="(23.编制工作策划)(3.修改《投标工作计划表》)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">相关附件
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                                         DisplayStatus="(3.编制工作策划)" OnClick="lbtnUpload_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                                                                     id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
            <uc3:UpLoadFile ID="uploadFile" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">是否需要其他部门评审
        </td>
        <td class="td-r">
            <asp:CheckBox runat="server" ID="ckbIsNeedOtherAppDept" activestatus="(23.编制工作策划)" tablename="MM_BidWorkPlan"
                          field="IsNeedOtherAppDept" onclick="isShowOtherAppDept();" />
        </td>
        <td class="td-l" name="OtherAppDeptTd" style="display: none">评审部门<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3" name="OtherAppDeptTd" style="display: none">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsOtherAppDeptNames" ResultAttr="name" Writeable="False" SelectPageMode="Dialog"
                                           PageUrl="../../../Sys/OrgUsers/OrgSelector.aspx" activestatus="(23.编制工作策划)" field="OtherAppDeptNames"
                                           ResultForControls="{'hiOtherAppDeptIDs':'id'}" IsMutiple="True"
                                           tablename="MM_BidWorkPlan" ShowJsonRowColName="True" />
            <input type="hidden" runat="server" id="hiOtherAppDeptIDs" tablename="MM_BidWorkPlan" field="OtherAppDeptIDs" />
        </td>
        <td class="td-m" colspan="4" name="noOtherAppDeptTd"></td>
    </tr>
    <tr>
        <td class="td-l">是否分管领导审批
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBox runat="server" ID="ckbIsNeedLeader" activestatus="(23.编制工作策划)" tablename="MM_BidWorkPlan"
                          field="IsNeedLeader" />
        </td>
    </tr>
    <tr runat="server" displaystatus="(3.编制工作策划)">
        <td colspan="6" style="text-align: right">
            新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>
            <asp:Button runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvWorkPlanItem" runat="server" ShowExport="true"
                UseDefaultDataSource="true" DataKeyNames="BidWorkPlanItemID" AllowPaging="true"
                BindGridViewMethod="BindWorkPlanItem" OnRowCommand="gvWorkPlanItem_RowCommand"
                OnRowCreated="gvWorkPlanItem_RowCreated" OnRowDataBound="gvWorkPlanItem_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField HeaderText="负责内容<span class='req-star'>*</span>" DataField="Content">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="负责信息<span class='req-star'>*</span>" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList ID="ddlItemName" req="1" runat="server" Width="150px">
                            </zhongsoft:LightDropDownList>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="责任部门或责任人" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="txtUserOrDeptName" IsMutiple="false"
                                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                                ResultAttr="name" ShowAttrs="name" PageWidth="850" ResultForControls="{'hiUserOrDeptId':'id'}">
                            </zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiUserOrDeptId" value='<%#Eval("UndertakeID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划完成日期" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtCompleteDate" readonly="readonly"
                                Value='<%# (Eval("CompleteDate")==null||string.IsNullOrEmpty(Eval("CompleteDate").ToString())) ? Eval("CompleteDate") : Convert.ToDateTime(Eval("CompleteDate")).ToString("yyyy-MM-dd") %>'
                                class="kpms-textbox-date" />
                            <input type="hidden" runat="server" id="hiUndertakeType" value='<%#Eval("UndertakeType") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-Width="300px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textbox" MaxLength="64"
                                Text='<%#Eval("Memo") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除吗？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---投标流程主键ID-->
<input type="hidden" runat="server" id="hiBidWorkPlanID" field="BidWorkPlanID" tablename="MM_BidWorkPlan" />
<script type="text/javascript">

    function initCustomerPlugin() {
        isShowOtherAppDept();
    }
    //格式化开标日期
    function formateDate() {
        var startBidDay = $("#<%=txtStartBidDay.ClientID %>").val();
        if (startBidDay != "") {
            $("#<%=txtStartBidDay.ClientID %>").val(parseDate(startBidDay));
        }
        return false;
    }

    //是否显示评审部门
    function isShowOtherAppDept() {
        if ($("#<%=ckbIsNeedOtherAppDept.ClientID%>").is(':checked')) {
            $("[name$='OtherAppDeptTd']").show();
            $("#<%=lbsOtherAppDeptNames.ClientID%>").attr("req", "1");
            $("[name$='noOtherAppDeptTd']").hide();
        } else {
            $("[name$='OtherAppDeptTd']").hide();
            $("#<%=lbsOtherAppDeptNames.ClientID%>").removeAttr("req");
            $("[name$='noOtherAppDeptTd']").show();
        }
    }

    function checkForm() {
        if ($formAction == 2) {
<%--            if ($actName == "编制工作策划") {
                var grid = $("#<%=hiTenderEntityID.ClientID%>").val();
                if (grid == "" || grid == undefined ) {
                    alert("请先选择工程！");
                    return false;
                } else {
                    return true;
                }
            }--%>
        }
        return true;
    }
</script>
