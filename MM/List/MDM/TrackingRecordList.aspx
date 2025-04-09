<%@ Page Language="C#" AutoEventWireup="true" Title="跟踪记录信息" CodeBehind="TrackingRecordList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.TrackingRecordList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">所属工程包/工程名称</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程类别</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">记录时间</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtStart"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtEnd"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="TrackingRecordID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid" OnExport="gvList_Export">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_view.gif" 
                                    onclick="viewItem('1','<%# Eval("TrackingRecordID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="BelongProjectPackage" HeaderText="工程包" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="工程名称" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="工程类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectScale" HeaderText="工程规模" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RecordTime" HeaderText="记录时间" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="80px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Theme" HeaderText="跟踪主题" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Content" HeaderText="跟踪内容" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Memo" HeaderText="备注" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function viewItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/MM/List/MDM/TrackingRecordEditor.aspx', json);
            showDivDialog(url, "", 650, 350, null);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


