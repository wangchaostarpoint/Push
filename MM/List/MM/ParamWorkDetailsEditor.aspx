<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ParamWorkDetailsEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.ParamWorkDetailsEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                前期项目工作任务<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkName" TableName="MBM_ParamWorkDetails"
                    Field="WorkName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" TableName="MBM_ParamWorkDetails"
                    Field="Sort" activestatus="(23.*)" req="1" DataType="UInteger"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="RadioButtonList2" RepeatDirection="Horizontal" TableName="MBM_ParamWorkDetails"
                                     Field="Flag" activestatus="(23.*)" req="1">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否在汇总表展示<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="RadioButtonList1" RepeatDirection="Horizontal" TableName="MBM_ParamWorkDetails"
                                     Field="IsShowInList" activestatus="(23.*)" req="1">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-m" colspan="4"></td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">
                分解<span id="Span1" runat="server" displaystatus="(3.*)" style="float: right"> 添加<zhongsoft:LightTextBox
                    runat="server" ID="tbCount" EnableTheming="false" DataType="PositiveInteger"
                    CssClass="kpms-textbox-money" Width="30px"></zhongsoft:LightTextBox>
                    行<asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                    ShowExport="false" AllowPaging="true" PageSize="10" UseDefaultDataSource="true"
                    ShowPageSizeChange="true" DataKeyNames="ParamWorkDetailsID,IsShowInList,Flag" OnRowCommand="gvList_RowCommand"
                    OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="排序" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSort" Text='<%# Eval("Sort") %>' DataType="UInteger"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="工作名称" ItemStyle-Width="20%">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkName" Text='<%# Eval("WorkName") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="工作内容" ItemStyle-Width="75%">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkContent" Text='<%# Eval("WorkContent") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbFlag" RepeatDirection="Horizontal" >
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                    <asp:ListItem Value="0">否</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否在汇总表展示">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbIsShow" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="True">是</asp:ListItem>
                                    <asp:ListItem Value="False">否</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="deleteData">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiParamWorkDetailsID" runat="server" tablename="MBM_ParamWorkDetails"
        field="ParamWorkDetailsID" />
</asp:Content>
