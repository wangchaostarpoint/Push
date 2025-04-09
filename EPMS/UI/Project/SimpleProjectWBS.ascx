<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SimpleProjectWBS.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.SimpleProjectWBS" %>
<tr>
    <td colspan="6" class="td-m flexible">
        任务信息 <span id="Span1" displaystatus="(2.编制小型项目策划，配置人员)" runat="server" style="float: right;
            color: Red">先保存再添加任务</span> <span id="Span2" displaystatus="(3.编制小型项目策划，配置人员)(3.初始化WBS任务)" runat="server"
                style="float: right">
                <asp:Button ID="btnDrWBS" runat="server" Text="导入模板任务" OnClientClick="return addProjectTemplateWBS();"
                    class="btn" />
                <asp:Button ID="btnAddWBS" runat="server" Text="添加任务" OnClientClick="return addWBS();"
                    class="btn" /> 
            </span>
    </td>
</tr>
<tr>
    <td colspan="6">
        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AutoGenerateColumns="false"
            AllowSorting="true" DataKeyNames="WBSID,ExecSpecialtyID" UseDefaultDataSource="true"
            BindGridViewMethod="UserControl.BindGridData" EmptyDataText="请添加任务信息" OnRowCommand="gvList_RowCommand"
            ShowExport="true" HideFieldOnExport="删除" ShowPageSizeChange="true" AllowPaging="true"
            PageSize="10" OnRowDataBound="gvList_RowDataBound">
            <Columns>
                <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类别">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <asp:TemplateField HeaderText="主任工" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" ID="tbZrg" IsMutiple="false" SelectPageMode="Dialog"
                            activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                            ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiZrg':'id'}"
                            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiZrg" value="" />
                        <input type="hidden" runat="server" id="hiZrgRoleId" />
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="主设人" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" ID="tbZsr" IsMutiple="false" SelectPageMode="Dialog"
                            activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                            ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiZsr':'id'}"
                            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiZsr" value="" />
                        <input type="hidden" runat="server" id="hiZsrRoleId" />
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="校核人" ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" ID="tbJhr" IsMutiple="true" SelectPageMode="Dialog"
                            activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                            ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiJhr':'id'}"
                            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiJhr" value="" />
                        <input type="hidden" runat="server" id="hiJhrRoleId" />
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanHandTime" HeaderText="计划设计完成" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanCheckTime" HeaderText="计划校核完成" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanRecheckTime1" HeaderText="计划审核完成" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightButtonField HeaderText="编辑" CommandName="ViewData" ItemStyle-Width="40px"
                    EditItemClick="editWBS" DataParamFields="WBSID">
                    <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                </zhongsoft:LightButtonField>
                <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px">
                    <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                </zhongsoft:LightButtonField>
            </Columns>
            <PagerStyle HorizontalAlign="Right"></PagerStyle>
        </zhongsoft:LightPowerGridView>
    </td>
</tr>
<asp:LinkButton runat="server" ID="btnAddWBSafter" OnClick="btnAddWBS_Click" Visible="false"></asp:LinkButton>
<asp:Button runat="server" ID="btnSelTempLate" Visible="false" OnClick="btnSelTempLate_Click" />
<input type="hidden" id="hiProjectXml" runat="server" />
<input type="hidden" id="hiXml" runat="server" />
<script type="text/javascript">
    function addWBS() {
        var url = buildQueryUrl("/EPMS/List/WBS/WBSDetailEditor.aspx", { actionType: 2, OrganizationID: '<%=OrganizationID %>', WBSType: 1 });
        showDivDialog(url, null, 1000, 600, editWBSCallBack);
        return false;
    }

    function editWBS(wbsID) {
        var url = buildQueryUrl("/EPMS/List/WBS/WBSDetailEditor.aspx", { actionType: 3, bizid: wbsID });
        showDivDialog(url, null, 1200, 600, editWBSCallBack);
        return false;
    }

    function addProjectTemplateWBS() {
        var param = new InputParamObject("s");
        var josn = { 'BusinessPlateID': "6" };
        getProjectTemplate("", param, josn, selTemplateCallBack);
        return false;
    }

    function getProjectTemplate(reid, param, filter, callback) {
        return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjectTemplateSelector.aspx", null), 650, 550, callback);
    }

    function selTemplateCallBack(re) {
        $('#<%=hiXml.ClientID %>').val(re.buildAttrJson("o", "id"));
        <%=Page.ClientScript.GetPostBackEventReference(this.btnSelTempLate,"") %>
        return false;
    }


    function editWBSCallBack(re) {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddWBSafter,"") %>
        return true;
    }
</script>
