<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormAttachmentView.ascx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.FormAttachmentView" %>
<script type="text/javascript" src="/Portal/UI/script/webdavstore.js"></script>
<asp:DataList runat="server" ID="dlAttachment" RepeatColumns="1" RepeatDirection="Horizontal"
    CssClass="form-fujian" DataKeyField="fileId" OnItemDataBound="dlAttachment_ItemDataBound"
    Width="100%" OnDeleteCommand="dlAttachment_DeleteCommand">
    <ItemStyle CssClass="form-fujiantd" />
    <ItemTemplate>
        <table style="width: 100%">
            <tr>
                <td runat="server" id="tdCheck" style="width: 1%">
                    <asp:CheckBox ID="cblAttachemnt" runat="server" AutoPostBack="True" 
                        oncheckedchanged="cblAttachemnt_CheckedChanged" Visible="false" />
                </td>
                <td style="width: 50%">
                    <img src="/portal/themes/images/<%# GetFileTypeImage(Eval("FileName").ToString()) %>" />
                    <a href="<%=this.WebAppPath %>/Sys/FileView/AttachmentView.aspx?fileId=<%#Eval("fileId") %>" target="_blank"
                        class="form-fujiana" title="<%# Eval("FileName") %>">
                        <%# Eval("FileName") %>
                    </a>
                </td>
                <td style="width: 20%">
                    大小：<%# GetFileSize(Eval("FileSize").ToString()) %>
                </td>
                <td style="width: 10%">
                    <%# Eval("FileCode")%>
                </td> 
                <td style="width: 5%">
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"
                        class="form-fujiana" title="<%# Eval("FileName") %>">下载 </a>
                </td>
                <td style="width: 7%;display:none">
                    <%# GetOfficeClientUrl(Eval("fileId").ToString(),Eval("FileName").ToString(),Eval("CreateUserId").ToString())%>
                </td>
                <td style="width: 5%">
                    <asp:LinkButton ID="btnDel" OnClientClick="return window.confirm('您确定删除吗？');" CommandName="Delete"
                        EnableTheming="false" CommandArgument='<%# Eval("FilePath") %>' runat="server">删除</asp:LinkButton>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
 <asp:Button  runat="server" ID="btnReload" OnClick="btnReload_Click" Visible="false"/>
 <asp:Button  runat="server" ID="btnDownload" OnClick="btnDownload_Click" Visible="false"/>
<script>
var $fileDavJson = <%=OutputDavMappingJSON() %>;
function doFileDav(fileId){
  
    for (var i=0;i<$fileDavJson.length;i++) {
        var d = $fileDavJson[i];
        if(fileId == d.fileId){
             var json = {"bizId":$formCtx.prcInstId,"fileId":fileId,"level":d.level};
             var dav = "";
             $.ajax({
                type: "POST",
                async: false,
                url: "WebDavHandler.ashx",
                data: json
            }).done(function (msg) {
                 dav=msg;
            });
          
            createFileDav(dav);
            break;
        }
    }
    }

    function attachmentReload() {
         <%=Page.ClientScript.GetPostBackEventReference(btnReload,"") %>
    }

    function downLoadFilesZip() {
         <%=Page.ClientScript.GetPostBackEventReference(btnDownload,"") %>
    }

</script>
