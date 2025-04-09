<%@ Page Title="工程获奖信息" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="MarketProjectAwardEntityList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.MarketProjectAwardEntityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnAdd" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return AddItem()"><span>
            <img  src="../../../Themes/Images/btn_add.gif" width="16" height="16"/>新建</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">获奖级别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlLevel" EnableTheming="False" CssClass="kpms-ddlsearch" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">获奖等次</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRanking" EnableTheming="False" CssClass="kpms-ddlsearch" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">获奖类别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlType" EnableTheming="False" CssClass="kpms-ddlsearch" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">获奖年度</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbYear" EnableTheming="False" CssClass="kpms-textboxsearch" DataType="Integer" MaxLength="4" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch"
            EnableTheming="false" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">授奖单位</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbAwardingUnitName" CssClass="kpms-textboxsearch"
            EnableTheming="false" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="15" ShowExport="True" UseDefaultDataSource="True" BindGridViewMethod="BindData"
        AllowSorting="true" DataKeyNames="MarketProjectAwardEntityID" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" ToolTip="查看" DataParamFields="MarketProjectAwardEntityID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif" />
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" ToolTip="编辑" DataParamFields="MarketProjectAwardEntityID"
                ImageUrl="../../../Themes/Images/btn_dg_edit.gif" />
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ToolTip="删除" DataParamFields="MarketProjectAwardEntityID"
                ImageUrl="../../../Themes/Images/btn_dg_delete.gif" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="MarketProjectName" SortExpression="MarketProjectName" />
            <zhongsoft:LightBoundField HeaderText="获奖级别" DataField="AwardLevel" SortExpression="AwardLevel" />
            <zhongsoft:LightBoundField HeaderText="授奖单位" DataField="AwardingUnitName" HeaderStyle-Width="150px" ShowToolTip="true" SortExpression="AwardingUnitName" />
            <zhongsoft:LightBoundField HeaderText="获奖等次" DataField="AwardRanking" SortExpression="AwardRanking" />
            <zhongsoft:LightBoundField HeaderText="获奖年度" DataField="AwardYear" SortExpression="AwardYear" />
            <zhongsoft:LightBoundField HeaderText="获奖类别" DataField="AwardType" SortExpression="AwardType" />
        </Columns>
    </zhongsoft:LightPowerGridView>

    <asp:Button runat="server" ID="btnCallBack" Visible="False" OnClick="btnCallBack_OnClick" />
    <script type="text/javascript">

        //新增正式工程
        function AddItem() {
            var json = { isFormalProject: 1 }
            var url = buildBizUrl(2, null, "MM/List/MM/MarketProjectAwardEntityEditor.aspx", json);
            showDivDialog(url, null, 850, 500, editCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function editCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnCallBack,"") %>
        }

        //查看详细信息
        function viewDetail(id) {
            var json = { isFormalProject: 1 }
            var url = buildBizUrl(1, id, "MM/List/MM/MarketProjectAwardEntityEditor.aspx", json);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, null);
            return false;
        }

        //编辑详细信息
        function editDetail(id) {
            var json = { isFormalProject: 1 }
            var url = buildBizUrl(3, id, "MM/List/MM/MarketProjectAwardEntityEditor.aspx", json);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, editCallBack);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
