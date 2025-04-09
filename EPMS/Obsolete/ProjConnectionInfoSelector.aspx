<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjConnectionInfoSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjConnectionInfoSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目编号/名称
                <asp:TextBox ID="tbProjectInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        DataKeyNames="ProjConnectionID" ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjConnectionCode" HeaderText="工程联系单编号" HeaderStyle-Width="40px"
                MaxLength="30">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" HeaderStyle-Width="20%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" HeaderStyle-Width="20%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设计阶段" HeaderStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPhaseName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目规模" HeaderStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbProjectScale"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目设总" HeaderStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbManagerUserName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业" HeaderStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ConMakeUserName" HeaderText="申请人" HeaderStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ConMakeUserTime" HeaderText="发起时间" HeaderStyle-Width="10%"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
