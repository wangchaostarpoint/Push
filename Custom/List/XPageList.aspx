<%@ Page Title="自定义页面" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="XPageList.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.XPageList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                页面名称
            </td>
            <td>
                <asp:TextBox ID="tbListInfo" runat="server"></asp:TextBox>
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
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="PageId" AutoGenerateColumns="False"
        AllowPaging="True" OnRowCommand="gvList_RowCommand" AllowSorting="true" BindGridViewMethod="BindListGrid">
        <Columns>
            <asp:BoundField DataField="PageName" HeaderText="页面名称" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" HeaderStyle-Width="100px" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                HeaderStyle-Width="100px" />
            <asp:TemplateField HeaderText="编辑">
                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="EditData" EnableTheming="false">
						<img   onclick='return DetailOfList("<%#Eval("PageId")%>",3);'  src="../../Themes/Images/btn_dg_edit.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除">
                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%#Eval("PageId") %>'
                        CommandName="DeleteData" EnableTheming="false">
						 <img  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function DetailOfList(bizId, actionType) {
            var bizIdCondition = actionType == "2" ? "" : "&bizId=" + bizId;
            var url = "XPageEditor.aspx?actionType=" + actionType + bizIdCondition;
            if (showModal(encodeURI(url), null, 1000, 650) == undefined) {
                return false;
            }

            return actionType == "1" ? false : true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
