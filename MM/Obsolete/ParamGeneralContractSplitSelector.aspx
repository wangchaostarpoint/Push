<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamGeneralContractSplitSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.ParamGeneralContractSplitSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                分项名称<asp:TextBox ID="tbItemName" MaxLength="15" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:TreeGridView BindJsonClick="true" ID="gvParam" AllowPaging="true" ParentIdColumn="PARENTID"
        SelfIdColumn="PARAMGENERALCONSPLITID" DataKeyNames="PARAMGENERALCONSPLITID" PageSize="10" runat="server"
        AutoGenerateColumns="false" ShowJsonRowColName="True" OnJsonClick="addObject"
        JsonClickMode="onclick" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px">
                <ItemTemplate>
                    <%# gvParam.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GENERALSPLITNAME" HeaderText="名称" />
        </Columns>
    </zhongsoft:TreeGridView>
</asp:Content>
