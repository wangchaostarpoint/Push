<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamSingleSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.ParamSingleSelector" Title="选择单项" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                单项名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="ParamSingleID"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="SingleName" HeaderText="单项名称" />
            <zhongsoft:LightTemplateField HeaderText="业务类型">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbBizType"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目阶段">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPhaseName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="是否项目单项">
                <ItemTemplate>
                    <%# Convert.ToInt32(Eval("IsProject"))==1?"是":"否"%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
 
    </script>
</asp:Content>
