<%@ Page Title="表单分类编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="FormScopeEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormScopeEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                分类名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:TextBox ID="tbScopeName" runat="server" tablename="WorkFlowFormScope" field="ScopeName"
                    activestatus="(23.*)" req="1" MaxLength="120"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                标签<span class="req-star">*</span>
            </td>
            <td class="td-r">            
                <asp:RadioButtonList runat="server" ID="rblLable" RepeatDirection="Horizontal" ActiveStatus="(23.*)" 
                    EnableTheming="false" tablename="WorkFlowFormScope" field="Label">
                    <asp:ListItem Value="Vertical" Selected="True">业务周期</asp:ListItem>
                    <asp:ListItem Value="Horizontal">功能模块</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属模块<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:CheckBoxList ID="cblModules" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" req="1">
                </asp:CheckBoxList>                
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" runat="server" tablename="WorkFlowFormScope"
                    DataType="PositiveInteger" req="1" field="Sort" activestatus="(23.*)" MaxLength="4"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hiScopeId" runat="server" type="hidden" tablename="WorkFlowFormScope"
        field="ScopeId" />
    <input id="hiParentId" runat="server" type="hidden" tablename="WorkFlowFormScope"
        field="ParentId" />
</asp:Content>
