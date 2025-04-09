<%@ Page Language="C#" AutoEventWireup="true" Title="项目批复文件" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjectApprovalDocList.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectApprovalDocList" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">项目编号/名称</span>
        <span>
            <zhongsoft:LightTextBox ID="tbProject" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" ></zhongsoft:LightTextBox>
        </span>
    </span>
     
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList"  AutoGenerateColumns="false" AllowPaging="True"
           AllowSorting="true" ShowExport="true" HideFieldOnExport=""
        DataKeyNames="OrganizationID" UseDefaultDataSource="false" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound"  Width="100%">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="项目阶段" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="批复文件" >
                <ItemTemplate>
                     <uc1:AttachmentView ID="ucUploadFile" runat="server"  />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>      
        </Columns>
    </zhongsoft:LightPowerGridView>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
