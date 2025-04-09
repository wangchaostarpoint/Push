<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectChargeDetail.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ProjectChargeDetail"
    MasterPageFile="~/UI/Master/ObjectList.Master" Title="项目收费情况" %>

<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" BindGridViewMethod="BindData"
        DataKeyNames="ChargeMProjectDetailID" AllowPaging="true" PageSize="15" ShowExport="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ContractCode" HeaderText="合同编号" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ContractName" HeaderText="合同名称" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MarketProjectCode" HeaderText="工程编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MarketProjectName" HeaderText="工程名称" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ContractValue" HeaderText="工程合同额" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ChargedValue" HeaderText="已收费（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SplitValue" HeaderText="本次收费额（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="收费时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>



