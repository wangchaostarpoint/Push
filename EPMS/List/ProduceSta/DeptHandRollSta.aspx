<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptHandRollSta.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.DeptHandRollSta" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="ProjectCode"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ResultForControls="{'hiOrganizationID':'id'}" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
     <span class="filter-block"><span class="filter-block-lb">设计阶段 </span><span>
        <zhongsoft:lightdropdownlist id="ddlPhase" runat="server" class="kpms-ddlsearch"
            enabletheming="false">
        </zhongsoft:lightdropdownlist>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">分院</span><span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false"
            AutoPostBack="true" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" flag="conditionHide"><span class="filter-block-lb">专业室</span><span>
        <zhongsoft:LightDropDownList ID="ddlRoom" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlSpecial" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    
    <!--隐藏高级查询按钮-->
    <span class="filter-block" flag="conditionHide"><span class="filter-block-lb">交出类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlStatisticType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Text="室交出时间" Value="FactRecheckTime1">
            </asp:ListItem>
            <asp:ListItem Text="部交出时间" Value="FactRecheckTime2">
            </asp:ListItem>
            <asp:ListItem Text="院交出时间" Value="FactCompleteTime">
            </asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" flag="conditionHide"><span class="filter-block-lb">所属类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRollType" class="kpms-ddlsearch">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" flag="conditionHide"><span class="filter-block-lb">日期范围</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjStatistics" AutoGenerateColumns="false"
        AllowFrozing="true" FrozenColNum="4" FrozenHeight="430px" ShowExport="true" HideFieldOnExport="全部"
        runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowDataBound="gvProjStatistics_RowDataBound"
        UseDefaultDataSource="false" FooterStyle-ForeColor="Red" ShowFooter="true" PageSize="10">
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
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目设总" DataField="ManagerUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务负责人" DataField="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="校核人" DataField="OperatorName" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="主设人" DataField="主设人" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="主任工" DataField="主任工" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="室交出" DataField="FactRecheckTime1" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部交出" DataField="FactRecheckTime2" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="院交出" DataField="FactDeliveryTime" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="校审完成时间" DataField="VerifyEndDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出版日期" DataField="PublishedDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="图纸总张数" DataField="MapALLSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="新制图自然张" DataField="NewNatureMapSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="新制图标准张" DataField="NewStandardMapSumCount"
                ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="活用图自然张" DataField="ActiveNatureMapSumCount"
                ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F0}">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="说明书页数" DataField="ExplainSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="清册页数" DataField="LiquidationSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="估（概、预）算书页数" DataField="BudgetSumCount" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设备标书页数" DataField="equipTenderBookPagesCount"
                ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="定额工日" DataField="WorkDayOfConfirm" ItemStyle-HorizontalAlign="Right" Visible="false">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initCustomerPlugin() {
            setConditionHide();
        }

        // 隐藏筛选条件
        function setConditionHide() {
            $('[flag="conditionHide"]').hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
