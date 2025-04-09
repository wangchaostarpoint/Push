<%@ Page Language="C#" AutoEventWireup="true" Title="项目经费使用记录" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjectCostList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjectCostList" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">申请类型</span> <span>
        <asp:DropDownList runat="server" ID="ddlApplyType" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Value="用车申请">用车申请</asp:ListItem>
            <asp:ListItem Value="超标交通工具乘坐申请">超标交通工具乘坐申请</asp:ListItem>
            <asp:ListItem Value="业务招待费">业务招待费</asp:ListItem>
            <asp:ListItem Value="加班费">加班费</asp:ListItem>
            <asp:ListItem Value="差旅费报销">差旅费报销</asp:ListItem>
            <asp:ListItem Value="日常报销">日常报销</asp:ListItem>
            <asp:ListItem Value="印制申请">印制申请</asp:ListItem>
            <asp:ListItem Value="办公用品成本费用">办公用品成本费用</asp:ListItem>
        </asp:DropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请时间：</span> <span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDateStart" class="kpms-textbox-date" activestatus="(23.*)" readonly="readonly" />
        <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDateEnd" class="kpms-textbox-date" activestatus="(23.*)" readonly="readonly" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <%--自定义按钮--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="ApplyID"
        UseDefaultDataSource="true" BindGridViewMethod="BindList" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand" ShowFooter="true">
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
                             onclick="viewForm('<%# Eval("ApplyID") %>','');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="费用类型" DataField="ApplyType" />
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ApplyUserName" />
            <zhongsoft:LightBoundField HeaderText="申请时间" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="费用（元）" DataField="Cost" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ApplyUserName" />
            <zhongsoft:LightBoundField HeaderText="事项" DataField="ApplyReason" />
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