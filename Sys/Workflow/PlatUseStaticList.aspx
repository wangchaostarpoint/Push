<%@ Page Title="流程使用统计" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="PlatUseStaticList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.PlatUseStaticList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <table class="kpms-detsearch">
        <tr>
            <td>表单类型
            </td>
            <td>
                <asp:DropDownList ID="ddlFormType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>部门
            </td>
            <td>
                <asp:DropDownList ID="ddlDept" runat="server">
                </asp:DropDownList>
            </td>
            <td>统计开始时间
            </td>
            <td>
                <zhongsoft:XHtmlInputText runat="server" readonly="readonly" class="kpms-textbox-date" ID="tbStartTime" />
            </td>
            <td>统计结束时间
            </td>
            <td>
                <zhongsoft:XHtmlInputText runat="server" ID="tbEndTime" class="kpms-textbox-date" readonly="readonly" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">

        function ResetText() {
            document.getElementById("<%=tbStartTime.ClientID %>").value = "";
            document.getElementById("<%=tbEndTime.ClientID %>").value = "";
            return true;
        }
        //查看部门流程详情
        function ShowDetail(OrganizationIdStr, OrganizationName, StartTime, EndTime) {
            var formtype = encodeURI($("#<%=ddlFormType.ClientID %>").val());

            var url = "/Sys/Workflow/PlatUseStaticDetail.aspx?OrganizationIdStr=" + OrganizationIdStr + "&StartTime=" + StartTime + "&EndTime=" + EndTime + "&OrganizationName=" + escape(OrganizationName) + "&FormType=" + formtype;
            url = buildQueryUrl(url, null);
            var sFeatures = "dialogHeight: 420px; dialogWidth: 750px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:Yes ; status: no;";
            //var dom = window.showModalDialog(url, null, sFeatures);
            showDivDialog(url, null, 850, 600, null)

            return false;

        }

        function ShowWorkflowDetail(OrganizationIdStr, OrganizationName, StartTime, EndTime) {

            var url = "/Sys/Workflow/WorkflowDetail.aspx?OrganizationIdStr=" + OrganizationIdStr + "&StartTime=" + StartTime + "&EndTime=" + EndTime + "&OrganizationName=" + escape(OrganizationName);

            var sFeatures = "dialogHeight: 420px; dialogWidth: 620px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:Yes ; status: no;";
            //var dom = window.showModalDialog(url, null, sFeatures);
            showDivDialog(url, null, 850, 600, null)

            return false;

        }

        function DisplayWorkflowDetail(Libtnid) {
            var test = document.getElementById(Libtnid);
            test.style.display = "";
        }

        function DisplayWorkflowDetailNone(Libtnid) {
            var test = document.getElementById(Libtnid);
            test.style.display = "none";

        }

       <%-- $("#<%=btnQuery.ClientID %>").live("click", function () {
            if ($("#<%=tbStartTime.ClientID %>").val() > $("#<%=tbEndTime.ClientID %>").val()
                && $("#<%=tbStartTime.ClientID %>").val() != "" && $("#<%=tbEndTime.ClientID %>").val() != "") {
                alert("统计开始时间不能大于统计结束时间");
                return false;
            }
            return true;
        })--%>

        function InitCustomerPlugin() {
            checkRegex();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="pdgPlatUseStatic" runat="server" AllowPaging="false"
        UseDefaultDataSource="true" DataKeyNames="OrganizationIdStr" Width="100%" AutoGenerateColumns="False"
        AllowSorting="True" OnRowDataBound="pdgPlatUseStatic_RowDataBound" OnRowCommand="pdgPlatUseStatic_RowCommand">
        <Columns>
            <asp:BoundField DataField="OrganizationName" HeaderText="部门"></asp:BoundField>
            <asp:TemplateField ItemStyle-ForeColor="Red" ItemStyle-Font-Bold="true">
                <HeaderTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="点击按待办事项排序" EnableTheming="false" OnClick="LinkButton1_Click">待办事项</asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbToDo" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ToDoList")%>'
                        ToolTip='<%# DataBinder.Eval(Container.DataItem,"OrganizationName") + "有" + DataBinder.Eval(Container.DataItem,"ToDoList") + "个待办未处理,【点击此列的标题可按大小排序】"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-ForeColor="Blue">
                <HeaderTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="点击按已办事项排序" EnableTheming="false" OnClick="LinkButton2_Click">已办事项</asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"DoneTaskList")%>'
                        ToolTip='<%# DataBinder.Eval(Container.DataItem,"OrganizationName") + "有" + DataBinder.Eval(Container.DataItem,"ToDoList") + "个待办未处理,【点击此列的标题可按大小排序】"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发起流程数">
                <ItemTemplate>
                    <%#DataBinder.Eval(Container.DataItem, "TaskList")%>
                    <asp:LinkButton ID="lbtnShowWorkFlowDetail" Style="display: none" runat="server" EnableTheming="false" CssClass="aStyle"
                        Text="查看详细"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-Width="60%">
                <HeaderTemplate>
                    待办事项明细
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnShowDetail" runat="server" EnableTheming="false" CssClass="aStyle">
                        <asp:Label ID="lbToDoList" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ToDoList")%>'
                            ToolTip="单击查看详细"></asp:Label>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
