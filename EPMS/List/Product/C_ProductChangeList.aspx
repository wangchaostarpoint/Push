<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_ProductChangeList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.C_ProductChangeList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="产品设计修改" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <%-- <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery" style="display: none;">--%>
    <span class="filter-block" style="display: none;"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false">></asp:TextBox>
    </span></span><span class="filter-block" style="display: none;"><span class="filter-block-lb">任务类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" Style="width: 155px; margin: 3px 0px;">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">修改类型</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlModifyNature" Style="width: 155px; margin: 3px 0px;">
                <asp:ListItem Value="">请选择</asp:ListItem>
                <asp:ListItem Value="一般修改">一般修改</asp:ListItem>
                <asp:ListItem Value="设计修改">设计修改</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </span></span>
    <%if (!(Request.QueryString["IsHideStartWf"] == "1"))
        {%>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《产品设计修改》</h4>
            </a></span>
    </span>
    <% } %>
    <%--</div>
    </fieldset>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProductChange" AutoGenerateColumns="false"
        DataKeyNames="ProductModifyID" ShowExport="true" HideFieldOnExport="全部" runat="server"
        BindGridViewMethod="BindDataGrid" OnSorting="gvProductChange_Sorting" ShowPageSizeChange="true"
        AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName" Visible="false">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="名称" DataField="WBSName" SortExpression="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="修改类型" DataField="ModifyNature" SortExpression="ModifyNature">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="修改原因" DataField="ModifyReason" SortExpression="ModifyReason">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="WriteUserName" SortExpression="WriteUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="修改状态" DataField="ModifyState" SortExpression="ModifyState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="成品信息" CommandName="ViewProduct" DataParamFields="WBSID"
                EditItemClick="viewProduct">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="查看流程" CommandName="ViewData" DataParamFields="ProductModifyID,ISOLD"
                EditItemClick="viewFormDetail">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvProductChange.CheckedClientID %>";

        function viewProduct(rollID) {
            var url = buildQueryUrl("/EPMS/List/Product/C_ProductList.aspx", { "RollID": rollID, "secid": "B53E6C85-096B-4A6B-98D9-8A78774FC8CC" });
            showDivDialog(url, "", 1250, 530);
            return false;
        }
        //发起《产品设计修改》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSProductModify.xpdl', xpdlId: 'EPMSProductModify_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProductModify.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url, "workspace");
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
