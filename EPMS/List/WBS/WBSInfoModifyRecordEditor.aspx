<%@ Page Title="卷册信息修改" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="WBSInfoModifyRecordEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSInfoModifyRecordEditor" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    Filter="{'IsDesignProject':'2'}" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                    TableName="EPMS_WBSInfoModifyRecord" Field="ProjectName" activestatus="(2.*)"
                    req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSInfoModifyRecord"
                    field="OrganizationID" />
            </td>
            <td class="td-l">
                项目编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSInfoModifyRecord"
                    Field="ProjectCode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                卷册名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                    ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','txtWBSOwner_hivalue':'WBSOwnerName','txtWBSOwner':'WBSOwnerName','hiWBSOwnerID':'WBSOwnerID'}"
                    activestatus="(2.*)" tablename="EPMS_WBSInfoModifyRecord" field="WBSName" BeforeSelect="beforeSelectWbs()"
                    FilterFunction="wbsFilter()" req="1" OnClick="txtWBSName_Click"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_WBSInfoModifyRecord"
                    field="WBSID" />
            </td>
            <td class="td-l">
                卷册编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.*)" tablename="EPMS_WBSInfoModifyRecord"
                    field="WBSCode" readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                修改后卷册名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbWBSNameOfNew" TableName="EPMS_WBSInfoModifyRecord"
                    Field="WBSNameOfNew" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                修改原因<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_WBSInfoModifyRecord"
                    Field="Memo" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                修改人<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtModifyUserName" activestatus="(23.*)"
                    tablename="EPMS_WBSInfoModifyRecord" field="LastModifyUserName" readonly="readonly"
                    class="kpms-textbox" req="1" />
            </td>
            <td class="td-l">
                修改时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtModifyDate" activestatus="(23.*)"
                    class="kpms-textbox-date" tablename="EPMS_WBSInfoModifyRecord" field="LastModifyDate"
                    readonly="readonly" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
               <br>卷册名称修改后会修改以下信息：</br>
               <br>1、卷册信息中卷册名称；</br>
               <br>2、《卷册任务书下达》流程中卷册名称；</br>
               <br>3、《互提资料提交》流程提出卷册名称、接收卷册名称；</br>
               <br>4、《外部资料管理》流程卷册名称，关联卷册名称；</br>
               <br>5、《成品四级校审》流程中的卷册名称。</br>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_WBSInfoModifyRecord" field="WBSInfoModifyRecordID"
        runat="server" />
    <script type="text/javascript">
        //        function initCustomerPlugin() {
        //            checkMaxLength();
        //            checkRegex();
        //        }

        //选择任务之前的逻辑判断
        function beforeSelectWbs() {
            var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
            if (orgId == '' || orgId == undefined) {
                alert('请先选择项目，再选择卷册！');
                return false;
            }
            return true;
        }

        //选择任务的筛选条件
        function wbsFilter() {
            var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
            return { OrganizationID: orgId, TypeID: '<%=WBSType.册.GetHashCode() %>', IsSelelctByRole: 1, SelelctRole: '主任工' };
        }
    </script>
</asp:Content>
