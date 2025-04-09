<%@ Page Title="批量安排任务负责人" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="WBSOwnerBatchSetting.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSOwnerBatchSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" OnClick="txtProjectName_OnClick"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    Filter="{'IsDesignProject':'2'}" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                    TableName="EPMS_WBSEntity" Field="ProjectName" activestatus="(3.*)" req="1" />
                <input type="hidden" runat="server" id="hiOrganizationID" />
            </td>
            <td class="td-l">项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(3.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectCode" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">专业
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpec" />
            </td>
            <td class="td-m" colspan="4" />
        </tr>

        <tr>
            <td class="td-l">任务负责人
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwner" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(3.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiWBSOwnerID':'id'}"
                    PageWidth="850" FilterFunction="ownerFilter()"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiWBSOwnerID" />
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
    <br />
    <span class="req-star">勾选需要安排的任务，点击左上角“保存”按钮，批量安排任务负责人、校核人。</span>
    <table class="tz-table">
        <tr>
            <td class="td-l">任务名称/编号</td>
            <td class="td-m" colspan="4">
                <zhongsoft:LightTextBox runat="server" ID="tbWbsName" EnableTheming="False" CssClass="kpms-textboxsearch" />
            </td>
            <td style="text-align: right" class="td-r">
                <asp:LinkButton runat="server" ID="lbtnSearch" OnClick="lbtnSearch_OnClick">查询&nbsp;&nbsp;</asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnReset" OnClick="lbtnReset_OnClick">重置&nbsp;&nbsp;</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m">
                <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" AllowPaging="True" PageSize="10" DataKeyNames="WBSID" BindGridViewMethod="BindData">
                    <Columns>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="5%" />
                        <zhongsoft:LightBoundField HeaderText="专业" HeaderStyle-Width="15%" DataField="SpecialtyName" />
                        <zhongsoft:LightBoundField HeaderText="任务编号" HeaderStyle-Width="15%" DataField="WBSCode" />
                        <zhongsoft:LightBoundField HeaderText="任务名称" HeaderStyle-Width="50%" DataField="WBSName" ShowToolTip="True" Width="350px" />
                        <zhongsoft:LightBoundField HeaderText="任务负责人" HeaderStyle-Width="15%" DataField="SJR" />
                        <zhongsoft:LightBoundField HeaderText="校核人" HeaderStyle-Width="15%" DataField="JHR" />
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        //选择卷册负责人筛选条件
        function ownerFilter() {
            var deptID = "<%=KPMSUser.OrganizationId %>";
            return "{DeptID:'" + deptID + "'}";
        }

        function checkForm() {
            var SJR = $("#<%=txtWBSOwner.ClientID %>").val();
            var JHR = $("#<%=lbsJHR.ClientID %>").val();
            if (SJR == "" && JHR == "") {
                alert("请选择人员！");
                return false;
            }
            var $gridCheckedClientID = "<%=this.gvList.CheckedClientID %>";
            if ($("#" + $gridCheckedClientID).val() == "[]") {
                alert("请选择要批量设置人员的任务！");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
