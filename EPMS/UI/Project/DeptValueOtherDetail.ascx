<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeptValueOtherDetail.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.DeptValueOtherDetail" %>
<tr>
    <td colspan="4" class="flexible">
        其他项
    </td>
    <td align="right" colspan="2">
        <asp:Button ID="btnAddProject" runat="server" OnClick="btnAddProject_Click"
            CssClass="btn" Text="添加其他项" />
    </td>
</tr>
<tr>
    <td colspan="6">
        <table width="100%" id="projectValue">
            <tr>
                <td colspan="6">
                    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                        UseDefaultDataSource="true" EmptyDataText="没有要查找的数据" DataKeyNames="ValueSourceID"
                        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                        <PagerStyle HorizontalAlign="Right"></PagerStyle>
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="工作分类">
                                <ItemTemplate>
                                    <zhongsoft:LightDropDownList ID="ddlWorkType" runat="server" Width="150px">
                                    </zhongsoft:LightDropDownList>
                                </ItemTemplate>
                                <ItemStyle Width="160px" />
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="项目名称">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbProjectName" runat="server" Text='<%#Eval("ProjectName") %>'
                                        MaxLength="64">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="本期申报产值">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbThisApplyValue" EnableTheming="false" CssClass="kpms-textbox-money"
                                        runat="server" Text='<%#Eval("ThisApplyValue") %>' Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$"
                                        errmsg="请输入正数，最多12位整数，2位小数">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="备注">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbMemo" runat="server" Text='<%#Eval("Memo") %>' MaxLength="512">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData">
                            </zhongsoft:LightButtonField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </td>
            </tr>
        </table>
    </td>
</tr>
