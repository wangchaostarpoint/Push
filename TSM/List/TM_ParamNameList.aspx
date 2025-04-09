<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TM_ParamNameList.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TM_ParamNameList" %>

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
            <td width="20%" valign="top" style="border: 1px #c4c4c6 solid;">
                <asp:TreeView ID="treeParam" runat="server" OnSelectedNodeChanged="treeParam_SelectedNodeChanged"
                    Height="100%" Width="100%" ShowLines="True">
                    <SelectedNodeStyle BackColor="#F7F7F7" />
                </asp:TreeView>
            </td>
            <td valign="top">
                <table width="100%" runat="server" id="param" visible="true">
                    <tr>
                        <td style="padding: 5px; background: #f5f7fa; border: #bdc1c6 1px solid;">
                            <span class="filter-block"><span class="filter-block-lb">参数名</span><span>
                                <zhongsoft:LightTextBox ID="tbParamName" runat="server" CssClass="kpms-textboxsearch"
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
                            <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false"
                                 runat="server" BindGridViewMethod="BindDataGrid" DataKeyNames="ParamNameID"
                                UseDefaultDataSource="True" ShowPageSizeChange="true" ageSize="15" OnRowCommand="gvList_RowCommand">
                                <Columns>
                                    <asp:BoundField HeaderText="参数名" DataField="ParamName" HeaderStyle-Width="30%"></asp:BoundField>
                                    <asp:BoundField HeaderText="说明" DataField="Remark"></asp:BoundField>
                                    <asp:BoundField HeaderText="排序" DataField="Sort" HeaderStyle-Width="7%"></asp:BoundField>
                                    <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                             <img alt="编辑" id="Img1"  onclick='return EditItem("<%#DataBinder.Eval(Container.DataItem,"ParamNameID") %>");'
                                             border="0" src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" EnableTheming="false"
                                                CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ParamNameID") %>'>
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
                            <span class="filter-block"><span class="filter-block-lb">参数明细名/值</span><span>
                                <zhongsoft:LightTextBox ID="tbParamDetail" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
                                    MaxLength="20"></zhongsoft:LightTextBox></span></span>
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
                                UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="ParamDetailID"
                                OnRowCommand="gvDetailList_RowCommand">
                                <Columns>
                                    <asp:BoundField HeaderText="参数明细名" DataField="ParamDetailName"></asp:BoundField>
                                    <asp:BoundField HeaderText="参数明细值" DataField="ParamDetailValue"></asp:BoundField>
                                    <asp:BoundField HeaderText="排序" DataField="Sort"></asp:BoundField>
                                    <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                <img alt="编辑" id="ImgEdit"   src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand"
                                                 onclick='return EditDetailItem("<%#DataBinder.Eval(Container.DataItem,"ParamDetailID") %>");'/>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" EnableTheming="false"
                                                CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ParamDetailID") %>'>
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
            var url = buildQueryUrl("/TSM/List/TM_ParamNameEditor.aspx", param);
            var dom = showModal(url, "", 600, 400);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }
        function AddItem() {
            var param = { actionType: 2 };
            var url = buildQueryUrl("/TSM/List/TM_ParamNameEditor.aspx", param);
            var dom = showModal(url, "", 600, 400);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }

        function EditDetailItem(bizId) {
            var param = { actionType: 3, bizId: bizId };
            var url = buildQueryUrl("/TSM/List/TM_ParamDetailEditor.aspx", param);
            var dom = showModal(url, "", 600, 400);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }

        function AddDetailItem() {
            var paramnameID = "<%=ParamNameID %>";
            if (paramnameID == "") {
                alert("请选中一个参数在添加参数明细");
                return false;
            }
            var param = { actionType: 2, paramnameID: paramnameID };
            var url = buildQueryUrl("/TSM/List/TM_ParamDetailEditor.aspx", param);
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
