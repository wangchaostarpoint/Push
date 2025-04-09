<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTypeEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.ProjectTypeEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工程类别名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectTypeName" field="PROJECTTYPENAME"
                    req="1" MaxLength="16" tablename="ESD_PARAMPROJECTTYPE" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                工程代号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" field="PROJECTTYPECODE"
                    req="1" MaxLength="2" tablename="ESD_PARAMPROJECTTYPE" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlBelongType" field="BELONGTYPE"
                    req="1" tablename="ESD_PARAMPROJECTTYPE" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                排序
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" runat="server" MaxLength="3" TableName="ESD_PARAMPROJECTTYPE"
                    Field="SORT" ActiveStatus="(23.*)" regex="^[0-9]\d{0,3}$" errmsg="请输入整数" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbDescription" TableName="ESD_PARAMPROJECTTYPE" activestatus="(23.*)"
                    Field="DESCRIPTION" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    maxtext="512" TextMode="MultiLine"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" TableName="ESD_PARAMPROJECTTYPE" activestatus="(23.*)"
                    Field="MEMO" runat="server" CssClass="kpms-textarea" EnableTheming="false" maxtext="512"
                    TextMode="MultiLine"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                工程阶段
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button runat="server" ID="btnAddPhase" Text="添加阶段" OnClick="btnAddPhase_Click"
                    OnClientClick="resturn addPhaseDetail()" />
            </td>
        </tr>
        <tr>
            <zhongsoft:LightPowerGridView ID="gvProjectPhase" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="PHASEID"
                ShowHeaderWhenEmpty="true" ShowExport="true" OnRowCommand="gvProjectPhase_RowCommand">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PHASENAME" HeaderText="阶段名称" Width="100" ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightBoundField DataField="PHASECODE" HeaderText="阶段编号" ItemStyle-Width="250px"
                        ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序" ItemStyle-Width="80px"
                        ItemStyle-HorizontalAlign="Left" MaxLength="15" />
                    <zhongsoft:LightBoundField DataField="FLAG" HeaderText="是否启用" ItemStyle-Width="80px"
                        ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" EditItemClick="viewPhaseDetail"
                        DataParamFields="PHASEID">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" EditItemClick="editPhaseDetail"
                        DataParamFields="PHASEID">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除{0}阶段吗？"
                        DeleteTipField="PHASENAME">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </tr>
        <tr>
            <td colspan="4">
                工程特性
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button runat="server" ID="btnAddAttribute" Text="添加阶段" OnClick="btnAddAttribute_Click"
                    OnClientClick="resturn addAttributeDetail()" />
            </td>
        </tr>
        <tr>
            <zhongsoft:LightPowerGridView ID="gvParamAttribute" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="PARAMPROATTRIBUTEID"
                ShowHeaderWhenEmpty="true" ShowExport="true" OnRowCommand="gvParamAttribute_RowCommand">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PARAMPROATTRIBUTENAME" HeaderText="性质名称" ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序" ItemStyle-Width="80px"
                        ItemStyle-HorizontalAlign="Right" MaxLength="15" />
                    <zhongsoft:LightBoundField DataField="FLAG" HeaderText="是否启用" ItemStyle-Width="80px"
                        ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" EditItemClick="viewAttributeDetail"
                        DataParamFields="PARAMPROATTRIBUTEID">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" EditPageUrl="editAttributeDetail"
                        DataParamFields="PARAMPROATTRIBUTEID">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除{0}特性吗？"
                        DeleteTipField="PARAMPROATTRIBUTENAME">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </tr>
    </table>
    <!---工程类型主键ID--->
    <input type="hidden" runat="server" id="hiProjectTypeID" field="PROJECTTYPEID" tablename="ESD_PARAMPROJECTTYPE" />
    <script>
        //编辑阶段
        function editPhaseDetail(phaseID) {
            return showDetail(phaseID, 3);
        }
        //添加阶段
        function addPhaseDetail() {
            return showDetail("", 2);
        }
        //查看阶段
        function viewPhaseDetail(phaseID) {
            return showDetail(phaseID, 1);
        }
        //打开阶段详细页面
        function showProjectPhase(phaseID, actionType) {
            var json = { projectTypeID: $bizCtx.bizId };
            var url = buildBizUrl(actionType, phaseID, "MM/List/MDM/ProjectPhaseEditor.aspx", json);
            return checkReturn(showModal(url, null, 750, 1150));
        }

        //编辑特性
        function editAttributeDetail(attributeID) {
            return showDetail(attributeID, 3);
        }
        //添加特性
        function addAttributeDetail() {
            return showDetail("", 2);
        }
        //查看特性
        function viewAttributeDetail(attributeID) {
            return showDetail(attributeID, 1);
        }
        //打开特性详细页面
        function showAttribute(attributeID, actionType) {
            var json = { projectTypeID: $bizCtx.bizId };
            var url = buildBizUrl(actionType, phaseID, "MM/List/MDM/ProjectAttributeEditor.aspx", json);
            return checkReturn(showModal(url, null, 750, 1150));
        }
    </script>
</asp:Content>
