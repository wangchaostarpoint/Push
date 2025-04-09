<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_FollowUpDesignTaskForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_FollowUpDesignTaskForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table">
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr>
        <td class="td-l">
            卷册名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','hiPutSpecialtyID':'ExecSpecialtyID','hiPutSpecialtyCode':'ExecSpecialtyCode','txtPutSpecialtyName':'ExecSpecialtyName','hiBelongDeptID':'BelongDeptID','txtBelongDeptName':'BelongDeptName','txtOriginalWBSOwner':'WBSOwnerName'}"
                activestatus="(23.输入外部意见，下达后续任务)" tablename="EPMS_WBSBook" field="WBSName" BeforeSelect="beforeSelectWbs()"
                FilterFunction="wbsFilter()" req="1" OnClick="txtWBSName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_WBSBook" field="WBSID" />
        </td>
        <td class="td-l">
            卷册编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.输入外部意见，下达后续任务)"
                tablename="EPMS_WBSBook" field="WBSCode" readonly="readonly" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            专业
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPutSpecialtyName" activestatus="(23.输入外部意见，下达后续任务)"
                readonly="readonly" class="kpms-textbox" tablename="EPMS_WBSBook" field="PutSpecialtyName" />
        </td>
        <td class="td-l">
            所属部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(23.输入外部意见，下达后续任务)"
                readonly="readonly" class="kpms-textbox" />
        </td>
        <td class="td-l">
            卷册负责人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtOriginalWBSOwner" activestatus="(23.输入外部意见，下达后续任务)"
                readonly="readonly" class="kpms-textbox" field="OriginalWBSOwner" tablename="EPMS_WBSBook" />
            <input type="hidden" runat="server" id="hiBelongDeptID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否重要任务<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <!-- 增加table，避免红字换行影响美观-->
            <table>
                <tr>
                    <td>
                        <asp:RadioButtonList runat="server" ID="rbIsImportant" field="IsImportant" tablename="EPMS_WBSBook"
                            activestatus="(23.输入外部意见，下达后续任务)" req="1" RepeatDirection="Horizontal">
                            <asp:ListItem Text="是" Value="1"></asp:ListItem>
                            <asp:ListItem Text="否" Value="0"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;&nbsp;
                    </td>
                    <td>
                        <span style="color: Red">此卷册成品需设总及以上等级人员签署的属于重要任务。</span>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否更换卷册负责人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsChangeOwner" field="IsChangeOwner" tablename="EPMS_WBSBook"
                activestatus="(23.输入外部意见，下达后续任务)" req="1" RepeatDirection="Horizontal">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l" id="change1">
            更换后卷册负责人<span class="req-star">*</span>
        </td>
        <td class="td-r" id="change2">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwner" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(3.输入外部意见，下达后续任务)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                ResultForControls="{'hiWBSOwnerID':'id'}" tablename="EPMS_WBSBook" field="WBSOwnerName"
                PageWidth="850" FilterFunction="ownerFilter()" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWBSOwnerID" tablename="EPMS_WBSBook" field="WBSOwnerID" />
        </td>
        <td class="td-m" colspan="4">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            外部意见<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tb" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="5000" tablename="EPMS_WBSBook" req="1" field="ExtendOpinion"
                activestatus="(23.输入外部意见，下达后续任务)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            后续任务<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                req="1" EnableTheming="false" MaxLength="5000" tablename="EPMS_WBSBook" field="FollowUpTask"
                activestatus="(23.输入外部意见，下达后续任务)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!--项目ID-->
<input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSBook"
    field="OrganizationID" />
<!---项目编号-->
<input type="hidden" id="hiProjectCode" runat="server" field="ProjectCode" tablename="EPMS_WBSBook" />
<!---项目名称-->
<input type="hidden" id="hiProjectName" runat="server" field="ProjectName" tablename="EPMS_WBSBook" />
<!-- 任务书主键ID-->
<input type="hidden" runat="server" id="hiWBSBookID" tablename="EPMS_WBSBook" field="WBSBookID" />
<!-- 任务书类型-->
<input type="hidden" runat="server" id="hiWBSBookType" tablename="EPMS_WBSBook" field="WBSBookType"
    value="设计任务书" />
<!-- 任务书性质-->
<input type="hidden" runat="server" id="hiWBSBookNature" tablename="EPMS_WBSBook"
    value="后续下达（海外）" field="WBSBookNature" />
<!-- 提出部门-->
<input type="hidden" runat="server" id="hiPutDeptID" tablename="EPMS_WBSBook" field="PutDeptID" />
<input type="hidden" runat="server" id="hiPutDeptName" tablename="EPMS_WBSBook" field="PutDeptName" />
<!-- 提出专业-->
<input type="hidden" runat="server" id="hiPutSpecialtyID" tablename="EPMS_WBSBook"
    field="PutSpecialtyID" />
<input type="hidden" runat="server" id="hiPutSpecialtyCode" tablename="EPMS_WBSBook"
    field="PutSpecialtyCode" />
<!-- 提出专业-->
<input type="hidden" runat="server" id="hiPutUserID" tablename="EPMS_WBSBook" field="PutUserID" />
<input type="hidden" runat="server" id="hiPutUserName" tablename="EPMS_WBSBook" field="PutUserName" />
<!-- 卷册负责人角色-->
<input type="hidden" runat="server" id="hiOwnerRoleId" />
<input type="hidden" runat="server" id="hiExeSpecialtyID" />
<script>
    function initCustomerPlugin() {
        //是否更换卷册负责人，显示不同内容
        var change = $("#<%=rbIsChangeOwner.ClientID %> input[type='radio']:checked").val();
        setBudgetControl(change);
        $('#<%=rbIsChangeOwner.ClientID %>').click(function () {
            var isChange = $("#<%=rbIsChangeOwner.ClientID %> input[type='radio']:checked").val();
            setBudgetControl(isChange);
        })
    }
    //是否更换卷册负责人
    function setBudgetControl(isChange) {
        if (isChange == "1") {
            $("#change1").show();
            $("#change2").show();
            $('#<%=txtWBSOwner.ClientID %>').attr('req', '1');
        }
        else {
            $("#change1").hide();
            $("#change2").hide();
            $('#<%=txtWBSOwner.ClientID %>').removeAttr('req');
            $("#<%=txtWBSOwner.ClientID %>").val("");
            $("#<%=hiWBSOwnerID.ClientID %>").val("");
        }
    }

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
        //当前登录人在所选项目中担任主设人的专业ID
        var specialtyID = $('#<%=hiExeSpecialtyID.ClientID %>').val();
        return { OrganizationID: orgId, TypeID: '<%=WBSType.册.GetHashCode() %>', ExeSpecialtyID: specialtyID };
    }

    //选择卷册负责人筛选条件
    function ownerFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var roleId = $('#<%=hiOwnerRoleId.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        return "{OrganizationID:'" + orgId + "',RoleID:'" + roleId + "',DeptID:'" + deptID + "'}";
    }

</script>
