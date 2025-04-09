<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileCatalogManager.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.FileDocument.FileCatalogManager" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls" TagPrefix="zhongsoft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KPMS文档管理</title>
</head>
<body>
    <form id="form1" runat="server">
    <table class="kpms-detailtabletotal" width="100%">
        <!---title--->
        <tr>
            <td class="kpms-detailtop">
                <img src="../../Themes/Images/btn_title.gif"/>文档管理
            </td>
        </tr>
        <!---搜索--->
        <tr>
            <td class="kpms-detailtoptitle">
                <table class="kpms-detsearch">
                    <tr>
                        <td>
                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="100%" cellpadding="2px" cellspacing="0px">
        <tr>
            <td width="20%" valign="top" style="border-width: 1px; border-color: #6699FF; border-style: solid">
                <asp:TreeView ID="CatalogTree" runat="server" OnSelectedNodeChanged="CatalogTree_SelectedNodeChanged"
                    ShowLines="True">
                </asp:TreeView>
            </td>
            <td valign="top">
                <zhongsoft:LightPowerGridView ID="filesList" runat="server" AutoGenerateColumns="false" Width="100%"
                    AllowPaging="true">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"><%#Eval("FileName") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CreateUserName" HeaderText="创建人" />
                        <asp:BoundField DataField="CreateDate" HeaderText="创建时间" />
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
