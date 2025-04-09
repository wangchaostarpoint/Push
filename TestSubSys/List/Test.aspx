<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Zhongsoft.Portal.TestSubSys.List.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/portal/themes/styles/globle.css" rel="stylesheet" type="text/css" />
    <link href="/portal/themes/styles/layout.css" rel="stylesheet" type="text/css" />
    <script src="/portal/themes/script/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" language="javascript" src="/portal/themes/script/jquery.js"></script>
</head>
<body>
    <script type="text/javascript" language="javascript">


    </script>
    <form id="form1" runat="server">
    <div>
<zhongsoft:LightObjectSelector runat="server" ID="lbsSelUser" SourceMode="SelectorPage" 
    DictCode="WORKFLOWFORMSCOPE" ResultForControls="{'hiUserId':'id'}"
    ResultAttr="name" />
<input id="hiUserId" runat="server" type="hidden" />
        <asp:Button ID="Button3" runat="server" Text="Button" onclick="Button3_Click" />
        <zhongsoft:LightTextBox runat="server" ID="LightTextBox1" TextMode="MultiLine" MaxLength="20"></zhongsoft:LightTextBox>
        <zhongsoft:LightTextBox runat="server" ID="sdf" DataType="Telphone"></zhongsoft:LightTextBox>
        <asp:Button ID="Button2" runat="server" Text="des" OnClick="Button2_Click" />
        <asp:Button ID="Button1" runat="server" Text="ser" OnClick="Button1_Click" />
        <zhongsoft:LightPowerGridView runat="server" ID="test" FrozenWidth="1035" FrozenHeight="280px" Width="1015" AllowFrozing="true">
            <Columns>
                <zhongsoft:LightFormField ></zhongsoft:LightFormField>
            </Columns>
        </zhongsoft:LightPowerGridView>
    </div>
    <script>
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
    </form>
</body>
</html>
