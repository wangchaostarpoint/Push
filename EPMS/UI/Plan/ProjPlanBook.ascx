<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjPlanBook.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.ProjPlanBook" %>
<%@ Import Namespace="DAL.EPMS" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<table class="tz-table">
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr>
        <td class="td-l">
            专业<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" req="1" activestatus="(2.*)"
                Width="200px">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">
            任务类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <%--    <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" field="ParamWBSTypeID"
                tablename="EPMS_ProjectPlanBook" activestatus="(2.*)">
            </zhongsoft:LightDropDownList>--%>
            <input type="hidden" runat="server" id="hiParamWBSTypeID" field="ParamWBSTypeID"
                tablename="EPMS_ProjectPlanBook" />
            <input type="hidden" runat="server" id="hiWBSType" field="WBSType" tablename="EPMS_ProjectPlanBook" />
        </td>
        <td class="td-l">
            编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <%--  <zhongsoft:LightDropDownList runat="server" ID="ddlWBSCode" tablename="EPMS_ProjectPlanBook"
                displaystatus="(2.*)">
            </zhongsoft:LightDropDownList>--%>
            <zhongsoft:XHtmlInputText runat="server" ID="tbWBSCode" TableName="EPMS_ProjectPlanBook"
                Field="WBSCode" activestatus="(2.*)" class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_ProjectPlanBook"
                field="WBSID" />
            <input type="hidden" runat="server" id="hiWBSCode" tablename="EPMS_ProjectPlanBook"
                field="WBSCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            主题<span class="req-star">*</span>
        </td>
        <td class="td-m" id="trTitle" colspan="5">
            <zhongsoft:LightTextBox ID="tbPlanBookTheme" runat="server" MaxText="128" TableName="EPMS_ProjectPlanBook"
                req="1" Field="PlanBookTheme" ActiveStatus="(23.编写项目计划书)(23.编制计划)(23.编制项目策划)(3.修改策划)(3.修改)(23.编制大纲)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbPlanBookContent" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="1024" tablename="EPMS_ProjectPlanBook"
                req="1" field="PlanBookContent" activestatus="(23.编写项目计划书)(23.编制计划)(23.编制项目策划)(3.修改策划)(3.修改)(23.编制大纲)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            编写人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtWriteUserName" runat="server"
                readonly="readonly" TableName="EPMS_ProjectPlanBook" Field="WriteUserName" ActiveStatus="(23.编写项目计划书)(23.编制计划)(23.编制项目策划)(23.编制大纲)" />
            <!--- 填写（编制\编写）人ID-->
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_ProjectPlanBook"
                field="WriteUserID" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtPhone" runat="server" readonly="readonly"
                ActiveStatus="(23.编写项目计划书)(23.编制计划)(23.编制项目策划)(23.编制大纲)" />
        </td>
        <td class="td-l">
            编制部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteDeptName" runat="server" MaxText="32" TableName="EPMS_ProjectPlanBook"
                class="kpms-textbox" readonly="readonly" Field="WriteDeptName" ActiveStatus="(23.编写项目计划书)(23.编制计划)(23.编制项目策划)(23.编制大纲)" />
            <!--编制（编写）部门ID--->
            <input type="hidden" id="hiWriteDeptID" name="hiWriteDeptID" runat="server" tablename="EPMS_ProjectPlanBook"
                field="WriteDeptID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            编制时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtWriteTime" runat="server"
                readonly="readonly" TableName="EPMS_ProjectPlanBook" Field="WriteTime" ActiveStatus="(23.编写项目计划书)(23.编制计划)(23.编制项目策划)(3.修改策划)(3.修改)(23.编制大纲)" />
        </td>
        <td class="td-l">
            需办结日期
        </td>
        <td class="td-m" id="tdFinishDate">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtFinishDate" runat="server"
                readonly="readonly" TableName="EPMS_ProjectPlanBook" Field="FinishDate" ActiveStatus="(23.编写项目计划书)(23.编制计划)(23.编制项目策划)(3.修改策划)(3.修改)(23.编制大纲)" />
        </td>
        <td class="td-l" itemshow="projPlan">
            是否升版<span class="req-star">*</span>
        </td>
        <td class="td-r" itemshow="projPlan">
            <asp:RadioButtonList runat="server" ID="rbIsUpgrate" field="IsUpGrade" tablename="EPMS_ProjectPlanBook"
                req="1" ActiveStatus="(2.编写项目计划书)(3.修改策划)(3.修改)(23.编制大纲)" RepeatDirection="Horizontal">
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0">否</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td colspan="2" itemshow="noprojPlan" style="display: none">
        </td>
    </tr>
    <tr runat="server" visible="false" id="trInitBook">
        <td class="td-l">
            文件操作方式
        </td>
        <td colspan="5" class="td-m">
            <asp:RadioButtonList runat="server" ID="rbInitType" activestatus="(23.编写项目计划书)(23.编制项目策划)(23.编制大纲)"
                RepeatDirection="Horizontal">
                <asp:ListItem Value="1">从模板文件中选择</asp:ListItem>
                <asp:ListItem Value="2">套用历史工程项目文件</asp:ListItem>
                <asp:ListItem Value="3">选择本地文件上传</asp:ListItem>
            </asp:RadioButtonList>
            <p>
                <span id="spanTitle" runat="server"></span><a runat="server" id="aLink" style="text-decoration: underline;
                    color: #0033FF;"></a>
            </p>
            <p style="color: Red">
                注：1、从模板文件中选择，自动加载生成项目文件，填充工程名称、组织人员信息<br />
                <br />
                &nbsp;&nbsp;&nbsp; 2、套用历史工程项目文件，请下载文件到本地文件夹，修改后上传</p>
        </td>
    </tr>
    <tr id="trVersion">
        <td class="td-l" itemshow="version">
            版本号
        </td>
        <td class="td-m" itemshow="version" id="tdVersion">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtVersionNum" runat="server"
                readonly="readonly" TableName="EPMS_ProjectPlanBook" Field="VersionNum" ActiveStatus="(2.编写项目计划书)(2.编制项目策划)(23.编制大纲)" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">
            项目计划
        </td>
        <td class="td-m" colspan="6">
            <a class="aStyle" id="aViewProjPlan">查看项目计划</a>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_ProjectPlanBook"
                Field="Memo" ActiveStatus="(23.编写项目计划书)(23.编制计划)(23.编制项目策划)(3.修改策划)(3.修改)(23.编制大纲)"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="3"
                MaxLength="1024" ReadOnly="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiBookFileId" />
<input type="hidden" id="hiProjectPlanBookID" name="hiProjectPlanBookID" runat="server"
    tablename="EPMS_ProjectPlanBook" field="ProjectPlanBookID" />
<!---项目ID-->
<input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server"
    tablename="EPMS_ProjectPlanBook" field="OrganizationID" />
<!---项目编号-->
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_ProjectPlanBook" />
<!---项目名称-->
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_ProjectPlanBook" />
<!----专业表主键--->
<input type="hidden" id="hiParamSpecialtyID" name="hiParamSpecialtyID" runat="server"
    tablename="EPMS_ProjectPlanBook" field="ParamSpecialtyID" />
<!----专业代字--->
<input type="hidden" id="hiSpecialtyCode" name="hiSpecialtyCode" runat="server" tablename="EPMS_ProjectPlanBook"
    field="SpecialtyCode" />
<!---专业名称-->
<input type="hidden" id="hiSpecialtyName" name="hiSpecialtyName" runat="server" tablename="EPMS_ProjectPlanBook"
    field="SpecialtyName" />
<!---表单类型--->
<input type="hidden" runat="server" id="hiFormType" field="FormType" tablename="EPMS_ProjectPlanBook" />
<input type="hidden" runat="server" id="hiProjectTemplateFileId" field="TemplateFileID"
    tablename="EPMS_ProjectPlanBook" />
<input type="hidden" runat="server" id="hiBookName" />
<input type="hidden" runat="server" id="hiPhaseCode" />
<input type="hidden" id="hiCheckFlowMes" name="hiCheckFlowMes" runat="server" value="已经存在正在流转的项目策划流程,不能重复发起！" />
<asp:LinkButton runat="server" ID="btnAfterSelectProj" OnClick="btnAfterSelectProj_Click"
    Visible="false"></asp:LinkButton>
<asp:LinkButton runat="server" ID="btnUseHistoryBook" OnClick="btnUseHistoryBook_Click"
    Visible="false"></asp:LinkButton>
<asp:LinkButton runat="server" ID="lbtnInitBook" Style="display: none" OnClick="btnInitBook_Click">
</asp:LinkButton>
<asp:LinkButton runat="server" ID="lbtnWBSOrSpeChange" Style="display: none" OnClick="lbtnWBSTypeChanged_Click">
</asp:LinkButton>
<asp:LinkButton runat="server" ID="lbtnAfterUpload" Style="display: none" OnClick="lbtnAfterUpload_Click"
    OnClientClick="return uploadBookFile()">
</asp:LinkButton>
<input type="hidden" runat="server" id="hiSelTemplateFile" />
<!---综合专业-->
<input runat="server" id="hiZHSpeCode" type="hidden" value="A" />
<input type="hidden" runat="server" id="hiSpePlanBookMemo" value="专业设计计划主要内容
一、本专业主要设计原则。
二、设计基础资料
三、设计范围
四、设计综合进度
五、保证措施
六、其他

" />
<script type="text/javascript">
    var formType = $("#<%=hiFormType.ClientID %>").val();
    function projPlanBook_Init() {
        checkRegex();
        checkMaxLength();
        if (!checkFormIsProjPlan()) {
            $("[itemshow='projPlan']").hide();
            $("[itemshow='noprojPlan']").show();
        }
        displayOfVersionInfo();
        $("#<%=rbIsUpgrate.ClientID %>").live("change", function () { displayOfVersionInfo(); });
        $("#<%=ddlSpecialty.ClientID %>").live("change", function () { afterWBSTypeOrSpeChange(); });
        $('#<%=rbInitType.ClientID %>').each(function(){
            $(this).unbind();
        });
        $("#<%=rbInitType.ClientID %>").each(function () { 
            $(this).bind('click', function () {
                initTypeChangeEvent(); 
        });
        });
       
         $("#lbBookName").text($("#<%=hiBookName.ClientID %>").val());
    }

    
    $('#aViewProjPlan').bind('click', function () {        
        var json = { OrganizationID: '<%=OrganizationID %>', IsShowInExportWBS: false };
        var url = buildBizUrl('<%=(int)AccessLevel.Read %>', '<%=OrganizationID %>', "EPMS/List/Plan/ProjOverallPlan.aspx", json);

        showDivDialog(url, null, 900, 750, null);
        return false;
    });

    function afterProjSelect() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAfterSelectProj, "")%>;
    }

    function afterWBSTypeOrSpeChange() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnWBSOrSpeChange, "")%>;
     }
   
     function afterUpLoad() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnAfterUpload, "")%>;
     }

      function uploadBookFile() {
        showUploadForm($prcInstId, "Module");
        return true;
     }
   
     //是否显示版本号信息
    function displayOfVersionInfo() {
        var isUpgrate = $("#<%=rbIsUpgrate.ClientID %> input[type=radio]:checked").val();
        if (isUpgrate == "<%=(int)BoolType.是 %>") {
            var savedVerionNum = $("#<%=txtVersionNum.ClientID %>").val();
            var veriosnNum = "";
            if ("<%=ActionType %>" == "<%=AccessLevel.Create %>") {
                veriosnNum = getNewVerionNum();
                if (veriosnNum == "") {
                    alert("由于不存在上版信息，无法升版");
                    selectRadlItem("<%=rbIsUpgrate.ClientID %>", "0");
                    return false;
                }
            }
            //升版，显示版本号信息,版本号必填
            $("[itemshow='version']").show();
            $("#<%=txtVersionNum.ClientID %>").attr("req", "1");
            if ($("#<%=txtVersionNum.ClientID %>").val() == "")
                $("#<%=txtVersionNum.ClientID %>").val(veriosnNum);
            $("[itemshow='notUpgrade']").hide();
            $("#tdVersion").attr("colspan", "5");
        }
        else {
            $("[itemshow='version']").hide();
            $("#<%=txtVersionNum.ClientID %>").removeAttr("req");
            $("[itemshow='notUpgrade']").show();
            $("#tdTemplate").attr("colspan", "5");
            $("#tdVersion").attr("colspan", "1");
        }
    }

    function selectRadlItem(radl, itemValue) {
        $("#" + radl + " input").each(function () {
            if ($(this).val() == itemValue) {
                $(this).attr("checked", "checked");
                return false;
            }
        });
    }

    //获取项目ID
    function getOrganizationID() {
        return $('#<%=hiOrganizationID.ClientID %>').val();
    }

    //查看历史工程策划书
    function viewOterProjBook(planBookId) {
        var json = null;
        var url = buildQueryUrl("/EPMS/List/Plan/ProjPlanBookList.aspx", json);
        showDivDialog(url, null, 1050, 550, null );
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
            afterUpLoad();
           }
        return false;
    }
    //选择套用策划书模板
    function selProjectTemplateFile() {
        var param = new InputParamObject("s");
        var orgID=$('#<%=hiOrganizationID.ClientID %>').val();
        var json={OrganizationID:orgID};
        getProjectTemplateFile("<%=hiSelTemplateFile.ClientID %>", param, json, afterSelTemplateFile);
    }
    //选择策划书模板后自动生成
    function afterSelTemplateFile() {
          <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnInitBook, "")%>;
    }

    //选择历史项目策划书
    function selHistoryFile() {
        var param = new InputParamObject("s");
        getHistoryProjectBookFile("<%=hiSelTemplateFile.ClientID %>", param, null, afterSelHistoryFile);
    }

    //选择历史工程策划书后
    function afterSelHistoryFile() {
          <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnUseHistoryBook, "")%>;
    }
    //获取策划书数量
    function getProjBookNum(){
         var attachNum=$(".form-fujiana").length/2;
         return attachNum;
    }

     //是否项目综合计划书
    function checkFormIsProjPlan() {
        var formType = $("#<%=hiFormType.ClientID %>").val();
        return formType == "<%=(int)Zhongsoft.Portal.EPMS.PlanBookType.综合计划书 %>".toString();
    }
</script>
