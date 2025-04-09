<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QualityInfoSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.QualityInfoSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择质量信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目编号/名称
                <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" Width="120px"></zhongsoft:LightTextBox>
                工程类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                设计阶段
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td>
                卷册编号/名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
                主题词
                <zhongsoft:LightTextBox ID="tbTheme" runat="server" Width="120px"></zhongsoft:LightTextBox>
                信息状态
                <zhongsoft:LightDropDownList runat="server" ID="ddlQualityState" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                专业
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="QualityID" ShowJsonRowColName="true"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="QualityTheme" HeaderText="主题词">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="工程类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="所属专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="信息状态">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbQualityState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WriteUserName" HeaderText="填写人">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
