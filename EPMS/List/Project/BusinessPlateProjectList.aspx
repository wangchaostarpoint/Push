<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessPlateProjectList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.BusinessPlateProjectList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="项目清单" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目状态</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectComleteInfo" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">业务板块</span> <span>
        <zhongsoft:LightDropDownList ID="ddlBusinessPlate" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
        <%--<asp:CheckBoxList ID="cblPhase" runat="server" RepeatColumns="7">
        </asp:CheckBoxList>--%>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目牵头分院</span> <span>
        <zhongsoft:LightDropDownList ID="ddlHostDeptName" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目设总</span> <span>
        <asp:TextBox ID="tbProjectManger" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目总工</span> <span>
        <asp:TextBox ID="tbZG" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">立项时间</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block"><span class="filter-block-lb">启动时间</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartQDDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="txtEndQDDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <br />
    <span class="filter-block"><span class="filter-block-lb">是否创优</span> <span>
        <zhongsoft:LightDropDownList ID="ddlIsGood" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Value="" Selected="True">全部</asp:ListItem>
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="0">否</asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">设计规模</span> <span>
        <asp:TextBox ID="tbProjectScale" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">业主信息</span> <span>
        <asp:TextBox ID="tbCustonmer" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">院计划进度</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtInnerCompleteDateStart" runat="server" class="kpms-textbox-comparedate"
                compare="1" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <zhongsoft:XHtmlInputText ID="txtInnerCompleteDateEnd" runat="server" class="kpms-textbox-comparedate"
                compare="1" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </span></span><span class="filter-block"><span class="filter-block-lb">实际完成时间</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtFactStart" runat="server" class="kpms-textbox-comparedate"
                    compare="2" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <zhongsoft:XHtmlInputText ID="txtFactEnd" runat="server" class="kpms-textbox-comparedate"
                    compare="2" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="OrganizationId,CustomerID" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound" EmptyDataText="没有要查找的数据" HideFieldOnExport="全选,项目网站,关注,通讯录"
        OnExport="gvList_Export" OnBeforeExporting="gvList_BeforeExporting">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightTemplateField HeaderStyle-Width="25px" HeaderText="关注">
                <ItemTemplate>
                    <%# Eval("AttenTionUrl").ToString()%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="25px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
             <zhongsoft:LightTemplateField HeaderText="项目状态">
                <ItemTemplate>
                    <zhongsoft:LightDropDownList ID="ddlProjectState" runat="server" Width="100px" flag="ddlProjectState" orgProjectState='<%# Eval("ProjectState") %>' flagID='<%# Eval("OrganizationID") %>'>
                    </zhongsoft:LightDropDownList>
                    <input type="hidden" runat="server" id="hiProjectState" value='<%# Eval("ProjectState") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="是否需要<br/>批复文件">
                <ItemTemplate>
                    <zhongsoft:LightDropDownList ID="ddlIsNeedApprovalDoc" runat="server" Width="50px" flag="ddlIsNeedApprovalDoc" orgIsNeedApprovalDoc='<%# Eval("IsNeedApprovalDoc") %>' flagID='<%# Eval("OrganizationID") %>'>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                    </zhongsoft:LightDropDownList>
                    <input type="hidden" runat="server" id="hiIsNeedApprovalDoc" value='<%# Eval("IsNeedApprovalDoc") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目网站" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/fhome.png" onclick =" return viewProjectPortal('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center"
                Visible="false" ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView1" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif" onclick="return viewItem('3','<%#Eval("OrganizationId") %>')" />
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
            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px">
                <ItemTemplate>
                    <a onclick="return viewProjectPortal('<%#Eval("OrganizationId") %>');" title='<%# Eval("ProjectName")%>'
                        style="color: Blue">
                        <%#Eval("ProjectName").ToString().Length > 25 ? Eval("ProjectName").ToString().Substring(0, 24) + "..." : Eval("ProjectName")%>
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="HostDeptName" HeaderText="项目牵头分院" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="&nbsp;&nbsp;&nbsp;项目设总B&nbsp;&nbsp;&nbsp;"
                HeaderStyle-Width="100px" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lbSzb" runat="server">
                    <span szb='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectScale" HeaderText="设计规模" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FormDate" HeaderText="立项日期" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="项目类型" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectFlag" HeaderText="项目标识" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="业主名称" ItemStyle-Width="200px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbCustomer" runat="server" OnClientClick='<%# String.Format("return openCustomer(\"{0}\")", Eval("CustomerID")) %>'
                        EnableTheming="false" ForeColor="Blue"><%#Eval("CustomerName") %></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目总工">
                <ItemTemplate>
                    <asp:Label ID="lbXmzg" runat="server">
                    <span xmzg='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目进度" ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbCompleteRate" runat="server" OnClientClick='<%# String.Format("return openProjectSchedule(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                    <input type="hidden" id="hiCompleteRate" runat="server" value='<%#Eval("CompleteRate") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计完成情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span RollCompleteInfo='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接口完成情况">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFlieInfo" runat="server" OnClientClick='<%# String.Format("return openFileList(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span FileCompleteInfo='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="存在问题">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbProblem" runat="server" OnClientClick='<%# String.Format("return openProjectSchedule(\"{0}\",\"{1}\")", Eval("OrganizationID"),"problem") %>'
                        EnableTheming="false" ForeColor="Blue"><span problems='<%#Eval("OrganizationId") %>'></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PlanCompleteDate" HeaderText="计划完成日期" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="TaskDate" HeaderText="启动日期" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="ContractState" HeaderText="合同状态" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="计划工程师" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lbJhgcs" runat="server">
                    <span jhgcs='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="质量工程师" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lbZlgcs" runat="server">
                    <span zlgcs='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="定额完成情况" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWorkDayInfo" runat="server" OnClientClick='<%# String.Format("return openWorkDay(\"{0}\")", Eval("OrganizationID")) %>'
                        EnableTheming="false" ForeColor="Blue">
                    <span workdayinfo='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="OuterCompleteDate" HeaderText="业主要求进度" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="接口工程师" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lbJkgcs" runat="server">
                    <span jkgcs='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目秘书" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lbXmms" runat="server">
                    <span xmms='<%#Eval("OrganizationId") %>'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <!-- 选择关注项目xml-->
    <input type="hidden" runat="server" id="hiProjXML" />
    <!-- 添加关注项目后台调用-->
    <asp:Button runat="server" ID="btnAddProjs" OnClick="btnAddProjs_Click" Visible="false" />
    <input type="hidden" id="hiMyContentProject" runat="server" value="0" />
    <!--修改项目状态-->
    <asp:Button runat="server" ID="btnModifyProject" OnClick="btnModifyProject_Click" Style="display: none" />
    <input type="hidden" runat="server" id="hiModifyOrgID" />
    <input type="hidden" runat="server" id="hiModifyState" />
    <input type="hidden" runat="server" id="hiModifyField" />
    <!--可以修改项目状态，是否需要批复文件的部门 经营生产处-->
    <input type="hidden" runat="server" id="hiCanEditProjectDeptID" value="D998E50D-F4B6-4596-AD96-46C8E7FDA2E8" />
    <script type="text/javascript">
        var title = "在任务距完成日期还有" + "<%=RollWaringDates %>" + "天时给出到期提醒，并标黄所在行的背景色。任务延期给出延期提醒，并标红所在行背景色";
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initPagePlugin() {
            getWBSCompleteInfo();
            setProblems();
            getProjectManger();
            //$("#trleader").hide();
            initAttention();

        }
        // 修改项目状态
        $('[flag="ddlProjectState"]').live('change', function () {
            var newState = $(this)[0].options[this.selectedIndex].text;
            if (confirm("确定将项目状态调整为【" + newState + "】吗")) {
                var orgID = $(this).attr("flagID");
                $('#<%=hiModifyOrgID.ClientID %>').val(orgID);
                $('#<%=hiModifyState.ClientID %>').val($(this).val());
                $('#<%=hiModifyField.ClientID %>').val("ProjectState");
                $('#<%=btnModifyProject.ClientID %>').click();
            }
            else {
                var orgState = $(this).attr("orgProjectState");
                $(this).val(orgState);
            }
        });
        // 修改项目是否需要批复文件
        $('[flag="ddlIsNeedApprovalDoc"]').live('change', function () {
            var newState = $(this)[0].options[this.selectedIndex].text;
            if (confirm("确定将是否需要批复文件调整为【" + newState + "】吗")) {
                var orgID = $(this).attr("flagID");
                $('#<%=hiModifyOrgID.ClientID %>').val(orgID);
                $('#<%=hiModifyState.ClientID %>').val($(this).val());
                $('#<%=hiModifyField.ClientID %>').val("IsNeedApprovalDoc");
                $('#<%=btnModifyProject.ClientID %>').click();
            }
            else {
                var orgState = $(this).attr("orgProjectState");
                $(this).val(orgState);
            }
        });
        //extendCheckGridRow("");

        function openWorkFlow(orgID) {
            var formID = '<%=PSFormID%>';
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", { actionType: 2, packageName: 'EPMSProjectStart.xpdl', xpdlId: 'ProjectStart_WP1', formId: formID, ver: '|', OrganizationID: orgID });
            window.open(url);
        }

        //打开项目定额
        function openWorkDay(orgID) {
            var url = buildQueryUrl("/EPMS/List/Sys/WorkloadOfProjectList.aspx", { OrganizationID: orgID, secid: '95C9998E-AF2F-4508-867F-9C72064748C3' });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);

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
                    //存在问题
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

        //打开项目进度填报
        function openProjectSchedule(projectID, pageType) {
            var url = buildQueryUrl("/EPMS/List/Project/ProjectScheduleList.aspx", { secid: '5580137F-4AE6-4C8E-A6D8-C486C661C538', OrganizationID: projectID, AllOrProblem: pageType });
            showDivDialog(url, null, 1000, 600, editProjectCallBack);
            return false;
        }
        //业主信息页面
        function openCustomer(CustomerID) {
            var url = buildQueryUrl("/MM/List/CRM/CustomerEditor.aspx", { bizid: CustomerID, actionType: 1 });
            showDivDialog(url, null, 1000, 600, null);
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
            var $ids = "";
            $("#<%=gvList.ClientID %> span[RollCompleteInfo]").each(function () {
                $ids += $(this).attr("RollCompleteInfo") + "|";
            });
            $.post("ProjectList.aspx",
                { asyfunc: "GetRollCompleteInfo", orgIdList: $ids },
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
                                        $(this).attr("class", "wbsWarning");
                                    } else if ($rollCompleteInfo.indexOf("到期") > 0) {
                                        $(this).attr("class", "wbsRemind");
                                    }
                                    $(this).attr("title", title);
                                }
                            }
                        }
                    });
                    //设计完成定额
                    $("#<%=gvList.ClientID %> span[WorkDayInfo]").each(function () {
                        var $orgID = $(this).attr("WorkDayInfo");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $workDayInfo = $l[i][2];
                            if ($orgID == $id) {
                                if ($workDayInfo == "")
                                    $(this).html("");
                                else {
                                    $(this).html($workDayInfo);
                                }
                            }
                        }
                    });
                    //接口完成情况 FileCompleteInfo
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
                                    if ($fileCompleteInfo.indexOf("延期") > 0) {
                                        $(this).attr("class", "wbsWarning");
                                    } else if ($fileCompleteInfo.indexOf("到期") > 0) {
                                        $(this).attr("class", "wbsRemind");
                                    }
                                    $(this).attr("title", title);
                                }
                            }
                        }
                    });
                }
            );
        }

        //异步加载总工、计划工程师、接口工程师、项目秘书、质量工程师
        function getProjectManger() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[xmzg]").each(function () {
                $ids += $(this).attr("xmzg") + "|";
            });
            $.post("BusinessPlateProjectList.aspx",
                { asyfunc: "GetProjectManger", orgIdList: $ids },
                function (res) {
                    var $l = eval('(' + res + ')');
                    //项目总工
                    $("#<%=gvList.ClientID %> span[xmzg]").each(function () {
                        var $orgID = $(this).attr("xmzg");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $xmzg = $l[i][1];
                            if ($orgID == $id) {
                                if ($xmzg == "")
                                    $(this).html("");
                                else {
                                    $(this).html($xmzg);
                                }
                            }
                        }
                    });
                    //计划工程师
                    $("#<%=gvList.ClientID %> span[jhgcs]").each(function () {
                        var $orgID = $(this).attr("jhgcs");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $jhgcs = $l[i][2];
                            if ($orgID == $id) {
                                if ($jhgcs == "")
                                    $(this).html("");
                                else {
                                    $(this).html($jhgcs);
                                }
                            }
                        }
                    });
                    //接口工程师
                    $("#<%=gvList.ClientID %> span[jkgcs]").each(function () {
                        var $orgID = $(this).attr("jkgcs");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $jkgcs = $l[i][3];
                            if ($orgID == $id) {
                                if ($jkgcs == "")
                                    $(this).html("");
                                else {
                                    $(this).html($jkgcs);
                                }
                            }
                        }
                    });
                    //项目秘书
                    $("#<%=gvList.ClientID %> span[xmms]").each(function () {
                        var $orgID = $(this).attr("xmms");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $xmms = $l[i][4];
                            if ($orgID == $id) {
                                if ($xmms == "")
                                    $(this).html("");
                                else {
                                    $(this).html($xmms);
                                }
                            }
                        }
                    });
                    //质量工程师
                    $("#<%=gvList.ClientID %> span[zlgcs]").each(function () {
                        var $orgID = $(this).attr("zlgcs");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $zlgcs = $l[i][5];
                            if ($orgID == $id) {
                                if ($zlgcs == "")
                                    $(this).html("");
                                else {
                                    $(this).html($zlgcs);
                                }
                            }
                        }
                    });
                    //设总B
                    $("#<%=gvList.ClientID %> span[szb]").each(function () {
                        var $orgID = $(this).attr("szb");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $szb = $l[i][6];
                            if ($orgID == $id) {
                                if ($szb == "")
                                    $(this).html("");
                                else {
                                    $(this).html($szb);
                                }
                            }
                        }
                    });
                }
            );
        }

        //查看项目网站
        function viewProjectPortal(OrganizationID) {
            //            var url = "../ProjectPortal/ProjectHomePage.aspx?projectPhaseID=" + OrganizationID;
            var url = "<%=WebAppPath%>/CatalogTree/EPMSFileTree.aspx?organizationID=" + OrganizationID;
            window.open(url);
            return false;
        }

        function viewItem(actionType, OrganizationID) {
            var url = "/EPMS/List/Project/ProjectEditor.aspx";
            var json = { actionType: actionType, bizId: OrganizationID };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }

        //打开卷册目录 项目ID、专业ID
        function openRollList(orgID, showWaringRow) {
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowRollEdit: 'true', IsShowWorkDay: 'true' });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);

            return false;
        }

        function openFileList(orgID, showWaringRow) {
            var roleName = "Sz";
            if (roleName == 'Szr') {
                roleName = "Bmfzr";
            }
            var url = buildQueryUrl("/EPMS/List/WBS/C_MutualFileList.aspx", { OrganizationID: orgID, secid: '58799f61-7761-43e8-961f-4ca93fa67039', RoleName: roleName, IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowRollEdit: 'true' });
            showDivDialog(url, null, 1200, 600, editProjectCallBack);

            return false;
        }

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

        //关注
        function initAttention() {
            $('[state="attetion"]').each(function () {
                $(this).bind("click", function () {
                    formAttention($(this).attr("projectID"), $(this).attr("projectCode"), $(this).attr("projectName"), $(this).attr("type"), $(this));
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
        function openProjectUser(orgID) {

            var url = buildQueryUrl("/EPMS/List/OBS/ProjectTeamMemberList.aspx", { IsPortal: true, MenuId: '241155B8-33F5-4D56-8A94-B5D6C2337320', OrganizationID: orgID });
            showDivDialog(url, null, 1200, 600, null);
            return false;
        }
        window.onload = function () {
            $('[state="attetion"]').each(function () {
                $(this).unbind("click");
            });
            initAttention();
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="treeView">
</asp:Content>
