<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectListSjr.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectListSjr" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="担任设计人" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目状态</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectComleteInfo" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">设计完成情况</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlCompleteInfo" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lkbSchedule" runat="server" OnClientClick="return reportSchedule()"
        EnableTheming="false" CssClass="btn-query" Visible="false"><span>进度填报</span></asp:LinkButton>
    <asp:LinkButton ID="lkbDesginControl" runat="server" EnableTheming="false" CssClass="btn-query" Visible="false"
        OnClientClick="return openDesginControl()"><span>设计过程控制</span></asp:LinkButton>
    <asp:LinkButton ID="lkbAddAlert" OnClientClick="return addPortalAlert()" runat="server" Visible="false"
        EnableTheming="false" CssClass="btn-query"><span>发送提醒</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="OrganizationId" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound" EmptyDataText="没有要查找的数据" HideFieldOnExport="全选,项目网站,通讯录"
        OnExport="gvList_Export" OnBeforeExporting="gvList_BeforeExporting">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="项目网站" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/fhome.png" onclick =" return ViewProjectPortal('<%#Eval("OrganizationId") %>');" />
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
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="300px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbProjectName" Text='<%# Eval("ProjectName").ToString()%>'
                        EnableTheming="false" ForeColor="Blue">
                    </asp:LinkButton>
                    <input type="hidden" id="hiOrganizationId" runat="server" value='<%#Eval("OrganizationId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px">
                <ItemTemplate>
                    <a onclick="return ViewProjectPortal('<%#Eval("OrganizationId") %>');" title='<%# Eval("ProjectName")%>'
                        style="color: Blue">
                        <%#Eval("ProjectName").ToString().Length > 25 ? Eval("ProjectName").ToString().Substring(0, 24) + "..." : Eval("ProjectName")%>
                    </a>
                    <input type="hidden" id="hiOrganizationId" runat="server" value='<%#Eval("OrganizationId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="阶段" DataField="PhaseName" ItemStyle-Width="200px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCompleteInfo" HeaderText="项目进度">
                <ItemStyle Width="60px" HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设计（完成/总数）">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span  RollCompleteInfo='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计完成率">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbRollCompleteRate"><span rollcompleterate='<%#Eval("OrganizationId") %>'></span></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计延期情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbRollCompleteAlert" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\",1)", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span  RollCompleteAlert='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口（完成/总数）">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFlieInfo" runat="server" OnClientClick='<%# String.Format("return openFileList(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span FileCompleteInfo='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口完成率">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFileCompleteRate"><span Filecompleterate='<%#Eval("OrganizationId") %>'></span></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口延期情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFileCompleteAlert" runat="server" OnClientClick='<%# String.Format("return openFileList(\"{0}\",1)", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span FilecompleteAlert='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
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
            <zhongsoft:LightBoundField DataField="ProjectState" HeaderText="项目状态" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ContractState" HeaderText="合同状态" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <script type="text/javascript">    
        var title = "在任务距完成日期还有" + "<%=RollWaringDates %>" + "天时给出到期提醒，并标黄所在行的背景色。任务延期给出延期提醒，并标红所在行背景色";
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initPagePlugin() {
            GetWBSCompleteInfo();
        }
        function addPortalAlert() {
             var ids = $("#" + $gridCheckedClientID).val();
            var organizationID = "";
            if (ids.length > 36 && ids.length < 72) {
                ids = ids.replace("[", "").replace("]", "").replace(/\"/g, "");
                organizationID = ids;
            }
            var url = buildQueryUrl("/EPMS/List/Sys/PortalAlertEditor.aspx", { actionType: 2, OrganizationID: organizationID });
            showDivDialog(url, null, 800, 500, null);
            return false;
        }

        //打开项目定额
//        function openWorkDay(orgID) {
//            var url = buildQueryUrl("/EPMS/List/Sys/WorkloadOfProjectList.aspx", { OrganizationID: orgID, secid: '95C9998E-AF2F-4508-867F-9C72064748C3', UserID: "<%=KPMSUser.Id %>" });
//            showDivDialog(url, null, 1200, 600, editProjectCallBack);

//            return false;
//        }

        //异步加载卷册、资料完成情况和提心信息
        function GetWBSCompleteInfo() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[RollCompleteInfo]").each(function () {
                $ids += $(this).attr("RollCompleteInfo") + "|";
            });
            $.post("ProjectListSjr.aspx",
                 { asyfunc: "GetRollCompleteInfo", orgIdList: $ids, userID: "<%=KPMSUser.UserId %>" },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //设计（完成/总数）
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
                                 }
                             }
                         }
                     });
                     //设计完成率
                     $("#<%=gvList.ClientID %> span[rollcompleterate]").each(function () {
                         var $orgID = $(this).attr("rollcompleterate");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $rollcompleterate = $l[i][2];
                             if ($orgID == $id) {
                                 if ($rollcompleterate == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($rollcompleterate);                                     
                                 }
                             }
                         }
                     });

                     //设计延期情况
                     $("#<%=gvList.ClientID %> span[RollCompleteAlert]").each(function () {
                         var $orgID = $(this).attr("RollCompleteAlert");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $rollCompleteAlert = $l[i][3];
                             if ($orgID == $id) {
                                 if ($rollCompleteAlert == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($rollCompleteAlert);
                                     if ($rollCompleteAlert.indexOf("延期") > 0) {
                                         $(this).attr("class","wbsWarning");
                                     } else if ($rollCompleteAlert.indexOf("到期") > 0) {
                                         $(this).attr("class","wbsRemind");
                                     }
                                     $(this).attr("title", title);
                                 }
                             }
                         }
                     });
                     
                     //接口（完成/总数）
                     $("#<%=gvList.ClientID %> span[FileCompleteInfo]").each(function () {
                         var $orgID = $(this).attr("FileCompleteInfo");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $fileCompleteInfo = $l[i][4];
                             if ($orgID == $id) {
                                 if ($fileCompleteInfo == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($fileCompleteInfo);                                    
                                 }
                             }
                         }
                     });
                     //接口完成率
                     $("#<%=gvList.ClientID %> span[Filecompleterate]").each(function () {
                         var $orgID = $(this).attr("Filecompleterate");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $filecompleterate = $l[i][5];
                             if ($orgID == $id) {
                                 if ($filecompleterate == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($filecompleterate);                                     
                                 }
                             }
                         }
                     });

                     //接口延期情况
                      $("#<%=gvList.ClientID %> span[FilecompleteAlert]").each(function () {
                         var $orgID = $(this).attr("FilecompleteAlert");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $filecompleteAlert = $l[i][6];
                             if ($orgID == $id) {
                                 if ($filecompleteAlert == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($filecompleteAlert);
                                     if ($filecompleteAlert.indexOf("延期") > 0) {
                                         $(this).attr("class","wbsWarning");
                                     } else if ($filecompleteAlert.indexOf("到期") > 0) {
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
            var url = "/EPMS/List/Project/ProjectEditorNew.aspx";
            var json = { actionType: 1, bizId: OrganizationID,IsMyProJect:1 };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }

        //打开卷册目录 项目ID、专业ID
        function openRollList(orgID, showWaringRow) {
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', UserID: '<%=KPMSUser.UserId %>', IsShowAllButn: 'false', IsShowRollEdit: 'false', ShowWaringRow: showWaringRow, IsShowSchedule: 'true',IsShowLbtnApprove:'false',IsShowBtnAdd:'false' });
            showDivDialog(url, null, 1250, 600, editProjectCallBack);

            return false;
        }

        function openFileList(orgID, showWaringRow) {
            var roleName = "Sjr";
            var url = buildQueryUrl("/EPMS/List/WBS/C_MutualFileList.aspx", { OrganizationID: orgID, secid: '58799f61-7761-43e8-961f-4ca93fa67039', UserID: "<%=KPMSUser.Id %>", ShowWaringRow: showWaringRow });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);

            return false;
        }

        //填报进度
        function reportSchedule() {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSWorkScheduleReportEditor.aspx", { actionType: 2 });
            showDivDialog(url, null, 1024, 600, editProjectCallBack);
            return false;
        }

        function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }

        function openProjectUser(orgID) {

            var url = buildQueryUrl("/EPMS/List/OBS/ProjectTeamMemberList.aspx", { IsPortal: true, MenuId: '241155B8-33F5-4D56-8A94-B5D6C2337320', OrganizationID: orgID });
            showDivDialog(url, null, 1200, 600, null);
            return false;
        }
        function openDesginControl(){
            var url = buildQueryUrl("/Custom/LIST/Dashboard.aspx", { ListId: '63d34c07-c157-498f-8ecc-5e2f5c5891c0', ViewId: 'c34caa34-6b79-403f-ad85-c8c392450d47', secid: 'E99D5B02-623F-4C39-8B01-BC1A9BD646BB',RoleName:'sjr',IsDashboard:1,ShowToolbar:0,IsShowHeader:2 });
            window.open(url);
            return false;
        }    

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
