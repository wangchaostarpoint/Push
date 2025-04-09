<%@ Page Title="投标项目开标记录" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="TenderOpenRecordList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.TenderOpenRecordList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">投标编号</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbBidNumber" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">开标日期</span><span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtBidstartDate" runat="server" readonly="readonly" />
        -
        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtBidEndDate" runat="server" readonly="readonly" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="15" UseDefaultDataSource="True" BindGridViewMethod="BindData" OnRowDataBound="gvList_OnRowDataBound" ShowExport="True" OnExport="gvList_OnExport">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showTender" DataParamFields="TenderOpenRecordID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editTender" DataParamFields="TenderOpenRecordID"
                ImageUrl="../../../Themes/Images/btn_dg_edit.gif" Visible="False">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightBoundField HeaderText="投标编号" DataField="BidNumber" />
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="开标时间" DataField="BidOpenDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="是否中标" DataField="IsWinBid" />
            <zhongsoft:LightBoundField HeaderText="未中标原因" DataField="NotWinBidReason" ShowToolTip="True" Width="200px" />
            <zhongsoft:LightBoundField HeaderText="开标地点" DataField="BidOpenPlace" />
            <zhongsoft:LightBoundField HeaderText="参与开标人员" DataField="JoinUserNames" ShowToolTip="True" Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnTenderCallBack" runat="server" Visible="false" OnClick="btnTenderCallBack_OnClick" />
    <script type="text/javascript">
        //查看详细信息
        function showTender(id) {
            var url = buildBizUrl(1, id, "MM/List/MDM/TenderOpenRecordEditor.aspx", null);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, null);
            return false;
        }

        function editTender(id) {
            var url = buildBizUrl(3, id, "MM/List/MDM/TenderOpenRecordEditor.aspx", null);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, editTenderCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function editTenderCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnTenderCallBack,"") %>
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
