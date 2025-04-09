<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectPhaseEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.ProjectPhaseEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                阶段名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectTypeName" field="PHASENAME" MaxLength="16"
                    req="1" tablename="ESD_PARAMPROJECTPHASE" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                阶段代号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" field="PHASECODE" MaxLength="2"
                    req="1" tablename="ESD_PARAMPROJECTPHASE" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属主阶段
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParentPhaseID" field="PARENTPHASEID"
                    tablename="ESD_PARAMPROJECTPHASE" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                排序
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" runat="server" MaxLength="3" TableName="ESD_PARAMPROJECTPHASE"
                    Field="SORT" ActiveStatus="(23.*)" regex="^[0-9]\d{0,3}$" errmsg="请输入整数" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" activestatus="(23.*)" field="FLAG"
                    req="1" RepeatDirection="Horizontal" tablename="ESD_PARAMPROJECTPHASE">
                    <asp:ListItem Text="是" Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="否" Value="2"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                是否修改版<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="RadioButtonList1" activestatus="(23.*)" field="ISMODIFYEDITION"
                    req="1" RepeatDirection="Horizontal" tablename="ESD_PARAMPROJECTPHASE">
                    <asp:ListItem Text="是" Value="1"></asp:ListItem>
                    <asp:ListItem Text="否" Value="2" Selected="True"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbDescription" TableName="ESD_PARAMPROJECTPHASE" activestatus="(23.*)"
                    Field="DESCRIPTION" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    maxtext="512" TextMode="MultiLine"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <!--阶段主键ID-->
    <input type="hidden" runat="server" id="hiPhaseID" field="PHASEID" tablename="ESD_PARAMPROJECTPHASE" />
    <!--工程类型主键ID-->
    <input type="hidden" runat="server" id="hiProjectTypeID" field="PROJECTTYPEID" tablename="ESD_PARAMPROJECTPHASE" />
</asp:Content>
