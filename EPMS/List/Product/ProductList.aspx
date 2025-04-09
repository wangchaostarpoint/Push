<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="成品清单" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div id="divCustomBar" style="float: left;" class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnNew" CssClass="subtoolbarlink" EnableTheming="false"
            ToolTip="上传成品">
            <span>
                <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="上传成品" width="16"
                    height="16" />上传</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnEdit" CssClass="subtoolbarlink" EnableTheming="false"
            ToolTip="编辑、修改成品信息、会签、添加校审意见" OnClientClick="viewProduct('test'); return false;">
            <span>
                <img runat="server" id="imgOk" src="~/Themes/Images/btn_editor.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                    width="16" height="16" />编辑</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnView" CssClass="subtoolbarlink" EnableTheming="false"
            ToolTip="查看成品信息" Visible="false">
            <span>
                <img runat="server" id="imgCancel" src="~/Themes/Images/btn_chakan.gif" alt="查看成品信息"
                    width="16" height="16" />查看</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
            ToolTip="下载成品">
            <span>
                <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="下载成品" width="16"
                    height="16" />下载</span>
        </asp:LinkButton>
    </div>
    <div id="divSystemBar" class="subtoolbarbg" runat="server" style="float: left;">
        <asp:LinkButton runat="server" ID="btnConfig" EnableTheming="false" CssClass="subtoolbarlink"><span>
                            <img  title="设置成品列表属性" src="<%=WebAppPath %>/Themes/Images/btn-cfg.gif" width="15" height="15" onclick="setProductList();return false;" /></span>
        </asp:LinkButton>
    </div>
    <div id="divCfg" style="display: none" class="ui-state-highlight ui-corner-all">
        <table>
            <tr title="您可以设置当成品数量超过多少时（设置值需要大于50），列表可以固定标题，滚轮滚动成品清单列表">
                <td>
                    设置成品数量
                </td>
                <td>
                    <zhongsoft:LightTextBox ID="maxProductNum" runat="server" DataType="Integer" Text="50"
                        Width="50px"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr title="您可以设置在固定高度内滑动鼠标滚轮滚动成品清单列表">
                <td>
                    设置固定高度
                </td>
                <td>
                    <zhongsoft:LightTextBox ID="maxProductHeight" runat="server" DataType="Integer" Text="1500"
                        Width="50px"></zhongsoft:LightTextBox>px
                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <div>
                        <asp:LinkButton ID="lbtnSetProductList" runat="server" OnClick="lbtnSetProductList_Click"
                            Width="30" CssClass="kpms-buttonfree" ToolTip="点击可以设置成品清单列表" OnClientClick="setProductList(); return true;">确定
                        </asp:LinkButton>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <table width="100%">
        <tr>
            <td>
                <div id="editor-content" style="width: 100%; height: inherit">
                    <asp:LinkButton runat="server" ID="lbtnAllNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnAllNum_Click">
                        <span>全部（<asp:Label ID="lbAllNum" runat="server" Text="3"></asp:Label>）</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnNewNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnNewNum_Click">
                        <span>新制（<asp:Label ID="lbNew" runat="server" Text="3"></asp:Label>）</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnReuseNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnReuseNum_Click">
                        <span>套用（<asp:Label ID="lbReuseNum" runat="server" Text="0"></asp:Label>）</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnSignNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnSignNum_Click">
                        <span>会签（<asp:Label ID="lbSign" runat="server" Text="2"></asp:Label>）</span>
                    </asp:LinkButton>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvProductList" PageSize="5000"
                    ShowExport="true" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true"
                    DataKeyNames="ProductID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid">
                    <Columns>
                        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px"  visible="false">
                        </zhongsoft:LightCheckField>
                        <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号" SortExpression="ProductCode" />
                        <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" />
                        <zhongsoft:LightBoundField DataField="ProductType" HeaderText="成品类别" SortExpression="ProductType" />
                        <zhongsoft:LightBoundField DataField="FileFormat" HeaderText="格式" SortExpression="FileFormat" />
                        <zhongsoft:LightBoundField DataField="MapsizeName" HeaderText="图幅" />
                        <zhongsoft:LightBoundField DataField="DesignerName" HeaderText="设计人" />
                        <zhongsoft:LightBoundField DataField="ProductSign" HeaderText="会签" />
                        <zhongsoft:LightTemplateField HeaderText="是否<br/>套用" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%#Eval("IsReuse")%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否<br/>会签" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%#Eval("IsJointlySign")%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        //查看、编辑成品
        function viewProduct(bizId) {
            var json = { actionType: 3, bizId: bizId };
            var url = buildQueryUrl('EPMS/List/Product/ProductEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }
        function initFormPlugin() {
            setSize();
        }
        //页面窗体大小变化时，更具窗体大小改变内容控件大小
        function setSize() {
            //        $('#divCfg').height($('#divSystemBar').height() + 'px');
            //        $('#divCfg').width($('#divSystemBar').width() + 'px');

        }

        function addSignProduct() {
            var json = {};
            var url = buildQueryUrl('EPMS/List/Product/ProductOpinionEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }

        function setProductList() {
            $("#divCfg").toggle();
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
