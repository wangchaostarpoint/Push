<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectUsersTest.aspx.cs"
    Inherits="Zhongsoft.Portal.TestSubSys.List.SelectUsersTest" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <zhongsoft:LightPowerGridView ID="MyList" runat="server">
        
    </zhongsoft:LightPowerGridView>
<zhongsoft:HiddenFieldContainer runat="server" ID="MyHidden">
   
</zhongsoft:HiddenFieldContainer>    
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    <input type="button" value="Json" onclick="test()"/>
    <script>
        function test() {

            var jsonStr = $("#<%=MyHidden.ClientID %>").val();
            var json = eval("(" + jsonStr + ")");
            alert(json[0].val);
        }
    </script>
    </form>
</body>
</html>
