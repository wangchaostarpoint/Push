<%@ Page Language="C#" Title="关联流程" AutoEventWireup="true" CodeBehind="RelationWorkflows.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.RelationWorkflows" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <table class="tz-table">
        <tr>
            <td class="tz-title" colspan="2">
               待办流程
            </td>
        </tr>
        <tr>
            <td>
                <zhongsoft:LightPowerGridView runat="server" ID="gvTodo" AutoGenerateColumns="false"
                    UseDefaultDataSource="true">
                    <Columns>
                        <asp:TemplateField HeaderText="事项主题">
                            <ItemTemplate>
                                <%#GetToDoItem(  
                                                Eval("FormID").ToString(),
                                                Eval( "ActivityInstanceId").ToString(),
                                                Eval("ProcessInstanceId").ToString(),
                                                Eval("ProcessInstanceName").ToString(),
                                                Eval("ActivityName").ToString(),
                                                Eval("ReadDateTime").ToString(),
                                                Eval("AlertTimes").ToString())
                                %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProcessName" HeaderText="表单类型" HeaderStyle-Width="150px" />
                        <asp:TemplateField HeaderText="发起人" HeaderStyle-Width="180px">
                            <ItemTemplate>
                                <div tip="1" style='width: 180px' class='autoskip' title='<%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]'>
                                    <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]</div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="接收时间" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <%#GetReceiveDate(DateTime.Parse(Eval("ReceiveDateTime").ToString()))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <table class="tz-table">
        <tr>
            <td class="tz-title" colspan="2">
               已办流程
            </td>
        </tr>
        <tr>
            <td>
                <zhongsoft:LightPowerGridView runat="server" ID="gvDone" AutoGenerateColumns="false"
                    UseDefaultDataSource="true">
                    <Columns>
                        <asp:TemplateField HeaderText="事项主题">
                            <ItemTemplate>
                                <%#GetDoneItem(DataBinder.Eval(Container.DataItem, "FormID").ToString(),
                                    DataBinder.Eval(Container.DataItem, "ActivityInstanceId").ToString(),
                                    DataBinder.Eval(Container.DataItem, "ProcessInstanceId").ToString(),
                                    DataBinder.Eval(Container.DataItem, "ProcessInstanceName").ToString(),
                                    DataBinder.Eval(Container.DataItem, "ActivityName").ToString())
                                %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="最后处理时间" HeaderStyle-Width="120px">
                            <ItemTemplate>
                                <%# GetStartDate(Convert.ToDateTime(Eval("LastRunDate")))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="发起人[发起时间]" HeaderStyle-Width="320px">
                            <ItemTemplate>
                                <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]&nbsp;<%# GetStartDate(DateTime.Parse(Eval("StartDateTime").ToString()))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
</asp:Content>
