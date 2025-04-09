<%@ Page Language="C#" AutoEventWireup="true" Title="选择模板文件" CodeBehind="ProjectTemplateFileSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjectTemplateFileSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                模板类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                模板文件名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvFileList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="TemplateFileID"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="类型" />
            <zhongsoft:LightBoundField DataField="TemplateFileName" HeaderText="模板文件名称" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiProjectName" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            var $sure = $(".ui-button-text");
        }
    
    </script>
</asp:Content>
