<%@ Page Title="系统参数编辑页面" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ParamEditorSingleModule.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Param.ParamEditorSingleModule" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls" TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td colspan="4" class="tz-title">基本信息
            </td>
        </tr>
        <tr>
            <td class="td-l">参数名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:TextBox runat="server" ID="tbParamName" CssClass="kpms-textbox" MaxLength="128"
                    Width="100px" req="1" activestatus="(23.*)"></asp:TextBox>
            </td>
            <td class="td-l">参数分类<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:DropDownList runat="server" ID="ddlParamType" req="1" Width="100px" activestatus="(23.*)">
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="trModule">
            <td class="td-l">所属模块<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:DropDownList runat="server" ID="ddlModule" Width="100px" activestatus="(23.*)" req="1">
                </asp:DropDownList>
            </td>
            <td class="td-l"></td>
            <td class="td-r"></td>
        </tr>
        <tr>
            <td colspan="4" class="tz-title">参数明细
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                    ShowAddData="true" OnAddData="btnAdd_Click" activestatus="(23.*)" OnRowDataBound="gvList_RowDataBound"
                    OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="名称">
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiId" value='<%#Eval("id") %>' />
                                <asp:TextBox runat="server" ID="tbText" Text='<%#Eval("Text") %>' req="1"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="值">
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="tbValue" Text='<%#Eval("Value") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ext值">
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="tbExtValue" Text='<%#Eval("ExtValue") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="排序" HeaderStyle-Width="70px">
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="tbSort" Text='<%#Eval("Sort") %>' regex="^\d*$" Width="40px"
                                    activestatus="(23.*)" MaxLength="3" errMsg="排序只能填写非负整数" Style="text-align: right"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="备注">
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="tbRemark" Text='<%#Eval("Remark") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="启用" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="cbFlag" activestatus="(23.*)" />
                                <input type="hidden" runat="server" id="hiFlag" value='<%#Eval("Flag") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiParamId" field="ConfigId" tablename="PortalConfig" />
    <input type="hidden" runat="server" id="hiParamXml" tablename="PortalConfig" field="Expression" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
