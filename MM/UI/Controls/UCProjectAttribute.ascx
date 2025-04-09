<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCProjectAttribute.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.UCProjectAttribute" %>
<table style="width:100%">
    <tr id="trAddAttribute" align="right">
        <td>
            新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>条新特性
            <asp:Button runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" />
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:TreeGridView ID="gvProjectAttribute" runat="server" AutoGenerateColumns="False"
                PowerPageCount="0" PowerPageIndex="0" RecordsCount="0" ParentIdColumn="PARAMPROATTRIBUTEID"
                UseDefaultDataSource="true" OnRowDataBound="gvProjectAttribute_RowDataBound"
                IndentSize="10" OnRowCommand="gvProjectAttribute_RowCommand">
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号">
                        <ItemTemplate>
                            <%# gvProjectAttribute.CreateHeader(Container.DataItem)%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="特性指标名称<span class='req-star'>*</span>"
                        ItemStyle-Width="150px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbAttributeName" req="1" Text='<%#Eval("PARAMPROATTRIBUTENAME") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="单位" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbUnit" Text='<%#Eval("unit") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="数量" ItemStyle-Width="120px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbValue" Style="text-align: right; width: 90%"
                                Text='<%#Eval("ATTRIBUTEVALUE") %>'></zhongsoft:LightTextBox>
                            <input type="hidden" runat="server" id="hiParamID" value='<%#Eval("PARAMPROATTRIBUTEID") %>' />
                            <input type="hidden" runat="server" id="hiPrimayKeyID" value='<%#IsMidInfo?Eval("MIDPROATTRIBUTEID"):Eval("PROATTRIBUTEID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" MaxLength="256" Style="width: 90%"
                                Text='<%#Eval("Memo") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="操作" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" ToolTip="删除" CommandName="DeleteData"
                                CommandArgument='<%#IsMidInfo?Eval("MIDPROATTRIBUTEID"):Eval("PROATTRIBUTEID") %>'
                                OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnAddNewAttr" EnableTheming="false" ToolTip="添加子特性"
                                CommandArgument='<%#IsMidInfo?Eval("MIDPROATTRIBUTEID"):Eval("PROATTRIBUTEID") %>'
                                CommandName="addNewAttr">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_add.gif" alt="添加子特性" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:TreeGridView>
        </td>
    </tr>
</table>
<script>
    function attribute_Init() {
        if (parseBool("<%=Enabled %>") == false) {
            $("#trAddAttribute").hide();
        }
    }
</script>
