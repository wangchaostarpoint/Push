<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskBookTemplateSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.TaskBookTemplateSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="任务书模板" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table width="100%" style="text-align: left;">
        <tr>
            <td>
                卷册名称/编号
            </td>
            <td>
                <zhongsoft:LightTextBox ID="tbWBSInfo" runat="server" EnableTheming="false" CssClass="kpms-textbox">
                </zhongsoft:LightTextBox>
            </td>
            <td>
                任务内容、范围、分工
            </td>
            <td>
                <zhongsoft:LightTextBox ID="tbName" runat="server" EnableTheming="false" CssClass="kpms-textbox">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="WBSBookTemplateID"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ContentOrRange" HeaderText="任务内容、范围、分工" MaxLength="10">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BasisOrConditions" HeaderText="设计依据及主要原则" MaxLength="10">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="详细" CommandName="viewData" EditItemClick="viewDetail"
                DataParamFields="WBSBookTemplateID" DialogMode="Dialog">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function viewDetail(bizId) {
            var json = { actionType: 1, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Sys/TaskBookTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
            return false;
        }

    </script>
</asp:Content>
