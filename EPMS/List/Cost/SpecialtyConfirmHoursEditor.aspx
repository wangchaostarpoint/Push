<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="SpecialtyConfirmHoursEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.SpecialtyConfirmHoursEditor" %>

<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <uc1:ProjectCommon ID="ProjectCommon1" runat="server" />
        <tr>
            <td class="td-l">
                项目总工日
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfTotal" tablename="EPMS_ProjectEntity"
                    field="WorkDayOfTotal"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                备用工日
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfSpare" tablename="EPMS_ProjectEntity"
                    field="WorkDayOfSpare"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                分配状态
            </td>
            <td class="td-r">
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    OnRowCreated="gvList_RowCreated" ShowHeader="true" ShowFooter="false" DataKeyNames="SpecialtyHourAdjustDetailId"
                    UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                            Visible="false">
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiRowNum" value='<%#Eval("RowNum") %>' />
                                <%#Eval("RowNum")%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="工作类别" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiSpecialtyHourAdjustDetailId" value='<%#Eval("SpecialtyHourAdjustDetailId") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("WorkType") %>' />
                                <asp:Label runat="server" ID="lbWorkType" Text='<%#Eval("WorkType") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="专业名称(编号)" DataField="SpecialtyInfo">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="工日" DataField="WorkQuota" ItemStyle-Width="80">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="比率(%)" DataField="SpeProportion" ItemStyle-Width="80">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="工日" ItemStyle-Width="80">
                            <ItemTemplate>
                                <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("WorkType") %>' />
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" regex="^[0-9]{0,6}$" errmsg="请输入数字"
                                    Style="text-align: right;" onblur="CalSpeProportion(this)"></zhongsoft:LightTextBox>
                                <zhongsoft:LightTextBox runat="server" ID="tbSum" regex="^[0-9]{0,6}$" errmsg="请输入数字"
                                    Style="text-align: right;" Visible="false"></zhongsoft:LightTextBox>
                                <zhongsoft:LightTextBox runat="server" ID="tbSpare" regex="^[0-9]{0,6}$" errmsg="请输入数字"
                                    Style="text-align: right;" Visible="false"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="比率(%)" ItemStyle-Width="80">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" regex="^[0-9]+(\.[0-9]{2})?$"
                                    errmsg="请输入数字（两位小数）" Style="text-align: right;"></zhongsoft:LightTextBox>
                                <zhongsoft:LightTextBox runat="server" ID="tbProSum" regex="^[0-9]+(\.[0-9]{2})?$"
                                    errmsg="请输入数字（两位小数）" Style="text-align: right;" Visible="false"></zhongsoft:LightTextBox>
                                <zhongsoft:LightTextBox runat="server" ID="tbProSpare" regex="^[0-9]+(\.[0-9]{2})?$"
                                    errmsg="请输入数字（两位小数）" Style="text-align: right;" Visible="false"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="调整记录">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbModifyRecord"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="专业卷册工日" DataField="">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProjectEntity"
        field="OrganizationID" />
    <input type="hidden" runat="server" id="hiProjectTemplateID" tablename="EPMS_ProjectEntity"
        field="ProjectTemplateID" />
    <input runat="server" id="hiSpecailtySumWorkQuota" type="hidden" />
</asp:Content>
