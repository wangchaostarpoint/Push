<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptUserProjectInfo.aspx.cs"
    Title="人员负荷" MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EPMS.List.OBS.DeptUserProjectInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <div style="background-color: #EFF2F7;" id="divQuery">
        <span class="filter-block"><span class="filter-block-lb">部&nbsp;室</span> <span>
            <asp:DropDownList runat="server" ID="ddlDept" AutoPostBack="True" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged"
                class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
            <asp:DropDownList runat="server" ID="ddlOrg" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">工号/姓名/简拼</span>
            <span>
                <asp:TextBox ID="tbUser" runat="server" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
            </span></span>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">

<zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" PageSize="15" runat="server"
    AllowSorting="true" UseDefaultDataSource="true" DataKeyNames="UserId" OnRowCommand="gvList_RowCommand"
    OnSorting="gvList_Sorting" ShowExport="true" OnExport="gvList_Export" OnRowDataBound="gvList_RowDataBound">
    <PagerStyle HorizontalAlign="Right"></PagerStyle>
    <Columns>
        <asp:TemplateField HeaderText="部门">
            <ItemTemplate>
                <asp:Label ID="lbDept" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="工号" DataField="LoginId"></asp:BoundField>
        <asp:BoundField HeaderText="姓名" DataField="UserName"></asp:BoundField>
        <asp:TemplateField HeaderText="Designer">
            <ItemTemplate>
                <asp:Label ID="lbDesigner" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Verify">
            <ItemTemplate>
                <asp:Label ID="lbVerify" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ZSR">
            <ItemTemplate>
                <asp:Label ID="lbZSR" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ZRG">
            <ItemTemplate>
                <asp:Label ID="lbZRG" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="SZ">
            <ItemTemplate>
                <asp:Label ID="lbSZ" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="当前工作">
            <ItemTemplate>
                <a onclick='return DetailOfWork("<%#Eval("UserId") %>","<%#Eval("UserName") %>")'>
                    <asp:Label ID="lbMyWork" runat="server"></asp:Label>
                </a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>

<script type="text/javascript">
    //查看人员工作信息
    function DetailOfWork(userId, userName) {
        var url = "/EPMS/List/OBS/CurrentTaskDetailList.aspx";
        var json = { userid: userId, secid: "C3455630-E393-4F75-B471-0E9151C39A6B" };
        url = buildQueryUrl(url, json);
        showDivDialog(url, "", 1050, 600);
        return false;
    }
</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
