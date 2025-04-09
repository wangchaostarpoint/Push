<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="人员安排" CodeBehind="ProjWBSList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.OBS.ProjWBSList" %>

<%@ Register Src="../../UI/WBS/WBSUser.ascx" TagName="WBSUser" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <span style="margin-top: 8px;">当前科室：
        <asp:Label runat="server" ID="lbDeptGroupInfo"></asp:Label></span>
    <asp:LinkButton runat="server" ID="btnStartFlow" CssClass="btn-query" EnableTheming="false"
        OnClientClick="return startFlow();">
        <span>发起流程</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnPersonState" CssClass="btn-query" EnableTheming="false"
        OnClientClick="return viewUserState();">
        <span>人员状态</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <input type="hidden" runat="server" id="hiIndex" value="0" />
    <input type="hidden" runat="server" id="hiType" value="true" />
    <div id="templateTabs">
        <ul>
            <li><a href='#Emergency' id='aEmergency'>紧急人员安排（<asp:Label ID="lbEmergency" runat="server"
                Text="0"></asp:Label>）</a></li>
            <li><a href='#Master' id='aMaster'>安排主设人主任工（<asp:Label ID="lbMaster" runat="server"
                Text="0"></asp:Label>）</a></li>
            <li><a href='#Designer' id='aDesigner'>安排设计人校核人（<asp:Label ID="lbRollNum" runat="server"
                Text="0"></asp:Label>）</a></li>
            <li><a href='#Verify' id='aVerify'>安排资料校核人（<asp:Label ID="lbFileNum" runat="server"
                Text="0"></asp:Label>）</a></li>
        </ul>
        <div id="Emergency">
            <asp:UpdatePanel ID="panelEquipFile" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <iframe src="../../../Sys/Workflow/WorkToDoList.aspx?ShowType=OBSForm" frameborder="0"
                        id="iframForward" width="100%" height="460" scrolling="no" name="forwardSpace"
                        allowtransparency="true" style="margin-top: 0px; margin-left: 0px;"></iframe>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="Master">
            <div class="tz-toolbar">
                <table width="100%" class="tz-table" id="tbQuery">
                    <tr class="list-leader">
                        <td>
                            <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span> <span>
                                <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
                                    EnableTheming="false"></zhongsoft:LightTextBox>
                            </span></span>
                            <div style="float: right; padding-right: 5px; padding-top: 3px;">
                                <asp:LinkButton runat="server" class="searchbtn bluecolor" ID="lbtnSearch">
                      <span content="searchResultf">查找</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" class="searchbtn" ID="LinkButton2">
                     <span>重置</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btnHasConfig" CssClass="searchbtn" OnClick="btnHasConfig_Click">
                    <span>已配置人员</span>
                                </asp:LinkButton></div>
                        </td>
                    </tr>
                </table>
            </div>
            <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
                AllowFrozing="true" FrozenColNum="2" runat="server" ShowPageSizeChange="true"
                UseDefaultDataSource="true" OnRowDataBound="gvRemibure_RowDataBound" AllowSorting="true"
                OnSorting="gvRemibure_Sorting" OnRowCommand="gvWBS_RowCommand" Width="100%">
                <Columns>
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
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="主设人">
                        <ItemTemplate>
                            <asp:Label ID="lbZSR" runat="server"></asp:Label>
                            <zhongsoft:LightObjectSelector runat="server" ID="txtZSR" SourceMode="SelectorPage"
                                IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                                PageWidth="850" EnableTheming="false" ShowAttrs="name,UserCode" ResultForControls="{'hiZSRId':'id'}"
                                SelectPageMode="Dialog" OnClick="btn_UpdateUser" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                            </zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiZSRId" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="工代">
                        <ItemTemplate>
                            <asp:Label ID="lbGD" runat="server"></asp:Label>
                            <zhongsoft:LightObjectSelector runat="server" ID="txtGD" SourceMode="SelectorPage"
                                IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                                PageWidth="850" EnableTheming="false" ShowAttrs="name,UserCode" ResultForControls="{'hiGDId':'id'}"
                                SelectPageMode="Dialog" OnClick="btn_UpdateUser" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                            </zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiGDId" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </div>
        <div id="Designer">
            <asp:UpdatePanel ID="panelRoll" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <uc1:WBSUser ID="rollUser" runat="server" WBSTypeID="0" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="Verify">
            <asp:UpdatePanel ID="panelFile" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <uc1:WBSUser ID="fileUser" runat="server" WBSTypeID="1" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWBS.CheckedClientID %>";
        $hideObjIds = "ctl00_btnQuery,ctl00_btnResrt";

        function initPagePlugin() {
            $('#templateTabs li a').each(function (i) {
                var index = $("#<%=hiIndex.ClientID %>").val();
                if (i == index) {
                    $('#templateTabs').tabs({ active: i });
                }
                $(this).click(function () {
                    $('#templateTabs').tabs({ active: i });
                    $("#<%=hiIndex.ClientID %>").val(i);
                    return true;
                });
            })
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
