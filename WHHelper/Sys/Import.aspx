<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Import.aspx.cs"
    Inherits="Zhongsoft.Portal.WHHelper.Sys.Import" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="模板数据导入" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <tr style="height: 30px;">
            <td align="left" style="font-weight: bold; color: blue;">
                <asp:LinkButton ID="bntDownTemp" EnableTheming="false" ForeColor="Blue" runat="server"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold">
                <asp:FileUpload ID="fileUploadFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="btnImport_Click">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_excel.gif" alt="导入" width="16"
                            height="16" />确定导入</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbCount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="color: Red;">
                <asp:Label ID="lbErrorMsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function DownFile(fieldID) {
            var url = "<%=WebAppPath%>/Sys/FileDocument/FileDownload.aspx?fileId=" + fieldID + "&flg=1"
            window.open(url);
        }

        parent.returnValue = "saved";
    </script>
</asp:Content>
