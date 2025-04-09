<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DesignerReviewInfoGrid.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Project.DesignerReviewInfoGrid" %>
<td colspan="5" class="td-m">
    <span runat="server" displaystatus="(23.编制计划)" style="float: right">添加<zhongsoft:LightTextBox
        runat="server" ID="tbCount" EnableTheming="false" DataType="PositiveInteger"
        CssClass="kpms-textbox-money" Width="30px"></zhongsoft:LightTextBox>
        行<asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
    </span>
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="false" AllowPaging="true" PageSize="10" UseDefaultDataSource="true" PermissionStatus="True" DataKeyNames="DesignReviewInfoID" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="计划评审时间">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanReviewDate" runat="server" readonly="readonly" ActiveStatus="(23.编制计划)" value='<%# string.IsNullOrEmpty(Convert.ToString(Eval("PlanReviewDate")))?"":Convert.ToDateTime(Eval("PlanReviewDate")).ToString("yyyy-MM-dd") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="评审内容">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbReviewContent" TextMode="MultiLine"
                        CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.编制计划)" Text='<%# Eval("ReviewContent") %>'>
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="deleteData">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</td>
