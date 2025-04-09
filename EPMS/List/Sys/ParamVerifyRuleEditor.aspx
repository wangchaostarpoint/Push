<%@ Page Language="C#" AutoEventWireup="true" Title="成品校审规则参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamVerifyRuleEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamVerifyRuleEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                校审规则<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbRule" TableName="EPMS_ParamVerifyRule"
                    Field="VerifyRule" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_ParamVerifyRule"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamVerifyRule" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,2}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamVerifyRule"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>对应的校审岗位及角色</b> <span runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                    <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                        regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行 </span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ParamVerifyRoleID" UseDefaultDataSource="true" BindGridViewMethod="BindVerify"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="校审角色">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlRole">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="校审岗位">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPost">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="排序号">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbSort" Style="text-align: right; width: 70px;" activestatus="(23.*)"
                                    regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数" runat="server" Text='<%#Eval("SORT") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamVerifyRoleID") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamVerifyRoleID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    OnClientClick="return confirm('确定要删除吗？')" CommandArgument='<%#Eval("ParamVerifyRoleID") %>'>
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ParamVerifyRule" field="ParamVerifyRuleID"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
