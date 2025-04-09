<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="单项目任务成品统计" CodeBehind="SingleProjRollProductSta.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.SingleProjRollProductSta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>项目名称 </span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','txtDesigner':'ManagerUserName','txtDesignSize':'ProjectScale'}"
            OnClick="txtProjectName_Click" Style="width: 255px;"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span><span class="filter-block"><span>项目编号 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" readonly="readonly"
            class="kpms-textbox" style="width: 75px;" />
    </span></span><span class="filter-block"><span>设计阶段 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" readonly="readonly" class="kpms-textbox"
            style="width: 75px;" />
    </span></span><span class="filter-block"><span>设总 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtDesigner" readonly="readonly" class="kpms-textbox"
            style="width: 75px;" />
    </span></span><span class="filter-block" flag="conditionHide"><span>设计规模 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtDesignSize" readonly="readonly" class="kpms-textbox"
            style="width: 75px;" />
    </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span>专业</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" flag="conditionHide"><span>所属类别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRollType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" flag="conditionHide"><span class="filter-block-lb">室交出时间</span>
        <span>
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtRoomStartTime"
                runat="server" readonly="readonly" compare="1" />
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtRoomEndTime" runat="server"
                readonly="readonly" compare="1" />
        </span></span><span class="filter-block" flag="conditionHide"><span class="filter-block-lb">部交出时间</span>
            <span>
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtDeptStartTime"
                    runat="server" readonly="readonly" compare="2" />
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtDeptEndTime" runat="server"
                    readonly="readonly" compare="2" />
            </span></span><span class="filter-block"><span class="filter-block-lb">交付业主时间</span>
                <span>
                    <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtDeliverStartTime"
                        runat="server" readonly="readonly" compare="3" />
                    <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtDeliverEndTime"
                        runat="server" readonly="readonly" compare="3" />
                </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="WBSID"
        UseDefaultDataSource="false" BindGridViewMethod="BindGrid" ShowFooter="true"
        OnRowDataBound="gvList_RowDataBound">
        <FooterStyle ForeColor="Red" HorizontalAlign="Right" />
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfConfirm" HeaderText="定额工日" ItemStyle-HorizontalAlign="Right" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="任务负责人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="NewNatureMapSum" HeaderText="新制图" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ActiveNatureMapSum" HeaderText="活用图" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MapALLSum" HeaderText="图纸<br/>总张数" HtmlEncode="false"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="NewStandardMapSum" HeaderText="新制<br/>标准张"
                HtmlEncode="false" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExplainBookCount" HeaderText="说明书" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LiquidationBookCount" HeaderText="设备<br/>材料清册"
                HtmlEncode="false" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BudgetBookCount" HeaderText="估（概、预）<br/>算书"
                HtmlEncode="false" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="EquipTenderBookCount" HeaderText="设备标书" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TopicReportCount" HeaderText="专题报告" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactRecheckTime1" HeaderText="室交出<br/>时间" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactRecheckTime2" HeaderText="部交出<br/>时间" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VerifyEndDate" HeaderText="校审完成<br/>时间" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PublishedDate" HeaderText="出版完成<br/>时间" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactDeliveryTime" HeaderText="交付业主<br/>时间"
                HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
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
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
