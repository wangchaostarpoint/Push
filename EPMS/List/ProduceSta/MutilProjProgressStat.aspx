<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MutilProjProgressStat.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.MutilProjProgressStat" MasterPageFile="~/UI/Master/ObjectList.Master" %>

    
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
        <zhongsoft:lightdropdownlist id="ddlProjectType" runat="server" class="kpms-ddlsearch"
            enabletheming="false">
        </zhongsoft:lightdropdownlist>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">设计阶段 </span><span>
        <zhongsoft:lightdropdownlist id="ddlPhase" runat="server" class="kpms-ddlsearch"
            enabletheming="false">
        </zhongsoft:lightdropdownlist>
    </span></span>
    <span class="filter-block" flag="conditionHide"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage" 
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            OnClick="txtProjectName_Click" PageWidth="850" ResultForControls="{'hiOrganizationID':'id'}"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span><span class="filter-block" flag="conditionHide"><span class="filter-block-lb">交出类型</span> <span>
        <zhongsoft:lightdropdownlist id="ddlStatisticType" runat="server" class="kpms-ddlsearch"
            enabletheming="false">
            <asp:ListItem Text="院交出" Value="FactDeliveryTime">
            </asp:ListItem>
            <asp:ListItem Text="室交出" Value="FactRecheckTime1">
            </asp:ListItem>
        </zhongsoft:lightdropdownlist>
    </span></span>

    <!--隐藏高级查询按钮-->
    <span class="filter-block" flag="conditionHide"><span class="filter-block-lb">立项时间</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSProjectFormDate" runat="server"
            readonly="readonly" compare="1"/>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" UseDefaultDataSource="true"
        DataKeyNames="OrganizationID"
        BindGridViewMethod="BindGrid" OnRowCreated="gvList_RowCreated" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="设总">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BusinessType" HeaderText="类别" Visible="false">
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
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>