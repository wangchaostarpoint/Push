<%@ Page Title="互提资料" Language="C#" AutoEventWireup="true" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="ProjOutFileList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.ProjOutFileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">专业</span> <span>
        <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" id="spFileNature" runat="server"><span class="filter-block-lb">
        资料状态</span> <span>
            <zhongsoft:LightDropDownList ID="ddlFileNature" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand" BindGridViewMethod="BindFileList">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业" ItemStyle-Width="30px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="资料类别" ItemStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料编号" ItemStyle-Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料名称" DataParamFields="WBSID"
                DialogMode="Dialog" EditItemClick="viewItem" ShowToolTip="true" Width="120px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="资料性质" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFileImp"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="提资单位" ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbProviderUnit"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="资料状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFileNature"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="验证人" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbCheckUser"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="验证日期" DataFormatString="{0:yyyy-MM-dd}"
                ItemStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="提交状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
