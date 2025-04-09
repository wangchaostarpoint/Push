<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyRecordStatistics.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.VerifyRecordStatistics" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">卷册负责人</span>
        <span>
            <zhongsoft:LightTextBox ID="tbOwnerName" search="1" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
            <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">分院</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
            </zhongsoft:LightDropDownList>
        </span></span>
    <asp:LinkButton runat="server" ID="lbtnReBindSpe" OnClick="ddlDept_SelectedIndexChanged"
        Style="display: none"></asp:LinkButton>

    <span class="filter-block"><span class="filter-block-lb">专业</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" flag="conditionHide"><span class="filter-block-lb">是否具备校审条件</span><span>
        <zhongsoft:LightDropDownList ID="ddlHasCondition" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Text="不具备" Value="0"></asp:ListItem>
            <asp:ListItem Text="具备" Value="1"></asp:ListItem>
            <%--                <asp:ListItem Text="未关闭" Value="2"></asp:ListItem>
            --%>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" flag="conditionHide"><span class="filter-block-lb">是否允许</span><span>
        <zhongsoft:LightDropDownList ID="ddlIsAllowVerify" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Value="0">不允许</asp:ListItem>
            <asp:ListItem Value="1">允许</asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">校审开始日期</span><span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSCreateDate" runat="server"
            readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFCreateDate" runat="server"
            readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvVerifyRoll" AutoGenerateColumns="false"
        ShowExport="true" runat="server" BindGridViewMethod="BindVerifyRoll" PageSize="10"
        UseDefaultDataSource="false" ShowPageSizeChange="true" OnRowDataBound="gvVerifyRoll_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="分院" DataField="BelongDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册负责人" DataField="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否具备<br/>校审条件" ItemStyle-Width="30px" Visible="false">
                <ItemTemplate>
                    <%#(Eval("IsHaveCondition") == null || string.IsNullOrEmpty(Eval("IsHaveCondition").ToString())) ? "" : Convert.ToString(Eval("IsHaveCondition")) == "1" ? "具备" : "不具备"%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="是否允许" ItemStyle-Width="30px" Visible="false">
                <ItemTemplate>
                    <%#(Eval("IsAllowStartVerify") == null || string.IsNullOrEmpty(Eval("IsAllowStartVerify").ToString()))?"":Convert.ToString(Eval("IsAllowStartVerify")) == "1" ? "允许" : "不允许"%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看详细" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false">
                                                 <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_detail.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <script type="text/javascript">

        function initCustomerPlugin() {
            setConditionHide();

            $("#<%=ddlDept.ClientID %>").live("change", function () { afterDeptChange(); });
        }

        // 隐藏筛选条件
        function setConditionHide() {
            $('[flag="conditionHide"]').hide();
        }

        function afterDeptChange() {
            <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnReBindSpe, "")%>;
        }

        function viewVerifyFlow(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
