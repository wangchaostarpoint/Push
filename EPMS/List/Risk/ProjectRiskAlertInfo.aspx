<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectRiskAlertInfo.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Risk.ProjectRiskAlertInfo" Title="项目风险提醒详细"
    MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery" style="display: none;">
            <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span>
                <zhongsoft:LightTextBox ID="tbProjName" runat="server" Width="100px">
                </zhongsoft:LightTextBox>
            </span>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvProjRisk" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid" OnSorting="gvProjRisk_Sorting">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" HeaderStyle-Width="80px"
                SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("OrganizationId") %>')" title='<%# Eval("ProjectName")%>'>
                        <%#Eval("ProjectName").ToString().Length > 25 ? Eval("ProjectName").ToString().Substring(0, 24) + "..." : Eval("ProjectName")%>
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="RiskGrade" HeaderText="风险等级" SortExpression="RiskGrade"
                HeaderStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskDescription" HeaderText="风险描述" SortExpression="RiskDescription">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function ViewItem(OrganizationID) {
            var url = "/EPMS/List/Project/ProjectEditor.aspx";
            var json = { actionType: 1, bizId: OrganizationID };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <span class="req-star">展示已完成未签合同、已立项启动无合同无委托书、初设未完成影响施工图设计等项目信息</span>
</asp:Content>
