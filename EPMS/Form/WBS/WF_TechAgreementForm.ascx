<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TechAgreementForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_TechAgreementForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
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
                ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','txtSpecialtyName':'ExecSpecialtyName','hiExeSpecialtyID':'ExecSpecialtyID','txtWBSOwner':'WBSOwnerName','txtBelongDeptName':'BelongDeptName'}"
                activestatus="(2.填写设备特征参数并上传扫描件)" tablename="EPMS_TechAgreementForm" field="WBSName"
                BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_TechAgreementForm"
                field="WBSID" />
        </td>
        <td class="td-l">
            卷册编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.填写设备特征参数并上传扫描件)"
                tablename="EPMS_TechAgreementForm" field="WBSCode" readonly="readonly" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            专业
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSpecialtyName" activestatus="(2.填写设备特征参数并上传扫描件)"
                readonly="readonly" class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiExeSpecialtyID" />
        </td>
        <td class="td-l">
            所属部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(2.填写设备特征参数并上传扫描件)"
                readonly="readonly" class="kpms-textbox" />
        </td>
        <td class="td-l">
            卷册负责人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSOwner" activestatus="(2.填写设备特征参数并上传扫描件)"
                readonly="readonly" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbOtherContent" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="512" tablename="EPMS_TechAgreementForm" field="Memo"
                activestatus="(23.*)" Rows="3"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr displaystatus="(3.填写设备特征参数并上传扫描件)(3.审核或补充)(3.批准)" runat="server" id="trShowNew">
        <td colspan="6" align="right">
            <%--<asp:Button runat="server" ID="btnAddEquipment" OnClick="btnAddEquipment_Click" Text="新增设备"
                OnClientClick="return addDetail()" />--%>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" style="font-weight: bold; text-align: center">
            <b>设备参数列表</b> <span id="Span1" runat="server" style="float: right" displaystatus="(3.填写设备特征参数并上传扫描件)(3.审核或补充)(3.批准)">
                <asp:Button runat="server" ID="btnAddEquipment" OnClick="btnAddEquipment_Click" Text="新增设备"
                    OnClientClick="return addDetail()" />
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvTechEquipment" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="TechEquipmentDetailID"
                BindGridViewMethod="UserControl.BindEquipment" ShowHeaderWhenEmpty="true" OnRowCommand="gvTechEquipment_RowCommand"
                ShowExport="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="2%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业" />
                    <zhongsoft:LightBoundField DataField="SpecialtyCode" HeaderText="专业编号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightBoundField DataField="EquipmentCode" HeaderText="设备编号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightBoundField DataField="InstallPlace" HeaderText="安装地点" Width="250"
                        ShowToolTip="true" />
                    <zhongsoft:LightBoundField DataField="EquipmentType" HeaderText="设备类型" Width="80"
                        ShowToolTip="true" />
                    <zhongsoft:LightBoundField DataField="EquipmentResource" HeaderText="来源" Width="250"
                        ShowToolTip="true" />
                    <zhongsoft:LightBoundField DataField="WBSCodes" HeaderText="卷册编号" Width="80" ShowToolTip="true" />
                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" DataParamFields="TechEquipmentDetailID"
                        CommandName="ViewData" />
                    <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" DataParamFields="TechEquipmentDetailID"
                        CommandName="EditData" />
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该设备吗？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!--项目ID-->
<input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_TechAgreementForm"
    field="OrganizationID" />
<!---项目编号-->
<input type="hidden" id="hiProjectCode" runat="server" field="ProjectCode" tablename="EPMS_TechAgreementForm" />
<!---项目名称-->
<input type="hidden" id="hiProjectName" runat="server" field="ProjectName" tablename="EPMS_TechAgreementForm" />
<!-- 技术协议书主键ID-->
<input type="hidden" runat="server" id="hiTechAgreementID" tablename="EPMS_TechAgreementForm"
    field="TechAgreementFormID" />
<script>

    function editDetail(bizId) {
        return showDetail(bizId, 3);
    }

    function addDetail() {
        return showDetail("", 2);
    }

    function viewDetail(bizId){
        return showDetail(bizId, 1);
    }

    function showDetail(bizId, actionType) {
        var id= $('#<%=hiTechAgreementID.ClientID %>').val();
        var json = { organizationID: $("#<%=hiOrganizationID.ClientID %>").val() ,techAgreementFormID: id};
        var url = buildBizUrl(actionType, bizId, "EPMS/List/WBS/TechAgreementEditor.aspx", json);
        var callBack=null;
        if (actionType != '1') {
            callBack = bindEquipment;
        }
        return showDivDialog(url, null, 600, 550, callBack);
    }

      //绑定设备列表列表
    function bindEquipment() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddEquipment,"")%>;
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
        var ownerId = '<%=KPMSUser.Id %>';
        return { OrganizationID: orgId, OwnerId: ownerId, IsShowMore: 1 };
    }

</script>
