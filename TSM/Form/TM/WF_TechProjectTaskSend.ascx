<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TechProjectTaskSend.ascx.cs"
    Inherits="Zhongsoft.Portal.TSM.Form.TM.WF_TechProjectTaskSend" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            申请编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbApplyCode" runat="server" readonly="readonly" class="kpms-textbox"
                Field="ApplyCode" TableName="SRPM_ProjectListOfWF">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            申请日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbApplyDateWF" runat="server" readonly="readonly" class="kpms-textbox-date"
                Field="ApplyDate" TableName="SRPM_ProjectListOfWF" req="1" ActiveStatus="(3.编制科技项目立项申请书)(3.修改科技项目立项申请书)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td colspan="2">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
           

             <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" field="ProjectName"  SelectPageMode="Dialog"
                req="1" tablename="SRPM_SciTechProjectReviewForm" IsMutiple="false" EnableTheming="false"
                ResultForControls="{'tbApplyCode':'ApplyCode'
                ,'tbApplyDateWF':'ApplyDate','hiProjectListID':'ProjectListID',
                'hiProjectYear':'ProjectYear','tbProjectManagerName':'ProjectManagerName','tbProjectBigClassName':'ProjectBigClassName'
                ,'hiProjectBigClassID':'ProjectBigClassID','tbTechnologySource':'TechnologySource','tbOutputLevel':'OutputLevel'
                ,'tbPlanStartDate':'PlanStartDate','tbPlanEndDate':'PlanEndDate','tbProjectTotalBudget':'ProjectTotalBudget','hiProjectManagerID':'ProjectManagerID'}"
               SourceMode="SelectorPage"  ResultAttr="name" ShowJsonRowColName="true" activestatus="(23.下达科研项目任务书)" PageUrl="~/TSM/Obsolete/TechProjectTaskSelector.aspx" />
            <input type="hidden" runat="server" id="hiProjectListID" field="ProjectListID" tablename="SRPM_SciTechProjectReviewForm" />
            <input type="hidden" runat="server" id="hiProjectYear" field="ProjectYear" tablename="SRPM_ProjectListOfWF" />
        </td>
        
        <td class="td-l">
            项目负责人
        </td>
        <td class="td-m"  >
            <zhongsoft:XHtmlInputText ID="tbProjectManagerName" runat="server" readonly="readonly"
                Field="ProjectManagerName" TableName="SRPM_ProjectListOfWF" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiProjectManagerID" field="ProjectManagerID"
                tablename="SRPM_ProjectListOfWF" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目类型
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="tbProjectBigClassName" runat="server" readonly="readonly"
                Field="ProjectBigClassName" TableName="SRPM_ProjectListOfWF" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiProjectBigClassID" field="ProjectBigClassID"
                tablename="SRPM_ProjectListOfWF" />
        </td>
        <td class="td-l">
            技术来源
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="tbTechnologySource" runat="server" readonly="readonly"
                Field="TechnologySource" TableName="SRPM_ProjectListOfWF" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            产值级别
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="tbOutputLevel" runat="server" readonly="readonly" Field="OutputLevel"
                TableName="SRPM_ProjectListOfWF" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            计划起止日期
        </td>
        <td class="td-m" colspan="3" nowrap="nowrap">
            <zhongsoft:XHtmlInputText ID="tbPlanStartDate" runat="server" readonly="readonly"
                req="1" ActiveStatus="(3.下达科研项目任务书1)(3.下达科研项目任务书1)" class="kpms-textbox-comparedate"
                compare="2" Field="PlanStartDate" TableName="SRPM_ProjectListOfWF">
            </zhongsoft:XHtmlInputText>
            至
            <zhongsoft:XHtmlInputText ID="tbPlanEndDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                req="1" ActiveStatus="(3.下达科研项目任务书1)(3.下达科研项目任务书1)" compare="2" Field="PlanEndDate" 
                TableName="SRPM_ProjectListOfWF">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            项目总经费（元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbProjectTotalBudget" runat="server" class="kpms-textbox-money"
                readonly="readonly" Field="ProjectTotalBudget" TableName="SRPM_ProjectListOfWF">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" style="text-align: left">
            科研项目立项申请信息
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvProjectList" runat="server" AutoGenerateColumns="false"
                DataKeyNames="ProjectListID" AllowPaging="true" OnRowCommand="gvProjectList_RowCommand"
                EmptyDataText="未添加项目信息" BindGridViewMethod="UserControl.BindProjectListGrid"
                HideFieldOnExport="查看,编辑" ShowExport="true">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="60px" />
                    <asp:BoundField DataField="ProjectName" HeaderText="项目名称" />
                    <asp:BoundField DataField="ProjectManagerName" HeaderText="项目负责人" />
                    <asp:BoundField DataField="ProjectDeptName" HeaderText="立项部门" />
                    <asp:BoundField DataField="ProjectContent" HeaderText="项目内容"></asp:BoundField>
                    <asp:BoundField DataField="ProjectBigClassName" HeaderText="项目类别"></asp:BoundField>
                    <asp:BoundField DataField="ProjectTotalBudget" HeaderText="项目总经费（元）" />
                    <asp:TemplateField HeaderText="起止时间" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <%#Convert.ToDateTime(Eval("PlanStartDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("PlanEndDate")).ToString("yyyy-MM-dd")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDetail"  EnableTheming="false" >
                        <img alt="" src="../../Themes/Images/btn_dg_view.gif"onclick='return DetailItem("<%#DataBinder.Eval(Container.DataItem,"FormId") %>","<%#DataBinder.Eval(Container.DataItem,"ProcessInstanceId") %>");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditData">
                                <img alt="编辑项目" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif" 
                                 onclick="return DetailItem('3','<%#Eval("ProjectListID") %>')" title="点击编辑该项目信息" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" align="right" >
            <asp:Button ID="btnUploadFile" runat="server" OnClientClick="return uploadFileOfSRPMProjectReview();"
                OnClick="btnUploadFile_Click" Text="上传附件" activeStatus="(3.下达科研项目任务书)"  displaystatus="(3.下达科研项目任务书)(3.汇总专委会评审结果)" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvFileList" runat="server" AutoGenerateColumns="false"
                AllowPaging="true" BindGridViewMethod="BindFileListGrid" OnRowCommand="gvFileList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名">
                        <ItemTemplate>
                            <a href="<%=WebAppPath %>/Sys/FileDocument/FileDownload.aspx?fileId=<%#Eval("FileId") %>" 
                                title="【点击下载】<%# Eval("FileName") %>" target="_blank" style="color: Blue; text-decoration: underline;">
                                <%# Eval("FileName") %>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UploadDate" HeaderText="上传时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                        ItemStyle-Width="120px" />
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                         >
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("FileId") %>'
                               EnableTheming="false"   CommandName="DeleteData">
                                        <img alt="删除" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" title="点击删除该文件"
                                         onclick="return confirm('-确定删除该文件吗？');"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:TreeGridView ID="tgvBudgetDetailList" runat="server" AutoGenerateColumns="false"
                SelfIdColumn="BudgetStatisticsID" ParentIdColumn="ParentID" PageSize="12" BindGridViewMethod="UserControl.BindBudgetDetailListGrid"
                UseDefaultDataSource="true" AllowPaging="true" IndentSize="10" OnRowCommand="tgvBudgetDetailList_RowCommand"
                EmptyDataText="未添加年度科目预算" ShowExport="true" ShowFooter="true" OnRowDataBound="tgvBudgetDetailList_RowDataBound">
                <FooterStyle Font-Bold="true" HorizontalAlign="Right" />
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <%# tgvBudgetDetailList.CreateHeader(Container.DataItem) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Year" HeaderText="年度" ItemStyle-HorizontalAlign="Right"
                        ItemStyle-Width="40px" />
                    <asp:BoundField DataField="SmallCostName" HeaderText="预算科目" />
                    <asp:BoundField DataField="BudgetMoney" HeaderText="总预算（元）" ItemStyle-HorizontalAlign="Right" />
                    <%-- <asp:BoundField DataField="CalculateReason" HeaderText="计算根据和理由" />--%>
                    <asp:BoundField DataField="Reason" HeaderText="必要性、修改原因" ItemStyle-Width="200px" />
                    <asp:BoundField DataField="BudgetYear" HeaderText="当年预算" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="NextYearBudget" HeaderText="明年预算" ItemStyle-HorizontalAlign="Right" />
                </Columns>
            </zhongsoft:TreeGridView>
        </td>
    </tr>
</table>
 
<%--流程主键--%>
<input type="hidden" runat="server" id="hiProjectReviewFormID" field="ProjectReviewFormID"
    tablename="SRPM_SciTechProjectReviewForm" />
<input type="hidden" runat="server" id="hiKJDeptID" value="11EAACF2-2C5E-4232-B781-C721C67D5388" />
<input type="hidden" runat="server" id="hiCreateUserID" field="CreateUserID"
    tablename="SRPM_SciTechProjectReviewForm" />
<input type="hidden" runat="server" id="hiManDeptID" value="21F74654-D0AB-4F33-8D42-59A2AD29F232" />
<script type="text/javascript">

    var curAct = "<%=CurrentActivityName %>";
    var actType = "<%=ActionType %>";

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        hideOrShowOperation();
    }

    function KPMSCheckSubmit() {

        //        if (curAct == "评委委员评审") {
        //            var xmlHttp;
        //            try {
        //                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        //            }
        //            catch (e) {
        //                try {
        //                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        //                }
        //                catch (e2) {
        //                    xmlHttp = false;
        //                }
        //            }

        //            if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
        //                xmlHttp = new XMLHttpRequest();
        //            }
        //            var url = "/Portal/SRPM/List/ReviewCheckOpinions.aspx?ProcessInstanceId=<%=BusinessObjectId %>&LoginId=<%=ActualUser.UserId %>";
        //            xmlHttp.open("GET", url, false);
        //            xmlHttp.send("");
        //            if (xmlHttp.responsetext != "") {
        //                var activityName = '<%=CurrentActivityName %>';
        //                if (xmlHttp.responsetext != "") {
        //                    alert(xmlHttp.responsetext);
        //                    return false;
        //                }
        //            }
        //        }

        return true;
    }

    function OnDisplay(trID, imgID) {
        imgID.src = document.getElementById(trID).style.display == "none" ? "../../Themes/Images/btn_title.gif" : "../../Themes/Images/btn_folder.gif";
        OpenDetail(trID);
    }

    //选择项目
    function SelectProject() {
        var param = new InputParamObject("s");
        var reObj = null;
        reObj = getTechProject("", param, "");
        if (reObj != null) {
            var id = reObj.getAttrVal(0, "o", "id");
            var name = reObj.getAttrVal(0, "o", "name");

            var projectCode = reObj.getAttrVal(0, "o", "att2");
            var projectManagerName = reObj.getAttrVal(0, "o", "att4");
            var projectYear = reObj.getAttrVal(0, "o", "att9");
            var projectBigClassName = reObj.getAttrVal(0, "o", "att12");
            var technologySource = reObj.getAttrVal(0, "o", "att13");
            var outputLevel = reObj.getAttrVal(0, "o", "att14");
            var planStartDate = reObj.getAttrVal(0, "o", "att15");
            var planEndDate = reObj.getAttrVal(0, "o", "att16");
            var applyCode = reObj.getAttrVal(0, "o", "att19");
            var applyDate = reObj.getAttrVal(0, "o", "att20");
            var projectTotalBudget = reObj.getAttrVal(0, "o", "att21");

          
            return true;
        }
        return false;
    }

    

    //查看流程页面
    function DetailItem(formid, processInstanceId) {
        var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + formid + "&prcInstId=" + processInstanceId;
        window.open(urlStr);
        return false;
    }

    //添加、查看、编辑科技项目评审
    function detailOfOption(actType, bizId) {
        var projectListID = $("#<%=this.hiProjectReviewFormID.ClientID %>").val();
        var url = "<%=WebAppPath %>/SRPM/List/SRPMProjectReviewEditor.aspx?actionType=" + actType;
        if (bizId != "") {
            url += "&bizId=" + bizId;
        }
        else {
            url += "&projectListId=" + projectListID;
        }
        showModal(url, null, 1000, 600);
        return true;
    }

    //添加、查看、编辑科技项目信息
    function detailOfProject(actType, bizId) {
        var url = "<%=WebAppPath %>/SRPM/List/SRPMProjectEditor.aspx?actionType=" + actType;
        if (bizId != "") {
            url += "&bizId=" + bizId;
        }
        showModal(url, null, 1000, 800);
        return true;
    }

    function applySRPMProjectReview() {
        var projectListID = $("#<%=hiProjectListID.ClientID %>").val();
        alert(projectListID);
        var url = "<%=WebAppPath %>/SRPM/List/SRPMProjectABCDEditor.aspx?actionType=" + actType + "&ProjectListId=" + projectListID;

        showModal(url, null, 1000, 800);
        return true;
    }

    //附件上传
    function uploadFileOfSRPMProjectReview() {
        var fileSourceId = $("#<%=this.hiProjectReviewFormID.ClientID %>").val(); ;
        var url = "<%=WebAppPath %>/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSourceId + "&fileSourceFlag=Form&buildSelfFolder=False";
        showModal(url, null, 500, 320);
        return true;
    }

    function hideOrShowOperation() {
        if (curAct == "下达科研项目任务书" && actType == "Create") {
            $("#trTip").show();
        }
        else {
            $("#trTip").hide();
        }
    }

</script>
