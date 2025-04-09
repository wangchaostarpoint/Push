<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogMgrNew.aspx.cs" MasterPageFile="~/UI/Master/ObjectList.Master"
    Inherits="Zhongsoft.Portal.Sys.Log.LogMgrNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                标题
            </td>
            <td>
                <asp:TextBox ID="tbTitle" Width="110px" class="kpms-textboxsearch" runat="server">
                </asp:TextBox>
            </td>
            <td>
                日志类别
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlCategory" Width="130px">
                </asp:DropDownList>
            </td>
            <td>
                状态
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlFlag">
                    <asp:ListItem Value="">全部</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">未处理</asp:ListItem>
                    <asp:ListItem Value="1">已处理</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="logList" AllowPaging="true" PageSize="18" runat="server"
        Width="100%" AutoGenerateColumns="false" UseDefaultDataSource="true" BindJsonClick="true"
        OnJsonClick="showMsg"  OnRowCommand="logList_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="标题" ItemStyle-Width="150px">
                <ItemTemplate>
                    <%# logList.GetSubString(Eval("Title"),20)%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-Width="150px" HeaderText="时间">
                <ItemTemplate>
                    <%# Eval("CreateDate").ToString() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField ItemStyle-Width="100px" DataField="CreateUserName" HeaderText="记录用户" />
            <asp:TemplateField HeaderText="日志信息">
                <ItemTemplate>
                    <%# logList.GetSubString(Eval("LogMessage"),90)%>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="35px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="btnView" EnableTheming="false">
                 <img alt="" style="cursor: pointer"  src="../../Themes/Images/btn_dg_edit.gif" onclick="return editException('<%#Eval("LogId")%>');"
                         />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" Visible="False" ID="btnCallBack" OnClick="btnCallBack_OnClick"/>
    <div style="display: none" id="msg">
    </div>
    <script type="text/javascript">
        $('#msg').dialog({
            autoOpen: false,
            width: 850,
            modal: true
        });
        function showMsg(json) {
            $("#msg").html(json[3]);
            $("#msg").dialog('open');
        }
        function editException(logId) {
            var url = buildQueryUrl("Sys/Log/LogMgrEditor.aspx", { "LogId": logId });
            showDivDialog(url, null, 850, 500, editCallBack);
            return false;
        }

        //弹出层callback方法
        function editCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnCallBack,"") %>
        }
    </script>
</asp:Content>
