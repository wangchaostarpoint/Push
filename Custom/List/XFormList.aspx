<%@ Page Title="自定义表单" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="XFormList.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XFormList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                表单名称<asp:TextBox ID="tbFormName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:LinkButton runat="server" class="kpms-btn" ID="btnSearch" OnClick="btnSearch_Click">
                       <img alt =""  src="../../Themes/Images/btn_search.gif" content='searchResult'/><span>查询</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" class="kpms-btn" ID="btnReset" OnClick="btnReset_Click">
                    <img alt ="" src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnNew" class="kpms-btn" OnClick="btnNew_Click"
                    OnClientClick='return DetailOfList(null,2);'>
                      <img alt ="" src="../../Themes/Images/btn_new.gif"/><span>新建</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="objectId"
        AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="gvList_RowCommand"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <asp:BoundField DataField="FormName" HeaderText="表单名称" />
            <asp:BoundField DataField="FormType" HeaderText="表单类型" />
            <asp:TemplateField HeaderText="表单状态" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                <ItemTemplate>
                    <%#GetFormIsPublish(Eval("IsPublish").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="表单权限" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%#GetFormPermission(bool.Parse(Eval("IsPublic").ToString()))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="权限" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                <ItemTemplate>
                    <a href="#" onclick="EditPermission('<%# Eval("ObjectId").ToString() %>','<%# Eval("formName").ToString() %>')">
                        <img title="权限" src="/Portal/Themes/Images/btn_lock.gif" /></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态控制" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnPublish" runat="server" CommandName="Publish" CommandArgument='<%#Eval("objectId") %>'>
						<img alt="" title="发布表单"  src="../../Themes/Images/btn_finish.gif" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="CancelPublish" CommandArgument='<%#Eval("objectId") %>'>
						<img alt=""  title="取消发布" src="../../Themes/Images/btn_back.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编辑">
                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="EditData">
						<img alt=""  onclick='return DetailOfList("<%#Eval("objectId")%>",3);'  src="../../Themes/Images/btn_dg_edit.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%#Eval("objectId") %>'
                        CommandName="DeleteData">
						 <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <script type="text/javascript">
        function DetailOfList(bizId, actionType) {
            var param = actionType == "2" ? "" : "&bizId=" + bizId;
            var url = "XFormEditor.aspx?actionType=" + actionType + param;
            if (window.open(encodeURI(url), "", "") == undefined) {
                return false;
            }
            return true;
        }

        function EditPermission(formId, formName) {
            url = "/Portal/Sys/SysManagement/AclManager.aspx?secObjId=" + formId +
                 "&secObjName=" + escape(formName) + "&IsForm=IsForm";
            arg = showModal(encodeURI(url), null, 980, 590);
        }

    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
