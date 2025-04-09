<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptProjectSpecList.aspx.cs"
    Title="科室下项目" Inherits="Zhongsoft.Portal.EPMS.List.Project.DeptProjectSpecList"
    MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">专业完成情况</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlSpecComplete" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
            <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lkbsetUsers" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClientClick="return setUsers()"><span>配置人员</span></asp:LinkButton>
    <%--  <asp:LinkButton ID="lbtnDeptPlan" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClientClick="return viewDeptProjPlan()" ><span>安排计划</span></asp:LinkButton>--%>
    <%-- <asp:LinkButton ID="lkbWorkDay" runat="server" OnClientClick="return workDayConfirm()"
        EnableTheming="false" CssClass="btn-query" Visible="false"><span>确认定额工天</span></asp:LinkButton>--%>
    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return viewUserWorkDay()"
        EnableTheming="false" CssClass="btn-query"><span>生产人员工作查询</span></asp:LinkButton>
    <asp:LinkButton ID="lkbProjectPlan" runat="server" OnClientClick="return viewProjectPlan()"
        EnableTheming="false" CssClass="btn-query"><span>项目计划</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="OrganizationId" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound" EmptyDataText="没有要查找的数据" OnSorting="gvList_Sorting"
        OnRowCommand="gvList_RowCommand" HideFieldOnExport="全选,项目网站,关注" OnExport="gvList_Export"
        OnBeforeExporting="gvList_BeforeExporting">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridView">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderStyle-Width="25px" HeaderText="关注">
                <ItemTemplate>
                    <%# Eval("AttenTionUrl").ToString()%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="25px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目网站" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath %>/Themes/Images/fhome.png" onclick =" return ViewProjectPortal('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="通讯录" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnProjectUser" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/ico_part.png" onclick =" return openProjectUser('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="OrganizationId" HeaderText="OrganizationId"
                Visible="False">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="100px"
                SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px" SortExpression="ProjectName">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("OrganizationId") %>')" title='<%# Eval("ProjectName")%>'
                        style="color: Blue">
                        <%#Eval("ProjectName").ToString().Length > 25 ? Eval("ProjectName").ToString().Substring(0, 24) + "..." : Eval("ProjectName")%>
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <%--<zhongsoft:LightBoundField DataField="ProjectCompleteRate" HeaderText="项目进度" DataFormatString="{0:N2}%"
                SortExpression="CompleteRate">
                <ItemStyle Width="60px" HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightTemplateField HeaderText="项目进度" ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbCompleteRate" runat="server" OnClientClick='<%# String.Format("return openProjectSchedule(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                    <input type="hidden" id="hiCompleteRate" runat="server" value='<%#Eval("ProjectCompleteRate") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计完成情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span RollCompleteInfo='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口完成情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFlieInfo" runat="server" OnClientClick='<%# String.Format("return openFileList(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span FileCompleteInfo='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
           <%-- <zhongsoft:LightTemplateField HeaderText="定额完成情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWorkDayInfo" runat="server" OnClientClick='<%# String.Format("return openWorkDay(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue">
                    <span workdayinfo='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightTemplateField HeaderText="存在问题">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbProblem" runat="server" OnClientClick='<%# String.Format("return openProjectSchedule(\"{0}\",\"{1}\")", Eval("OrganizationID"),"problem") %>'
                        EnableTheming="false" ForeColor="Blue"><span problems='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectState" HeaderText="项目状态" HtmlEncode="false"
                SortExpression="ProjectState">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <!-- 选择关注项目xml-->
    <input type="hidden" runat="server" id="hiProjXML" />
    <!-- 添加关注项目后台调用-->
    <asp:Button runat="server" ID="btnAddProjs" OnClick="btnAddProjs_Click" Visible="false" />
    <input type="hidden" id="hiMyContentProject" runat="server" value="0" />
    <script type="text/javascript">
        var title = "在任务距完成日期还有" + "<%=RollWaringDates %>" + "天时给出到期提醒，并标黄所在行的背景色。任务延期给出延期提醒，并标红所在行背景色";
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initPagePlugin() {
            initAttention();
            getWBSCompleteInfo();
            setProblems();
            checkGridView();
        }

        function checkGridView() {
            var proIDs = $("#" + $gridCheckedClientID).val();
            if (proIDs.length > 36 && proIDs.length < 72) {
                $("#<%=lkbsetUsers.ClientID %>").show();
            } else {
            $("#<%=lkbsetUsers.ClientID %>").hide();
            }
        }

        //打开项目进度填报
        function openProjectSchedule(projectID, pageType) {
            var url = buildQueryUrl("/EPMS/List/Project/ProjectScheduleList.aspx", { secid: '5580137F-4AE6-4C8E-A6D8-C486C661C538', OrganizationID: projectID, AllOrProblem: pageType });
            showDivDialog(url, null, 1000, 600, editProjectCallBack);
            return false;
        }

        //部门工作负荷
        function openDeptWork() {
            var url = buildQueryUrl("/EPMS/List/Sys/WorkloadOfDeptMonthList.aspx", { DeptID: "<%=DeptID %>", OrgUnitID: "<%=OrgUnitID %>", secid: '73462074-7233-4990-BC24-B79F505A7719' });
            showDivDialog(url, null, 800, 500, editProjectCallBack);
            return false;
        }

        //新建子项
        function addNewProject() {
            var ids = $("#" + $gridCheckedClientID).val();
            var organizationID = "";
            if (ids.length > 36 && ids.length < 72) {
                ids = ids.replace("[", "").replace("]", "").replace(/\"/g, "");
                organizationID = ids;
            }
            if (organizationID != null) {
                var url = buildQueryUrl("/EPMS/List/Project/ProjectEditor.aspx", { actionType: 2, newType: 'sub', ParentID: organizationID });
            } else {
                var url = buildQueryUrl("/EPMS/List/Project/ProjectEditor.aspx", { actionType: 2, newType: 'sub' });
            }
            showDivDialog(url, null, 1000, 600, editProjectCallBack);
            return false;
        }


        //异步加载卷册、资料完成情况和提心信息
        function getWBSCompleteInfo() {
            var complete = $("#<%=ddlSpecComplete.ClientID %> option:selected").val();
            var $ids = "";
            $("#<%=gvList.ClientID %> span[RollCompleteInfo]").each(function () {
                $ids += $(this).attr("RollCompleteInfo") + "|";
            });
            $.post("DeptProjectSpecList.aspx",
                 { asyfunc: "GetRollCompleteInfo", orgIdList: $ids, orgUnitID: "<%=OrgUnitID %>", deptID: "<%=DeptID %>", specID: "<%=SpecialtyId %>", specComplete: complete },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //设计完成情况
                     $("#<%=gvList.ClientID %> span[RollCompleteInfo]").each(function () {
                         var $orgID = $(this).attr("RollCompleteInfo");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $rollCompleteInfo = $l[i][1];
                             if ($orgID == $id) {
                                 if ($rollCompleteInfo == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($rollCompleteInfo);
                                     if ($rollCompleteInfo.indexOf("延期") > 0) {
                                         $(this).attr("class","wbsWarning");
                                     } else if ($rollCompleteInfo.indexOf("到期") > 0) {
                                         $(this).attr("class","wbsRemind");
                                     }
                                     $(this).attr("title", title);
                                 }
                             }
                         }
                     });
                     //接口完成情况 FileCompleteInfo
                     $("#<%=gvList.ClientID %> span[FileCompleteInfo]").each(function () {
                         var $orgID = $(this).attr("FileCompleteInfo");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $fileCompleteInfo = $l[i][3];
                             if ($orgID == $id) {
                                 if ($fileCompleteInfo == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($fileCompleteInfo);
                                     if ($fileCompleteInfo.indexOf("延期") > 0) {
                                         $(this).attr("class","wbsWarning");
                                     } else if ($fileCompleteInfo.indexOf("到期") > 0) {
                                         $(this).attr("class","wbsRemind");
                                     }
                                     $(this).attr("title", title);
                                 }
                             }
                         }
                     });
                 }
                );
        }

        //查看项目网站
        function ViewProjectPortal(OrganizationID) {
//            var url = "../ProjectPortal/ProjectHomePage.aspx?projectPhaseID=" + OrganizationID;

             var url = "<%=WebAppPath%>/CatalogTree/EPMSFileTree.aspx?organizationID=" + OrganizationID;
            window.open(url);
            return false;
        }

        function ViewItem(OrganizationID) {
            var url = "/EPMS/List/Project/ProjectEditor.aspx";
            var json = { actionType: 1, bizId: OrganizationID };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }

        function editProject() {
            var proIDs = $("#" + $gridCheckedClientID).val();
            if (proIDs.length < 36) {
                alert("请勾选要维护的项目");
            } else {
                //打开编辑页面
                var url = buildQueryUrl("/EPMS/List/Project/ProjectStateEditor.aspx", { bizids: proIDs, actionType: 3, RoleName: 'Sz' });
                showDivDialog(url, null, 700, 400, editProjectCallBack);
            }
            return false;
        }

        //打开卷册目录 项目ID、专业ID
        function openRollList(orgID, showWaringRow) {
            var deptID = "<%=DeptID %>";

            var specID = "<%=SpecialtyId %>";
            var complete = $("#<%=ddlSpecComplete.ClientID %> option:selected").val();
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowRollEdit: 'true', IsShowWorkDay: 'true', DeptID: deptID, SpecialtyID: specID, SpecialtyComplete: complete });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);

            return false;
        }

        function openFileList(orgID, showWaringRow) {
            var deptID = "<%=DeptID %>";

            var specID = "<%=SpecialtyId %>";
            var url = buildQueryUrl("/EPMS/List/WBS/C_MutualFileList.aspx", { OrganizationID: orgID, secid: '58799f61-7761-43e8-961f-4ca93fa67039', IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowRollEdit: 'true', DeptID: deptID, SpecialtyID: specID });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);

            return false;
        }

        //打开项目定额
//        function openWorkDay(orgID) {
//            var deptID = "<%=DeptID %>";
//            var orgUnitID = "<%=OrgUnitID %>";
//            var specID = "<%=SpecialtyId %>";
//            var url = buildQueryUrl("/EPMS/List/Sys/WorkloadOfProjectList.aspx", { OrganizationID: orgID, secid: '95C9998E-AF2F-4508-867F-9C72064748C3', DeptID: deptID, SpecialtyID: specID, OrgUnitID: orgUnitID });
//            showDivDialog(url, null, 1200, 600, editProjectCallBack);

//            return false;
//        }

        function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }

        //批量添加关注项目
        function batchAddProj() {
            var param = new InputParamObject("m");
            getDivProjectNew('<%=hiProjXML.ClientID %>', param, null, addProjs);

            return false;
        }
        //将选择的项目添加到我的关注项目中
        function addProjs() {
            //<%=Page.ClientScript.GetPostBackEventReference(this.btnAddProjs,"")%>;
        }

        //关注
        function initAttention() {
            $('[state="attetion"]').each(function () {
                $(this).bind("click", function () {
                    formAttention($(this).attr("projectID"), $(this).attr("projectCode"), $(this).attr("projectName"), $(this).attr("type"), $(this))
                });
            });
            $('[state="MyContent"]').each(function () {
                $(this).bind("click", function () {
                    var $type = $(this).attr("type");
                    if ("add" == $type) { //加载关注的      
                        $("#<%=hiMyContentProject.ClientID %>").val("1");
                    }
                    else {//加载所有             
                        $("#<%=hiMyContentProject.ClientID %>").val("0");
                    }
                    $("[id$='btnQuery']")[0].click();
                });
            });
        }



        function formAttention(projectID, projectCode, projectName, type, img) {
            var userId = '<%=KPMSUser.Id %>';
            $.ajax({
                type: "POST",
                url: buildQueryUrl("EPMS/List/Project/ProjectList.aspx", null),
                data: { asyfunc: "AddConditionProject", projectID: projectID, projectCode: projectCode, projectName: projectName, userId: userId, type: type },
                async: false,
                success: function (result) {
                    var $type;
                    if ("add" == type) {
                        $type = "cancel";
                        img.attr("title", "已关注,点击取消关注");
                        img.attr("src", "/Portal/Themes/Images/btn_attention.png");
                    }
                    else {
                        $type = "add";
                        img.attr("title", "未关注,点击加关注");
                        img.attr("src", "/Portal/Themes/Images/btn_notattention.png");
                    }
                    //为按钮添加文本、click事件
                    img.unbind("click");
                    img.bind("click", function () {
                        formAttention(projectID, projectCode, projectName, $type, img)
                    });
                }
            });
        }


//        //查看项目的综合计划书信息
//        function viewDeptProjPlan() {
//            var url = buildBizUrl(3, null, "/Custom/List/Dashboard.aspx", {listId:'DDAE1702-DBCB-49C4-952B-321C9DFC09A6',IsShowHeader:2});
//            //showDivDialog(url, null, 1000, 600, null);
//            window.open(url);
//            return false;
//        }

//        function workDayConfirm() {
//            var url = buildQueryUrl("/EPMS/List/WBS/WBSWorkDayConfirmEditor.aspx", { actionType: 2 });
//            showDivDialog(url, null, 1200, 600, editProjectCallBack);
//            return false;
//        }

        //打开配置人员页面
        function setUsers() {
            //如果当前项目有当前人项目组成员配置的待办则打开待办直接处理发送
            //其他状态都打开项目组成员配置编辑页
            var projectID = "";
            var proIDs = $("#" + $gridCheckedClientID).val();
            if (proIDs.length > 36 && proIDs.length < 72) {
                var projectID = proIDs.replace("[", '""').replace("]", '""');
                projectID = projectID.replace(/\"/g, "");
            }
            var userID = "<%=KPMSUser.Id %>";
            $.post("DeptProjectSpecList.aspx",
                 { asyfunc: "GetUserSetWorkFlow", ProjectID: projectID, UserID: userID, FormID: "138" },
                 function (res) {
                     if (res == "") {
                         //打开编辑页面
                         var url = buildQueryUrl("/EPMS/List/OBS/ProjectTeamMemberEditor.aspx", { OrganizationId: projectID, actionType: 3 });
                         showDivDialog(url, null, 1050, 650, editProjectCallBack);
                     } else {
                         //打开流程
                         var url = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: res });
                         window.open(url);
                     }


                 }
                );

            return false;
        }

        //异步添加存在问题
        function setProblems() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[problems]").each(function () {

                $ids += $(this).attr("problems") + "|";
            });
            $.post("DeptProjectSpecList.aspx",
                 { asyfunc: "GetProblemsInfo", orgIdList: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //设计完成情况
                     $("#<%=gvList.ClientID %> span[problems]").each(function () {
                         var $orgID = $(this).attr("problems");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $problemsInfo = $l[i][1];
                             if ($orgID == $id) {
                                 if ($problemsInfo == "") {
                                     $(this).html("更多");
                                 }
                                 else {
                                     var info = $problemsInfo;
                                     if (info.length >= 7) {
                                         info = info.substring(0, 6) + "...";
                                         $(this).html(info);
                                         $(this).attr('title', $problemsInfo);
                                     } else {
                                         $(this).html($problemsInfo);
                                     }
                                 }
                             }
                         }
                     });

                 }
                );
        }
        function openProjectUser(orgID) {

            var url = buildQueryUrl("/EPMS/List/OBS/ProjectTeamMemberList.aspx", { IsPortal: true, MenuId: '241155B8-33F5-4D56-8A94-B5D6C2337320', OrganizationID: orgID });
            showDivDialog(url, null, 1200, 600, null);
            return false;
        }   

        function viewUserWorkDay() {
            var deptID="<%=DeptID %>";
            if(deptID==""|| deptID==undefined){
            deptID="<%=OrgUnitID %>";
            }
            var url = buildQueryUrl("/Custom/List/Dashboard.aspx", { DeptID:deptID ,listId:'C188FA56-5BB4-4490-A3F6-D00C9BE481CA',IsShowHeader:2 });
            window.open(url);
            return false;
        }
        function viewProjectPlan() {
            
            var url =  buildQueryUrl("/Custom/List/Dashboard.aspx", { listId:'D7B0CDE9-A017-45CF-9F06-73AF008654A9',IsShowHeader:2 });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="treeView">
</asp:Content>
