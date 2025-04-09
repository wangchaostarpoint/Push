<%@ Page Language="C#" Title="项目计划管理信息" AutoEventWireup="true" CodeBehind="ProjectPlanMgrList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectPlanMgrList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务版块</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlat" CssClass="kpms-ddlsearch" EnableTheming="False" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目状态</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectState" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">计划开始日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanStart"
            runat="server" readonly="readonly" compare="2" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanStartEnd"
            runat="server" readonly="readonly" compare="2" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">计划完成日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtStart"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtEnd"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
    <span class="filter-block" flag="ddlDept"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程类别</span> <span>
        <asp:CheckBoxList runat="server" ID="cblProjectType" RepeatDirection="Horizontal"
            RepeatColumns="14" RepeatLayout="Flow" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程阶段</span> <span>
        <asp:CheckBoxList runat="server" ID="cblProjectPhase" CssClass="kpms-ddlsearch" EnableTheming="False" RepeatDirection="Horizontal" />
    </span></span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lbtnNew" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
        OnClientClick="return false;" flag="isCanEdit">
        <span>
            <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="新建" height="16" />新建</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="lbtnStartWf" EnableTheming="false" CssClass="subtoolbarlink" ToolTip="发送项目立项通知给设总"
        OnClientClick="return checkProject();" OnClick="lbtnStartWf_OnClick" flag="isCanEdit"><span>
        <img src="../../../Themes/Images/btn_submit.gif" />发送</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowFrozing="true" FrozenColNum="5"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand"
        DataKeyNames="OrganizationID" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
                <HeaderStyle Width="60px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </zhongsoft:LightCheckField>
            <asp:TemplateField HeaderText="操作" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false"
                        ToolTip="查看" OnClientClick="return false">
                                    <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_view.gif" ,
                                    onclick="viewItem('1','<%# Eval("OrganizationID") %>');"/>
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false"
                        ToolTip="编辑" OnClientClick="return false">
                                    <img alt="编辑" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_edit.gif" ,
                                    onclick="viewItem('3','<%# Eval("OrganizationID") %>');"/>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false"
                        ToolTip="删除" CommandName="del" CommandArgument='<%# Eval("OrganizationID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                    </asp:LinkButton>
                    <input type="hidden" runat="server" id="hiFormDate" value='<%# Eval("FormDate") %>' />
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="卷册去向" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnRoll" runat="server" EnableTheming="false" OnClientClick="return false" ToolTip="查看卷册去向">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="viewRollInfo('<%# Eval("OrganizationID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
            </asp:TemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目状态">
                <ItemTemplate>
                    <zhongsoft:LightDropDownList ID="ddlProjectState" runat="server" Width="100px" flag="ddlProjectState" orgProjectState='<%# Eval("ProjectState") %>'
                        flagID='<%# Eval("OrganizationID") %>'>
                    </zhongsoft:LightDropDownList>
                    <%-- <asp:Label ID="lbProjectState" runat="server" Text='<%# Eval("ProjectState") %>'></asp:Label>--%>
                    <input type="hidden" runat="server" id="hiProjectState" value='<%# Eval("ProjectState") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目网站" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewProject" runat="server" EnableTheming="false">
                        <img alt=""  src ="<%=WebAppPath%>/Themes/Images/fhome.png" onclick =" return viewProjectPortal('<%#Eval("OrganizationId") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
                <HeaderStyle Width="100px"></HeaderStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
                <HeaderStyle Width="100px"></HeaderStyle>

                <ItemStyle Width="100px"></ItemStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程包" DataField="ProjectPackage" ItemStyle-Width="100px" ShowToolTip="true">
                <HeaderStyle Width="100px"></HeaderStyle>

                <ItemStyle Width="100px"></ItemStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="业务板块" DataField="BusinessPlate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum">
                <HeaderStyle Width="100px"></HeaderStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阶段估算产值(万元)" DataField="ViewEstimateContractVal" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                <HeaderStyle Width="100px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Right"></ItemStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阶段合同产值(万元)" DataField="ViewContractValue" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                <HeaderStyle Width="100px"></HeaderStyle>

                <ItemStyle HorizontalAlign="Right"></ItemStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade" HeaderStyle-Width="70px">
                <HeaderStyle Width="70px"></HeaderStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程涉及专业" DataField="RelateMajors">
                <HeaderStyle Width="100px"></HeaderStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="规模" DataField="ProjectScale" ItemStyle-Width="100px" ShowToolTip="true">
                <HeaderStyle Width="100px"></HeaderStyle>

                <ItemStyle Width="100px"></ItemStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程类别" DataField="ProjectType">
                <HeaderStyle Width="100px"></HeaderStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ManagerDeptName")))?"":Eval("ManagerDeptName")+"：" )+Eval("ManagerUserName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="计划开始日期" DataField="PlanStartDate" DataFormatString="{0:yyyy-MM-dd}">
                <HeaderStyle Width="100px"></HeaderStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成日期" DataField="PlanCompleteDate" DataFormatString="{0:yyyy-MM-dd}">
                <HeaderStyle Width="100px"></HeaderStyle>
            </zhongsoft:LightBoundField>
        </Columns>
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindData" OnClick="btnBindData_Click" Style="display: none" />
    <asp:Button runat="server" ID="btnModifyProjectState" OnClick="btnModifyProjectState_Click" Style="display: none" />
    <input type="hidden" runat="server" id="hiModifyOrgID" />
    <input type="hidden" runat="server" id="hiModifyState" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            var rowFilter = "<%=RowFilter%>";
            if (rowFilter == "" || parseBool('<%=KPMSUser.IsAdmin%>')) {
                $('[flag="ddlDept"]').show();
            }
            else {
                $('[flag="ddlDept"]').hide();
            }
        }

        $('[flag="ddlProjectState"]').live('change', function () {
            var newState = $(this)[0].options[this.selectedIndex].text;
            if (confirm("确定将状态调整为" + newState + "吗")) {
                var orgID = $(this).attr("flagID");
                $('#<%=hiModifyOrgID.ClientID %>').val(orgID);
                $('#<%=hiModifyState.ClientID %>').val($(this).val());
                $('#<%=btnModifyProjectState.ClientID %>').click();
            }
            else {
                var orgState = $(this).attr("orgProjectState");
                $(this).val(orgState);
            }
        });

        var isOnlyRead ="<%=IsOnlyRead%>";
        //只能查看隐藏新建 发送按钮
        if (isOnlyRead == "1") {
            $('[flag="isCanEdit"]').hide();
        }

        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        $('#<%=lbtnNew.ClientID %>').bind('click', function () {
            viewItem(2, '');
        });

        function viewRollInfo(organizationID) {
            var json = { OrganizationID: organizationID };
            var url = buildQueryUrl('/EPMS/List/WBS/RollDeliverInfo.aspx', json);
            showDivDialog(url, "", 1000, 500, null);
            return false;
        }

        function viewItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Project/ProjectEditorNew.aspx', json);
            var callBack = null;
            if (actionType == '2' || actionType == '3') {
                callBack = bindData;
            }
            showDivDialog(url, "", 800, 500, callBack);
            return false;
        }

        //执行后台绑定列表
        function bindData() {
            $('#<%=btnBindData.ClientID %>').click();
        }

        function checkProject() {
            var $gridCheckedClientID = "<%=this.gvList.CheckedClientID %>";
            if ($("#" + $gridCheckedClientID).val() == "[]") {
                alert("请选择要发送项目立项通知给设总的项目！");
                return false;
            }
            return confirm("您将发送所选项目通知给设总，确定吗？");
        }

        //查看项目网站
        function viewProjectPortal(OrganizationID) {
            var url = "<%=WebAppPath%>/CatalogTree/EPMSFileTree.aspx?organizationID=" + OrganizationID;
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


