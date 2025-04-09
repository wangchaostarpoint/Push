<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JoinSignOperator.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.JoinSignOperator" %>
<table style="width: 150px; border-spacing: 0px">
    <tr>
        <td>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:DataList ID="dlWBSOperatorList" runat="server" EnableViewState="true" RepeatDirection="Horizontal"
                        RepeatColumns="7" Width="100%" OnItemDataBound="dlWBSOperatorList_ItemDataBound">
                        <ItemTemplate>
                            <table style="width: 115px; border-spacing: 0px; border-color: #cbccce; border-style: solid;
                                border-width: 1px;">
                                <tr style="height: 25px;">
                                    <td style="width: 100%;">
                                        <asp:Label runat="server" ID="lbSpecialtyName" Text='<%# Eval("ParamSpecialtyName") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td style="height: 28px; border-color: #cbccce; border-style: solid; border-width: 1px;">
                                        <%-- <asp:Label runat="server" ID="test" Text='<%# Eval("UserName") %>'></asp:Label>--%>
                                        <div runat="server" id="div">
                                        </div>
                                        <input type="hidden" runat="server" id="hiOperatorId" value='<%#Eval("UserId")%>' />
                                        <input type="hidden" runat="server" id="hiOperatorName" value='<%#Eval("UserName")%>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>
<script type="text/javascript">
    //查看校审人校审的成品信息
    function viewOperateSignProduct(obj) {
        var operateUserID = $(obj).attr("operateUserID");
        var json = { operateUserID: operateUserID, IsViewSignProduct: true, productVerifyID: "<%=BizId %>" };
        var url = buildQueryUrl('EPMS/List/Product/OperatorVerifyProductList.aspx', json);
        showDivDialog(url, null, 900, 600, null);
        return false;
    }
</script>
