<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjProductionPlanList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjProductionPlanList"
    Title="生产作业计划" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" flag="planTime"><span class="filter-block-lb">计划年月</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>年
         <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="150px">
         </zhongsoft:LightDropDownList>月
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" AllowFrozing="true" FrozenColNum="4"
        DataKeyNames="PlanActivityOfProjectID" BindGridViewMethod="BindGrid" OnRowCreated="gvList_RowCreated">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程代号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="财务账号" DataField="FinancialSerialNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程（项目）名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="规模" DataField="ProjectScale" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程类别" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ManagerDeptName")))?"":Eval("ManagerDeptName")+"：" )+Eval("ManagerUserName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="RelateMajors">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开始日期" DataField="PlanStartDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成日期" DataField="PlanCompleteDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="工程总卷册数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','','','')" title='<%# Eval("TotalRollNum")%>'
                        style="color: Blue"><%# Eval("TotalRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工日" DataField="ThisPlanFinishWorkday" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作量%" DataField="ThisPlanFinishRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="累计工作量%" DataField="ThisPlanTotalRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="计划完成卷册数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','PlanCompleteTime','<%=ThisMonth %>','<%=ThisYear %>')" title='<%# Eval("ThisPlanRollNum")%>'
                        style="color: Blue"><%# Eval("ThisPlanRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已出版卷册" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','FactCompleteTime','','')" title='<%# Eval("PublishedRollNum")%>'
                        style="color: Blue"><%# Eval("PublishedRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="上月实际完成卷册" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','FactCompleteTime','<%=ThisMonth %>','<%=ThisYear %>')" title='<%# Eval("PreFactPublishRollNum")%>'
                        style="color: Blue"><%# Eval("PreFactPublishRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="本月计划出版卷册" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','PlanCompleteTime','<%=ThisMonth %>','<%=ThisYear %>')" title='<%# Eval("ThisPlanPublishRollNum")%>'
                        style="color: Blue"><%# Eval("ThisPlanPublishRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="实际完成比例%" DataField="ThisFactFinishRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="实际完成卷册数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','FactCompleteTime','<%=ThisMonth %>','<%=ThisYear %>')" title='<%# Eval("FactFinishRollNum")%>'
                        style="color: Blue"><%# Eval("FactFinishRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="累计完成比例%" DataField="ThisFactTotalRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="累计完成卷册数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','FactCompleteTime','','')" title='<%# Eval("TotalFinishRollNum")%>'
                        style="color: Blue"><%# Eval("TotalFinishRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="计划完成比例%" DataField="NextPlanFinishRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="计划完成卷册数" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationId") %>','PlanCompleteTime','<%=Month %>','<%=Year %>')" title='<%# Eval("NextPlanRollNum")%>'
                        style="color: Blue"><%# Eval("NextPlanRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //打开卷册目录
        function viewItem(orgID, timeField, dataMonth, dataYear) {
            var isPlanWBS = 0;
            if (timeField == "PlanCompleteTime") {
                isPlanWBS = 1;
            }
            var url = buildQueryUrl("/EPMS/List/Plan/ProjectWeekPlanWBSList.aspx",
                {
                    OrganizationID: orgID, TimeField: timeField, DataMonth: dataMonth, DataYear: dataYear, IsPlanWBS: isPlanWBS
                });
            showDivDialog(url, null, 850, 500, null);

            return false;
        }

        function initCustomerPlugin() {
            if (parseBool("<%=IsHidePlanTime%>")) {
                $('[flag="planTime"]').hide();
                //目前只有年月查询条件，当该条件隐藏后隐藏查询充值按钮，后续根据实际情况调整
                $("[id$=divQuery]").hide();
            }
            else {
                $('[flag="planTime"]').show();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>



