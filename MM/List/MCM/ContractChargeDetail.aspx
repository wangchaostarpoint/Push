<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractChargeDetail.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractChargeDetail"
    MasterPageFile="~/UI/Master/ObjectList.Master" Title="合同收费情况" %>

<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">合同编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContract" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" BindGridViewMethod="BindData"
        DataKeyNames="ChargeContractDetailID" AllowPaging="true" PageSize="15" ShowExport="true" ShowFooter="true"
        OnRowDataBound="gvList_RowDataBound">
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
            <zhongsoft:LightBoundField DataField="ContractValue" HeaderText="合同额（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="HadCharge" HeaderText="已收费（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SplitValue" HeaderText="本次收费额（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="收费时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
        <FooterStyle ForeColor="Red" HorizontalAlign="Right" />
    </zhongsoft:LightPowerGridView>
</asp:Content>


