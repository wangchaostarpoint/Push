<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CatalogTree.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.CatalogTree" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <title>武汉分公司API</title>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr>
            <td colspan="2" style=" text-align:right; color:blue;">
               <a href="<%=WebAppPath %>/WHHelper/List/View/ApiTree.aspx" target="_Blank" >查看手册</a> 
            </td>
        </tr>
        <tr>
            <td width="20%" valign="top" style="border: 1px #6699FF solid;"> 
                <asp:TreeView ID="tvCatalogTree" runat="server" ShowLines="True" Height="100%"
                    Width="100%">
                    <SelectedNodeStyle BackColor="#F7F7F7" />
                </asp:TreeView>
            </td>
            <td valign="top" style="width: 90%; height: 100%">
                <iframe src="" frameborder="0" id="ListFrame" name="ListFrame" height="1200px" 
                    width="100%" runat="server"></iframe>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        document.getElementById('ListFrame').src = "ContentList.aspx?pid=<%=rootID%>";
         

    </script>
    </form>
</body>
</html>

