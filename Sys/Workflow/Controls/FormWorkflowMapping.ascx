<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormWorkflowMapping.ascx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.FormWorkflowMapping" %>
<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<table class="tz-table">
    <tr>
        <td class="tz-title">
            关联信息
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="WorkflowMappingList" runat="server" AutoGenerateColumns="false"
                AllowPaging="true" PageSize="12" DataKeyNames="LinkedProcessId" UseDefaultDataSource="true"
                OnRowDataBound="WorkflowMappingList_RowDataBound" OnRowDeleting="WorkflowMappingList_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="业务名称" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <a runat="server" id="btnView" style="text-decoration: underline; color: Blue" target="_blank">
                                <%#Eval("LinkedProcessName")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LinkedProcessCreatorName" HeaderText="创建人" ItemStyle-Width="12%" />
                    <asp:BoundField DataField="LinkedProcessStartDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="LinkedProcessFinishDate" HeaderText="完成时间" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="CreateUserName" HeaderText="关联人" ItemStyle-Width="12%" />
                    <asp:TemplateField HeaderText="分类" ItemStyle-Width="12%">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblType"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnDelete" runat="server" CommandName="delete" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                OnClientClick="return confirm('您确定要删除？')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
            <input type="hidden" runat="server" id="hiMainProcessId" />
        </td>
    </tr>
</table>
