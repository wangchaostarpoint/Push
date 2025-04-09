<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyOptValueList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.MonthlyOptValueList"
    Title="月度产值一览表" MasterPageFile="~/UI/Master/ObjectList.Master" %>

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
        DataKeyNames="PlanActivityOfProjectID" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程包" DataField="ProjectPackage" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ManagerDeptName")))?"":Eval("ManagerDeptName")+"：" )+Eval("ManagerUserName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
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
            <zhongsoft:LightBoundField HeaderText="本月计划完成进度" DataField="ThisPlanFinishRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月实际完成进度" DataField="ThisFactFinishRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月完成估算产值（万元）" DataField="ThisFactESValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月完成合同产值（万元）" DataField="ThisFactCEValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下月计划完成进度" DataField="NextPlanFinishRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下月计划完成估算产值（万元）" DataField="NextPlanESValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下月计划完成合同产值（万元）" DataField="NextPlanCEValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
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

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

