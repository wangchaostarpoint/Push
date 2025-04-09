<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductVerifyOperator.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductVerifyOperator" %>

<%@ Register Src="../../UI/Product/ProductSelect.ascx" TagName="ProductSelect" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="detailContent" runat="server">
    <table class="tz-table">
        <tr>
            <td valign="top" style="width: 200px; height: 100%;">
                <uc1:ProductSelect ID="ProductSelect" runat="server" />
            </td>
            <td valign="top" >
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
                    EmptyDataText="没有校审人信息" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    UseDefaultDataSource="true" BindGridViewMethod="BindGrid">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="RoleName" HeaderText="角色">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="岗位">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="OperateUserName" HeaderText="校审人">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="OperateFinishTime" HeaderText="校审完成时间" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnProductRefresh" runat="server" content="Refresh" Style="display: none"
        OnClick="btnProductRefresh_Click" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        $("[name='fileCheck']>:checkbox").click(function () {
            $("#<%=btnProductRefresh.ClientID %>").click();
        });
    </script>
</asp:Content>
