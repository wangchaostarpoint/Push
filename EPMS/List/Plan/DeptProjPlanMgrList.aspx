<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptProjPlanMgrList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.DeptProjPlanMgrList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">计划周期</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanCycle" AutoPostBack="true"
            class="kpms-ddlsearch" EnableTheming="false" OnSelectedIndexChanged="lbtnReBindTimeDll_Click">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">计划年</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanYear" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">
        <asp:Label runat="server" ID="lbPlanCycle" secondflag="noYear"></asp:Label></span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanPeriod" class="kpms-ddlsearch"
                EnableTheming="false" secondflag="noYear">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">专业</span> <span>
            <zhongsoft:LightDropDownList ID="ddlSpecial" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="lbtnNewActivity" OnClientClick="return newDetail()"
        EnableTheming="false" CssClass="btn-query" OnClick="lbtnNewActivity_Click">
        <span>
            <img runat="server" id="img2" src="~/Themes/Images/btn_new.gif" alt="新建" height="16" />新建</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvMonthPlan" AutoGenerateColumns="false"
        DataKeyNames="PlanActivityID" ShowExport="true" HideFieldOnExport="全部" runat="server"
        UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true"
        OnRowDataBound="gvMonthPlan_RowDataBound" OnRowCommand="gvMonthPlan_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="安排时间" ItemStyle-Width="80px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPlanTime"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="部门名称" DataField="DeptName" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业室" DataField="OrgUnitName" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业名称" DataField="SpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业主任工" DataField="WriteUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="安排状态" ItemStyle-Width="80px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPlanState" Text='<%#Eval("PlanState") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="流程开始时间" DataField="ActivityStartTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="流程结束时间" DataField="ActivityFinishTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" DataParamFields="PlanActivityID,ExtendedAttribute"
                EditItemClick="viewForm" ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>--%>
            <zhongsoft:LightTemplateField HeaderText="查看" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" ForeColor="Blue">
                    <span> <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_view.gif" /></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditorData" DataParamFields="PlanActivityID"
                EditItemClick="editDetail">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="启动" EditItemClick="checkCanStart" ImageUrl="../../../Themes/Images/ico_act_start.png"
                DataParamFields="PlanActivityID,WriteUserId,WriteUserName" CommandName="StartFlow" />
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" DataParamFields="PlanActivityID">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiRoleName" value="计划管理岗" />
    <input type="hidden" runat="server" id="hiSpecialDeptCode" value="01017010" />
    <script type="text/javascript">
        //提示启动流程
        function checkCanStart(planActivityID, writeUserId, writeUserName) {
            if (writeUserId == "") {
                alert("-请先选择专业主任工再发起流程");
                return false;
            }
            return confirm("您确定给 - " + writeUserName + " - 启动【月度计划安排】流程？");
        }
        //编辑月度计划安排
        function editDetail(planActivityID) {
            var url = buildBizUrl(3, planActivityID, "EPMS/List/Plan/DeptProjPlanEditor.aspx", null);
            showDivDialog(url, null, 550, 300, refreshInfo);
        }
        //新建月度计划安排
        function newDetail() {
            var url = buildBizUrl(2, null, "EPMS/List/Plan/DeptProjPlanEditor.aspx", null);
            showDivDialog(url, null, 550, 300, refreshInfo);
        }

        function initPagePlugin() {
            timeInfoDisplay();
            $("#<%=ddlPlanCycle.ClientID %>").live("change", function () {
                timeInfoDisplay();
            });
        }
        // 计划周期为项目全周期时，不显示计划年、计划月信息
        function timeInfoDisplay() {
            var planCycle = $("#<%=ddlPlanCycle.ClientID %>").val();
            if (planCycle == "<%=DAL.EPMS.PlanCycle.项目全周期.ToString() %>") {
                $("[flag='planTime']").hide();
            }
            else if (planCycle == "<%=DAL.EPMS.PlanCycle.年度.ToString() %>") {
                $("[secondFlag='noYear']").hide();
            }
            else {
                $("[flag='planTime']").show();
                $("[secondFlag='noYear']").show();
            }
            $("#<%=lbPlanCycle.ClientID %>").html(planCycle);
        }
        //更新
      function refreshInfo() {
           <%=Page.ClientScript.GetPostBackEventReference(this.lbtnNewActivity,"") %>
      }

      function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
