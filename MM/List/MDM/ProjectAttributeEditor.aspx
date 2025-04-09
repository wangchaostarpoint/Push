<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectAttributeEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.ProjectAttributeEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                项目特性名称<span class="req-star">*</span>
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbParamAttributeName" field="PARAMPROATTRIBUTENAME"
                    tablename="MDM_PARAMPROATTRIBUTE" req="1" activestatus="(23.*)" MaxLength="32"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                排序
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" runat="server" MaxLength="3" TableName="MDM_PARAMPROATTRIBUTE"
                    Field="SORT" ActiveStatus="(23.*)" regex="^[0-9]\d{0,3}$" errmsg="请输入整数" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" activestatus="(23.*)" field="FLAG"
                    req="1" RepeatDirection="Horizontal" tablename="MDM_PARAMPROATTRIBUTE">
                    <asp:ListItem Text="是" Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="否" Value="2"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                是否有信息来源
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbHasBaseSource" activestatus="(23.*)" RepeatDirection="Horizontal">
                    <asp:ListItem Text="是" Value="1"></asp:ListItem>
                    <asp:ListItem Text="否" Value="0" Selected="True"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <!--特性主键ID-->
    <input type="hidden" runat="server" id="hiParamProAttributeID" field="PARAMPROATTRIBUTEID"
        tablename="MDM_PARAMPROATTRIBUTE" />
    <!--信息来源-->
    <input type="hidden" runat="server" id="hiBaseInfoSource" field="BASEINFOSOURCE"
        tablename="MDM_PARAMPROATTRIBUTE" />
    <!---工程类型ID-->
    <input type="hidden" runat="server" id="hiProjectTypeID" field="PROJECTTYPEID" tablename="MDM_PARAMPROATTRIBUTE" />
</asp:Content>
