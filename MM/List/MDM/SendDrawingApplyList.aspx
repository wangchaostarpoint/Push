<%@ Page Title="送图申请台帐" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="SendDrawingApplyList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MDM.SendDrawingApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">送图信息</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbSendDrawingInfo" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">是否同意</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlIsAgree">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Value="1">同意</asp:ListItem>
            <asp:ListItem Value="0">不同意</asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtDateStart" class="kpms-textbox-date" readonly="readonly"/> -
        <zhongsoft:XHtmlInputText runat="server" ID="txtDateEnd" class="kpms-textbox-date" readonly="readonly"/>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" ShowExport="True" AllowPaging="True" PageSize="15" BindGridViewMethod="BindData" 
                                  UseDefaultDataSource="True" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看送图申请"
                             onclick="viewForm('<%# Eval("SendDrawingApplyID") %>','');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="送图信息" DataField="SendDrawingInfo" Width="200px" ShowToolTip="True" />
            <zhongsoft:LightTemplateField HeaderText="是否同意" ItemStyle-Width="80px">
                <ItemTemplate>
                    <%#Eval("IsAgree").ToString()=="1"?"同意":"不同意" %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="不同意原因" DataField="DisagreeReasons" ShowToolTip="True" Width="200px" />
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ApplyUserName" />
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" />
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
