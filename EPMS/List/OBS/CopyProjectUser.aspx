<%@ Page Title="复制历史工程的项目组成员" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="CopyProjectUser.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.OBS.CopyProjectUser" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <link href="../../../Themes/custom/styles/global.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table" style="width: 100%; margin-top: 20px;">
                <tr>
                    <td class="td-m" colspan="6">
                        当前项目基本信息
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        项目名称
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightTextBox ID="tbProjectName" runat="server" MaxLength="128" Field="ProjectName"
                            req="1" TableName="EPMS_ProjectEntity" activestatus="(23.?)" ReadOnly="true" />
                    </td>
                    <td class="td-l">
                        项目编号
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" MaxLength="32" Field="ProjectCode"
                            req="1" TableName="EPMS_ProjectEntity" activestatus="(23.?)" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td class="td-m" colspan="6">
                        选择历史工程项目
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        项目名称
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                            PageWidth="850" SelectPageMode="Dialog" ResultForControls="{'hiTargetOrganizationID':'id','tbProjectPhaseCode':'ProjectCode','tbPhaseName':'PhaseName'}"
                            EnableTheming="false" Text="选择项目" AfterSelect="afterSelect()" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                            ShowJsonRowColName="true" FilterFunction="projFilter()" ResultAttr="name" activestatus="(23.步骤)" />
                        <input id="hiTargetOrganizationID" type="hidden" runat="server" />
                    </td>
                    <td class="td-l">
                        项目编号
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbProjectPhaseCode" runat="server" readonly="readonly"
                            activestatus="(23.步骤)" maxlength="16" class="kpms-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        设计阶段
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" activestatus="(23.步骤)"
                            maxlength="16" class="kpms-textbox" />
                    </td>
                    <td class="td-l">项目通讯录
                    </td>
                    <td class="td-r">
                        <asp:LinkButton ID="lkbProjectUser" runat="server" ForeColor="Blue" EnableTheming="false"
                            OnClientClick="return openProjectUser()" activestatus="(13.*)" displaystatus="(13.*)">通讯录</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="td-m" colspan="6">
                        复制套用的人员
                    </td>
                </tr>
                <tr>
                    <td class="td-r" colspan="6">
                        <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="All">全部</asp:ListItem>
                            <asp:ListItem Value="ProjectRole">管理人员</asp:ListItem>
                            <asp:ListItem Value="SpecialtyRole">专业人员</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnSure" OnClientClick="return saveData();" OnClick="btnSure_Click">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function initCustomerPlugin() {
        }

        function saveData() {
            if (!checkReqField()) {
                return false;
            }
            if (confirm("您确定要复制目标工程的项目组成员吗？")) {
                return true;
            }
            return false;
        }

        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }

        function projFilter() {
            return "";
        }

        function openProjectUser() {
            var orgID = $("#<%=hiTargetOrganizationID.ClientID %>").val();
            if (orgID == "") {alert("请先选择项目！");return false;}
            var url = buildQueryUrl("/EPMS/List/OBS/ProjectTeamMemberList.aspx", { IsPortal: true, MenuId: '241155B8-33F5-4D56-8A94-B5D6C2337320', OrganizationID: orgID });
            showDivDialog(url, null, 1200, 600, null);
            return false;
        }
    </script>
</asp:Content>
