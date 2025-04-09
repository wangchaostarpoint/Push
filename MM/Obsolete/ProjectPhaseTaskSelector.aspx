<%@ Page Title="选择关联的任务单" Language="C#" AutoEventWireup="true" CodeBehind="ProjectPhaseTaskSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.ProjectPhaseTaskSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                任务名称/编号<zhongsoft:LightTextBox ID="tbTaskName" MaxLength="15" runat="server" CssClass="kpms-textbox"
                    Width="120px"></zhongsoft:LightTextBox>
                工程类型
                <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" Width="140px">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td>
                下达时间<zhongsoft:XHtmlInputText ID="txtDateStart" runat="server" ReadOnly="true" class="kpms-textbox-comparedate"
                    compare="1" />
                至
                <zhongsoft:XHtmlInputText ID="txtDateEnd" runat="server" ReadOnly="true" class="kpms-textbox-comparedate"
                    compare="1" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvContract" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        DataKeyNames="TASKISSUEDPHASEID" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="TASKCODE" HeaderText="任务编号" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TASKNAME" HeaderText="任务名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MARKETPROJECTCODE" HeaderText="工程编号" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MARKETPROJECTNAME" HeaderText="工程名称" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PHASENAME" HeaderText="阶段名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CUSTOMERNAME" HeaderText="业主名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TASKSTATE" HeaderText="接收委托书时间" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TASKISSUEDDATE" HeaderText="任务下达时间" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PROJECTTYPENAME" HeaderText="工程类别">
                <ItemStyle HorizontalAlign="center" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
