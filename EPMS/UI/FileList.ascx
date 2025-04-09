<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileList.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.FileList" %>
<span id="spFile" style="float: right">
    <!-- 回发后按钮隐藏，有问题！不可以将img的runat设置为=server-->
    <zhongsoft:LightFileUploader runat="server" ID="fu" CssClass="subtoolbarlink" EnableTheming="false" BeforeUpload="checkFile"
        OnClick="btnBindFile_Click"> <span>
                            <img id="imgFile" src="../../Themes/Images/ico_fujian.gif" alt="上传文件" width="16" 
                                height="16" />上传文件</span></zhongsoft:LightFileUploader>
</span><span id="spDownFile" style="float: right; display: none;">
    <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
        ToolTip="批量下载" OnClientClick="return batchDownload();">
        <span>
            <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
                height="16" />批量下载</span>
    </asp:LinkButton></span>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvFile" AllowPaging="True"
    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
    DataKeyNames="FileID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindFile"
    OnRowCommand="gvFile_RowCommand" OnRowDataBound="gvFile_RowDataBound">
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="40px">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField HeaderText="文件编号" DataField="FileCode">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="文件名称">
            <ItemTemplate>
                <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileID") %>"
                    target="_blank" title="<%# Eval("FileName") %>" class="aStyle">
                    <%#Eval("FileName")%>
                </a>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="预览" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="80px" Visible="false">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lbtnViewFile" EnableTheming="false" Text="预览"
                    OnClientClick='<%# String.Format("return ViewFile(\"{0}\",\"{1}\",\"{2}\")",Eval("fileId"),Eval("FileName"),Eval("FileSourceFlag")) %>'></asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="80px" Visible="false">
            <ItemTemplate>
                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("FileID") %>'
                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="1">有效</asp:ListItem>
                    <asp:ListItem Value="2">作废</asp:ListItem>
                </asp:RadioButtonList>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="40px">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                    CommandArgument='<%# Eval("FileID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                </asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<input type="hidden" runat="server" id="hiFileCode" />
<!--是否隐藏文件编号 如果隐藏则不处理文件编号相关-->
<input type="hidden" runat="server" id="hiIsHideFileCode" value="false" />
<input type="hidden" runat="server" id="hiFileRelateId" />
<script type="text/javascript">

    function initFileList() {
        if (!parseBool('<%=Enable %>')) {
            $('#spFile').hide();
        }
        if (parseBool('<%=DownAllFile %>')) {
            $('#spDownFile').show();
        }
    }

    //下载成品
    function batchDownload() {
        var fileRelateId = $('#<%=hiFileRelateId.ClientID%>').val();
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?FileRelateId=" + fileRelateId;
        showDivDialog(urlStr, null, 750, 550);
        return false;
    }

    function ViewFile(FileId, FileName, FileType) {
        var fileId = FileId;
        var fileName = FileName;
        var url = "/Portal/Sys/FileView/FileViewOnline.aspx?FileID=" + fileId + "&fileName=" + fileName + "&fileType=";
        window.open(url);
    }

    function checkFile() {
        debugger;
        // 是否隐藏文件编号 如果隐藏则不处理文件编号相关
        var hideFileCode = $("#<%=hiIsHideFileCode.ClientID%>").val();
        var fileCode = $('#<%=hiFileCode.ClientID%>').val();
        if (fileCode == "" && hideFileCode=="false") {
            alert("请先填写资料编号并保存");
            return false;
        }
        return true;
    }

</script>
