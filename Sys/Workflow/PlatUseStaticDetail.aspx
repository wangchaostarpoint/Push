<%@ Page Title="流程使用详细" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="PlatUseStaticDetail.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.PlatUseStaticDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="pdgDetail" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        Width="100%" UseDefaultDataSource="true" OnRowCommand="pdgDetail_RowCommand" OnRowDataBound="pdgDetail_OnRowDataBound">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="姓名"></asp:BoundField>
            <asp:BoundField DataField="OrganizationOfficialName" HeaderText="部门"></asp:BoundField>
            <asp:BoundField HeaderText="待办事项" ItemStyle-Font-Bold="true" ItemStyle-ForeColor="Red"
                DataField="ToDoNum">
                <ItemStyle Font-Bold="True" ForeColor="Red"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="MobilePhone" HeaderText="移动电话"></asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="分机号"></asp:BoundField>

            <asp:TemplateField HeaderText="查看详细" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnShowDetail" runat="server" EnableTheming="false">
                     <img alt="" src="../../Themes/Images/btn_dg_view.gif" border='0' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </zhongsoft:LightPowerGridView>

    <script language="javascript" type="text/javascript">

        function ShowDetail(StartTime, EndTime, PartName, PartId, OrganizationIdStr) {
            var formtype = encodeURI( '<%=Request.QueryString["FormType"] %>');


            var url = "Sys/Workflow/UserWorkflowDetail.aspx?&StartTime=" + StartTime + "&EndTime=" + EndTime + "&PartName=" + escape(PartName) + "&PartId=" + PartId + "&FormType" + formtype + "&OrganizationIdStr=" + OrganizationIdStr;
            var sFeatures = "dialogHeight: 600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:No ; status: no;";
            //var dom = window.showModalDialog(url, null, sFeatures);
            showDivDialog(url, null, 850, 600, null);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
