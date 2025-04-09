<%@ Page Language="C#" Title="互提资料设计进度" AutoEventWireup="true" CodeBehind="MutualFileScheduleList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.MutualFileScheduleList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery" style="display: none;">
            <span>
                <table>
                    <tr>
                        <td>
                            <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Style="width: 70px; margin: 3px 0px;"
                                OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="true">
                            </zhongsoft:LightDropDownList>
                            <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Style="width: 100px; margin: 3px 0px;"
                                OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="true">
                            </zhongsoft:LightDropDownList>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblMutualFileState" runat="server" RepeatDirection="Horizontal"
                                AutoPostBack="true" OnSelectedIndexChanged="rblMutualFileState_SelectedIndexChanged">
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
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvMutualFile" AutoGenerateColumns="false"
        AllowFrozing="true" runat="server" ShowPageSizeChange="true" UseDefaultDataSource="true"
        AllowSorting="true" OnSorting="gvMutualFile_Sorting" OnRowDataBound="gvMutualFile_RowDataBound"
        Width="100%">
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
            <zhongsoft:LightBoundField HeaderText="资料编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料名称" DataField="WBSName" SortExpression="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="BelongDeptName" SortExpression="BelongDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="负责人" DataField="WBSOwnerName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属专业" DataField="BelongSpecialtyName" SortExpression="BelongSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料类别" DataField="FileType" SortExpression="FileType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料重要性" DataField="FileImportance" SortExpression="FileImportance">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料性质" DataField="FileNature" SortExpression="FileNature">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划提出时间" DataField="PlanCompleteTime" SortExpression="PlanCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="状态">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
