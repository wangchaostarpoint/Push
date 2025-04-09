<%@ Page Title="生产任务" Language="C#" AutoEventWireup="true" CodeBehind="ProjectTaskList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectTaskList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<%@ Import Namespace="EDPortal.EPMS" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">任务编号</span><span>
        <zhongsoft:LightTextBox ID="tbTaskInfo" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false">
        </zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">阶段</span><span>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" CssClass="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lkbSchedule" runat="server" OnClientClick="return confrimTask()"
        EnableTheming="false" CssClass="btn-query" OnClick="lkbSchedule_Click"><span>签收</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="TaskIssuedPhaseID,PhaseID,ProjectCode,TaskInfoFormID" UseDefaultDataSource="true"
        BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowCommand="gvList_RowCommand"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="项目编号">
                <ItemTemplate>
                    <span projectcode='<%#Eval("TaskInfoFormID") %>'></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目名称">
                <ItemTemplate>
                    <span projectname='<%#Eval("TaskInfoFormID") %>'></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="阶段任务编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设计阶段">
                <ItemTemplate>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DesignChiefUserName" HeaderText="设总">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanChiefUserName" HeaderText="计划工程师">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="签收" CommandName="confrimTask" EditItemClick="confrimTask"
                Visible="false" DataParamFields="TaskIssuedPhaseID,ProjectCode" ImageUrl="../../../Themes/Images/ico_banliyijian.gif">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <!--任务单视图实现-->
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvTaskList" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="projectnumber" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="详细">
                <ItemTemplate>
                    <a class="aStyle" title="点击查询任务单详细信息">详细</a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="任务编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="projectnumber" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="projectname" HeaderText="项目名称" HeaderStyle-Width="390px"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="phase" HeaderText="设计阶段">
            </zhongsoft:LightBoundField>
            <%--
            <zhongsoft:LightButtonField HeaderText="签收" CommandName="confrimTask" EditItemClick="confrimTask"
                Visible="false" DataParamFields="TaskIssuedPhaseID,ProjectCode" ImageUrl="../../../Themes/Images/ico_banliyijian.gif">
            </zhongsoft:LightButtonField>
            --%>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiIsStart" runat="server" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=GridViewList.CheckedClientID %>";
        function initPagePlugin() {
            if ('<%=EPMSConfig.Instance.ProductProj %>' == '') {
                setProjectInfo();
            }
        }

        //异步加载项目名称、项目编号
        function setProjectInfo() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[projectcode]").each(function () {
                $ids += $(this).attr("projectcode") + "|";
            });
            $.post("ProjectTaskList.aspx",
                 { asyfunc: "GetProjectInfo", strTaskInfoFormIDs: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //项目Code
                     $("#<%=gvList.ClientID %> span[projectname]").each(function () {
                         var $projectname = $(this).attr("projectname");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][2];
                             if ($projectname == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                     //项目Name
                     $("#<%=gvList.ClientID %> span[projectcode]").each(function () {
                         var $projectcode = $(this).attr("projectcode");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][1];
                             if ($projectcode == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                 }
                );

        }



        //处理签收功能
        function confrimTask() {
            var rollDs = $("#" + $gridCheckedClientID).val();
            if (rollDs.length < 3) {
                alert("请勾选要签收的任务");
                return false;
            } else {
                if (confirm("是否签收已勾选项目任务")) {
                    parent.returnValue = "Confirmproject";
                    if (confirm("是否发起勾选项目的项目启动流程")) {
                        $("#<%=hiIsStart.ClientID %>").val("1");
                    } else {
                        $("#<%=hiIsStart.ClientID %>").val("0");
                    }
                    return true;
                } else {

                    return false;
                }
            }
        }

        function openWorkFlow(orgID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", { actionType: 2, packageName: 'EPMSProjectStart.xpdl', xpdlId: 'ProjectStart_WP1', formId: 136, ver: '|', OrganizationID: orgID });
            window.open(url);
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
