<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectDataDispenseForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.ProjectData.WF_ProjectDataDispenseForm" %>
<%@ Register Src="~/EPMS/UI/ProjectData/ProjectDataRecUserList.ascx" TagName="ProjectDataRecUserList" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3" style="white-space: nowrap">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectPhaseCode':'ProjectCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写资料分发清单)"
                TableName="EPMS_ProjectDataRecForm" Field="ProjectName" />
        </td>
        <td class="td-l" runat="server">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbProjectPhaseCode" runat="server" readonly="readonly"
                activestatus="(23.填写资料分发清单)" maxlength="16" class="kpms-textbox" TableName="EPMS_ProjectDataRecForm"
                Field="ProjectCode" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                tablename="EPMS_ProjectDataRecForm" field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">主题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTitle" runat="server" MaxLength="128" activestatus="(23.填写资料分发清单)"
                Field="Title" TableName="EPMS_ProjectDataRecForm" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">发起人
           
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtDispenseUserName" runat="server" readonly="readonly"
                activestatus="(23.填写资料分发清单)" maxlength="16" class="kpms-textbox" TableName="EPMS_ProjectDataRecForm"
                Field="DispenseUserName" />
            <input type="hidden" id="hiDispenseUserID" name="hiDispenseUserID" runat="server"
                tablename="EPMS_ProjectDataRecForm" field="DispenseUserID" />
        </td>
        <td class="td-l">发起部门
           
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtDispenseDeptName" runat="server" readonly="readonly"
                activestatus="(23.填写资料分发清单)" maxlength="16" class="kpms-textbox" TableName="EPMS_ProjectDataRecForm"
                Field="DispenseDeptName" />
            <input type="hidden" id="hiDispenseDeptID" name="hiDispenseDeptID" runat="server"
                tablename="EPMS_ProjectDataRecForm" field="DispenseDeptID" />
        </td>
        <td class="td-l">日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtDispenseDate" activestatus="(23.填写资料分发清单)"
                EnableTheming="false" req="1" class="kpms-textbox-date" readonly="readonly" field="DispenseDate"
                tablename="EPMS_ProjectDataRecForm" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">责任人</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="selResponsible" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiResponsibleID':'id'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写资料分发清单)"
                TableName="EPMS_ProjectDataRecForm" Field="Responsible" />
            <input type="hidden" id="hiResponsibleID" name="hiResponsibleID" runat="server"
                tablename="EPMS_ProjectDataRecForm" field="ResponsibleID" />
        </td>
        <td class="td-l">页数</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPageNum" runat="server" MaxLength="128" activestatus="(23.填写资料分发清单)"
                Field="PageNum" TableName="EPMS_ProjectDataRecForm" DataType="Integer" EnableTheming="false"
                CssClass="kpms-textbox-money" />
        </td>
        <td class="td-l"></td>
        <td class="td-r"></td>
    </tr>
    <tr>
        <td colspan="6" class="flexible">资料清单
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" ShowFooter="false"
                UseDefaultDataSource="true" PageSize="100" AutoGenerateColumns="false" Width="100%" EmptyDataText="没有资料信息" BindGridViewMethod="UserControl.BindGridData"
                ShowExport="false" ShowPageSizeChange="true" AllowSorting="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <asp:TemplateField HeaderText="资料名称" SortExpression="FileName">
                        <ItemTemplate>
                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileID") %>"
                                target="_blank" title="<%# Eval("FileName") %>">
                                <%# Eval("FileName").ToString() %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField HeaderText="上传人" DataField="CreateUserName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="上传时间" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="CreateDate">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="flexible">接收人清单
           <%--选择专业，选择其他接收人--%>
            <span style="float: right">
                <asp:Button ID="lkbSelSpec" runat="server" displaystatus="(23.填写资料分发清单)(3.分发)" EnableTheming="false" OnClick="lkbSelSpec_Click" OnClientClick="return selSpec();" Text="选择专业"></asp:Button>
                <asp:Button ID="lkbSelOtherUser" runat="server" displaystatus="(23.填写资料分发清单)(3.分发)" EnableTheming="false" OnClick="lkbSelOtherUser_Click" OnClientClick="return selUser();" Text="选择其他接收人"></asp:Button>
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc1:ProjectDataRecUserList ID="ucProjectDataRecUserList1" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiProjectDataRecFormID" runat="server" tablename="EPMS_ProjectDataRecForm"
    field="ProjectDataRecFormID" />
<input type="hidden" id="hiSpecXml" runat="server" />
<input type="hidden" id="hiUserXml" runat="server" />
<script type="text/javascript">

    function selSpec() {
        var param = new InputParamObject("m");
        var json = { OrganizationID:'<%=OrganizationId %>', ShowLittleSpe: 1 };
        getDivSpecialty("<%=hiSpecXml.ClientID%>", param, json, selSpecCallBack);
        return false;
    }

    function selSpecCallBack() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lkbSelSpec,"") %>
        return true;
    }

    function selUser() {
        var param = new InputParamObject("m");

        getEPMSUser("<%=hiUserXml.ClientID%>", param, null, selUserCallBack);
        return false;

    }

    function selUserCallBack() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lkbSelOtherUser,"") %>
        return true;
    }

</script>

