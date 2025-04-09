<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="各专业工程进展状态统计" CodeBehind="SpecialtyProjProgressSta.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.SpecialtyProjProgressSta" %>

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
            style="width: 75px;" class="kpms-textbox" />
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

    <!--隐藏高级查询-->
    <span class="filter-block" flag="conditionHide"><span class="filter-block-lb">交出类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlStatisticType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Text="院交出" Value="FactDeliveryTime" />
            <asp:ListItem Text="室交出" Value="FactRecheckTime1" />
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" UseDefaultDataSource="true"
        BindGridViewMethod="BindGrid" OnRowCreated="gvList_RowCreated" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="BusinessType" HeaderText="类别" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ZSR" HeaderText="主设人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AllWorkDay" HeaderText="合计" ItemStyle-HorizontalAlign="Right" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ComWorkDay" HeaderText="已完成" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F2}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayRate" HeaderText="完成%" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F2}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastWorkDay" HeaderText="剩余" ItemStyle-HorizontalAlign="Right" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AllRoll" HeaderText="合计" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ComRoll" HeaderText="已完成" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RollRate" HeaderText="完成%" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastRoll" HeaderText="剩余" ItemStyle-HorizontalAlign="Right">
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
