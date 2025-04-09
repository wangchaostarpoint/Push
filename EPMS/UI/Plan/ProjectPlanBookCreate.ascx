<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectPlanBookCreate.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Plan.ProjectPlanBookCreate" %>

<table class="tz-table">
    <tr runat="server" visible="True" id="trInitBook">
        <td class="td-l">文件操作方式
        </td>
        <td colspan="5" class="td-m">
            <asp:RadioButtonList runat="server" ID="rbInitType" activestatus="(23.编写项目计划书)(23.编制项目策划)(23.编制大纲)(23.编制项目设计计划)(3.编制项目策划、配置人员)"
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
    <tr runat="server" visible="True" id="trInitBookFileOp">
        <td class="td-l">
            <asp:Label runat="server" ID="lblFileType" Text="工程设计计划文件"></asp:Label>
            <input type="hidden" runat="server" id="hiFileType" />
        </td>
        <td class="td-m" colspan="5">
            <table style="width: 100%">
                <tr>
                    <td style="width: 70%">
                        <a runat="server" id="aGCSJJHWJ" target="_blank" />
                    </td>
                    <td style="width: 10%">
                        <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(23.编制专业设计计划)" EnableTheming="False" OnClientClick="return uploadBookFileNew();">
                            <img src="../../Themes/Images/btn_upload.gif">
                            <span>上传附件</span>
                        </asp:LinkButton>
                    </td>
                    <td style="width: 5%; text-align: center">
                        <a runat="server" id="aDownLoad" target="_blank" style="text-decoration: underline; color: Blue">下载</a>
                    </td>
                    <td style="width: 10%; text-align: center">
                        <a runat="server" id="aEdit" target="_blank" style="text-decoration: underline; color: Blue" displaystatus="(23.编写项目计划书)(23.编制项目策划)(23.编制大纲)(23.编制项目设计计划)(23.编制专业设计计划)(3.编制项目策划、配置人员)">在线编辑</a>
                    </td>
                    <td style="width: 5%; text-align: center">
                        <a runat="server" id="aDel" target="_blank" style="text-decoration: underline; color: Blue" onclick="delFile();" displaystatus="(23.编写项目计划书)(23.编制项目策划)(23.编制大纲)(23.编制项目设计计划)(23.编制专业设计计划)(3.编制项目策划、配置人员)">删除</a>
                        <input type="hidden" runat="server" id="hiFileID" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    
</table>
<input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" />
<input type="hidden" id="hiProjectPlanBookID" name="hiProjectPlanBookID" runat="server" />
<input type="hidden" runat="server" id="hiProjectTemplateFileId" />
<%--field="TemplateFileID" tablename="EPMS_ProjectPlanBook" --%>
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" />
<%--field="ProjectName" tablename="EPMS_ProjectPlanBook" --%>
<input type="hidden" runat="server" id="hiSelTemplateFile" />
<asp:LinkButton runat="server" ID="lbtnInitBook" Style="display: none" OnClick="lbtnInitBook_OnClick" />
<asp:LinkButton runat="server" ID="lbtnAfterUpload" Style="display: none" OnClick="lbtnAfterUpload_OnClick" />
<asp:LinkButton runat="server" ID="lbtnDelFile" Style="display: none" OnClick="lbtnDelFile_OnClick" />
<asp:LinkButton runat="server" ID="btnUseHistoryBook" OnClick="btnUseHistoryBook_OnClick" Visible="false" />
<script type="text/javascript">
    function ProjPlanBook_Init() {

        $('#<%=rbInitType.ClientID %>').each(function () {
            $(this).unbind();
        });
        $("#<%=rbInitType.ClientID %> input[type=radio]").each(function () {
            $(this).bind('click', function () {
                initTypeChangeEvent();
            });
        });
    }

    //检查是否有工程计划文件
    function checkHasFile() {
        var fileID = $("#<%=hiFileID.ClientID%>").val();
        var formID = "<%=FormId%>";
        var msg = "";
        if (formID == "390") {
            msg = "请添加专业设计计划文件!";
        }
        else if (formID == "365") {
            msg = "请添加工程设计计划文件!";
        }
        if (fileID == "") {
            alert(msg);
            return false;
        }
        return true;
    }


    //初始化策划书方式改变时
    function initTypeChangeEvent() {
        var errStr = checkList();
        if (errStr != "") {
            $("#<%=rbInitType.ClientID %> input[type=radio]").each(function () {
                $(this).removeAttr("checked");
            });
            alert(errStr);
            return false;
        }
        var initType = $("#<%=rbInitType.ClientID %> input[type=radio]:checked").val();
        //通过模板初始化书
        if (initType == "1") {
            //selProjectTemplateFile();
            if (selProjectTemplateFile()) {
                afterSelTemplateFile();
            }
        } else if (initType == "2") {
            //历史项目
            selHistoryFile();
        }
        else if (initType == "3") {
            //清空数据
            //$("#<%=lbtnAfterUpload.ClientID %>").click();
            //afterUpLoad();
            uploadBookFileNew();
        }
        return false;
    }



    //选择套用策划书模板
    function selProjectTemplateFile() {
        //判断是否已经生成,如果是已经生成 则在生成的文件基础上再次生成,避免遗漏用户调整
        var fileID = $("#<%=hiFileID.ClientID%>").val();
        if (fileID != "") {
            alert("已经存在设计计划文件,本次将自动生成.");
            return true;
        }
        var param = new InputParamObject("s");
        var orgID = $('#<%=hiOrganizationID.ClientID %>').val();
        var json = { OrganizationID: orgID, ParamValue: 23 };
        getProjectTemplateFile("<%=hiSelTemplateFile.ClientID %>", param, json, afterSelTemplateFile);
        return false;
    }
    //选择策划书模板后自动生成
    function afterSelTemplateFile() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnInitBook, "")%>;
    }


    //选择历史项目策划书
    function selHistoryFile() {
        var param = new InputParamObject("s");
        getHistoryProjectBookFile("<%=hiSelTemplateFile.ClientID %>", param, null, afterSelHistoryFile);
    }//选择历史工程策划书后
    function afterSelHistoryFile() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnUseHistoryBook, "")%>;
    }


    //上传附件
    function uploadBookFileNew() {
        var sourceID = $('#<%=hiOrganizationID.ClientID %>').val();
        if ($formId == "390") {
            sourceID = '<%=BusinessObjectId%>';
        }
        var fileType = $('#<%=hiFileType.ClientID %>').val();
        showUploadFormAndType(sourceID, 'Module', fileType, afterUpLoad);
        return false;
    }

    function afterUpLoad() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnAfterUpload, "")%>;
    }


    function delFile() {
        if (confirm('您确定删除吗？')) {
            <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnDelFile, "")%>;
        }
    }
</script>
