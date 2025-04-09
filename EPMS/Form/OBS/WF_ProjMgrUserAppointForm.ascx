<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjMgrUserAppointForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_ProjMgrUserAppointForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<script type="text/javascript">
    //查看关联项目立项、启动通知单
    function ViewProjectTask(formid, processid) {
        url = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=" + formid + "&prcinstid=" + processid;
        window.open(url, '_blank');
        return false;
    }
</script>
<table class="tz-table" width="100%">
    <uc1:ProjectCommon ID="ProjectCommon1" runat="server" />
    <tr style="display:none;">
        <td class="td-l" nowrap="nowrap">提出人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="PutUserName" tablename="EPMS_ProjectResource"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPutUserId" field="PutUserID" tablename="EPMS_ProjectResource" />
        </td>
        <td class="td-l" nowrap="nowrap" style="display: none">关联工程立项审批单
        </td>
        <td class="td-r" style="display: none">
            <a runat="server" id="aProjectStart" title="点击查看工程立项审批单" class="aStyle"></a>
            <asp:Label runat="server" ID="lbNoProjectStartMsg" Text="该项目没有工程立项审批单" CssClass="aStyle-red"
                Visible="false"></asp:Label>
        </td>
        <td class="td-l" nowrap="nowrap">关联勘测设计项目通知单
        </td>
        <td class="td-r">
            <a runat="server" id="aProjectTask" title="点击查看勘测设计项目通知单" class="aStyle"></a>
            <asp:Label runat="server" ID="lbNoTaskMsg" Text="该项目没有勘测设计项目通知单" CssClass="aStyle-red" Visible="false"></asp:Label>
        </td>
        <td class="td-l">是否重大项目<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rdblIsImportantProject" runat="server" ActiveStatus="(23.审核)"
                Field="IsImportantProject" TableName="EPMS_ProjectResource" RepeatColumns="2">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr style="display: none;">
        <td class="td-l">是否数字化设计<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rdblIsDigitalDesign" runat="server" ActiveStatus="(23.接收任命书并打印)"
                Field="IsDigitalDesign" TableName="EPMS_ProjectResource" RepeatColumns="2" >
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">是否创优<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rdblIsExcellent" runat="server" ActiveStatus="(23.接收任命书并打印)"
                Field="IsExcellent" TableName="EPMS_ProjectResource" RepeatColumns="2">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr style="display: none">
        <%--<td class="td-l" nowrap>
            设总判断是否简单工程<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="6">
            <table>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rdblIsSimpleProject" runat="server" ActiveStatus="(23.接收任命书并打印)"
                            Field="IsSimpleProject" TableName="EPMS_ProjectResource" RepeatColumns="2" req="1">
                            <asp:ListItem Text="是" Value="1"></asp:ListItem>
                            <asp:ListItem Text="否" Value="0"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:LinkButton ID="lkbSimpleProjectDefinition" runat="server" OnClientClick="return showSetInfo();"
                            ForeColor="Blue" Text="简单工程定义" EnableTheming="false"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>--%>
        <%--add by xuning 2016-08-08 去掉页面上“技质部审核是否简单工程”字段--%>
        <%--<td class="td-l" nowrap>
            技质部审核是否简单工程<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList ID="rdblCheckSimpleProject" runat="server" ActiveStatus="(23.审核是否简单工程)"
                Field="CheckSimpleProject" TableName="EPMS_ProjectResource" RepeatColumns="2"
                req="1">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>--%>
    </tr>
    <tr style="display: none">
        <td class="td-l" nowrap="nowrap">配置要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbResourceRequire" runat="server" TextMode="MultiLine"
                MaxText="512" CssClass="kpms-textarea" EnableTheming="false" ActiveStatus="(23.编制任命书)"
                Field="ResourceRequire" TableName="EPMS_ProjectResource"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <uc2:ProjectMgrUser ID="ProjectMgrUser1" runat="server" />
    <tr>
        <td class="td-l" nowrap="nowrap">任命要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbInfo" runat="server" TextMode="MultiLine" MaxText="512"
                CssClass="kpms-textarea" EnableTheming="false" ActiveStatus="(23.2)" Text="&nbsp;&nbsp;&nbsp;&nbsp;祝贺你们接受这一重要工作，相信你们能够在参加项目的全体人员的支持下做好这一工作，你们将执行国家有关法律、法规、标准和规程规范，坚决执行我院的质量管理体系程序文件的规定，认真听取业主的意见，充分发挥个人的聪明才智，全心全意地为业主服务，你们的工作责任和伴随而来的荣誉是终生的。"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<div style="display: none; font-size: inherit; letter-spacing: 4px; line-height: 20px"
    title="简单工程定义" id="divSimpleProjectDefinition">
    简单工程项目应视其重要性、难易程度、投资状况和涉及专业多少等因素综合考虑，一般可按以下条件予以界定：<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;发电项目：专业较少的技改项目或基建项目。<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;送电项目：破口项目、单回路不超过10公里的220kV线路项目、110kV及以下电压等级的线路和单体铁塔加高或移位项目。<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;变电工程：扩建间隔项目、一般110kV及以下新（扩）建项目和保护改造项目。<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;系统工程：配合专业数量在3个及以下的系统工程。<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;通信工程：一般区域性的光纤通信项目、微波项目等。<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;新能源工程：海上测风塔工程、风电场升压站220kV扩间隔单项工程、一般110kV及以下新（扩）建单项工程；风电场集电线路单项工程；破口项目、单回路220kV线路项目、110kV及以下电压等级的线路和单体铁塔加高或移位项目；陆上风电场工程等级Ⅲ（装机容量＜100MW，≥50MW，风电机组单机容量＜2000kW，升压站电压等级≤110kV，＞35kV）和工程等级Ⅳ（装机容量＜50MW，单机容量＜2000kW，升电站电压等级35kV）、太阳能光伏电站工程：电站容量≤50MW。<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;独立勘察工程：合同额（含预估额）≤50万的国内工程、不涉及新技术、新工艺应用的国内工程。<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;所有板块的国际工程均为非简单工程。<br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;特高压新（扩）建项目和保护改造项目均为非简单工程。
</div>
<!--主键 -->
<input type="hidden" id="hiProjectResourceID" name="hiProjectResourceID" runat="server"
    field="ProjectResourceID" tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
    field="OrganizationID" tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiResourceType" name="hiResourceType" runat="server" field="ResourceType"
    tablename="EPMS_ProjectResource" value="1" />
<input type="hidden" id="hiConfirmDate" name="hiConfirmDate" runat="server" field="ConfirmDate"
    tablename="EPMS_ProjectResource" />
<input type="hidden" runat="server" id="hiConfirmUserID" field="ConfirmUserID" tablename="EPMS_ProjectResource" />
<input type="hidden" runat="server" id="hiConfirmUserName" field="ConfirmUserName"
    tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiCheckFlowMes" name="hiCheckFlowMes" runat="server" value="已经存在发起的项目管理人员任命流程,不能重复发起！" />
<script type="text/javascript">

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "接收任命书并打印") {

                alert("请打印设总任命书，点击页面上方更多按钮中设总任命书即可");
                return true;
            }
        }
        return true;
    }

    //加载div默认事件
    function initEvent(div, funcName) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 400,
            minWidth: 800,
            modal: true
        });
    }

    function showSetInfo() {
        initEvent('divSimpleProjectDefinition', '');
        $("#divSimpleProjectDefinition").dialog('open');
        $("#divSimpleProjectDefinition").parent().appendTo("#<%=this.Page.Form.ClientID%>");
        return false;
    }

    //打印设总任命书
    function showPrint() {
        var projectId = $('#<%=hiOrganizationId.ClientID %>').val();
        var resourceId = $('#<%=hiProjectResourceID.ClientID %>').val();
        var urlStr = buildQueryUrl("/EPMS/List/OBS/ProjMgrAppointPrint.aspx", { ProjectID: projectId, ProjectResouceID: resourceId });
        window.open(urlStr, '_blank');
        return false;
    }

    //系统打印调用
    function beforePrint() {
        showPrint();
        return false;
    }
</script>
