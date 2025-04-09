<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrgTreeList.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.OrgUsers.OrgTreeList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body id="MainBody" runat="server" style=" overflow:auto;">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%; width: 100%" cellpadding="2px" cellspacing="0px">
        <tr>
         
            <td width="20%" valign="top" style="border-width: 1px; border-color: #6699FF; border-style: solid">
               
                <table width="100%" style="height: 100%">
                    <tr>
                        <td>
                            <div>
                                <span>
                                    <asp:TreeView ID="tvOrganizationTree" runat="server" ShowLines="True" Height="100%">
                                        <SelectedNodeStyle BackColor="#F7F7F7" />
                                    </asp:TreeView>
                                </span>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" style="width: 100%; height: 100%">
                <iframe src="" frameborder="0" id="ListFrame" name="ListFrame" width="100%" height="100%"
                    scrolling="auto" runat="server"></iframe>
            </td>
        </tr>
    </table>

    <script language="javascript">
        document.getElementById('ListFrame').src = "OrgUsersList.aspx?isRoot=1&OrgId=<%=tvOrganizationTree.Nodes[0].Value %>&OrgName="+escape('<%= tvOrganizationTree.Nodes[0].Text%>');
    </script>

    </form>
</body>
</html>
