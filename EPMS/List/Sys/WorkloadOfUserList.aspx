<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkloadOfUserList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.WorkloadOfUserList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年&nbsp;份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYears" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">月&nbsp;份</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlMonths" runat="server" class="kpms-ddlsearch"
                EnableTheming="false" Width="60">
            </zhongsoft:LightDropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <style>
        body, html
        {
            overflow: hidden;
        }
    </style>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWorkload" AutoGenerateColumns="false"
        DataKeyNames="" ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="年份" DataField="StatYear" SortExpression="StatYear">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月份" DataField="StatMonth" SortExpression="StatMonth">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作天数" DataField="WorkDay" SortExpression="WorkDay">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作负荷" DataField="Workload" SortExpression="Workload">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField HeaderText="完成定额（人/天）" DataField="WorkDayOfComplete" SortExpression="WorkDayOfComplete" Visible="false">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="详细" Visible="false">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <%--图表插件--%>
    <zhongsoft:EChart ID="EChartWorkload" runat="server" Width="600" Height="250px" MainTitle="个人负荷分析折线图">
    </zhongsoft:EChart>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWorkload.CheckedClientID %>";

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
