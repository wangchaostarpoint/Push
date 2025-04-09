<%@ Page Title="选择编辑页面" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="XEditorSelector.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XEditorSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    页面名称<asp:TextBox ID="tbName" MaxLength="20" runat="server" Width="120px"></asp:TextBox>
    <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click" CssClass="kpms-btn">
    <img alt =""  src="../../Themes/Images/btn_search.gif" content='searchResult'/><span>查询</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" CssClass="kpms-btn" ID="btnReset" OnClick="btnReset_Click">
                     <img alt ="" src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnAdd" class="kpms-btn" OnClick="btnAdd_Click"
        OnClientClick="return addXEditor();">
                     <img alt ="" src="../../Themes/Images/btn_new.gif"/><span>新建</span>
    </asp:LinkButton>

    <script>

        function addXEditor() {
            var url = "XEditorBuilder.aspx?actionType=2";
            var stringFeatures = "dialogHeight:600px; dialogWidth:1000px;resizable: Yes; scroll:auto; status: no;";
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
            <asp:BoundField DataField="EditorName" HeaderText="表单名称" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
