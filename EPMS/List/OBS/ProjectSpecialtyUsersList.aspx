<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectSpecialtyUsersList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.OBS.ProjectSpecialtyUsersList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="人员安排" %>

<%@ Register Src="../../UI/WBS/WBSUser.ascx" TagName="WBSUser" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span> <span>
        <asp:TextBox ID="tbName" runat="server" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <span style="margin-top: 8px;">当前科室：
        <asp:Label runat="server" ID="lbDeptGroupInfo"></asp:Label></span>
    <asp:LinkButton runat="server" ID="btnStartFlow" CssClass="btn-query" EnableTheming="false"
        OnClientClick="return startFlow();" Visible="false">
        <span>发起流程</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnPersonState" CssClass="btn-query" EnableTheming="false"
        OnClientClick="return viewUserState();">
        <span>人员状态</span>
    </asp:LinkButton><asp:LinkButton runat="server" ID="btnHasConfig" CssClass="btn-query"
        EnableTheming="false" OnClick="btnHasConfig_Click">
                    <span>已配置人员</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <input type="hidden" runat="server" id="hiType" value="true" />
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
        runat="server" ShowPageSizeChange="true" UseDefaultDataSource="true" OnRowDataBound="gvRemibure_RowDataBound"
        AllowSorting="true" OnSorting="gvRemibure_Sorting" OnRowCommand="gvWBS_RowCommand"
        DataKeyNames="OrganizationID" Width="100%">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="操作" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiProjectSpecialtyID" value='<%#Eval("ProjectSpecialtyID") %>' />
                    <asp:LinkButton ID="lbtnConfig" runat="server" EnableTheming="false" CommandName="Config">
                        <a id="aConfig" onclick="configProjUsers('<%#Eval("OrganizationID") %>')">配置</a>
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnChange" runat="server" EnableTheming="false">
                        <a id="aChange" onclick="changeProjUsers('<%#Eval("OrganizationID") %>')">变更</a>
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnBill" runat="server" EnableTheming="false">
                        <a id="aBill" onclick="viewProjUsers('<%#Eval("ProjectResourceID") %>')">审批单</a>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目名称/编号" ItemStyle-Width="200px" SortExpression="ProjectCode">
                <ItemTemplate>
                    <%#string.Format("{1}（{0}）", Eval("ProjectCode"), Eval("ProjectName"))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总" SortExpression="ManagerUserName"
                Width="50" />
            <zhongsoft:LightTemplateField HeaderText="专业" SortExpression="SpecialtyName" ItemStyle-Width="50px">
                <ItemTemplate>
                    <%#string.Format("{0}{1}", Eval("SpecialtyCode"), Eval("SpecialtyName"))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计完成情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\",\"{1}\",\"0\")", Eval("OrganizationID"), Eval("ParamSpecialtyID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span title="在卷册或是资料任务在距完成日期还有3天时或是已延期时给出提醒，并标红所在行的背景色" RollCompleteInfo='<%#Eval("OrganizationId") %>;<%#Eval("ParamSpecialtyID") %>'></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="200px" />
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口完成情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFlieInfo" runat="server" OnClientClick='<%# String.Format("return openFileList(\"{0}\",\"{1}\",\"0\")", Eval("OrganizationID"), Eval("ParamSpecialtyID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span FileCompleteInfo='<%#Eval("OrganizationId") %>;<%#Eval("ParamSpecialtyID") %>''></span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="200px" />
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="主任工">
                <ItemTemplate>
                    <asp:Label ID="lbZRG" runat="server"></asp:Label>
                    <zhongsoft:LightObjectSelector runat="server" ID="txtZRG" SourceMode="SelectorPage"
                        IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                        EnableTheming="false" ShowAttrs="name,UserCode" ResultForControls="{'hiZRGId':'id'}"
                        PageWidth="850" SelectPageMode="Dialog" OnClick="btn_UpdateUser" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                    </zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiZRGId" />
                </ItemTemplate>
                <ItemStyle Width="200px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="主设人">
                <ItemTemplate>
                    <asp:Label ID="lbZSR" runat="server"></asp:Label>
                    <zhongsoft:LightObjectSelector runat="server" ID="txtZSR" SourceMode="SelectorPage"
                        IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                        EnableTheming="false" ShowAttrs="name,UserCode" ResultForControls="{'hiZSRId':'id'}"
                        PageWidth="850" SelectPageMode="Dialog" OnClick="btn_UpdateUser" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                    </zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiZSRId" />
                </ItemTemplate>
                <ItemStyle Width="200px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="工代">
                <ItemTemplate>
                    <asp:Label ID="lbGD" runat="server"></asp:Label>
                    <zhongsoft:LightObjectSelector runat="server" ID="txtGD" SourceMode="SelectorPage"
                        IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                        EnableTheming="false" ShowAttrs="name,UserCode" ResultForControls="{'hiGDId':'id'}"
                        PageWidth="850" SelectPageMode="Dialog" OnClick="btn_UpdateUser" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                    </zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiGDId" />
                </ItemTemplate>
                <ItemStyle Width="200px" />
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWBS.CheckedClientID %>";
        function initPagePlugin() {
            GetWBSCompleteInfo();
        }

        function GetWBSCompleteInfo() {
            var $ids = "";
            $("#<%=gvWBS.ClientID %> span[RollCompleteInfo]").each(function () {
                $ids += $(this).attr("RollCompleteInfo") + "|";
            });
            $.post("/Portal/EPMS/List/Project/ProjectListZsr.aspx",
                 { asyfunc: "GetRollCompleteInfo", orgIdList: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //设计完成情况:X/X xx% 到期（）延期（）
                     $("#<%=gvWBS.ClientID %> span[RollCompleteInfo]").each(function () {
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
                                         $(this).parent().parent().parent().css('background-color', 'red');
                                     } else if ($rollCompleteInfo.indexOf("到期") > 0) {
                                         $(this).parent().parent().parent().css('background-color', 'yellow');
                                     }
                                 }
                             }
                         }
                     });
                     //接口完成情况 FileCompleteInfo
                     $("#<%=gvWBS.ClientID %> span[FileCompleteInfo]").each(function () {
                         var $orgID = $(this).attr("FileCompleteInfo");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $fileCompleteInfo = $l[i][4];
                             if ($orgID == $id) {
                                 if ($fileCompleteInfo == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($fileCompleteInfo);
                                     if ($fileCompleteInfo.indexOf("延期") > 0) {
                                         $(this).parent().parent().parent().css('background-color', 'red');
                                     } else if ($fileCompleteInfo.indexOf("到期") > 0) {
                                         $(this).parent().parent().parent().css('background-color', 'yellow');
                                     }
                                 }
                             }
                         }
                     });
                 }
                );
        }

        //打开卷册目录 项目ID、专业ID
        function openRollList(orgID, SpeID, showWaringRow) {
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: orgID, SpecialtyID: SpeID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowWorkDay: 'true', IsShowRollEdit: 'true' });
            showDivDialog(url, null, 1200, 600, null);

            return false;
        }

        function openFileList(orgID, SpeID, showWaringRow) {

            var url = buildQueryUrl("/EPMS/List/WBS/C_MutualFileList.aspx", { OrganizationID: orgID, SpecialtyID: SpeID, secid: '58799f61-7761-43e8-961f-4ca93fa67039', IsShowAllButn: 'false', IsShowRollEdit: 'true', ShowWaringRow: showWaringRow });
            showDivDialog(url, null, 1200, 600, null);

            return false;
        }


        //发起流程
        function startFlow() {
            var url = "/Sys/Workflow/FormTemplateList.aspx";
            var json = { DefaultWFType: encodeURI("生产管理"), IsShowHeader: 1 };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
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

        //跳转到项目组成员配置流程页面
        function viewProjUsers(projResourceId) {
            if (projResourceId == "") { alert("暂无项目组成员配置审批单！"); return false; }
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: projResourceId, isOld: 0 };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        //变更：打开项目组成员变更流程页面
        function changeProjUsers(orgId) {
            var url = '/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSProjResourceChange.xpdl&xpdlId=ProjResourceChange_wp1&formId=146&ver=|';
            var json = { OrganizationId: orgId };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        //配置编辑页面
        function configProjUsers(orgId) {
            var url = "/EPMS/List/OBS/ProjectTeamMemberEditor.aspx";
            var json = { OrganizationId: orgId, actiontype: 3 };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 650);
            return true;
        }

        function selUserFilter(orgId, speId, roleId) {
            return { RoleID: roleId, OrganizationID: orgId, SpecialtyID: speId };
        }
        
    </script>
</asp:Content>
