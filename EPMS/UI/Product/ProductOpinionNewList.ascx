<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductOpinionNewList.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Product.ProductOpinionNewList" %>
<div id="divBars" style="width: 100%;">
    <table class="tz-table">
        <tr id="trleader">
            <td class="flexible" onclick="openDetail('opinionListDetail')">
                校审意见清单&nbsp;<img src="../../themes/images/lright.png" />
            </td>
            <td>
                <div id="divSystemBar" class="subtoolbarbg" runat="server" style="float: left;">
                    <asp:DataList ID="dlRoleList" runat="server" EnableViewState="true" GridLines="Both"
                        RepeatDirection="Horizontal" BorderWidth="0" CellPadding="0" CellSpacing="0"
                        ItemStyle-BorderWidth="0" OnItemCommand="dlRoleList_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnRole" CssClass="subtoolbarlink" EnableTheming="false"
                                CommandArgument='<%#Eval("RoleName") %>' CommandName="role">
                                <asp:Label ID="lbRole" runat="server" Text='<%#Eval("RoleName")+"（"+Eval("OpinionNum")+"）" %>'></asp:Label>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div id="divCustomBar" style="float: left;" class="subtoolbarbg" runat="server">
                    <asp:LinkButton runat="server" ID="lbtnOpinionEdit" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="点击您可以编辑、添加校审意见" OnClientClick="return ProductEditOpinion();">
                        <span>
                            <img runat="server" id="imgOk" src="~/Themes/Images/btn_editor.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                                width="16" height="16" />编辑</span>
                    </asp:LinkButton>
                </div>
                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="点击您可以编辑、添加校审意见" OnClientClick="return ProductEditOpinion();">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                            width="16" height="16" />批量更新为已执行</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="100%" id="opinionListDetail">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvOpinionList" AllowPaging="True"
                                PageSize="1000" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                                EmptyDataText="没有校审意见" DataKeyNames="VerifyOpinionID" UseDefaultDataSource="true"
                                BindGridViewMethod="BindGrid">
                                <Columns>
                                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="rkbProductCheck()">
                                    </zhongsoft:LightCheckField>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="RoleName" HeaderText="校审角色" SortExpression="VerifyPost" />
                                    <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="校审岗位" SortExpression="VerifyPost" />
                                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="校审成品" SortExpression="ProductCode" />
                                    <zhongsoft:LightBoundField DataField="VerifyOpinion" HeaderText="校审意见" ItemStyle-Width="30%" />
                                    <zhongsoft:LightBoundField DataField="MistakeType" HeaderText="错误类别" SortExpression="MistakeType" />
                                    <zhongsoft:LightTemplateField HeaderText="修改情况">
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rblExcutionState" runat="server" RepeatDirection="Horizontal"
                                                Width="100px" CssClass="kpms-radio">
                                                <asp:ListItem Value="1">已执行</asp:ListItem>
                                                <asp:ListItem Value="0">不执行</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <zhongsoft:LightTextBox ID="tbMemo" Width="100%" runat="server" TextMode="MultiLine"
                                                CssClass="kpms-textarea" EnableTheming="false" maxtext="256" Height="10px"></zhongsoft:LightTextBox>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="质量<br/>判定" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <%#Eval("IsQuality")=="1"?"是":"否"%>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="PutUserName" HeaderText="提出人" ItemStyle-Width="30%" />
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<%--<div id="opinionListDetail">
</div>--%>
<asp:Button ID="btnProductRefresh" runat="server" content="Refresh" Style="display: none"
    OnClick="btnProductRefresh_Click" />
<script type="text/javascript">
    function ProductEditOpinion() {
        var json = { action: 2, bizId: '<%=BizId %>', RoleName: '<%=RoleName %>', VerifyPost: '<%=VerifyPost %>', actiontype: 3 };
        //校审意见类型传参
        var opinionType = '<%=OpinionType %>';
        if (opinionType != '') {
            $.extend(json, { OpinionType: opinionType });
        }
        var url = buildQueryUrl('EPMS/List/Product/ProductOpinionList.aspx', json);
        showDivDialog(encodeURI(url), null, 950, 550, afterOpinionEditor);
        return false;
    }

    function afterOpinionEditor() {
        $("#<%=btnProductRefresh.ClientID %>").click();
    }
</script>
