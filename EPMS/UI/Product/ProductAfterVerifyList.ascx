<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductAfterVerifyList.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Product.ProductAfterVerifyList" %>
<div id="divBars" style="width: 100%;">
    <table class="tz-table">
        <tr id="trleader">
            <td class="flexible" onclick="openDetail('productAfterVerifyList')">已校审成品清单&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table width="100%" id="productAfterVerifyList">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView runat="server" ID="gvProductAfterVerifyList" AllowPaging="True"
                                AutoGenerateColumns="false" ShowExport="false" AllowSorting="true" DataKeyNames="ProductID"
                                UseDefaultDataSource="true" BindGridViewMethod="BindList" OnRowDataBound="gvProductAfterVerifyList_RowDataBound"
                                OnRowCommand="gvProductAfterVerifyList_RowCommand">
                                <Columns>
                                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="35px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnProductView" EnableTheming="false">
                                              <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                                onclick="return showProductAfterVerify('1','<%#Eval("ProductID")%>');" />                        
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField HeaderText="成品编号" DataField="ProductCode" ItemStyle-HorizontalAlign="Center" />
                                    <zhongsoft:LightBoundField HeaderText="成品名称" DataField="ProductName" ItemStyle-HorizontalAlign="Center" />
                                    <zhongsoft:LightBoundField HeaderText="完成校审时间" DataField="ProductVerifyEndDate" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:yyyy-MM-dd}" />
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
</div>
<script type="text/javascript">
    function showProductAfterVerify(actionType, bizId) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('EPMS/List/Product/ProductDetailView.aspx', json);
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }
</script>
