<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileItemSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.FileItemSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                编号/名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
                 <div style="display: none">
                 任务类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                </div>
                专业
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialtyID" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                <asp:LinkButton runat="server" ID="lbtnAddWBS" CssClass="subtoolbarlink" EnableTheming="false" Visible="false"
                    ToolTip="WBS任务分解" OnClientClick="return addWBS()">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="WBS任务分解" width="16"
                            height="16" />WBS任务分解</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="WBSID" ShowJsonRowColName="true"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业（系统）方式" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划提交日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际提交日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="资料状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFileNature"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="提交状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindWbs" OnClick="btnBindWbs_Click" Style="display: none" />
    <script type="text/javascript">
        //添加任务信息
        function addWBS() {
            var json = { OrganizationID: '<%=OrganizationID %>' };
            var url = buildBizUrl(2, null, "/EPMS/List/WBS/WBSSplitEditor.aspx", json);
            showDivDialog(encodeURI(url), "", 1050, 600, bindWbs);
            return false;
        }

        //绑定WBS列表
        function bindWbs() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindWbs,"")%>;
        }
    </script>
</asp:Content>
