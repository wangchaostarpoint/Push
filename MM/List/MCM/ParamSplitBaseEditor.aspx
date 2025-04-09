<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamSplitBaseEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ParamSplitBaseEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                模板<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPARAMSPLITBASENAME" TableName="MCM_PARAMSPLITBASE"
                    Field="PARAMSPLITBASENAME" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSORT" TableName="MCM_PARAMSPLITBASE"
                    Field="SORT" activestatus="(23.*)" req="1" DataType="UInteger"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="MCM_PARAMSPLITBASE"
                    Field="FLAG" activestatus="(23.*)" req="1">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">
                分项<span runat="server" displaystatus="(3.*)" style="float: right">添加<zhongsoft:LightTextBox
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
                     ShowPageSizeChange="true" DataKeyNames="PARAMSPLITBASEID,Flag"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="名称">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbPARAMSPLITBASENAME" Text='<%# Eval("PARAMSPLITBASENAME") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="排序">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSORT" Text='<%# Eval("SORT") %>' DataType="UInteger"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
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
    <input type="hidden" id="hiPARAMSPLITBASEID" runat="server" tablename="MCM_PARAMSPLITBASE"
        field="PARAMSPLITBASEID" />
    <input type="hidden" id="hiLEVELID" runat="server" tablename="MCM_PARAMSPLITBASE"
        field="LEVELID" value="1" />
    <script type="text/javascript">

        parent.returnValue = "Saved";
    
    </script>
</asp:Content>
