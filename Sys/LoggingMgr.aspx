<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoggingMgr.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.LoggingMgr" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style=" padding:3px;">
    <form id="form1" runat="server">
    <zhongsoft:LightPowerGridView ID="logList" AllowPaging="true" PageSize="18" runat="server"
        Width="100%" AutoGenerateColumns="false" BindJsonClick="true" OnJsonClick="showMsg"
        UseDefaultDataSource="true" OnRowCommand="logList_RowCommand">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="标题" ItemStyle-Width="100px" />
            <asp:TemplateField ItemStyle-Width="150px" HeaderText="时间">
                <ItemTemplate>
                    <%# GetLocalDate(DateTime.Parse(Eval("TimeStamp").ToString())) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField ItemStyle-Width="100px" DataField="MachineName" HeaderText="服务器" />
            <asp:TemplateField>
                <ItemTemplate>
                    <%# logList.GetSubString(Eval("FormattedMessage"),90)%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    </form>
    <div style="display: none" id="msg">
    </div>

    <script>
        $('#msg').dialog({
            autoOpen: false,
            width:850,
            modal:true
        });
        function showMsg(json) {
            $("#msg").html(json[3]);
            $("#msg").dialog('open');
        }
    </script>

</body>
</html>
