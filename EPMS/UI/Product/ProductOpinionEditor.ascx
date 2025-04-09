<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductOpinionEditor.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.ProductOpinionEditor" %>
<table class="tz-table">
    <tr runat="server" id="trAddOpinionTitle">
        <td>
            校审意见
            <asp:Label ID="lbProduct" runat="server"></asp:Label>
        </td>
        <td flag="hide">
            错误类别
        </td>
        <td flag="hide">
            质量判定
        </td>
        <td flag="hide">
            修改情况
        </td>
        <%-- <td style="width: 170px">
            <table>
                <tr>
                    <td>
                        修改情况
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>
        </td>--%>
    </tr>
    <tr align="left" runat="server" id="trAddOpinionContent">
        <td colspan="4">
            <zhongsoft:LightTextBox ID="tbVerifyOpinion" runat="server" TextMode="MultiLine"
                ToolTip="请输入校审意见" CssClass="kpms-textarea" EnableTheming="false" Height="20px"
                Width="100%" maxtext="1024"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiVerifyOpinionID" />
        </td>
        <td style="width: 150px" flag="hide">
            <asp:RadioButtonList ID="rblMistakeType" runat="server" RepeatDirection="Vertical"
                RepeatColumns="2" CssClass="kpms-radio" ToolTip="请选择错误类别">
            </asp:RadioButtonList>
        </td>
        <td title="如果校审意见较重要，具有借鉴意义，请选中该项" align="left" flag="hide">
            <asp:CheckBox ID="ckIsQuality" runat="server"></asp:CheckBox>
        </td>
        <td align="left" style="width: 145px" flag="hide">
            <asp:RadioButtonList ID="rblExcutionState" runat="server" RepeatDirection="Horizontal"
                CssClass="kpms-radio">
                <asp:ListItem Value="1">已执行</asp:ListItem>
                <asp:ListItem Value="0">不执行</asp:ListItem>
            </asp:RadioButtonList>
            <zhongsoft:LightTextBox ID="tbMemo" Width="100%" runat="server" TextMode="MultiLine"
                Visible="false" CssClass="kpms-textarea" EnableTheming="false" maxtext="256"
                Height="20px"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr valign="top">
        <td valign="top" colspan="3">
            <div id="editor-content" style="width: 100%;">
                <asp:DataList ID="dlRoleList" runat="server" GridLines="Both" RepeatDirection="Horizontal"
                    ItemStyle-BorderWidth="0" BorderWidth="0" CellPadding="0" CellSpacing="0" OnItemCommand="dlRoleList_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbtnRole" CssClass="subtoolbarlink" EnableTheming="false"
                            CommandArgument='<%#Eval("RoleName") %>' CommandName="role">
                            <asp:Label ID="lbRole" runat="server" Text='<%#Eval("RoleName")+"（"+Eval("OpinionNum")+"）" %>'></asp:Label>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </td>
        <td align="right" style="width: 100px;">
            <asp:Button ID="lbtnExcute" Text="批量标记已执行" runat="server" OnClientClick="return confirm('您确定要批量将意见都标记为已执行状态吗？');"
                class="kpms-buttonfree" OnClick="lbtnExcute_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
                PageSize="1000" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                UseDefaultDataSource="true" BindGridViewMethod="BindGrid" DataKeyNames="VerifyOpinionID"
                OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="校审成品" SortExpression="ProductCode" />
                    <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="校审岗位" SortExpression="VerifyPost" />
                    <zhongsoft:LightBoundField DataField="VerifyOpinion" HeaderText="校审意见" ItemStyle-Width="30%"
                        Visible="false" />
                    <zhongsoft:LightTemplateField HeaderText="校审意见">
                        <ItemTemplate>
                            <%--   <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("VerifyOpinion")%>
                            </div>--%>
                            <asp:Label ID="lbVerifyOpinion" Text='<%# gvList.GetSubString(Eval("VerifyOpinion"), 20)%>'
                                ToolTip='<%#Eval("VerifyOpinion") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="MistakeType" HeaderText="错误类别" SortExpression="MistakeType" />
                    <zhongsoft:LightTemplateField HeaderText="修改情况">
                        <ItemTemplate>
                            <%#Eval("ExcutionState") == "1" ? "已执行" : Eval("ExcutionState") == "0" ? "不执行" : "未修改" + Eval("Memo")%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="质量判定" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <%#Eval("IsQuality") == "1" ? "是" : "否"%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该校审意见吗？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function initCustomerPlugin() {

        $('[flag="hide"]').hide();
    }

    //设置页面返回值，编辑后刷新父级页面
    function setReturnVal() {
        parent.returnValue = "saved";
    }
</script>
