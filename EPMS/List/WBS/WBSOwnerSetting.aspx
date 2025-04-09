<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WBSOwnerSetting.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSOwnerSetting" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="安排任务负责人" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    Filter="{'IsDesignProject':'2'}" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                    TableName="EPMS_WBSEntity" Field="ProjectName" activestatus="(3.*)" req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSEntity"
                    field="OrganizationID" />
            </td>
            <td class="td-l">项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(3.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectCode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">任务名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                    ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','txtWBSOwner_hivalue':'WBSOwnerName','txtWBSOwner':'WBSOwnerName','hiWBSOwnerID':'WBSOwnerID'}"
                    activestatus="(23.*)" tablename="EPMS_WBSBook" field="WBSName" BeforeSelect="beforeSelectWbs()" OnClick="txtWBSName_OnClick"
                    FilterFunction="wbsFilter()" req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_WBSEntity" field="WBSID" />
            </td>
            <td class="td-l">任务编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.*)" tablename="EPMS_WBSEntity"
                    field="WBSCode" readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">任务负责人<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwner" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(3.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiWBSOwnerID':'id'}"
                    tablename="EPMS_WBSBook" req="1" PageWidth="850" field="WBSOwnerName" FilterFunction="ownerFilter()"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiWBSOwnerID" tablename="EPMS_WBSEntity"
                    field="WBSOwnerID" />
            </td>

            <td class="td-l">校核人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsJHR" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(3.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiJHR':'id'}"
                    PageWidth="850" FilterFunction="ownerFilter()"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiJHR" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiExeSpecialtyID" />
    <script type="text/javascript">
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
            //当前登录人在所选项目中担任主设人的专业ID
            //var specialtyID = $('#<%=hiExeSpecialtyID.ClientID %>').val();
            //新增筛选：尚未开展、正在进行，按照角色筛选（具体逻辑在选择页面）
            return { OrganizationID: orgId, TypeID: '<%=WBSType.册.GetHashCode() %>', IsShowMore: 0, WBSStates: '<%=(int)WBSState.尚未开展 %>,<%=(int)WBSState.正在进行 %>', IsSelelctByRole: 1 };
        }

        //选择卷册负责人筛选条件
        function ownerFilter() {
            var deptID = "<%=KPMSUser.OrganizationId %>";
            return "{DeptID:'" + deptID + "'}";
        }
    </script>
</asp:Content>
