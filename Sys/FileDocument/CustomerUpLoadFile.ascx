<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerUpLoadFile.ascx.cs"
    Inherits="Zhongsoft.Portal.Sys.FileDocument.CustomerUpLoadFile" %>
<asp:DataList runat="server" ID="dlAttachment" RepeatDirection="Horizontal" DataKeyField="fileId"
    OnItemDataBound="dlAttachment_ItemDataBound" OnDeleteCommand="dlAttachment_DeleteCommand">
    <ItemTemplate>
        <table id="attachmentId">
            <tr>
                <td style="width: 23px;">
                    <img src="<%=this.WebAppPath %>/themes/images/<%# GetFileTypeImage(Eval("FileName").ToString()) %>" />
                </td>
                <td class="kpms-attachmenttd">
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"
                        target="_blank" title="<%# Eval("FileName") %>" class="kpms-attachmenta">
                        <%# Eval("FileName") %>
                    </a>
                    <input type="hidden" runat="server" id="hiFileID" value='<%#Eval("fileId") %>' />
                    <input type="hidden" runat="server" id="hiFilePath" value='<%# Eval("FilePath") %>' />
                    <input type="hidden" runat="server" id="hiFileName" value='<%# Eval("FileName") %>' />
                    <asp:LinkButton ID="btnDel" OnClientClick="return window.confirm('您确定删除吗？');" CommandName="Delete"
                        CommandArgument='<%# Eval("FilePath") %>' runat="server"><span>删除</span></asp:LinkButton>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>