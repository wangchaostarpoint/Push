<%@ Page Language="C#" AutoEventWireup="true" Title="项目风险信息" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="ProjectRiskList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Risk.ProjectRiskList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery" style="display: none;">
            <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span>
                <zhongsoft:LightTextBox ID="tbProjName" runat="server" Width="100px">
                </zhongsoft:LightTextBox>
            </span><span class="filter-block"><span class="filter-block-lb">项目类型</span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" Width="100px">
                </zhongsoft:LightDropDownList>
            </span><span class="filter-block"><span class="filter-block-lb">设计阶段</span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhaseName" Width="100px">
                </zhongsoft:LightDropDownList>
            </span>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" AutoGenerateColumns="false" AllowPaging="true"
        runat="server" ShowPageSizeChange="true" DataKeyNames="ProjectRiskID" UseDefaultDataSource="true"
        AllowSorting="true" OnSorting="gvList_Sorting" OnRowDataBound="gvList_RowDataBound"
        Width="100%">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" HeaderStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目类型" HeaderStyle-Width="60px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbProjectType"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计阶段" HeaderStyle-Width="60px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPhaseName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="风险数据来源" HeaderStyle-Width="60px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbRiskSounce"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="风险状态" HeaderStyle-Width="60px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbRiskState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="风险等级" HeaderStyle-Width="60px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbRiskGrade"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="RiskType" HeaderText="风险类型" HeaderStyle-Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskDescription" HeaderText="风险描述" HeaderStyle-Width="300px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
