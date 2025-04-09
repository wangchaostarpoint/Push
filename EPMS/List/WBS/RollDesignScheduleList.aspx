<%@ Page Language="C#" Title="卷册设计进度" AutoEventWireup="true" CodeBehind="RollDesignScheduleList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.RollDesignScheduleList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery" style="display: none;">
            <span>
                <table>
                    <tr>
                        <td>
                            <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Width="70px" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"
                                AutoPostBack="true">
                            </zhongsoft:LightDropDownList>
                            <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="100px" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged"
                                AutoPostBack="true">
                            </zhongsoft:LightDropDownList>
                            专业
                            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" Width="100px" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged">
                            </zhongsoft:LightDropDownList>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblRollState" runat="server" RepeatDirection="Horizontal"
                                AutoPostBack="true" OnSelectedIndexChanged="rblRollState_SelectedIndexChanged">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </span>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvRollInfo" AutoGenerateColumns="false"
        AllowFrozing="true" FrozenColNum="2" runat="server" ShowPageSizeChange="true"
        UseDefaultDataSource="true" AllowSorting="true" OnSorting="gvRollInfo_Sorting"
        OnRowDataBound="gvRollInfo_RowDataBound" Width="100%">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="名称" DataField="WBSName" SortExpression="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="负责人" DataField="WBSOwnerName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="卷册状态">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="计划室交出时间" DataField="PlanRecheckTime1" SortExpression="PlanRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成(%)" DataField="CompleteRate" SortExpression="CompleteRate"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="当前节点（人员）">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbCurrentUser"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
