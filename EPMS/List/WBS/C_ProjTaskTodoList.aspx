<%@ Page Language="C#" Title="我的计划任务" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    AutoEventWireup="true" CodeBehind="C_ProjTaskTodoList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.C_ProjTaskTodoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:CheckBox runat="server" ID="cbFlow" Text="流程待办" Checked="true" OnCheckedChanged="cb_CheckedChanged"
        AutoPostBack="true" Visible="false" />
    <asp:CheckBox runat="server" ID="cbRoll" Text="卷册" OnCheckedChanged="cb_CheckedChanged"
        AutoPostBack="true" Visible="false" />
    <asp:CheckBox runat="server" ID="cbMutual" Text="互提资料" OnCheckedChanged="cb_CheckedChanged"
        AutoPostBack="true" Visible="false" />
    <asp:CheckBox runat="server" ID="cbExternal" Text="外部资料" OnCheckedChanged="cb_CheckedChanged"
        AutoPostBack="true" Visible="false" />
    <asp:LinkButton runat="server" ID="btnStartFlow" CssClass="btn-query" EnableTheming="false"
        OnClientClick="startFlow();" Visible="false">
        <span>发起流程</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnPersonState" CssClass="btn-query" EnableTheming="false"
        OnClientClick="viewUserState();" Visible="false">
        <span>人员状态</span>
    </asp:LinkButton>
    <asp:LinkButton ID="lkbEditRoll" runat="server" OnClientClick="return editRoll()"
        EnableTheming="false" CssClass="btn-query" Visible="false"><span>周进度报告</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjTodo" AutoGenerateColumns="false"
        AllowFrozing="true" runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true"
        UseDefaultDataSource="true" OnRowDataBound="gvProjTodo_RowDataBound" AllowSorting="true"
        OnSorting="gvProjTodo_Sorting" Width="100%" DataKeyNames="WBSID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="TaskType" HeaderText="工作类别" SortExpression="TaskType" />
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号" SortExpression="WBSCode" />
            <zhongsoft:LightTemplateField HeaderText="名称" ItemStyle-Width="200px" SortExpression="WBSName">
                <ItemTemplate>
                    <a onclick="viewTask('<%#Eval("WBSID") %>')" style="color:Blue">
                        <%#string.Format("{0}",Eval("WBSName")) %>
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
             <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" SortExpression="ProjectCode" />
            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px" SortExpression="ProjectName">
                <ItemTemplate>
                    <%#Eval("ProjectName").ToString().Length > 15 ? Eval("ProjectName").ToString().Substring(0, 14) + "..." : Eval("ProjectName")%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSMode" HeaderText="来源" SortExpression="WBSMode" />
            <%--<zhongsoft:LightBoundField DataField="Read_Time" HeaderText="接收时间" SortExpression="Read_Time"
                DataFormatString="{0:yyyy-MM-dd HH:mm}" />--%>
            <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始" SortExpression="PlanStartTime"
                DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField DataField="FactStartTime" HeaderText="实际开始" SortExpression="PlanStartTime"
                DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成" SortExpression="PlanCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际完成" SortExpression="PlanCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField DataField="WarningInfo" HeaderText="预警提醒" SortExpression="WarningInfo" />
            <zhongsoft:LightBoundField HeaderText="完成百分比" SortExpression="WBSState" DataField="CompleteRate"
                DataFormatString="{0:N2}%" />
            <zhongsoft:LightBoundField HeaderText="状态" SortExpression="WBSState" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <script type="text/javascript">

        $gridCheckedClientID = "<%=this.gvProjTodo.CheckedClientID %>";
        //$hideObjIds = "ctl00_btnQuery,ctl00_btnResrt";

        function viewTask(wbsId) {
            var json = { actionType: 1, bizId: wbsId };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            var callBack = null;
            showDivDialog(url, "", 1050, 600, callBack);
        }

        //发起流程
        function startFlow() {
            var url = "/Sys/Workflow/FormTemplateList.aspx";
            var json = { DefaultWFType: encodeURI("生产管理") };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 530);
        }

        //查看人员状态
        function viewUserState() {
            //var url = "/EM/List/C_ProjUserStateList.aspx";
            var url = "/EPMS/List/OBS/DeptUserProjectInfo.aspx";
            var json = { deptID: '' };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }

        function editRoll() {
            var rollDs = $("#" + $gridCheckedClientID).val();
            if (rollDs.length < 36) {
                alert("请勾选要维护的卷册任务");
            } else {
                //打开编辑页面
                var url = buildQueryUrl("/EPMS/List/WBS/WBSCompleteRateEditor.aspx", { bizids: rollDs, actionType: 3, RoleName: "Sjr", wbsType: "roll" });
                showDivDialog(url, null, 800, 500, editProjectCallBack);
            }
            return false;
        }
        function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
