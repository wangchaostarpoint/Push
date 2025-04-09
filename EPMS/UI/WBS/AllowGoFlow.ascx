<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AllowGoFlow.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.AllowVerifyGoFlow" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<!--任务的设计条件-->
<%@ Register Src="../../UI/Product/WBSConditonStats.ascx" TagName="WBSConditonStats"
    TagPrefix="uc2" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" width="100%" id="tbProject">
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr>
        <td class="td-l">
            任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','txtWBSOwner':'WBSOwnerName','hiBelongSpecialtyID':'ExeSpecialtyID'}"
                activestatus="(23.填写不具备条件处理申请)" tablename="EPMS_AllowGoFlow" field="WBSName"
                BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()" AfterSelect="afterWBSSelect()"
                req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_AllowGoFlow" field="WBSID" />
        </td>
        <td class="td-l">
            任务编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.填写不具备条件处理申请)"
                tablename="EPMS_AllowGoFlow" field="WBSCode" readonly="readonly" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            专业负责人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPutUserName" activestatus="(23.?)"
                readonly="readonly" class="kpms-textbox" />
        </td>
        <td class="td-l">
            任务负责人
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSOwner" activestatus="(23.?)" readonly="readonly"
                class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td rowspan="2" class="td-l">
            <asp:LinkButton ID="lkbFiles" runat="server" OnClientClick="return openFileDetail()"
                EnableTheming="false" ForeColor="Blue">
                接口资料
            </asp:LinkButton>
        </td>
        <td class="td-r" rowspan="2">
            <uc2:WBSConditonStats ID="wbsCondition" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            特殊放行申请原因 <span class="req-star">*</span>
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbModifyReason" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" activestatus="(23.填写不具备条件处理申请)" field="AllowReason" tablename="EPMS_AllowGoFlow"
                TextMode="MultiLine" maxtext="128" Rows="4" Width="98%" req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            校审类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlVerifyType" activestatus="(23.填写不具备条件处理申请)"
                req="1" tablename="EPMS_AllowGoFlow" field="VerifyType">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiVerifyType" tablename="EPMS_AllowGoFlow"
                field="VerifyType" />
        </td>
        <td class="td-l">
            校审条件
        </td>
        <td class="td-r">
            <span class="req-star">是否具备校审条件：<asp:Label runat="server" ID="lbIsHaveCondition"></asp:Label></span>
        </td>
        <td class="td-l">
            是否允许发起校审流程<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblIsAllowStartVerify" RepeatDirection="Horizontal"
                req="1" activestatus="(23.审批)(23.设总审批)(23.部门负责人审批)" field="IsAllowStartVerify" tablename="EPMS_AllowGoFlow">
                <asp:ListItem Value="1">允许</asp:ListItem>
                <asp:ListItem Value="0">不允许</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<!----主键-->
<input type="hidden" runat="server" id="hiAllowGoFlowID" field="AllowGoFlowID" tablename="EPMS_AllowGoFlow" />
<input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
    tablename="EPMS_AllowGoFlow" />
<input type="hidden" runat="server" id="hiProjectCode" field="ProjectCode" tablename="EPMS_AllowGoFlow" />
<input type="hidden" runat="server" id="hiProjectName" field="ProjectName" tablename="EPMS_AllowGoFlow" />
<input type="hidden" runat="server" id="hiBelongSpecialtyID" />
<asp:LinkButton runat="server" ID="btnAfterSelectWBS" OnClick="btnAfterSelectWBS_Click"
    Visible="false"></asp:LinkButton>
<script>
    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择任务！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var ownerId = '<%=KPMSUser.Id %>';
        var formType = '<%=Zhongsoft.Portal.EPMS.Obsolete.WBSFormTypeSelect.校审.ToString() %>';
        return { OrganizationID: orgId, WBSType: '<%=WBSMode.任务管理.GetHashCode() %>', WBSFormTypeSelect: formType, OwnerId: ownerId, IsShowMore: 1 };
    }

     function afterWBSSelect() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAfterSelectWBS, "")%>;
    }

    //接口资料下载页面
    function openFileDetail() {
        var releWBSID = $("#<%=hiWBSID.ClientID %>").val();
        var organizationID = $("#<%=hiOrganizationID.ClientID %>").val();
        var specialtyID = $("#<%=hiBelongSpecialtyID.ClientID %>").val();
        var json = { actionType: 1, ReleWBSID: releWBSID, OrganizationID: organizationID, SpecialtyID: specialtyID };
        var url = buildQueryUrl("/EPMS/List/WBS/WBSFileDownload.aspx", json);
        showDivDialog(url, null, 800, 600, null);
        return false;
    }
</script>
