<%@ Page Title="人员扩展信息列表" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="OrganizationUsersExtendList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.OrganizationUsersExtendList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                工号/姓名(拼音简写)
                <asp:TextBox ID="tbUser" runat="server" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
            </td>
            <td>
                部门
                <asp:DropDownList ID="ddlDept" runat="server" Width="180px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:LinkButton ID="btnQuery" OnClick="btnQuery_Click" runat="server" CssClass="kpms-btn"><img content="searchResult" src="../../Themes/Images/btn_search.gif" /><span>查找</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click" CssClass="kpms-btn"><img src="../../Themes/Images/btn_empty.gif" /><span>重置</span></asp:LinkButton>
                <asp:LinkButton runat="server" OnClientClick="return AddNew()" OnClick="btnAdd_Click"
                    CausesValidation="false" ID="btnAdd" CssClass="kpms-btn"><img src="../../Themes/Images/btn_add.gif" /><span>新建</span></asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" OnExport="gvList_Export" downloadfilename="人员扩展信息" AllowPaging="true"
        UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <asp:BoundField DataField="LoginId" HeaderText="工号" />
            <asp:BoundField DataField="UserName" HeaderText="姓名" />
            <asp:BoundField DataField="OrgUnitName" HeaderText="部门" />
            <asp:TemplateField HeaderText="操作" HeaderStyle-Width="8%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="editItem" EnableTheming="false">
                        <img alt="编辑" id="Img2"  onclick='return EditItem("<%#DataBinder.Eval(Container.DataItem,"UserExtendId") %>");'
                            border="0" src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" title="编辑" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnDelete" runat="server" EnableTheming="false" CommandName="remove" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserExtendId")%>'>
                        <img alt="删除" id="Img3" onclick="return confirm('确定删除？');"   border="0" src="../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" title="删除" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <script type="text/javascript">
    function initCustomerPlugin(){
              $("#<%=this.tbUser.ClientID %>").autocomplete({
                  source: function(request, response) {
                      $.getJSON("JsonSelectorHandler.ashx", {
                          term: request.term + ',user'
                      }, response);
                  },
                  minLength: 1,
                  select: function(event, ui) {
                      if (ui.item) {
                          $("#<%=tbUser.ClientID %>").attr("value", ui.item.value);
                          <%=ClientScript.GetPostBackEventReference(this.btnQuery,"Query") %>;  
                      }
                  }
              });
        }
    
     function AddNew(){
            var stringFeatures = "dialogHeight:150px; dialogWidth:450px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "/Portal/Sys/OrgUsers/OrganizationUsersExtendEditor.aspx?actionType=2";
            if (window.showModalDialog(encodeURI(url), null, stringFeatures) == undefined) {
                return false;
            }
            return true;
     }
     function EditItem(id){
       var stringFeatures = "dialogHeight:150px; dialogWidth:450px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "/Portal/Sys/OrgUsers/OrganizationUsersExtendEditor.aspx?actionType=3&bizId="+id;
            if (window.showModalDialog(encodeURI(url), null, stringFeatures) == undefined) {
                return false;
            }
            return true;
     
     }
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
