<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_BidSecurityNotBackList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.C_BidSecurityNotBackList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工程名称/编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjName" runat="server" EnableTheming="false" CssClass="kpms-textbox"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                招标单位
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbUnit" runat="server" EnableTheming="false" CssClass="kpms-textbox"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProj" AutoGenerateColumns="false"
        OrderColumn="工程编号" DataKeyNames="MARKETPROJECTID" AllowFrozing="true" FrozenColNum="2"
        ShowExport="true" runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true"
        OnSorting="gvProj_Sorting" AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号">
                <ItemTemplate>
                    <%#gvProj.PageIndex * gvProj.PageSize + gvProj.Rows.Count + 1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <asp:BoundField DataField="MARKETPROJECTCODE" HeaderText="工程编号" SortExpression="MARKETPROJECTCODE" />
            <asp:TemplateField HeaderText="工程名称" SortExpression="MARKETPROJECTNAME">
                <ItemTemplate>
                    <asp:Label ID="lbPasserName" runat="server" Text='<%# gvProj.GetSubString(DataBinder.Eval(Container.DataItem, "MARKETPROJECTNAME"), 7)%>'
                        ToolTip='<%#Eval("MARKETPROJECTNAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CUSTOMERNAME" HeaderText="招标单位" SortExpression="CUSTOMERNAME" />
            <asp:BoundField DataField="STARTBIDDAY" HeaderText="开标时间" SortExpression="STARTBIDDAY"
                DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="center" />
            <asp:BoundField DataField="TOTALMONEY" HeaderText="投标保证金" SortExpression="TOTALMONEY"
                ItemStyle-HorizontalAlign="right" />
            <asp:BoundField DataField="NOTRETURNAMOUNT" HeaderText="未还投标保证金" SortExpression="NOTRETURNAMOUNT"
                ItemStyle-HorizontalAlign="right" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
