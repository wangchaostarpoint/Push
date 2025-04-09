<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PWSUpLoadFile.ascx.cs" Inherits="Zhongsoft.Portal.Sys.FileDocument.PWSUpLoadFile" %>
<asp:DataList runat="server" ID="dlAttachment" CssClass="kpms-tablebordernone" DataKeyField="fileId"
    OnItemDataBound="dlAttachment_ItemDataBound" OnDeleteCommand="dlAttachment_DeleteCommand">
    <ItemTemplate>
        <table class="kpms-tablebordernone">
            <tr align="left">
                <td style="width: 23px;">
                    <img src="<%=this.WebAppPath %>/themes/images/<%# GetFileTypeImage(Eval("FileName").ToString()) %>" />
                </td>
                <td>
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>&fileType=pws"
                        target="_blank" title="<%# Eval("FileName") %>">
                        <%# Eval("FileName").ToString().Length > this.FileNameLength ? Eval("FileName").ToString().Substring(0, FileNameLength) +"..." : Eval("FileName").ToString()%>
                    </a>
                </td>
                <td>
                    <input type="hidden" runat="server" id="hiFileID" value='<%#Eval("fileId") %>' />
                    <input type="hidden" runat="server" id="hiFilePath" value='<%# Eval("FilePath") %>' />
                    <input type="hidden" runat="server" id="hiFileName" value='<%# Eval("FileName") %>' />
                    <asp:ImageButton ID="btnDel" OnClientClick="return window.confirm('您确定删除吗？')" CommandName="Delete"
                        CommandArgument='<%# Eval("FilePath") %>' CausesValidation="false" runat="server"
                        ImageUrl="~/Themes/Images/btn_dg_delete.gif" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
<input type="hidden" runat="server" id="hiFileSourceID" />
<input type="hidden" runat="server" id="hiFileType" />