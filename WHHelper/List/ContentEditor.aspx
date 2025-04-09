<%@ Page Title="帮助文档-内容" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="ContentEditor.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.ContentEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
       <tr>
            <td class="td-l">标题<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTitle" TableName="WH_Helper_Content" Field="Title" runat="server" ActiveStatus="(23.*)" req="1" />
            </td> 
        </tr>
          <tr> 
            <td class="td-l">标题描述<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTitleDesc" TableName="WH_Helper_Content" Field="TitleDesc" runat="server" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
             <td class="td-l">关键字<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbKeyWord" TableName="WH_Helper_Content" Field="KeyWord" runat="server" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
          <tr>
            <td class="td-l">内容</td>
            <td >
                <input type="hidden" id="hiContents" runat="server" tablename="WH_Helper_Content" field="ContentText" />
                <script id="container" name="content" type="text/plain" style="width: 100%; height: 500px;">
                </script>
                <!-- 配置文件 -->
                <script type="text/javascript" src="<%=WebAppPath %>/UEditor/ueditor.config.js"></script>
                <!-- 编辑器源码文件 -->
                <script type="text/javascript" src="<%=WebAppPath %>/UEditor/ueditor.all.min.js"></script>
                <!-- 实例化编辑器 -->
                <script type="text/javascript">
                    var ue = UE.getEditor('container', {
                     toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'print', 'preview', 'searchreplace', 'help', 'drafts'
        ]],
                        autoHeightEnabled: false,
                        autoFloatEnabled: true,
                        serverUrl: "<%=WebAppPath %>/UEditorSrv/controller.ashx?id=<%=BusinessObjectId %>"
                    });

                    //对编辑器的操作最好在编辑器ready之后再做
                    ue.ready(function () {
                        //设置编辑器的内容
                        var content = $('#<%=hiContents.ClientID %>').val();
                        ue.setContent(content);
                        //只读设置
                        if ($bizCtx.action == 1) {
                            ue.setDisabled();
                        }
                    });
                </script>
            </td>
        </tr>
        
          <tr>
            <td class="td-l">代码：错误说明可以记录错误id<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbErrorCode" TableName="WH_Helper_Content" Field="ErrorCode"  Width="150px" runat="server" ActiveStatus="(23.*)" />
            </td> 
        </tr>
        <tr>
              <td class="td-l">排序<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="WH_Helper_Content" Field="Sort" Width="50px" runat="server" ActiveStatus="(23.*)"   />
            </td>
        </tr> 
        <tr>
              <td class="td-l">说明<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbRemark" TableName="WH_Helper_Content" Field="Remark" ActiveStatus="(23.*)"  
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr> 
      
        <tr>
            <td class="td-l" rowspan="3">相关附件</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.*)" displaystatus="(3.*)" OnClick="upLoadFile_Click">
<span>
<img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传附件</span>
                </zhongsoft:LightFileUploader>
            </td>
        </tr>
        <tr>
            <td class="td-r" colspan="3">
                <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="WH_Helper_Content" field="ContentId" />
        <input type="hidden" runat="server" id="hiCatalogId"   tablename="WH_Helper_Content" field="CatalogId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

          function checkForm() {
            var html = ue.getContent();
            $('#<%=hiContents.ClientID %>').val(html);
            return true;
        }
    </script>
</asp:Content>
