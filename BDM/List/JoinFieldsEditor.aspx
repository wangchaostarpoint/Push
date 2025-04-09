<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JoinFieldsEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.BDM.List.JoinFieldsEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <table class="tz-table">
                    <tr>
                        <td class="td-m">
                            <asp:Label runat="server" ID="lbtitle" Style="color: Blue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-m">
                            <zhongsoft:LightPowerGridView runat="server" ID="gvList" AutoGenerateColumns="false"
                                ShowAddData="true" OnAddData="btnAdd_Click" OnRowDataBound="gvList_RowDataBound"
                                OnRowCommand="gvList_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="左联接字段">
                                        <ItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlLeft" req="1">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="运算符">
                                        <ItemTemplate>
                                            =
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="右联接字段">
                                        <ItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddlRight" req="1">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" EnableTheming="false">
						             <img onclick="if(!confirm('确认要删除吗？')) return false;" src="../../themes/images/btn_dg_delete.gif"  />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
                <input type="hidden" runat="server" id="hiValue" />
                <input type="hidden" runat="server" id="hiText" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function check() {
            return checkReqField();
        }

        function getFields() {
            var fields = "";
            $("#<%=gvList.ClientID %>").find("select").each(function (i) {
                if (i % 2 == 0) {
                    fields += $(this).val() + "|";
                }
                else {
                    fields += $(this).val() + ";"
                }
            })
            return fields.substring(0, fields.length - 1);
        }


        function getTexts() {
            var fields = "";
            $("#<%=gvList.ClientID %>").find("select").each(function (i) {
                if (i % 2 == 0) {
                    fields += $(this).find(":selected").text() + "=";
                }
                else {
                    fields += $(this).find(":selected").text() + ","
                }
            })
            return fields.substring(0, fields.length - 1);
        }
    
    </script>
    </form>
</body>
</html>
