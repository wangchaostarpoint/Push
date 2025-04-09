<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjProductionTaskList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjProductionTaskList"
    Title="生产任务完成情况" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <asp:Label Font-Size="Large" runat="server" ID="lbThisMonth"><%=ThisYear %>年<%=ThisMonth %>月生产任务完成情况</asp:Label>
    <zhongsoft:LightPowerGridView ID="gvThisMonth" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true"
        DataKeyNames="ParamPhaseID" BindGridViewMethod="BindGrid" OnRowDataBound="gvThisMonth_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="阶段" DataField="Phase">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="说明" ItemStyle-Width="300px">
                <ItemTemplate>
                    <div style="word-break: break-all !important; white-space: normal !important;">
                        <asp:Label ID="lbMemo" runat="server"></asp:Label>
                    </div>
                    <input type="hidden" runat="server" id="hiParamPhaseID" value='<%# Eval("ParamPhaseID")%>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiTotalPhaseID" runat="server" value="20,30,40" />
    <input type="hidden" id="hiPhasePer85" runat="server" value="20,30" />
    <input type="hidden" id="hiPhasePer90" runat="server" value="40" />
    <input type="hidden" id="hiPer85" runat="server" value="85" />
    <input type="hidden" id="hiPer90" runat="server" value="90" />
    <p>
        <asp:Label Font-Size="Large" runat="server" ID="lbNextMonthing"><%=Year %>年<%=Month %>计划中</asp:Label>
    </p>
    <p>
        <asp:Label Font-Size="Larger" runat="server" ID="lbNextMonthingMemo"></asp:Label>
    </p>
    <p>
        <asp:Label Font-Size="Large" runat="server" ID="lbNextMonthC"><%=Year %>年<%=Month %>计划完成的工程</asp:Label>
    </p>
    <zhongsoft:LightPowerGridView ID="gvNextMonth" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="false" PageSize="15" UseDefaultDataSource="true"
        DataKeyNames="OrganizationID">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目类别" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下月累计计划进度" DataField="NextPlanTotalRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField Visible="false">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiKeyID" value='<%# Eval("OrganizationID")%>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

