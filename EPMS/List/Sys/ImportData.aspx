<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ImportData.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ImportData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <p />
    <%--        <b>请选择模板类型：<zhongsoft:LightDropDownList ID="ddlProjTempType" runat="server">
        </zhongsoft:LightDropDownList>
        </b><b>请选择要导入的模板：<zhongsoft:LightDropDownList ID="ddlProjTempName" runat="server">
        </zhongsoft:LightDropDownList>
        </b>--%>
    <table class="kpms-table">       
        <tr>
            <td>
                请选择要导入的模板
            </td>
            <td>
                <zhongsoft:LightDropDownList ID="ddlProjTempName" runat="server">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
         <tr>
            <td>
                请选择模板类型
            </td>
            <td>
                <zhongsoft:LightDropDownList ID="ddlProjTempType" runat="server">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
    <table class="kpms-table">
        <tr>
            <td>
                <a href="<%=WebAppPath %>/EPMS/DownLoad/标准化模板.xls" target="_blank" class="btn">
                    <img alt="下载" src="../../../Themes/Images/accessory_excel.gif" />下载模板</a>
            </td>
        </tr>
        <tr id="Tr1" runat="server" visible="true">
            <td>
                选择要导入的Excel文件：<asp:FileUpload ID="FileUpload1" runat="server" Width="400px" />
            </td>
        </tr>
        <tr id="Tr2" runat="server" visible="true">
            <td>
                <asp:Button ID="btnImport" runat="server" Text="导入" OnClientClick=" return checkImportData()"
                    OnClick="btnImport_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    错误信息：</p>
                <asp:TextBox runat="server" ID="txtErrMsg" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false"></asp:TextBox>
            </td>
        </tr>
    </table>

    <script type="text/javascript">
        function checkImportData() {
            if ($('#<%= ddlProjTempType.ClientID  %> option:selected').text() == '请选择' ||
            $('#<%= ddlProjTempName.ClientID  %> option:selected').text() == '请选择') {
                alert("请选择模板类型和模板名称");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
