<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectSingleValueList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectSingleValueList" Title="项目单项"
    MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="OrganizationId" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound" EmptyDataText="没有要查找的数据">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px">
                <ItemTemplate>
                    <%#Eval("ProjectName").ToString().Length > 25 ? Eval("ProjectName").ToString().Substring(0, 24) + "..." : Eval("ProjectName")%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SingleName" HeaderText="单项" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SplitValue" HeaderText="产值" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="日期" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="treeView">
</asp:Content>
