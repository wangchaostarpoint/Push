<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkDoneList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.WorkDoneList" %>

<%@ Import Namespace="Zhongsoft.Portal.Sys.Workflow" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>待办事项跟踪列表</title>
</head>
<body>
    <form id="form1" runat="server">
   <script src="/Portal/UI/Script/jquery.tools.min.js" type="text/javascript"></script>
    <table class="kpms-detailtabletotal" width="100%">
        <!---title--->
        <tr>
            <td class="kpms-detailtop">
                <img src="../../Themes/Images/btn_title.gif" alt="已办工作" />已办工作
            </td>
        </tr>
        <!---搜索--->
        <tr>
            <td class="kpms-detailtoptitle">
                <table class="kpms-detsearch">
                    <tr>
                        <td align="left">
                            发起人<asp:TextBox ID="tbCreateUser" Width="120px" MaxLength="10" class="kpms-textboxsearch"
                                runat="server"></asp:TextBox>
                        </td>
                        <td align="left">
                            标&nbsp;题<asp:TextBox MaxLength="20" ID="tbTitle" class="kpms-textboxsearch" runat="server"
                                EnableTheming="false" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="btnkQuery" runat="server" ImageUrl="../../Themes/Images/btn_imgsearch.gif"
                                OnClick="btnQuery_Click"></asp:ImageButton>
                            &nbsp;<asp:ImageButton ID="btnReset" runat="server" ImageUrl="../../Themes/Images/btn_empty.gif"
                                OnClick="btnReset_Click"></asp:ImageButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <!---detail列表--->
    </table>
    <zhongsoft:LightPowerGridView ID="doneList" runat="server" OnRowCommand="doneList_RowCommand"
        AllowPaging="true" PageSize="15" Width="100%">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <img src="../../Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# FormHelper.FlowState(Eval("ProcessStatus").ToString(),
                      Eval("ProcessInstanceId").ToString(), 
                     Eval("packageName").ToString(), 
                     Eval("processId").ToString(), 
                      Eval("ActivityInstanceId").ToString(),
                    Eval("ActivityName").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <img src="../../Themes/Images/othertype_t.gif" title="委托信息" alt="委托信息">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# GetConsign(Eval("deputyId").ToString(),Eval("deputyName").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="事项主题">
                <ItemTemplate>
                    <%#GetToDoItem(DataBinder.Eval(Container.DataItem, "FormID").ToString(),
                                    DataBinder.Eval(Container.DataItem, "ActivityInstanceId").ToString(),
                                    DataBinder.Eval(Container.DataItem, "ProcessInstanceId").ToString(),
                                    DataBinder.Eval(Container.DataItem, "ProcessInstanceName").ToString(),
                                    DataBinder.Eval(Container.DataItem, "ActivityName").ToString())
                    %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="已发给" HeaderStyle-Width="180px">
                <ItemTemplate>
                    <%#GetReceivers(Eval("ExtendedAttribute").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发起人">
                <ItemTemplate>
                    <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataFormatString="{0:yy-MM-dd HH:mm}" DataField="FinishDateTime"
                HeaderText="完成时间" />
        </Columns>
    </zhongsoft:LightPowerGridView>

    <script language="javascript">
        function initCustomerPlugin() {
            $("#<%=this.tbCreateUser.ClientID %>").autocomplete({
                source: function(request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',user'
                    }, response);
                },
                minLength: 1,
                select: function(event, ui) {
                    if (ui.item) {
                        $("#<%=hiUserId.ClientID %>").attr("value", ui.item.id);
                    }
                }
            });


            $("#<%=doneList.ClientID %> span").tooltip({ position: 'bottom center'});
        }
    </script>

    <input type="hidden" runat="server" id="hiUserId" />
    </form>
</body>
</html>
