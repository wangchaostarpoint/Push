<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCProjectFileCreate.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.ProjectData.UCProjectFileCreate" %>
<%@ Import Namespace="DAL.EPMS" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table">
    <tr>
        <td class="td-l">文件操作方式
        </td>
        <td colspan="5" class="td-m">
            <asp:RadioButtonList runat="server" ID="rbInitType" activestatus="(23.*)"
                RepeatDirection="Horizontal">
                <asp:ListItem Value="1">从模板文件中选择</asp:ListItem>
                <asp:ListItem Value="2">套用历史工程项目文件</asp:ListItem>
                <asp:ListItem Value="3">选择本地文件上传</asp:ListItem>
            </asp:RadioButtonList>
            <p>
                <span id="spanTitle" runat="server"></span><a runat="server" id="aLink" style="text-decoration: underline; color: #0033FF;"></a>
            </p>
            <p style="color: Red">
                注：1、从模板文件中选择，自动加载生成项目文件，填充工程名称、组织人员信息<br />
                <br />
                &nbsp;&nbsp;&nbsp; 2、套用历史工程项目文件，请下载文件到本地文件夹，修改后上传
            </p>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiSelTemplateFile" />
<input type="hidden" runat="server" id="hiProjectTemplateFileId" field="TemplateFileID" />
<asp:LinkButton runat="server" ID="btnUseHistoryBook" OnClick="btnUseHistoryBook_Click"
    Visible="false"></asp:LinkButton>
<asp:LinkButton runat="server" ID="lbtnInitBook" Style="display: none" OnClick="btnInitBook_Click">
</asp:LinkButton>
<asp:LinkButton runat="server" ID="lbtnAfterUpload" Style="display: none" OnClick="lbtnAfterUpload_Click"
    OnClientClick="return uploadBookFile();"> 
</asp:LinkButton>
<script type="text/javascript">
    function initProjectFile() {
        $('#<%=rbInitType.ClientID %>').unbind();

        $("#<%=rbInitType.ClientID %>").find("input[type='radio']").each(function () {
            $(this).bind('click', function () {
                initTypeChangeEvent();
            });
        }
        );

    }

    function afterUpLoad() {
         <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnAfterUpload, "")%>;
    }

    function uploadBookFile() {
        showUploadFormAndType('<%= BizID%>', "ProjectFile", null, afterUpLoad);
        return false;
    }

    //初始化策划书方式改变时
    function initTypeChangeEvent() {
        var initType = $("#<%=rbInitType.ClientID %> input[type=radio]:checked").val();
        //通过模板初始化书
        if (initType == "1") {
            selProjectTemplateFile();
        } else if (initType == "2") {
            //历史项目
            selHistoryFile();
        }
        else if (initType == "3") {
            //清空数据
            $("#<%=lbtnAfterUpload.ClientID %>").click();
        }
        return false;
    }
    //选择套用策划书模板
    function selProjectTemplateFile() {
        var param = new InputParamObject("s");
        var json = { TemplateFileType: '<%=TemplateFileType%>', OrganizationID: '<%=OrgID%>' }
        getProjectTemplateFile("<%=hiSelTemplateFile.ClientID %>", param, json, afterSelTemplateFile);
    }
    //选择策划书模板后自动生成
    function afterSelTemplateFile() {
          <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnInitBook, "")%>;
    }

    //选择历史项目策划书
    function selHistoryFile() {
        var param = new InputParamObject("s");
        var json = { FileType: '<%=ParamFileType%>' };
        getHistoryProjectFile("<%=hiSelTemplateFile.ClientID %>", param, json, afterSelHistoryFile);
    }

    //选择历史工程策划书后
    function afterSelHistoryFile() {
          <%=this.Page.ClientScript.GetPostBackEventReference(this.btnUseHistoryBook, "")%>;
    }

    function cancelExp() {
        closeWindow();
    }

</script>

