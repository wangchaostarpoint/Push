<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.ContractSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择合同" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>合同编号/名称<zhongsoft:LightTextBox ID="tbContract" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
            <td style="display: none">合同类别<zhongsoft:LightDropDownList runat="server" ID="ddlContractType" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
            </td>
            <td>合同状态
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" CssClass="kpms-ddlsearch" EnableTheming="False"/>
            </td>
            <td>签订日期<zhongsoft:XHtmlInputText ID="txtSignDateStart" runat="server" ReadOnly="true"
                                              class="kpms-textbox-comparedate" compare="1" />
                至
                <zhongsoft:XHtmlInputText ID="txtSignDateEnd" runat="server" ReadOnly="true" class="kpms-textbox-comparedate"
                                          compare="1" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvContract" AllowPaging="true"
        PageSize="9" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        DataKeyNames="ContractId" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="CONTRACTCODE" HeaderText="合同编号" ItemStyle-Wrap="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTNAME" HeaderText="合同名称" MaxLength="20"
                Width="200">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ContractTypeName" HeaderText="合同类别" MaxLength="20"
                Width="200">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SIGNDATE" HeaderText="签订日期" DataFormatString="{0:yyyy-MM-dd}"
                Width="70">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="合同金额（万元）" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <%#string.IsNullOrEmpty( Convert.ToString(Eval("CONTRACTVALUE")))?"":(Convert.ToDecimal(Eval("CONTRACTVALUE"))/10000).ToString("F2") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
