<%@ Page Title="文档在线编辑签章选择列表" MasterPageFile="~/UI/Master/ObjectSelector.Master" Language="C#" AutoEventWireup="true" CodeBehind="SelectSignatureList.aspx.cs" Inherits="Zhongsoft.Portal.WebOffice.SelectSignatureList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server" Visible="false">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="false" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true" DataKeyNames="SealRegisterId">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="印章名称" DataField="SealName" />
            <zhongsoft:LightBoundField HeaderText="印章类别" DataField="SealTypeText" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script language="javascript" type="text/javascript">
        document.getElementById("tdtoolBar").style.display = "none";
    </script>
</asp:Content>
