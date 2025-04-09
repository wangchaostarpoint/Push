<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishProductInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishProductInfo" %>
<table class="tz-table" width="100%" id="Table1">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('productDetail')">
            成品列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
        <td align="right">
            <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal" RepeatColumns="4"
                AutoPostBack="true" OnSelectedIndexChanged="rblType_SelectedIndexChanged">
                <asp:ListItem Value="" Selected="True">全部</asp:ListItem>
                <asp:ListItem Value="1">压力管道成品</asp:ListItem>
                <asp:ListItem Value="2">非压力管道成品</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<table class="tz-table" id="productDetail" style="width: 100%">
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" ID="gvList" runat="server" AllowPaging="true"
                ShowFooter="false" UseDefaultDataSource="true" PageSize="100" AutoGenerateColumns="false"
                DataKeyNames="ProductID" EmptyDataText="没有成品信息" BindGridViewMethod="UserControl.BindInfo"
                OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightTemplateField HeaderText="签署页" ItemStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="signPage" runat="server" CausesValidation="False" ImageUrl="~/Themes/Images/btn_dg_view.gif"
                                CommandName="del"></asp:ImageButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" HeaderStyle-Width="4%"
                        Visible="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FileFormat" HeaderText="成品类别" HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="成品编号">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("ProductCode")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="成品名称" SortExpression="ProductName">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <a runat="server" id="aProductName" class="aStyle">
                                    <%#Eval("ProductName")%></a>
                                <asp:Label runat="server" ID="lbProductName" Text='<%# DataBinder.Eval(Container.DataItem, "ProductName") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="成品等级" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("ProductType")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="图幅" HeaderStyle-Width="4%">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("Mapsize")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="是否活用" HeaderStyle-Width="4%">
                        <ItemTemplate>
                            <%#Convert.ToString( Eval("IsReuse"))=="1"?"是":"否"%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传日期" DataFormatString="{0:yyyy-MM-dd}"
                        HeaderStyle-Width="8%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业" HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="设计人" HeaderStyle-Width="4%">
                        <ItemTemplate>
                            <asp:Label ID="lbDesigners" runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="长" HeaderStyle-Width="3%">
                        <ItemTemplate>
                            <asp:Label ID="lbLength" runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="宽" HeaderStyle-Width="3%">
                        <ItemTemplate>
                            <asp:Label ID="lbWidth" runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="StandardPage" HeaderText="标准张" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<div id="divSignInfo" style="display: none" title="获取签名">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                请输入签署页每行显示的签名个数:
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" value="5" ID="txtNum" EnableTheming="false"
                    class="kpms-textbox" />
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    //加载div默认事件
    function initEvent(div, productId) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 150,
            minWidth: 300,
            modal: true,
            buttons: {
                "确定": function () {
                    var num = $("#<%=txtNum.ClientID %>").val();
                    window.open('/portal/EPMS/List/Product/SignPage.aspx?ProductId=' + productId + '&Num=' + num);

                    $(this).dialog("close");
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    //弹出对应层
    function showSetInfo(div, productId) {
        initEvent(div, productId);
        $("#" + div).dialog('open');
        $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        return false;
    }

    ///下载成品
    function downloadProductFile(productId) {
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=sign&fileId=" + productId;
        window.open(urlStr);
        //showDivDialog(urlStr, null, 750, 550);
        return false;
    }
</script>
