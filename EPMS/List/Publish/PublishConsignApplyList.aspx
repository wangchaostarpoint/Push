<%@ Page Language="C#" AutoEventWireup="true" Title="印制申请单" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="PublishConsignApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishConsignApplyList" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbProject" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请时间：</span> <span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtConsignTimeStart" class="kpms-textbox-date" activestatus="(23.*)" readonly="readonly" />
        <zhongsoft:XHtmlInputText runat="server" ID="txtConsignTimeEnd" class="kpms-textbox-date" activestatus="(23.*)" readonly="readonly" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <%--自定义按钮--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="PublishConsignID"
        UseDefaultDataSource="false" BindGridViewMethod="BindList" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看"
                             onclick="viewForm('<%# Eval("PublishConsignID") %>','');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="费用类型" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbConsignTypeNew" />
                    <input type="hidden" runat="server" id="hiConsignTypeID" value='<%# Eval("ConsignTypeID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ConsignUserName" />
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="ConsignDeptName" />
            <zhongsoft:LightBoundField HeaderText="申请时间" DataField="ConsignTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="费用" DataField="ChargeSum" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" />
        </Columns>
    </zhongsoft:LightPowerGridView>

    <%--JS区域--%>
    <script type="text/javascript">

        //页面加载执行
        function initCustomerPlugin() {

        }
        //查看流程
        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 0, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>