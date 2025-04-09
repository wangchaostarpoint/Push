<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_PublishConsignList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.C_PublishConsignList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="委托交付台账" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">专业</span><span>
            <zhongsoft:LightDropDownList ID="ddlSpeInfo" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">室交出时间</span>
            <span>
                <zhongsoft:XHtmlInputText runat="server" ID="tbBegin" compare="2" class="kpms-textbox-comparedate"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
                至<zhongsoft:XHtmlInputText runat="server" ID="tbEnd" compare="2" class="kpms-textbox-comparedate"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <table>
        <tr>
            <td>
                <asp:LinkButton ID="lkbNotPublish" runat="server" EnableTheming="false" CssClass="btn-query"
                    OnClick="lkbNotPublish_Click"><span>设计完成未出版</span></asp:LinkButton>
                <asp:LinkButton ID="lkbPublishing" runat="server" EnableTheming="false" CssClass="btn-query"
                    OnClick="lkbPublishing_Click"><span>正在出版</span></asp:LinkButton>
                <asp:LinkButton ID="lkbNotDeliver" runat="server" EnableTheming="false" CssClass="btn-query"
                    OnClick="lkbNotDeliver_Click"> <span>未交付</span></asp:LinkButton>
                <asp:LinkButton ID="lkbDelivered" runat="server" EnableTheming="false" CssClass="btn-query"
                    OnClick="lkbDelivered_Click"><span>已交付</span></asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvPublish" AutoGenerateColumns="false"
        DataKeyNames="" ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        OnSorting="gvPublish_Sorting" ShowPageSizeChange="true" AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="PutDeptName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="名称" DataField="WBSName" SortExpression="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务负责人" DataField="WBSOwnerName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划室交出时间" DataField="PlanRecheckTime1" SortExpression="PlanRecheckTime1">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="室交出时间" DataField="FactRecheckTime1" SortExpression="FactRecheckTime1">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部交出时间" DataField="FactRecheckTime2" SortExpression="FactRecheckTime2">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出版完成时间" DataField="PublishCompleteTime" SortExpression="PublishCompleteTime">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="送出版时间" DataField="ConsignData" SortExpression="ConsignData">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="交付业主时间" DataField="FactDeliveryTime" SortExpression="FactDeliveryTime">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出版状态" DataField="PublishState" SortExpression="PublishState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="交付状态" DataField="DeliveryState" SortExpression="DeliveryState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看委托流程" CommandName="ViewData" DataParamFields="PublishConsignID,IsOldConsign"
                EditItemClick="viewFormDetail">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="查看交付流程" CommandName="ViewData" DataParamFields="PublishDeliverID,IsOldDeliver"
                EditItemClick="viewFormDetail">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvPublish.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
