<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WBSEmergeRecordList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSEmergeRecordList"
    Title="任务修改记录" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbWBSCode" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="15" ShowExport="True"
        UseDefaultDataSource="true" BindGridViewMethod="BindData" DataKeyNames="WBSEmergeRecordID">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%#Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" />
            <zhongsoft:LightBoundField HeaderText="名称" DataField="WBSName" />
            <zhongsoft:LightBoundField HeaderText="操作人" DataField="OperateUserName" />
            <zhongsoft:LightBoundField HeaderText="操作时间" DataField="OperateTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="操作" DataField="OperateType" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
