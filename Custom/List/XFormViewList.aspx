<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XFormViewList.aspx.cs"
    Inherits="Zhongsoft.Portal.Custom.List.XFormViewList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>视图编辑页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="tz-table">
            <tr>
                <td class="td-m">
                    <asp:LinkButton runat="server" ID="btnAdd" OnClientClick="return addFormView();"
                        OnClick="btnAdd_Click" class="kpms-btn">   <img alt =""  src="../../Themes/Images/btn_add.gif"/><span>新建</span></asp:LinkButton><asp:DropDownList
                            Width="200px" runat="server" ID="ddlType" AutoPostBack="true" OnSelectedIndexChanged="ddlType_Change">
                        </asp:DropDownList>
                    视图
                    <input type="hidden" runat="server" id="hiNum" />
                    <input type="hidden" runat="server" id="hiFormId" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: middle; border: #6f9dd1 1px solid; height: 25px;">
                    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="FormViewId"
                        AutoGenerateColumns="False" OnRowCommand="gvList_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="FormViewType" HeaderText="视图类型" />
                            <asp:TemplateField HeaderText="编辑">
                                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="EditData" AccessLevel="3"
                                        EnableTheming="false">
						<img   onclick='return editFormView("<%#Eval("FormViewId")%>","<%#Eval("FormViewType")%>");'  src="../../Themes/Images/btn_dg_edit.gif" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除">
                                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%#Eval("FormViewId") %>'
                                        EnableTheming="false" AccessLevel="4" CommandName="DeleteData">
						 <img    onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </td>
            </tr>
        </table>
    </div>
    <script>
        function addFormView() {
            var type = $("#<%=ddlType.ClientID %>").val();
            if (type == "") {
                alert("请选择要添加的视图类型。");
                return false;
            }

            var num = $("#<%=hiNum.ClientID %>").val();
            if (num > 0) {
                alert("已存在" + type + "视图,不能重复添加。");
                return false;
            }

            var url = "XFormViewEditor.aspx?actionType=2&FormID=<%=FormID %>&FormType=<%=FormType %>&FormViewType=" + type;
            if (showModal(encodeURI(url), null, 1000, 600) == undefined) {

            }
            return true;

        }

        function editFormView(formViewId, viewType) {
            var url = "XFormViewEditor.aspx?actionType=3&FormID=<%=FormID %>&FormType=<%=FormType %>&bizId=" + formViewId + "&FormViewType=" + viewType;
            if (showModal(encodeURI(url), null, 1000, 600) == undefined) {
                return false;
            }
            return true;
        }
    
    </script>
    </form>
</body>
</html>
