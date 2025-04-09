<%@ Page Title="表达式设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="CommonExpEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.CommonExpEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="lbField" />
        </Triggers>
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td colspan="3">
                        <zhongsoft:LightTextBox runat="server" ID="tbExp" TextMode="MultiLine" CssClass="kpms-textarea"
                            EnableTheming="false"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;">
                        <asp:TreeView runat="server" ID="treeView" Width="150px" Height="200px" BorderColor="#7395c5"
                            SelectedNodeStyle-BackColor="#ccccff" EnableTheming="false" ShowLines="true"
                            BorderWidth="1px" BorderStyle="Ridge" BackColor="White" OnSelectedNodeChanged="treeView_Change">
                        </asp:TreeView>
                    </td>
                    <td style="width: 523px;">
                        <asp:ListBox runat="server" ID="lbField" Width="523px" Height="200px" SelectionMode="Single">
                        </asp:ListBox>
                        <input type="hidden" runat="server" id="hiScope" />
                    </td>
                    <td valign="top">
                        <div runat="server" id="divMemo" style="width: 100px; height: 200px; border-color: Gray;
                            border-width: 1px; vertical-align: top">
                        </div>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>



        function initCustomerPlugin() {
            $("#<%=lbField.ClientID%>").dblclick(function () { selectItem(this.value); });
            if ("<%=IsPostBack%>" == "False") {
                var re = window.dialogArguments;
                if (re != undefined && re != null &&
                $("#<%=tbExp.ClientID %>").val() == "") {
                    $("#<%=tbExp.ClientID %>").val(re);
                }
            }
        }

        function selectItem(value) {
            var scope = $("#<%=hiScope.ClientID %>").val();
            var exp = $("#<%=tbExp.ClientID %>").val();
            if (scope == "sysvalue") {
                exp += "Parameters!" + value + ".Value";
            }
            else if (scope == "field") {
                exp += "Fields!" + value + ".Value";
            }
            else if (scope == "operator" || scope == "special") {
                exp += value;
            }
            else if (scope == "function") {
                exp += value + "(";
            }
            else if (scope == "pageparam" || scope == "sysparam") {
                exp += "&" + value + "=";
            }
            else if (scope == "viewcol") {
                exp += "ViewCol!" + value + ".Value";
            }
            else if (scope == "chartparam") {
                exp += "ChartParams!" + value + ".Value";
            }
            $("#<%=tbExp.ClientID %>").val(exp);
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:LinkButton runat="server" ID="btnSure" OnClientClick="return closeExpWindow()">
                      <span>确定</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
    </asp:LinkButton>
    <script>

        function closeExpWindow() {
            $.post("CommonExpEditor.aspx",
                    { asyfunc: "checkExp", exp: $("#<%=tbExp.ClientID %>").val() },
                      function (res) {
                          if (res != "")
                          { alert(res) }
                          else {
                              window.returnValue = $("#<%=tbExp.ClientID %>").val();
                              window.close();
                          }
                      })

            return false;
        }

        function cancelEdit() {
            window.returnValue = null;
            window.close();
        }
    </script>
</asp:Content>
