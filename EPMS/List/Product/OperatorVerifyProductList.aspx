<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperatorVerifyProductList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.OperatorVerifyProductList" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="校审成品信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="detailContent" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvProductList" AllowPaging="true"
        EmptyDataText="没有成品信息" AutoGenerateColumns="false" ShowExport="true" UseDefaultDataSource="true"
        PageSize="10" BindGridViewMethod="BindVerifyProduct" OnRowDataBound="gvProductList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OperateUserName" HeaderText="校审人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="校审岗位">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OperateStartTime" HeaderText="校审开始时间" DataFormatString="{0:yyyy-MM-dd}"
                ItemStyle-Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OperateFinishTime" HeaderText="校审完成时间" DataFormatString="{0:yyyy-MM-dd}"
                ItemStyle-Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="校审状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="UpLoadDate" HeaderText="上传日期" DataFormatString="{0:yyyy-MM-dd}"
                ItemStyle-Width="70px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
