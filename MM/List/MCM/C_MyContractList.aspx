<%@ Page Language="C#" AutoEventWireup="true" Title="我的合同" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="C_MyContractList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.C_MyContractList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                <%--    合同编号/名称
                <zhongsoft:LightTextBox runat="server" ID="tbContractInfo"></zhongsoft:LightTextBox>
                合同类型--%>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvContract" AutoGenerateColumns="false"
        DataKeyNames="" ShowExport="true" HideFieldOnExport="" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" AllowSorting="true" OnRowDataBound="gvContract_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="CONTRACTCODE" HeaderText="合同编号" SortExpression="CONTRACTCODE"  ItemStyle-Wrap="false"/>
            <zhongsoft:LightBoundField DataField="CONTRACTNAME" HeaderText="合同名称" SortExpression="CONTRACTNAME"  MaxLength="20"/>
            <zhongsoft:LightBoundField DataField="UNDERTAKEUSERNAME" HeaderText="承办人" SortExpression="UNDERTAKEUSERNAME" />
            <zhongsoft:LightBoundField DataField="CONTRACTTYPENAME" HeaderText="合同类型" SortExpression="CONTRACTTYPENAME" />
            <zhongsoft:LightBoundField DataField="SIGNDATE" HeaderText="签订日期" SortExpression="SIGNDATE"
                DataFormatString="{0:yyyy-MM-dd}"   Width="70"/>
            <zhongsoft:LightBoundField DataField="CONTRACTVALUE" HeaderText="合同额（万元）" SortExpression="CONTRACTVALUE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField DataField="PARAMCONTRACTTYPEID" HeaderText="合同类型ID" SortExpression="CONTRACTTYPENAME" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=this.gvContract.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
