<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttachmentView.ascx.cs" Inherits="Zhongsoft.Portal.Sys.FileDocument.AttachmentView" %>
<asp:DataList runat="server" ID="dlAttachment" CssClass="kpms-tablebordernone"
    DataKeyField="fileId" OnItemDataBound="dlAttachment_ItemDataBound"
    OnDeleteCommand="dlAttachment_DeleteCommand">
    <ItemTemplate>
        <table class="kpms-tablebordernone">
            <tr align="left">
                <td style="width: 23px;">
                    <img src="<%=this.WebAppPath %>/themes/images/<%# GetFileTypeImage(Eval("FileName").ToString()) %>" />
                </td>
                <td> 
                    <%--在线预览地址--%>
                    <a href="<%=this.WebAppPath %>/Sys/FileView/AttachmentView.aspx?fileId=<%#Eval("fileId") %>"
                        target="_blank" title="<%# Eval("FileName") %>">
                        <%# Eval("FileName").ToString().Length > this.FileNameLength ? Eval("FileName").ToString().Substring(0, FileNameLength) : Eval("FileName").ToString()%>
                    </a>&nbsp; 
                    <a class="aStyle" href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>" target="_blank">
                        下载
                    </a>&nbsp; 
                    <a class="aStyle" flag="view" fileid="<%#Eval("fileId") %>" filename="<%# Eval("FileName") %>" style="display:none"
                        href="<%=this.WebAppPath %>/Sys/FileView/AttachmentView.aspx?fileId=<%#Eval("fileId") %>" target="_blank">
                        在线预览
                    </a> 
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnDel" OnClientClick="return window.confirm('您确定删除吗？')" CommandName="Delete"
                        CommandArgument='<%# Eval("FilePath") %>' CausesValidation="false" runat="server"
                        ImageUrl="~/Themes/Images/btn_dg_delete.gif" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
<input type="hidden" runat="server" id="hiFileSourceID" />
<input type="hidden" runat="server" id="hiFileType" />
<input type="hidden" runat="server" id="hiFileSourceFlag" />

<script type="text/javascript">
    initView();
    function initView() {
        $('[flag="view"]').each(function () {
            //ceb文件不能预览，直接进行提示下载打开
            if ($(this).attr('filename').indexOf('.ceb') > -1) {
                var fileId = $(this).attr('fileid');
                $(this).attr('href', '<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=' + fileId);
            }
        });
    }
</script>
