<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyRecordContentSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.SurveyRecordContentSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lbTitle" runat="server" Text="确认记录" />
                <zhongsoft:LightTextBox ID="tbInspectCondition" runat="server" Width="120px"></zhongsoft:LightTextBox>
                专业
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialtyID" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                <asp:LinkButton runat="server" ID="lbtnAddRecord" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="新建记录" OnClientClick="return addDetail()" OnClick="lbtnAddRecord_Click">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="新建记录" width="16"
                            height="16" />新建</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="SurveyRecordContentId"
        ShowJsonRowColName="true" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="InspectCondition" HeaderText="确认记录" ShowToolTip="true"
                MaxLength="50">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecuteCondition" HeaderText="默认执行情况" ShowToolTip="true"
                MaxLength="50">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" DataParamFields="SurveyRecordContentId"
                CommandName="EditData" />
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" DataParamFields="SurveyRecordContentId"
                CommandName="ViewData" Visible="false" />
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该记录吗？">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function editDetail(bizId) {
            return showDetail(bizId, 3);
        }

        function addDetail() {
            return showDetail("", 2);
        }

        function showDetail(bizId, actionType) {
            var json = { FormID: "<%=FormID %>", SpecialtyID: "<%=SpecialtyID %>" };
            var url = buildBizUrl(actionType, bizId, "EPMS/List/Survey/SurveyRecordEditor.aspx", json);
            return checkReturn(showModal(url, null, 550, 450));
        }

        function viewDetail(bizId) {
            return showDetail(bizId, 1);
        }
    </script>
</asp:Content>
