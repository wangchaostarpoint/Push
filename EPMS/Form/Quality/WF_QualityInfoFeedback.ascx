<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_QualityInfoFeedback.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Quality.WF_QualityInfoFeedback" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            填写人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCreateUserName" runat="server" TableName="EPMS_QualityFeedBack"
                Field="CreateUserName" activestatus="(23.对初始质量库进行价值鉴别并分析原因)(23.对初始经验（质量）进行价值鉴别并分析原因制定措施)"
                class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiCreateUserId" type="hidden" runat="server" tablename="EPMS_QualityFeedBack"
                field="CreateUserId" />
        </td>
        <td class="td-l">
            填写部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" TableName="EPMS_QualityFeedBack"
                Field="DeptName" activestatus="(23.对初始质量库进行价值鉴别并分析原因)(23.对初始经验（质量）进行价值鉴别并分析原因制定措施)"
                class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiDeptID" type="hidden" runat="server" tablename="EPMS_QualityFeedBack"
                field="DeptID" />
        </td>
        <td class="td-l">
            填写日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCreateDate" runat="server" TableName="EPMS_QualityFeedBack"
                Field="CreateDate" activestatus="(23.对初始质量库进行价值鉴别并分析原因)(23.对初始经验（质量）进行价值鉴别并分析原因制定措施)"
                req="1" class="kpms-textbox-date" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            审批人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConfirmUserName" runat="server" TableName="EPMS_QualityFeedBack"
                Field="ConfirmUserName" activestatus="(23.审批（院副总工）)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiConfirmUserID" type="hidden" runat="server" tablename="EPMS_QualityFeedBack"
                field="ConfirmUserID" />
        </td>
        <td class="td-l">
            审批人角色
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtConfirmUserRole" runat="server" TableName="EPMS_QualityFeedBack"
                Field="ConfirmUserRole" activestatus="(23.审批（院副总工）)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m flexible">
            质量信息列表 <span id="Span1" runat="server" displaystatus="(2.对初始质量库进行价值鉴别并分析原因)(2.对初始经验（质量）进行价值鉴别并分析原因制定措施)"
                style="float: right; color: Red;display:none;">先保存再添加记录</span> <span id="Span2" runat="server"
                    displaystatus="(3.对初始质量库进行价值鉴别并分析原因)(3.修改初始质量库进行价值鉴别并分析原因)" style="float: right">
                    <asp:Button ID="btnAddDetail" runat="server" OnClientClick="return addQualityInfo()"
                        Text="添加质量信息" class="btn" Visible="false" />
                </span><span id="Span3" runat="server" displaystatus="(3.审批（院副总工）)" style="float: right;
                    display: inline-block">审批状态<zhongsoft:LightDropDownList runat="server" ID="ddlQualityState"
                        OnSelectedIndexChanged="ddlQualityState_SelectedIndexChanged" AutoPostBack="true"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                    审批意见<zhongsoft:LightDropDownList runat="server" ID="ddlApproveOpinion" OnSelectedIndexChanged="ddlApproveOpinion_SelectedIndexChanged"
                        AutoPostBack="true" EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span>
        </td>
    </tr>
    <tr>
        <td colspan="5" class="td-m">
            <table>
                <tr>
                    <td style="width: 120px">
                        项目编号/名称
                    </td>
                    <td style="width: 120px">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" SourceMode="SelectorPage"
                            PageWidth="850" IsMutiple="false" DoCancel="false" SelectPageMode="Dialog" Writeable="true"
                            EnableTheming="false" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" Width="120px"
                            ShowJsonRowColName="true" ResultAttr="ProjectCode" activestatus="(123.*)" />
                    </td>
                    <td style="width: 50px">
                        &nbsp;专业
                    </td>
                    <td>
                        <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" class="kpms-ddlsearch"
                            EnableTheming="false" Width="120px">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td style="width: 120px">
                        &nbsp;卷册编号/名称
                    </td>
                    <td style="width: 120px">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsRollCode" SourceMode="SelectorPage"
                            PageWidth="850" IsMutiple="false" DoCancel="false" SelectPageMode="Dialog" Writeable="true"
                            EnableTheming="false" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx" FilterFunction="wbsFilter()"
                            ShowJsonRowColName="true" ResultAttr="WBSCode" activestatus="(123.*)" />
                        <input type="hidden" runat="server" id="hiSpecialtyIDS" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="td-r">
            <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click">
                      <span content='searchResult'>查询</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="lbtnReset" OnClick="lbtnReset_Click">
                      <span content='searchResult'>重置</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvQualityInfo" AutoGenerateColumns="false"
                AllowSorting="true" DataKeyNames="QualityID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindGridData"
                EmptyDataText="请添加质量信息" OnRowCommand="gvQualityInfo_RowCommand" ShowExport="true"
                HideFieldOnExport="删除" ShowPageSizeChange="true" AllowPaging="true" PageSize="10">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="名称">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="QualityTheme" HeaderText="主题词" ShowToolTip="true"
                        HeaderStyle-Width="60px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="QualityStateToWorkFlow" HeaderText="审批状态">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="OpinionConfirmUserName" HeaderText="审批人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="OpinionApproveOpinion" HeaderText="审批意见" ShowToolTip="true"
                        Width="60px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField HeaderText="查看" CommandName="viewData" ItemStyle-Width="40px"
                        EditItemClick="viewQualityInfo" DataParamFields="QualityID">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField HeaderText="编辑" CommandName="editData" ItemStyle-Width="40px"
                        Visible="false" EditItemClick="editQualityInfo" DataParamFields="QualityID">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px"
                        Visible="false">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.对初始质量库进行价值鉴别并分析原因)(23.对初始经验（质量）进行价值鉴别并分析原因制定措施)" field="Memo"
                tablename="EPMS_QualityFeedBack" TextMode="MultiLine" maxtext="512" Rows="4"
                Width="98%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiQualityFeedBackID" runat="server" field="QualityFeedBackID"
    tablename="EPMS_QualityFeedBack" />
<asp:Button ID="btnAddQualityInfo" runat="server" Visible="false" OnClick="btnAddQualityInfo_Click" />
<input type="hidden" runat="server" id="hiZZRoleName" value="主任工程师" />
<input type="hidden" runat="server" id="hiDeptRoleName" value="科室负责人" />
<input type="hidden" runat="server" id="hiQualityName" value="室主任（主任工）" />
<script type="text/javascript">

    function checkForm() {
        if ($formAction == 0) {
            if ($('#<%=gvQualityInfo.ClientID %>')[0].rows[1].cells[0].innerText == "请添加质量信息") {
                window.alert('-请至少添加一条质量信息！');
                return false;
            }
        }
        return true;
    }

    //查看质量信息
    function viewQualityInfo(QualityID) {
        var actionType = 1;
        var businessID = "<%=BusinessObjectId %>"
        var url = buildQueryUrl("EPMS/List/Quality/QualityInfoEditor.aspx", { "actionType": actionType, "bizId": QualityID, PageType: "workFlowEditor", WorkFlowBizid: businessID, secid: "56c2e1a6-2663-4c30-a78d-8d1767ca8944" });
        showDivDialog(url, null, 800, 600, null);
        return false;
    }

    //新建质量信息
    function addQualityInfo() {
        var actionType = 2;
        var businessID = "<%=BusinessObjectId %>"
        var url = buildQueryUrl("EPMS/List/Quality/QualityInfoEditor.aspx", { "actionType": actionType, PageType: "workFlowEditor", WorkFlowBizid: businessID, "CurrName": "<%=CurrentActivityName %>", secid: "56c2e1a6-2663-4c30-a78d-8d1767ca8944" });
        showDivDialog(url, null, 800, 600, qualityInfoCallBack);
        return false;
    }

    //编辑质量信息
    function editQualityInfo(QualityID) {
        var actionType = 3;
        var businessID = "<%=BusinessObjectId %>"
        var url = buildQueryUrl("EPMS/List/Quality/QualityInfoEditor.aspx", { "actionType": actionType, "bizId": QualityID, PageType: "workFlowEditor", WorkFlowBizid: businessID, "CurrName": "<%=CurrentActivityName %>", secid: "56c2e1a6-2663-4c30-a78d-8d1767ca8944" });
        showDivDialog(url, null, 800, 600, qualityInfoCallBack);
        return false;
    }
    function qualityInfoCallBack() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddQualityInfo,"") %>;
        return true;
    }
    
    //选择卷册信息
    function wbsFilter(){
       var projectCode=$("#<%=lbsSelectProject.ClientID %>").next().val();
       return {ProjectCode:projectCode};
    }
</script>
