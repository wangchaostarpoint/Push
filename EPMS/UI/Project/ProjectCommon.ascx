<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectCommon.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectCommon" %>
<tr runat="server" id="trTitle" visible="false">
    <td colspan="6" class="td-m flexible">
        项目信息
    </td>
</tr>
<tr runat="server" id="trBaseInfo">
    <td class="td-l">
        项目名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3" style="white-space: nowrap">
        <div style="clear:both"/>
        <div style="width:85%; float:left">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
            SelectPageMode="Dialog"
            ResultForControls="{'hiOrganizationId':'id','tbProjectPhaseCode':'ProjectCode','tbPhaseName':'PhaseName'}"
            EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ShowJsonRowColName="true" FilterFunction="projFilter()" ResultAttr="name"
            activestatus="(23.编制计划)" AfterSelect="afterSelect()" />
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Visible="false"></asp:LinkButton>
        </div>
        <div style="float:left;line-height:25px">
            <a runat="server" id="aProjectStart" title="点击项目详细信息" class="aStyle" style="display:none;">项目详细信息</a>
            <a runat="server" title="点击项目详细信息" class="aStyle" onclick="viewProjectInfo()">项目详细信息</a>
        </div>  
    </td>

    <td class="td-l" runat="server" id="tdProjectCode">
        项目编号
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText ID="tbProjectPhaseCode" runat="server" readonly="readonly"
            activestatus="(23.编制计划)" maxlength="16" class="kpms-textbox" />
        <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server" />  
    </td>
</tr>
<tr>   
    <td class="td-l">
        项目分类
    </td>
    <td class="td-m" >
        <zhongsoft:XHtmlInputText ID="txtProjectLevel" runat="server" readonly="readonly" maxlength="16"
            class="kpms-textbox" activestatus="(23.编制计划)" />
    </td>
    <td class="td-l">是否重大项目
        </td>
        <td class="td-r"">
            <zhongsoft:XHtmlInputText ID="txtIsImportant" runat="server" readonly="readonly" maxlength="16"
            class="kpms-textbox" activestatus="(23.编制计划)" />
        </td>
    <td class="td-l">
        设计阶段
    </td>
    <td class="td-m" >
        <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" maxlength="16"
            class="kpms-textbox" activestatus="(23.编制计划)" />
    </td>
</tr> 
 <tr>
    <td class="td-l">项目牵头分院
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText ID="txtHostDeptName" runat="server" readonly="readonly" maxlength="128"
            class="kpms-textbox" activestatus="(23.编制计划)" />
    </td>
    <td class="td-l">项目配合分院
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:XHtmlInputText ID="txtDeputyDeptName" runat="server" readonly="readonly" maxlength="1024"
            class="kpms-textbox" activestatus="(23.编制计划)" />
    </td>
</tr>
<script> 
    function afterSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }

    function projFilter() {
        return "<%=Filter %>";
    }
    //查看项目信息
    function viewProjectInfo() {
        var url = buildQueryUrl("/EPMS/List/Project/ProjectEditorNew.aspx",
            {
                organizationID: $("#<%=hiOrganizationId.ClientID%>").val(), actiontype: 1
            });
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }


    //查看流程页面
    function viewWorkflow(FId, PId) {
        var param = { formId: FId, prcInstId: PId };
        var urlStr = buildBizUrl("1", null, "/Sys/Workflow/FormDetail.aspx", param);
        window.open(urlStr);
        return false;
    }
</script>
