<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MeetingContent.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.MeetingContent" %>
<tr runat="server" id="trAddJudgeContent">
    <td colspan="4" class="flexible">
        <span content="JudgeContent">会议内容</span>
    </td>
    <td align="right" colspan="2" style="border-right: 1px solid #cbccce;">
        <asp:Button ID="btnAddJudgeContent" runat="server" Text="添加会议内容" activestatus="(3.*)"
            displaystatus="(3.*)" OnClientClick="return EditContent('2','')" />
    </td>
</tr>
<tr>
    <td colspan="6" style="border-right: 1px solid #cbccce;">
        <zhongsoft:LightPowerGridView ID="gridView" runat="server" PageSize="100" Width="100%"
            AutoGenerateColumns="False" UseDefaultDataSource="true" AllowSorting="true" DataKeyField="MeetingContentID"
            ItemShowLength="20" BindGridViewMethod="UserControl.BindGrid">
            <Columns>
                <asp:TemplateField HeaderText="序号" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-Wrap="false">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                        <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("MeetingContentID") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Wrap="False" Width="5%"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="讨论问题及解决办法" ItemStyle-Width="50%">
                    <ItemTemplate>
                        <a onclick="return EditContent('1','<%#Eval("MeetingContentID") %>')" title='<%# Eval("Memo")%>'
                            style="color: #0000FF; text-decoration: underline">
                            <%#Eval("Memo").ToString().Length > 20 ? Eval("Memo").ToString().Substring(0, 20) + "..." : Eval("Memo")%>
                        </a>
                    </ItemTemplate>
                    <ItemStyle Width="40%"></ItemStyle>
                </asp:TemplateField>
                <zhongsoft:LightBoundField DataField="ExecUserName" HeaderText="执行人">
                </zhongsoft:LightBoundField>
                <%-- <zhongsoft:LightBoundField DataField="ExecTime" HeaderText="执行时间" DataFormatString="{0:yyyy-MM-dd}">
                </zhongsoft:LightBoundField>--%>
                <asp:TemplateField HeaderText="执行时间">
                    <ItemTemplate>
                        <%#Convert.ToDateTime(Eval("ExecTime")) == DateTime.MinValue ? null : Convert.ToDateTime(Eval("ExecTime")).ToString("yyyy-MM-dd")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnEditContent" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif" 
                                    onclick="EditContent('3','<%# Eval("MeetingContentID") %>');"/>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                    HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="ibtnDelReview" runat="server" OnCommand="ibtnDelReview_Click"
                            EnableTheming="false" CommandArgument='<%#Eval("MeetingContentID") %>'>
                            <img alt="删除" onclick="return confirm('确认要删除吗？');" src="<%=WebAppPath%>/Themes/Images/btn_dg_delete.gif" />
                        </asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Right"></PagerStyle>
        </zhongsoft:LightPowerGridView>
    </td>
</tr>
<asp:Button ID="btnContentRefresh" runat="server" content="Refresh" Style="display: none"
    OnClick="btnContentRefresh_Click" />
<script type="text/javascript">
    function EditContent(actionType, bizId) {
        var json = { FormId: "<%=BusinessId %>", actionType: actionType, OrganizationID: "<%=OrganizationID %>", bizId: bizId }
        var url = buildQueryUrl("EPMS/List/Project/ProjectMeetingEditor.aspx", json);
        showDivDialog(encodeURI(url), null, 550, 400, afterContentEditor);
        return false;
    }
    function afterContentEditor() {
        $("#<%=btnContentRefresh.ClientID %>").click();
    }
</script>
