<%@ Page Language="C#" Title="选择科技项目" AutoEventWireup="true" CodeBehind="TechProjectTaskSelector.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectSelector.Master" Inherits="Zhongsoft.Portal.TSM.Obsolete.TechProjectTaskSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目编号
            </td>
            <td>
                <zhongsoft:LightTextBox ID="tbTechProjectCode" runat="server" Width="100px">
                </zhongsoft:LightTextBox>
            </td>
            <td>
                项目名称
            </td>
            <td>
                <zhongsoft:LightTextBox ID="tbTechProjectName" runat="server" Width="100px">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true" DataKeyNames="ProjectListID">
        <Columns>
            <asp:BoundField HeaderText="项目编号" DataField="ApplyCode" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField HeaderText="项目负责人" DataField="ProjectManagerName" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField HeaderText="承担部门" DataField="ProjectDeptName" ItemStyle-HorizontalAlign="Left" />
            <asp:BoundField HeaderText="立项级别" DataField="ProjectLevel" ItemStyle-HorizontalAlign="Left" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
