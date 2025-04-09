<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectFlowList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectFlowList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr runat="server" id="trBaseInfo">
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" style="white-space: nowrap">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'tbProjectPhaseCode':'ProjectCode','hiOrganizationID':'id','tbManagerName':'ManagerUserName','tbPhaseName':'PhaseName','tbProjectScale':'ProjectScale'}"
                    EnableTheming="false" Text="选择项目" AfterSelect="afterSelect()" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" Filter="{'projectState':'all'}" />
                <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
                <input type="hidden" runat="server" id="hiOrganizationID" />
            </td>
            <td class="td-l" runat="server" id="tdProjectCode">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbProjectPhaseCode" runat="server" readonly="readonly"
                    maxlength="16" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设总
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbManagerName" runat="server" readonly="readonly" class="kpms-textbox" />
            </td>
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" class="kpms-textbox" />
            </td>
            <td class="td-l">
                项目规模
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbProjectScale" runat="server" readonly="readonly"
                    class="kpms-textbox" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <asp:Label runat="server" ID="lbTitle" Style="font-weight: bold"></asp:Label>&nbsp;
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjectFlow" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        PageSize="10" UseDefaultDataSource="true" ShowPageSizeChange="true" OnRowDataBound="gvProjectFlow_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="流程名称" DataField="FormName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成数量" DataField="NUM" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="详细列表" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="50px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" ToolTip="查看">
                                    <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiFormIDs" value="151,152,156,229,230,242,196,157,166,167,172,171,217,220,169,231,224,225,223,237,153,235,236,232,150,243,240,241,332" />
    <script type="text/javascript">
        function afterSelect() {
        <%=this.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
       }
       //查询项目详细
       function viewFlowDetail(orgID,formID){
           var json = { OrganizationID: orgID,FormID:formID};
           var url = buildQueryUrl('/EPMS/List/Project/ProjectFlowDetail.aspx', json);
           showDivDialog(url, null, 900, 550, null);
       }

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
