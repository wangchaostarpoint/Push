<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XDataSourceList.aspx.cs"
    Inherits="Zhongsoft.Portal.BDM.List.XDataSourceList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="tz-table" id="tableBase" runat="server" style="border: #bebdbd 1px solid">
            <tr>
                <td colspan="2" class="tz-title">
                    基本信息
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    页面名称<span class="req-star">*</span>
                </td>
                <td class="td-m">
                    <input type="text" runat="server" id="tbEditorName" class="kpms-textbox" style="width: 200px" />
                    <input type="hidden" runat="server" id="hiObjId" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    页面编号<span class="req-star">*</span>
                </td>
                <td class="td-m">
                    <input type="hidden" runat="server" id="hiListCode" />
                    <zhongsoft:LightTextBox runat="server" ID="tbCodePrefix" Width="95px" ReadOnly="true"
                        req="1"></zhongsoft:LightTextBox>
                    <zhongsoft:LightTextBox runat="server" ID="tbCode" Width="95px" DataType="EnNumStr"
                        req="1"></zhongsoft:LightTextBox>
                </td>
            </tr>
        </table>
        <br />
        <table class="tz-table" style="border: #bebdbd 1px solid">
            <tr>
                <td colspan="2" class="tz-title">
                    数据源
                </td>
            </tr>
            <tr>
                <td class="td-m" colspan="2">
                    <asp:LinkButton runat="server" ID="btnAddDataSource" OnClientClick="return addDataSource();"
                        OnClick="btnAdd_Click">   <img alt =""  src="../../Themes/Images/btn_add.gif"/><span>新增数据源</span></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: middle; border: #bebdbd 1px solid; height: 25px;" colspan="2">
                    <asp:DataList runat="server" ID="sourceList" RepeatDirection="Horizontal" RepeatColumns="3"
                        ShowHeader="true" OnItemCommand="sourceList_ItemCommand" DataKeyField="SourceId"
                        OnItemDataBound="sourceList_ItemDataBound">
                        <ItemStyle Width="200px" Height="100px" BackColor="#f4f1f1" BorderColor="#bebdbd"
                            BorderWidth="1px" Font-Size="Medium" />
                        <ItemTemplate>
                            <table width="100%">
                                <tr>
                                    <td style="height: 20px">
                                        名称：
                                        <%#Eval("TableName").ToString()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 20px">
                                        主键：
                                        <%#Eval("PKCode").ToString()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 20px">
                                        类型：
                                        <%#Eval("DataSourceType").ToString()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="height: 20px">
                                        <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                    <img alt="编辑模块" src="/Portal/Themes/Images/btn_dg_edit.gif" border='0' onclick="return editDataSource('<%# Eval("SourceId").ToString() %>')" />
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("SourceId") %>'
                                            EnableTheming="false">
                                                <img alt="删除" src="/portal/Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>
    <input type="hidden" runat="server" id="hiSave" />
    <script>



        var hsChange = false;
        function editDataSource(sourceId) {
            var json = { ObjectId: "<%=ObjId %>", FormType: "<%=FormType %>" };
            var url = buildBizUrl(3, sourceId, "/BDM/List/XDataSourceEditor.aspx", json);
            return checkReturn(showModal(encodeURI(url), null, 600, 250));


        }

        function addDataSource() {
            var json = { ObjectId: "<%=ObjId %>", FormType: "<%=FormType %>" };
            var url = buildBizUrl(3, "", "/BDM/List/XDataSourceEditor.aspx", json);
            showModal(encodeURI(url), null, 600, 250);
        }

        function saveDivSource() {

            if (typeof (checkReqField) == 'function') {
                if (!checkReqField()) return false;
            }
            if (hsChange || parseBool($("#<%=hiSave.ClientID %>").val())) {
                var editorName = $("#<%=tbEditorName.ClientID %>").val();
                var editorCode = $("#<%=tbCodePrefix.ClientID %>").val() + $("#<%=tbCode.ClientID %>").val()
                $.ajax({
                    url: 'XDataSourceList.aspx',
                    data: { asyfunc: "SaveSource",
                        EditorName: editorName,
                        EditorCode: editorCode,
                        FormType: "<%=FormType %>",
                        Id: "<%=ObjId %>"
                    },
                    type: "POST",
                    success: function (res) {
                        if (res == "") {
                            hsChange = false;
                            $("#<%=hiSave.ClientID %>").val("");
                            parent.showSaveMsg("元数据保存成功", 0);
                        }
                        else if (res == "<%=SaveFail %>") {
                            parent.showSaveMsg("元数据保存失败", 1);
                        }
                        else {
                            parent.showSaveMsg(res, 1);
                        }
                    }
                });
            }
            return true;
        }

        $("#<%=tbEditorName.ClientID %>").live("blur", function () { hsChange = true; })
        $("#<%=tbCode.ClientID %>").live("blur", function () { hsChange = true; })
    </script>
    </form>
</body>
</html>
