<%@ Page Title="业务功能设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="MetroList.aspx.cs" Inherits="Zhongsoft.Portal.Metro.List.MetroList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <table width="100%" runat="server" id="param" visible="true" style=" padding-left:8px;">
        <tr>
            <td>
                名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="140px" CssClass="kpms-textboxsearch"
                    MaxLength="20"></zhongsoft:LightTextBox>
                <asp:LinkButton runat="server" class="kpms-btn" ID="btnSearch" OnClick="btnSearch_Click"
                    EnableTheming="false">
                                    <img  alt=""  src="../../Themes/Images/btn_search.gif"/><span>查找</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" class="kpms-btn" ID="btnReset" OnClick="btnReset_Click"
                    EnableTheming="false">
                                    <img alt="" src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnNew" class="kpms-btn" OnClick="btnNew_Click" Visible="false"
                    OnClientClick="return AddOrEditMetro('2','')" EnableTheming="false">
                                 <img  alt="" src="../../Themes/Images/btn_new.gif"/><span>新建</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
<table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                <zhongsoft:TreeGridView ID="gvMetro" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="SELFID" PowerPageCount="0" PowerPageIndex="0" RecordsCount="0"
                    SelfIdColumn="SELFID" ParentIdColumn="PARENTID" UseDefaultDataSource="true"
                    OnRowDataBound="gvMetro_RowDataBound" OnRowCommand="gvMetro_RowCommand" ShowFooter="true">
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="6%">
                            <ItemTemplate>
                                <%# gvMetro.CreateHeader(Container.DataItem)%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="NAME" HeaderText="名称" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="60%"/>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="页面权限" ItemStyle-Width="8%">
                            <ItemTemplate>
                                <%#GetPermissionFlag(Convert.ToString(Eval("IsPublic")))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="权限" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="6%">
                            <ItemTemplate>
                                <a href="#" onclick="editPermission('<%# Eval("SELFID").ToString() %>','<%# Eval("NAME").ToString() %>','')">
                                    <img title="权限" src="../../Themes/Images/btn_lock.gif" /></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="6%">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                             <img alt="编辑" id="ibtnEdit"  onclick='return EditItem("<%#DataBinder.Eval(Container.DataItem,"TYPE") %>",3,"<%#DataBinder.Eval(Container.DataItem,"SELFID") %>","<%#DataBinder.Eval(Container.DataItem,"PARENTID") %>");'
                                             border="0" src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="添加下级" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="6%">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnAdd" runat="server" CommandName="AddData" EnableTheming="false">
                                             <img alt="添加分组" id="ibtnAdd" onclick='return AddItem("<%#DataBinder.Eval(Container.DataItem,"TYPE") %>",2,"<%#DataBinder.Eval(Container.DataItem,"SELFID") %>","<%#DataBinder.Eval(Container.DataItem,"PARENTID") %>");'
                                             border="0" src="../../Themes/Images/btn_new.gif" style="cursor: hand" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="布局设置" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="6%">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnSet" runat="server" CommandName="SetData" EnableTheming="false" Visible="false">
                                             <img alt="设置分组" id="ibtnSet" onclick='return SetTile(3,"<%#DataBinder.Eval(Container.DataItem,"SELFID") %>");'
                                             border="0" src="../../Themes/Images/ico_blockActivity.gif" style="cursor: hand" />
                                <input type="hidden" id="hiType" runat="server" value='<%#DataBinder.Eval(Container.DataItem,"TYPE") %>' />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="6%">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" EnableTheming="false"
                                    CommandArgument='<%#DataBinder.Eval(Container.DataItem,"SELFID") %>'>
                                             <img alt="删除" id="ImgDelete"  border="0" onclick="return confirm('确定删除？');" src="../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:TreeGridView>
            </td>
        </tr>
    </table>

    <script>
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function AddItem(type, actType, bId, pId) {
            if (type == "Metro") { AddOrEditGroup(actType, bId, pId); }
            else if (type == "Group") { AddOrEditTile(actType, bId, pId); }
            else {return false; }
        }

        function EditItem(type, actType, bId, pId) {
            if (type == "Metro") { AddOrEditMetro(actType, bId); }
            else if(type=="Group"){AddOrEditGroup(actType, bId, pId); }
            else { AddOrEditTile(actType, bId, pId); }
        }

        function AddOrEditMetro(actType,bId) {
            var param = { actionType: actType, bizId: bId };
            var url = buildQueryUrl("/Metro/List/MetroEditor.aspx", param);
            showDivDialog(encodeURI(url), null, 600, 400, afterParamFilter);
            return false;
        }

        function AddOrEditGroup(actType, bId, metroId) {
            var param = null;
            if (actType == 2) {
                param = { actionType: actType, bizId: '', metroID: bId };
            }
            else {
                param = { actionType: actType, bizId: bId, metroID: metroId };
            }
            var url = buildQueryUrl("/Metro/List/GroupEditor.aspx", param);
            showDivDialog(encodeURI(url), null, 600, 400, afterParamFilter);
            return false;
        }

        function afterParamFilter(dom) {
            if (dom != null && dom != "undefined") {                
                <%=this.ClientScript.GetPostBackEventReference(this.btnSearch, "")%>;
                return true;
            }
            else {
                return false;
            }
        }

        function AddOrEditTile(actType, bId, groupId) {
            var param = null;
            if (actType == 2) {
                param = { actionType: actType, bizId: '', groupID: bId };
            } else {
                param = { actionType: actType, bizId: bId, groupID: groupId };
            }
            var url = buildQueryUrl("/Metro/List/TileEditor.aspx", param);
            showDivDialog(encodeURI(url), null, 600, 400, afterParamFilter);
            return false;
        }

        function SetTile(actType, bId) {
            var param = { editBaseView: 1, metroId: bId,ViewType:1 };
            var url = buildQueryUrl("/Metro/List/GroupTemplate.aspx", param);
//            var dom = showModal(url, "", 1280, 600);
//            if (dom != null && dom != "undefined") {
//                return true;
            //            }
            //xiedx 1127改为open方式打开，评审意见
            window.open(url);
            return false;
        }

        function editPermission(menuId, menuName, isModule) {
            var url = buildQueryUrl("sys/Acl/AclMgr.aspx", { secObjId: menuId, secObjName: encodeURI(menuName), ismodule: isModule });
            //showModal(url, null, 980, 590);
            showDivDialog(url, null, 980, 590, afterParamFilter);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
