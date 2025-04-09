<%@ Page Title="选择委托单页面" Language="C#" AutoEventWireup="true" CodeBehind="ConsignInfoSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.ConsignInfoSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                工程编号
                <zhongsoft:LightTextBox ID="tbProjName" runat="server" Width="80px"></zhongsoft:LightTextBox>
                卷册编号
                <zhongsoft:LightTextBox ID="tbRollName" runat="server" Width="80px"></zhongsoft:LightTextBox>
                委托单号
                <zhongsoft:LightTextBox ID="tbBillCode" runat="server" Width="80px"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td>
                专业名称
                <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" Width="80px">
                </zhongsoft:LightDropDownList>
                委托部门
                <zhongsoft:LightDropDownList ID="ddlDeptID" runat="server" Width="80px">
                </zhongsoft:LightDropDownList>
                委托日期
                <zhongsoft:XHtmlInputText ID="txtStarteDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    compare="1" />
                至
                <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    compare="1" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="8" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        DataKeyNames="PublishConsignWBSID" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ConsignTime" HeaderText="委托日期" HeaderStyle-Width="10%"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="工程编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="工程名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ConsignTypeName" HeaderText="委托类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ConsignDeptName" HeaderText="委托部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RequireCompleteTime" HeaderText="要求出版完成日期"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectTypeCode" HeaderText="工程类型">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
