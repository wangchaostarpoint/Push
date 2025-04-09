<%@ Page Title="国内签约情况统计表" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="DomesticContractSignStatistics.aspx.cs" Inherits="Zhongsoft.Portal.MM.Report.DomesticContractSignStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务版块</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlat" CssClass="kpms-ddlsearch" EnableTheming="False" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">合同编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">合同状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">会签状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSignState" />
    </span></span>
    <span class="filter-block" style="display: none"><span class="filter-block-lb">签约状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractStatus" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">签约日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtStartTime"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtEndTime"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
    <span class="filter-block" style="display: none"><span class="filter-block-lb"></span><span>
        <asp:CheckBox runat="server" ID="ckbThisMonth" Text="本月新签" TextAlign="Left" />
    </span></span>

    <span class="filter-block">
        <span class="filter-block-lb">全字段查询</span><span>
            <span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlColumn" CssClass="kpms-ddlsearch" EnableTheming="False" />
                <zhongsoft:LightDropDownList runat="server" ID="ddlCondition" CssClass="kpms-ddlsearch" EnableTheming="False" onchange="conditionChange();" />
                <zhongsoft:LightTextBox runat="server" ID="tbCondition" CssClass="kpms-textboxsearch" EnableTheming="False" />
            </span>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" BindGridViewMethod="BindData" AllowPaging="True" PageSize="15"
        ShowExport="True" OnRowCreated="gvList_OnRowCreated" OnRowDataBound="gvList_OnRowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Eval("Sort") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="1工程项目或合同名称" DataField="ContractName" />
            <zhongsoft:LightBoundField HeaderText="2合同金额（万元）" DataField="ContractValue" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="3实物量指标1" DataField="PhysicalIndicator1" />
            <zhongsoft:LightBoundField HeaderText="4实物量" DataField="Converting1" />
            <zhongsoft:LightBoundField HeaderText="5实物量指标2" DataField="PhysicalIndicator2" />
            <zhongsoft:LightBoundField HeaderText="6实物量" DataField="Converting2" />
            <zhongsoft:LightBoundField HeaderText="7中标时间" DataField="SignDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="8合同签订时间" DataField="SignDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="9开始时间" DataField="SignDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="10结束时间" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="11日历天" />
            <zhongsoft:LightBoundField HeaderText="12项目类别" DataField="ProjectClass" />
            <zhongsoft:LightBoundField HeaderText="13合同类别" DataField="ContractTypeName" />
            <zhongsoft:LightBoundField HeaderText="14新产业类别" DataField="NewIndustryType" />
            <zhongsoft:LightBoundField HeaderText="15商业模式类别" DataField="BusinessMode" />
            <zhongsoft:LightBoundField HeaderText="16所在省" DataField="Province" />
            <zhongsoft:LightBoundField HeaderText="17所在市" DataField="Area" />
            <zhongsoft:LightBoundField HeaderText="18合同状态" DataField="ContractState" />
            <zhongsoft:LightBoundField HeaderText="19是否直接从建设单位承揽" DataField="IsBuildUnit" />
            <zhongsoft:LightBoundField HeaderText="20建设单位" DataField="CustomerName" />
            <zhongsoft:LightBoundField HeaderText="21建设单位分类" DataField="BuildUnit" />
            <zhongsoft:LightBoundField HeaderText="22合同甲方" DataField="PartyA" />
            <zhongsoft:LightBoundField HeaderText="23合同甲方（内部分包）" />
            <zhongsoft:LightBoundField HeaderText="24合同乙方" DataField="PartyB" />
            <zhongsoft:LightBoundField HeaderText="25填报单位" />
            <zhongsoft:LightBoundField HeaderText="26报表专责备注栏" />
            <zhongsoft:LightBoundField HeaderText="27集团专责备注栏" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            //将GridView列表外层div宽度设置为低于当前界面的比较小的宽度,以便于上方查询条件区域完全显示
            $("#div2").width("100");
            //获取查询条件区域宽度
            var tbQuery = $("#tbQuery");
            //设置GridView最外层div的宽度和上方查询条件区域宽度一致
            $("#divContent").width(tbQuery[0].clientWidth);
            //恢复GridView区域宽度为100%显示 此时下发横向滚动条和右面竖向滚动条正常显示
            $("#div2").width("100%");
            conditionChange();
        }

        function conditionChange() {
            var checkText = $("#<%=ddlCondition.ClientID %>").find("option:selected").val();
            if (checkText.indexOf("NULL") > 0) {
                $("#<%=tbCondition.ClientID%>").val('');
                $("#<%=tbCondition.ClientID%>").attr("readonly", "readonly");
            } else {
                $("#<%=tbCondition.ClientID%>").removeAttr("readonly");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
