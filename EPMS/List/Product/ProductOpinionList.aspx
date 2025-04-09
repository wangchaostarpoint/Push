<%@ Page Language="C#" AutoEventWireup="true" Title="校审意见" CodeBehind="ProductOpinionList.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductOpinionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    DataKeyNames="FileId" UseDefaultDataSource="true" BindGridViewMethod="BindFileGrid"
                    HideFieldOnExport="全选" ShowPageSizeChange="false">
                    <Columns>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px">
                        </zhongsoft:LightCheckField>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="FileCode" HeaderText="资料编号" HeaderStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileName" HeaderText="资料名称" MaxLength="50">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                校审意见
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbVerifyOpinion" runat="server" TextMode="MultiLine"
                    ToolTip="请输入校审意见" CssClass="kpms-textarea" EnableTheming="false" Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                差错性质
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblMistakeType" runat="server" RepeatDirection="Vertical"
                    RepeatColumns="4" CssClass="kpms-radio">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                质量判定
            </td>
            <td class="td-m" colspan="3" title="如果校审意见较重要，具有借鉴意义，请选中该项">
                <asp:CheckBox ID="ckIsQuality" runat="server"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center">
                <asp:Button ID="btnSave" runat="server" Text="保存" Style="text-align: center" OnClick="btnSave_Click"
                    OnClientClick="return checkProduct();" flag="update" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvOpinionList" AllowPaging="false"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    DataKeyNames="VerifyOpinionID" UseDefaultDataSource="true" ShowPageSizeChange="false"
                    OnRowDataBound="gvOpinionList_RowDataBound" OnRowCommand="gvOpinionList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="资料编号" HeaderStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="资料名称">
                            <ItemTemplate>
                                <asp:Label ID="lbFileName" runat="server"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="校审岗位" Visible="false" />
                        <zhongsoft:LightBoundField DataField="RoleName" HeaderText="校审角色" ItemStyle-Width="40px" />
                        <zhongsoft:LightTemplateField HeaderText="校审意见">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbVerifyOpi" runat="server" class="kpms-textbox" MaxLength="1024"
                                    CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="3"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "VerifyOpinion") %>' flag="update">
                                </zhongsoft:LightTextBox>
                                <asp:Label ID="lbVerifyOpinion" Text='<%# gvOpinionList.GetSubString(Eval("VerifyOpinion"), 20)%>'
                                    ToolTip='<%#Eval("VerifyOpinion") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="差错性质">
                            <ItemTemplate>
                                <asp:RadioButtonList ID="rbMistakeType" runat="server" RepeatDirection="Vertical"
                                    RepeatColumns="2" CssClass="kpms-radio" flag="update">
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="修改情况">
                            <ItemTemplate>
                                <asp:Label ID="lbEx" runat="server">
                                <%#Eval("ExcutionState") == "1" ? "已执行" : Eval("ExcutionState") == "0" ? "不执行" : "未修改" %></asp:Label>
                                <div style="word-break: break-all !important; white-space: normal !important; width: 60px">
                                    <zhongsoft:LightTextBox ID="tbMemo" Width="100%" runat="server" TextMode="MultiLine"
                                        Enabled="false" CssClass="kpms-textarea" EnableTheming="false" maxtext="256"
                                        Height="10px" Text='<%#Eval("Memo")%>'></zhongsoft:LightTextBox></div>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="质量判定" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <asp:CheckBox ID="ckbIsQuality" runat="server" flag="update" Text="是"></asp:CheckBox>
                                <asp:Label ID="lbIsQuality" runat="server"><%#Eval("IsQuality") == "1" ? "是" : "否"%></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="保存" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnSave" EnableTheming="false" CommandName="SaveData"
                                    key='<%#Eval("VerifyOpinionID") %>' OnClick="lbtnSave_Click" flag="update">
                                <img alt="保存" title="保存" src="../../../Themes/Images/btn_save.gif"                                     />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="DeleteData"
                                    flag="update" OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("VerifyOpinionID") %>'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif"                                     />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            //对需要刷新的按钮注册返回值
            $('[flag="update"]').each(function () {
                $(this).bind('click', function () {
                    setReturnVal();
                });
            });
        }

        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = "saved";
        }

        function checkProduct() {
            var content = $("#<%=tbVerifyOpinion.ClientID %>").val();
            var type = $("#<%=rblMistakeType.ClientID %> input[type='radio']:checked").val();
            if (content == '' || content == undefined) {
                alert("请输入校审意见！");
                return false;
            }
            else if (type == '' || type == undefined) {
                alert("请选择差错性质");
                return false;
            }
            return true;
        }

    </script>
</asp:Content>
