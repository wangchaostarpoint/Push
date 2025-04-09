<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptProjectUserWorkList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.DeptProjectUserWorkList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="生产人员工作负荷" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">人员姓名</span> <span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" Width="120px" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目状态</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectComleteInfo" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        DataKeyNames="UserId" OnRowDataBound="gvList_RowDataBound" ShowPageSizeChange="true"
        PageSize="10" AllowSorting="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="UserId" HeaderText="ID" Visible="false" />
            <zhongsoft:LightTemplateField HeaderText="提示" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbIsNeedException" Text="！" ForeColor="Red" ToolTip="需破格"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="LoginID" HeaderText="工号" />
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名" />
            <zhongsoft:LightBoundField DataField="OrganizationName" HeaderText="部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="资格信息" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a onclick="viewQualificOfUser('<%#Eval("UserId") %>')" title="">
                        <img id="imgQualificOfUser" src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif"
                            alt="资格信息" />
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="工作负荷" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbMyWork" Text='<%#Eval("TaskInfo") %>'></asp:Label>
                    <a onclick="viewCurrWork('<%#Eval("UserId") %>')" title="">
                        <img id="imgCurrWork" src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif" alt="查看" />
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="总任务数" DataField="TotalTaskNum" SortExpression="TotalTaskNum"
                ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="个人差错" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a onclick="viewUserError('<%#Eval("UserId") %>')" title="">
                        <img id="imgUserError" src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif" alt="个人差错" />
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initCustomerPlugin() {
            $("#<%=this.tbUserInfo.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',user4Code'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbUserInfo.ClientID %>").attr("value", ui.item.value.substring(0, ui.item.value.indexOf('[')));
                        if (typeof (rebindSelectorList) == "function") {
                            rebindSelectorList();
                        }
                    }
                }
            });


        }
        function viewCurrWork(userId) {
            var projectState = $("#<%=ddlProjectComleteInfo.ClientID %>").val();
            var url = buildQueryUrl("/Custom/List/Dashboard.aspx", { secid: "AD2E2530-2701-457C-9DBF-8EEFA6D2189A", IsDashboard: "1", ShowToolbar: "1", userId: userId, DeptID: '<%=DeptID %>', IsShowHeader: 2, StrProjectState: projectState });
            window.open(url);
            return false;
        }

        function viewQualificOfUser(userId) {
            var url = buildQueryUrl("/EPMS/List/OBS/QualificOfUserList.aspx", { secid: "1A112151-D758-4C34-AB8C-09606442E4E5", IsDashboard: "1", ShowToolbar: "1", UserId: userId, IsShowHeader: 2 });
            window.open(url);
            return false;
        }

        function viewUserError(userId) {
            var url = buildQueryUrl("/EPMS/List/Quality/MyProjectError.aspx", { secid: "0E2E8E73-F39D-4402-94F1-09948E17CB97", IsDashboard: "1", ShowToolbar: "1", UserId: userId, IsShowHeader: 2 });
            window.open(url);
            return false;
        }

        //加载列表查看按钮Title信息
        function setTitle(obj, userID) {
            var title = $(obj).find("#imgCurrWork").attr("title");

            if (title == "" || title == undefined) {
                //更具UserID异步加载当前人对应的所负担任务（状态为正在进行）的总数
                $.post("<%=WebAppPath %>" + "/EPMS/List/OBS/CurrentTaskDetailList.aspx",
                 { asyfunc: "GetUserTaskMassage", struserID: userID },
                 function (res) {
                     $(obj).find("#imgCurrWork").attr("title", res);
                 }
                );
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="treeView">
</asp:Content>
