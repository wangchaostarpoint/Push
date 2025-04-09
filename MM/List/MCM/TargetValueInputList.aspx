<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TargetValueInputList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.TargetValueInputList"
    Title="目标值录入" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="lbtnSave" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return false;">
            <span>
                <img runat="server" id="img2" src="~/Themes/Images/btn_new.gif" alt="保存" height="16" />保存</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"  OnRowCommand="gvList_RowCommand"
        DataKeyNames="TargetValueID" UseDefaultDataSource="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("TargetValueID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TargetMonth" HeaderText="月度">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="新签合同（万元）" ItemStyle-Width="60px"
                ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbNewContract" CssClass="kpms-textbox-money"
                        Width="90%" EnableTheming="false" Text='<%#Eval("NewContract") ==null?"":(Convert.ToDecimal( Eval("NewContract"))/10000).ToString("F2")%>' DataType="Decimal2">
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同收费（万元）" ItemStyle-Width="60px"
                ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbContractCharge" CssClass="kpms-textbox-money"
                        Width="90%" EnableTheming="false" Text='<%#Eval("ContractCharge")==null?"":(Convert.ToDecimal( Eval("ContractCharge"))/10000).ToString("F2")%>' DataType="Decimal2">
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="内部利润（万元）" ItemStyle-Width="60px"
                ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbInternalProfit" CssClass="kpms-textbox-money"
                        Width="90%" EnableTheming="false" Text='<%#Eval("InternalProfit") ==null?"":(Convert.ToDecimal( Eval("InternalProfit"))/10000).ToString("F2")%>' DataType="Decimal2">
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Style="display: none" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            $('#<%=lbtnSave.ClientID %>').bind('click', function () {
                saveTargetInfo();
            });

            function saveTargetInfo() {
                $('#<%=btnSave.ClientID %>').click();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

