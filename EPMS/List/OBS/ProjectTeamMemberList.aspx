<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTeamMemberList.aspx.cs"
    Title="团队成员" MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EPMS.List.OBS.ProjectTeamMemberList" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeProject" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeProject_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工号/姓名</span> <span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF('项目组成员配置')">
                <h4>发起《项目组成员配置》</h4>
            </a></span>
    </span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF('项目组成员变更')">
                <h4>发起《项目组成员变更》</h4>
            </a></span>
    </span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF('跨分院专业审核委托')">
                <h4>发起《跨分院专业审核委托》</h4>
            </a></span>
    </span>
    <%=GetPrintHtml() %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <div id="templateTabs">
        <ul>
            <li><a href='#All' id='a0'>
                <asp:Label ID="lb0" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a1'>
                <asp:Label ID="lb1" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a2'>
                <asp:Label ID="lb2" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a3'>
                <asp:Label ID="lb3" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a4'>
                <asp:Label ID="lb4" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a5'>
                <asp:Label ID="lb5" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a6'>
                <asp:Label ID="lb6" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a7'>
                <asp:Label ID="lb7" runat="server"></asp:Label></a></li>
        </ul>
        <div id="All">
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView Width="100%" AllowPaging="True" PageSize="10" ID="gvAll"
                        runat="server" AllowSorting="true" AutoGenerateColumns="False" ShowExport="true"
                        DataKeyNames="OrganizationUsersInRolesID" UseDefaultDataSource="true" OnRowDataBound="gvAll_RowDataBound"
                        BindGridViewMethod="BindGrid">
                        <Columns>
                            <asp:BoundField DataField="UnitPostName" HeaderText="角色" ItemStyle-Width="120px" />
                            <asp:BoundField DataField="LoginId" HeaderText="工号" ItemStyle-Width="50px" />
                            <%--<asp:BoundField DataField="UserName" HeaderText="姓名" ItemStyle-Width="60px" />--%>
                            <zhongsoft:LightTemplateField HeaderText="姓名" HeaderStyle-Width="90px">
                                <ItemTemplate>
                                    <%#Convert.ToString(Eval("UserName")).Replace("【破格】","") %>
                                    <a class="aStyle" href="javascript:void(0)" runat="server" id="aViewExceptionForm" target="_blank">【破格】</a>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>


                            <asp:TemplateField HeaderText="部门" ItemStyle-Width="160px">
                                <ItemTemplate>
                                    <asp:Label ID="lbDept" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AppointDate" HeaderText="任命时间" ItemStyle-Width="80px"
                                DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="LeaveDate" HeaderText="卸任时间" ItemStyle-Width="80px" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="MobilePhone" HeaderText="手机" ItemStyle-Width="140px" />
                            <asp:BoundField DataField="Phone" HeaderText="座机" ItemStyle-Width="80px" />
                            <asp:BoundField DataField="Email" HeaderText="邮箱" ItemStyle-Width="80px" />
                            <asp:TemplateField HeaderText="工作负荷" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <a onclick='return DetailOfWork("<%#Eval("UserId") %>")'>
                                        <asp:Label ID="lbMyWork" runat="server"></asp:Label>
                                        <img id="imgCurrWork" flag="currWork" userid='<%#Eval("UserId")%>' src="<%=WebAppPath %>/Themes/Images/loadGreen.png" alt="查看" />
                                    </a>
                                    <input type="hidden" id="hiUserID" value="<%#Eval("UserId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                    <asp:LinkButton ID="lbtnReBind" runat="server" OnClick="lbtnReBind_Click" Visible="false">LinkButton</asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" runat="server" id="hiIndex" value="0" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            $('#templateTabs li a').each(function (i) {
                var index = $("#<%=hiIndex.ClientID %>").val();
                if (i == index) {
                    $('#templateTabs').tabs({ active: i });
                }
                $(this).click(function () {
                    $('#templateTabs').tabs({ active: i });
                    $("#<%=hiIndex.ClientID %>").val(i);
                    <%=Page.GetPostBackEventReference(this.lbtnReBind,"") %>;
                    return true;
                });
            })

            //初始化人员任务数量信息
            initUserTaskCnt();
        }

        function ShowLoadStatisticDetailList(userID, loginID, userName) {
            var url = "../ProjectHR/LoadStatisticDetailList.aspx?UserID=" + userID + "&LoginID=" + loginID + "&UserName=" + escape(userName) + "&OrganizationId=" + "<%=OrganizationId %>";
            var stringFeatures = "dialogHeight: 700px; dialogWidth: 900px; edge: Raised; center: Yes; help: Yes; resizable: Yes; scroll: Yes; status: Yes;";
            window.showModalDialog(url, "", stringFeatures);
            return false;
        }
        //查看人员工作信息
        function DetailOfWork(userId) {
            var url = buildQueryUrl("/EPMS/List/OBS/CurrentTaskDetailList.aspx", { secid: "c3455630-e393-4f75-b471-0e9151c39a6b", IsDashboard: "1", ShowToolbar: "1", userid: userId });
            showDivDialog(url, null, 1000, 600);
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
        //发起《项目组成员配置》  
        function startStateWF(type) {
            var param = {};
            if (type == "项目组成员配置") {
                param = {
                    actionType: 2, packageName: 'EPMSProjResourceAppoint.xpdl', xpdlId: 'EPMSProjResourceAppoint_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProjResourceAppoint.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationId%>'
                }
            } else if (type == "项目组成员变更") {
                param = {
                    actionType: 2, packageName: 'EPMSProjMemberChange.xpdl', xpdlId: 'ProjMemberChange_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProjMemberChange.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationId%>'
                }
            } else if (type == "跨分院专业审核委托") {
                param = {
                    actionType: 2, packageName: 'EPMSProfessionalAuditEntrustment.xpdl', xpdlId: 'EPMSProfessionalAuditEntrustment_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProfessionalAuditEntrustment.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationId%>'
                }
            }
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", param);
            window.open(url);   
            return false;
        }
        //查看
        function ViewFormInfo(businessID) {
            if (businessID) {
                var urlStr = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: businessID });
                window.open(urlStr);
            } else {
                alert("未找到流程数据");
            }
            return false;
        }

        //初始化人员任务数量信息
        function initUserTaskCnt() {
            var userIds = '';
            $('#<%=gvAll.ClientID%> [flag="currWork"]').each(function () {
                var userId = $(this).attr('userid');
                userIds += userId + ',';
            });
            userIds = userIds.substring(0, userIds.length - 1);

            $.post("<%=WebAppPath %>" + "/EPMS/List/OBS/CurrentTaskDetailList.aspx",
                { asyfunc: "GetUserTaskCnt", struserID: userIds },
                function (res) {
                    var task = eval(res);
                    var len = task.length;

                    $('#<%=gvAll.ClientID%> [flag="currWork"]').each(function () {
                        var userId = $(this).attr('userid');
                        for (var i = 0; i < len; i++) {
                            var t = task[i];
                            if (t.id == userId) {
                                var cnt = t.value;
                                var color = ''
                                if (cnt < 10) {
                                    color = 'green';
                                }
                                else if (cnt >= 10 && cnt < 20) {
                                    color = 'yellow';
                                }
                                else if (cnt >= 20) {
                                    color = 'red';
                                }

                                var imgUrl = '/Themes/Images/load' + color + '.png';
                                imgUrl = buildQueryUrl(imgUrl, null);
                                //根据负荷数量，设置不同颜色图标
                                $(this).attr('src', imgUrl);

                                break;
                            }
                        }
                    });
                }
            );
        }

        //针对某个模板进行标准表单打印
        //打印
        function stdPrint(exportId, businessId) {
            var url = buildQueryUrl($appCtx.appPath + "/WHHelper/SOA/ExportService.aspx", { exportId: exportId, businessId: businessId });
            window.open(url);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
