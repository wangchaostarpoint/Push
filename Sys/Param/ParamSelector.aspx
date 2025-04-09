<%@ Page Title="系统参数选择页面" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="ParamSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.ParamSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    参数名称<asp:TextBox ID="tbName" MaxLength="20" runat="server" Width="120px"></asp:TextBox>
    <script>
        function addParam() {
            var url = "ParamEditor.aspx?actionType=2";
            var stringFeatures = "dialogHeight:550px; dialogWidth:650px;resizable: Yes; scroll:auto; status: no;";
            var re = window.showModalDialog(encodeURI(url), null, stringFeatures);
            if (re != undefined) {
                return true;
            }
            return false;
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="gvList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:BoundField DataField="ParamName" HeaderText="参数名称" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
