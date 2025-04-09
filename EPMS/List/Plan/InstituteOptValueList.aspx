<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstituteOptValueList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.InstituteOptValueList"
    Title="院工程产值月报表" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">计划年月</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>年
         <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="150px">
         </zhongsoft:LightDropDownList>月
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程名称/项目编号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">所属工程包</span> <span>
        <zhongsoft:LightTextBox ID="tbPackage" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectPhase" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程类别</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" flag="ddlDept"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" AllowFrozing="true" FrozenColNum="5"
        DataKeyNames="PlanActivityOfProjectID" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程涉及专业" DataField="RelateMajors">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="规模" DataField="ProjectScale" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程类别" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ManagerDeptName")))?"":Eval("ManagerDeptName")+"：" )+Eval("ManagerUserName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划开始时间" DataField="PlanStartDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成时间" DataField="PlanCompleteDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="目前已完成进度（%）" DataField="ThisFactTotalRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目估算产值（万元）" DataField="MEstimateContractVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段估算产值（万元）" DataField="PEstimateContractVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段已完成估算产值（万元）" DataField="FinishedESVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段待完成估算产值（万元）" DataField="ToDoESVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目合同产值（万元）" DataField="MContractValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段合同产值（万元）" DataField="PContractValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段已完成合同产值（万元）" DataField="FinishedCEVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段待完成合同产值（万元）" DataField="ToDoCEVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目状态">
                <ItemTemplate>
                    <asp:Label ID="lbProjectState" runat="server" Text='<%# Eval("ProjectState") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="总卷册数量" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationID") %>','','','')" title='<%# Eval("TotalRollNum")%>'
                        style="color: Blue"><%# Eval("TotalRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已完成卷册" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationID") %>','FactCompleteTime','','')" title='<%# Eval("TotalFinishRollNum")%>'
                        style="color: Blue"><%# Eval("TotalFinishRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="卷册去向" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnRoll" runat="server" EnableTheming="false" OnClientClick="return false" ToolTip="查看卷册去向">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="viewRollInfo('3','<%# Eval("OrganizationID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
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

        //打开卷册目录
        function viewItem(orgID, timeField, dataMonth, dataYear) {
            var url = buildQueryUrl("/EPMS/List/Plan/ProjectWeekPlanWBSList.aspx",
                {
                    OrganizationID: orgID, TimeField: timeField, DataMonth: dataMonth, DataYear: dataYear
                });
            showDivDialog(url, null, 850, 500, null);

            return false;
        }

        //卷册去向
        function viewRollInfo(actionType, organizationID) {
            var json = { actionType: actionType, OrganizationID: organizationID };
            var url = buildQueryUrl('', json);
            showDivDialog(url, "", 650, 400, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

