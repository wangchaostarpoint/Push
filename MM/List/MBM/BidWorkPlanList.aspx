﻿<%@ Page Title="投标工作策划台帐" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="BidWorkPlanList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MBM.BidWorkPlanList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工程名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbMarketName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">承办部门</span><span>
        <zhongsoft:LightDropDownList ID="ddlUndertakeDeptName" runat="server">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">开标时间</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" readonly="readonly" class="kpms-textbox-comparedate" compare="1" />
        -
        <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" readonly="readonly" class="kpms-textbox-comparedate" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" AllowPaging="True" ShowExport="True" PageSize="15"
        BindGridViewMethod="BindData" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                    <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看投标工作策划流程信息"
                         onclick="viewForm('<%# Eval("BidWorkPlanID") %>','');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="承办部门" DataField="DutyDeptName" />
            <zhongsoft:LightBoundField HeaderText="开标时间" DataField="BidOpenDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="编制人" DataField="PlanWriteUserName" />
            <zhongsoft:LightBoundField HeaderText="编标时间" DataField="FormulateBidDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="编标截止时间" DataField="FormulateBidEndDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="编标地点" DataField="FormulateBidPlace" DataFormatString="{0:yyyy-MM-dd}" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
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
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
