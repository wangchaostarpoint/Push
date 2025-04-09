<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSelector.aspx.cs"
    Title="选择客户" Inherits="Zhongsoft.Portal.MM.Obsolete.CustomerSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>客户名称<asp:TextBox ID="tbCustomerName" MaxLength="15" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td style="display: none;">客户类型
            </td>
            <td style="display: none;">
                <zhongsoft:LightDropDownList ID="ddlCombineType" runat="server">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                <asp:LinkButton runat="server" ID="btnNew" OnClientClick="return AddItem()">
                              <span>新建</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnResetList" runat="server" Visible="false" OnClick="btnResetList_OnClick" />
    <script type="text/javascript" language="javascript">
        function AddItem() {
            var param = { actionType: 2 };
            var url = buildQueryUrl("/MM/List/CRM/CustomerEditor.aspx", param);
            <%
        if (EDPortal.BLL.Sys.SysConfig.Instance.MainWebAppPath != null && EDPortal.BLL.Sys.SysConfig.Instance.MainWebAppPath.Contains(Request.Url.Host))
        {
        %>
            //如果相关地址配置正确，新建客户直接链接到综合系统的新建客户页面
            url = buildQueryUrl("<%=EDPortal.BLL.Sys.SysConfig.Instance.MainWebAppPath%>/MM/List/CRM/CustomerEditor.aspx", param);
            <%
        }
            %>
            var dom = showDivDialog(url, "", 1096, 660, resetList);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }
        //弹出层callback方法
        function resetList() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnResetList,"") %>
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvCustomer" AllowPaging="true"
        PageSize="8" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnJsonClick="addObject" JsonClickMode="onclick" BindGridViewMethod="DoSelectByFilter"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="客户名称" DataField="CUSTOMERNAME" Width="250"
                ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="所属单位" DataField="BelongUnit" Width="70" />
            <zhongsoft:LightBoundField HeaderText="所属行业" DataField="BelongIndustry" Width="70" />
            <zhongsoft:LightBoundField HeaderText="企业性质" DataField="CustomerNature" Width="70" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
