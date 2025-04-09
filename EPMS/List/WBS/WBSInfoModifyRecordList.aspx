<%@ Page Title="卷册名称修改台帐" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="WBSInfoModifyRecordList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSInfoModifyRecordList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
    <!-- -->
    <span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span> <span>
        <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
     <table>
        <tr>
            <td><asp:LinkButton runat="server" ID="lbtnNew" CssClass="subtoolbarlink" EnableTheming="false"
        OnClientClick="return false">
<span><img width="16" height="16"  alt="新建"  runat="server" src="~/Themes/Images/btn_new.gif" />新建</span>

    </asp:LinkButton>
    <span style="color: Red">专业主任工可以修改本专业的卷册名称，如果卷册的《成品四级校审》流程到【自动批签及plt确认】步骤或者校审流程已结束则不允许修改！</span>
           </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="WBSInfoModifyRecordID" UseDefaultDataSource="false" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSNameOfNew" HeaderText="修改后名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastModifyUserName" HeaderText="修改人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastModifyDate" HeaderText="修改时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Memo" HeaderText="修改原因">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            $('#<%=lbtnNew.ClientID %>').bind('click', function () {
                newItem();
            });
        }

        //新建
        function newItem() {
            var json = { actionType: 2, OrganizationID: '<%=QueryOrgID %>' };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSInfoModifyRecordEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
