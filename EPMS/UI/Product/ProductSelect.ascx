<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductSelect.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.ProductSelect" %>
<script type="text/javascript">
    function showAllSelected() {

    }
    function fileSelect() {
        var selectType = $("#<%=lbtnSelect.ClientID %>").html();
        if (selectType == "全选") {
            $("[name='fileCheck']>:checkbox").attr("checked", true);
            $("#<%=lbtnSelect.ClientID %>").html("反选");
        }
        else {
            $("[name='fileCheck']>:checkbox").attr("checked", false);
            $("#<%=lbtnSelect.ClientID %>").html("全选");
        }
        return false;
    }
</script>
<span class="req-star">如果需要针对资料提建议，不需勾选成品；否则勾选文件进行批量添加意见</span>
<table width="100%">
    <tr>
        <td>
            <asp:LinkButton runat="server" ID="lbtnSelect" CssClass="subtoolbarlink" EnableTheming="false"
                OnClientClick="return fileSelect();" Text="全选" Width="30px" name="allCheck">               
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="lbtnSelected" CssClass="subtoolbarlink" EnableTheming="false"
                OnClientClick="return showAllSelected();" Text="已选" Width="30px" Visible="false">               
            </asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td>
            <asp:DataList runat="server" ID="dlFileList" RepeatColumns="1" DataKeyField="ID">
                <ItemTemplate>
                    <td>
                        <asp:CheckBox ID="fileSelect" runat="server" name="fileCheck" />
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lbName" Text='<%#Eval("Name").ToString().Length>15?Eval("Name").ToString().Substring(0,15)+"...":Eval("Name").ToString() %>'
                            ToolTip='<%#Eval("Name") %>'></asp:Label>
                    </td>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
<script type="text/javascript">
   
</script>
