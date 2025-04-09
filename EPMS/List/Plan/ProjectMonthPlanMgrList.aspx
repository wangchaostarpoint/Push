<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMonthPlanMgrList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjectMonthPlanMgrList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<%@ Import Namespace="DAL.EPMS" %>
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
        </span></span><span class="filter-block"><span class="filter-block-lb">部门</span> <span>
            <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="lbtnNewActivity" OnClientClick="return newDetail()"
        OnClick="lbtnNewActivity_Click" EnableTheming="false" CssClass="btn-query">
        <span>
            <img runat="server" id="img2" src="~/Themes/Images/btn_new.gif" alt="新建" height="16" />新建</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvMonthPlan" AutoGenerateColumns="false"
        DataKeyNames="PlanActivityID" ShowExport="true" HideFieldOnExport="全部" runat="server"
        BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowDataBound="gvMonthPlan_RowDataBound"
        UseDefaultDataSource="true" OnRowCommand="gvMonthPlan_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="安排部门" DataField="WriteDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="月度计划名称">
                <ItemTemplate>
                    <asp:Label ID="lbActivityTheme" Text='<%# gvMonthPlan.GetSubString(Eval("ActivityTheme"), 30)%>'
                        ToolTip='<%#Eval("ActivityTheme") %>' runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="计划工程师" DataField="WriteUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月度计划创建时间" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月度计划分发时间" DataField="PlanSendTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="流程开始时间" DataField="ActivityStartTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="流程结束时间" DataField="ActivityFinishTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <%-- <zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" DataParamFields="PlanActivityID,ExtendedAttribute"
                EditItemClick="viewForm" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>--%>
            <zhongsoft:LightTemplateField HeaderText="查看" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" ForeColor="Blue">
                    <span> <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_view.gif" /></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditorData" DataParamFields="PlanActivityID"
                EditItemClick="editDetail" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="启动" EditItemClick="checkCanStart" ImageUrl="../../../Themes/Images/ico_act_start.png"
                DataParamFields="PlanActivityID,WriteUserID,WriteUserName" CommandName="StartFlow"
                ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiRoleName" value="计划管理岗" />
    <input type="hidden" runat="server" id="hiSpecialDeptCode" value="01017034" />
    <script type="text/javascript">
        function editDetail(planActivityID) {
            var url = buildBizUrl(3, planActivityID, "EPMS/List/Plan/ProjectMonthPlanEditor.aspx", null);
            showDivDialog(url, null, 550, 250, refreshInfo);
            return false;
        }

        function newDetail() {
            var url = buildBizUrl(2, null, "EPMS/List/Plan/ProjectMonthPlanEditor.aspx", null);
            var callBack=refreshInfo();
            showDivDialog(url, null, 550, 250, refreshInfo);
            return false;
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

        //提示启动流程
        function checkCanStart(planActivityID, writeUserId, writeUserName) {
            if (writeUserId == "") {
                alert("-请先选择专业主任工再发起流程");
                return false;
            }
            return confirm("您确定给 - " + writeUserName + " - 启动【月度计划编制流程】流程？");
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
