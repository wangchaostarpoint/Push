<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.CRM.CustomerList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                单位名称
                <zhongsoft:LightTextBox ID="tbCustomerName" runat="server" Width="70px" MaxLength="20"></zhongsoft:LightTextBox>
                单位类型
                <zhongsoft:LightDropDownList ID="ddlCustomerType" runat="server" Width="150px">
                </zhongsoft:LightDropDownList>
                负责部门
                <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="150px">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvCustomer" runat="server" AutoGenerateColumns="false"
        ShowFooter="true" ShowExport="true" AllowPaging="true" PageSize="12" UseDefaultDataSource="true"
        DataKeyNames="CUSTOMERID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="单位名称" DataField="CUSTOMERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="法人代表" DataField="ARTIFICIAL" HeaderStyle-Width="120px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="单位类型" DataField="CUSTOMERTYPE" HeaderStyle-Width="120px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属集团" DataField="BelongCombine">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="单位地址" DataField="ADDRESS" HeaderStyle-Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="董事长" DataField="HeaderMan" HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="主要经营范围" DataField="MainBusiness" HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="企业规模" DataField="CorporationSize" HeaderStyle-Width="6%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="客户类型" DataField="CombineType" HeaderStyle-Width="6%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showCustomerDetail" DataParamFields="CUSTOMERID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="查看联系人" EditItemClick="showCustomerDetail" DataParamFields="CUSTOMERID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvCustomer.CheckedClientID %>";

        //查看客户详细信息
        function showCustomerDetail(id) {
            var url = buildBizUrl(1, id, "MM/List/CRM/CustomerEditor.aspx", null);
            return checkReturn(showModal(url, null, 880, 600));

        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
