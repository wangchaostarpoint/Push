<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamExpendNameList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.ParamExpendNameList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>参数明细台账</title>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr>
            <td width="20%" valign="top" style="border: 1px #6699FF solid;">
                <asp:TreeView ID="treeParam" runat="server" OnSelectedNodeChanged="treeParam_SelectedNodeChanged"
                    Height="100%" Width="100%" ShowLines="True">
                    <SelectedNodeStyle BackColor="#F7F7F7" />
                </asp:TreeView>
            </td>
            <td valign="top">
                <table width="100%" runat="server" id="param" visible="true">
                    <tr>
                        <td class="tz-toolbar">
                            <span class="filter-block"><span class="filter-block-lb">参数名</span><span>
                                <zhongsoft:LightTextBox ID="tbParamName" runat="server" Width="140px" CssClass="kpms-textboxsearch"
                                    EnableTheming="false" MaxLength="20"></zhongsoft:LightTextBox></span></span>
                            <asp:LinkButton runat="server" class="kpms-btn" ID="btnSearch" OnClick="btnSearch_Click"
                                EnableTheming="false">
                                    <img  alt=""  src="../../Themes/Images/btn_search.gif"/><span>查找</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" class="kpms-btn" ID="btnReset" OnClick="btnReset_Click"
                                EnableTheming="false">
                                    <img alt="" src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnNew" class="kpms-btn" OnClick="btnNew_Click"
                                OnClientClick="return AddItem()" EnableTheming="false">
                                 <img  alt="" src="../../Themes/Images/btn_new.gif"/><span>新建</span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                                AllowPaging="true" DataKeyNames="PARAMEXPENDNAMEID" UseDefaultDataSource="true"
                                OnRowCommand="gvList_RowCommand">
                                <Columns>
                                    <asp:BoundField HeaderText="参数名" DataField="PARAMEXPENDNAME" HeaderStyle-Width="30%">
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="说明" DataField="REMARK"></asp:BoundField>
                                    <asp:BoundField HeaderText="排序" DataField="SORT" HeaderStyle-Width="7%"></asp:BoundField>
                                    <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                             <img alt="编辑" id="Img1"  onclick='return EditItem("<%#DataBinder.Eval(Container.DataItem,"PARAMEXPENDNAMEID") %>");'
                                             border="0" src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" EnableTheming="false"
                                                CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PARAMEXPENDNAMEID") %>'>
                                             <img alt="删除" id="Img2" onclick="return confirm('确定删除？');"  border="0" 
                                             src="../../Themes/Images/btn_dg_delete.gif" style="cursor: hand"  />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
                <table width="100%" runat="server" id="detail" visible="false">
                    <tr>
                        <td class="tz-toolbar">
                            参数明细名/值
                            <zhongsoft:LightTextBox ID="tbParamDetail" runat="server" Width="140px" CssClass="kpms-textboxsearch"
                                MaxLength="20"></zhongsoft:LightTextBox>
                            <asp:LinkButton runat="server" class="kpms-btn" ID="btnDetailSearch" OnClick="btnDetailSearch_Click">
                                    <img alt="" src="../../Themes/Images/btn_search.gif"/><span>查找</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" class="kpms-btn" ID="btnDetailReset" OnClick="btnDetailReset_Click">
                                   <img alt="" src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnDetailNew" class="kpms-btn" OnClick="btnDetailNew_Click"
                                OnClientClick="return AddDetailItem()">
                                <img src="../../Themes/Images/btn_new.gif"/><span>新建</span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView ID="gvDetailList" runat="server" AutoGenerateColumns="false"
                                AllowPaging="true" UseDefaultDataSource="true" PageSize="15" DataKeyNames="PATAMDETAILID"
                                OnRowCommand="gvDetailList_RowCommand" BindGridViewMethod="BindDetailDataGrid">
                                <Columns>
                                    <asp:BoundField HeaderText="参数明细名" DataField="PATAMDETAILNAME"></asp:BoundField>
                                    <asp:BoundField HeaderText="字段类型" DataField="SHOWTYPE"></asp:BoundField>
                                    <asp:BoundField HeaderText="排序" DataField="SORT"></asp:BoundField>
                                    <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                <img alt="编辑" id="ImgEdit"   src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand"
                                                 onclick='return EditDetailItem("<%#DataBinder.Eval(Container.DataItem,"PATAMDETAILID") %>");'/>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="删除" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" EnableTheming="false"
                                                CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PATAMDETAILID") %>'>
                                             <img alt="删除" id="ImgDelete"  border="0" onclick="return confirm('确定删除？');" src="../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function EditItem(bizId) {
            var param = { actionType: 3, bizId: bizId };
            var url = buildQueryUrl("/MM/List/ParamExpendNameEditor.aspx", param);
            var dom = showModal(url, "", 600, 400);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }
        function AddItem() {
            var param = { actionType: 2 };
            var url = buildQueryUrl("/MM/List/ParamExpendNameEditor.aspx", param);
            var dom = showModal(url, "", 600, 400);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }

        function EditDetailItem(bizId) {
            var param = { actionType: 3, bizId: bizId };
            var url = buildQueryUrl("/MM/List/ParamExpendDetailEditor.aspx", param);
            var dom = showModal(url, "", 600, 400);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }

        function AddDetailItem() {
            var paramnameID = "<%=ParamNameID %>";
            if (paramnameID == "") {
                alert("请选中一个参数再添加参数明细");
                return false;
            }
            var param = { actionType: 2, paramnameID: paramnameID };
            var url = buildQueryUrl("/MM/List/ParamExpendDetailEditor.aspx", param);
            var dom = showModal(url, "", 600, 400);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }
    </script>
    </form>
</body>
</html>
