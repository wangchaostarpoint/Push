<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTemplateFileList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProjectData.ProjectTemplateFileList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.EPMS" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    操作方式：<br />
    <%--目前使用 Start--%>
    <span style="display: none" id="spGeneral">
        <table>
            <tr>
                <td><a style="color: blue" onclick="upLoadFile()">
                    <h4>上传《<%=ParamFileType %>》文件</h4>
                </a>
                </td>
                <td>：只上传相关文件，相关人员从此列表中下载或再次分发
                </td>
            </tr>
        </table>
    </span>
    <span style="display: none" id="spGeneralAndFenfa">
        <table>
            <tr>
                <td>
                    <a style="color: blue" onclick="upLoadFileAndFenfa()">
                        <h4>上传《<%=ParamFileType %>》文件并分发</h4>
                    </a>
                </td>
                <td>：上传相关文件后启动《资料分发流程》发送给相关接收人
                </td>
            </tr>
        </table>
    </span>
    <%--当前页面参数没有对应流程，则隐藏--%>
    <span style="display: none" id="spGeneralAndFlow">
        <table>
            <tr>
                <td>
                    <a style="color: blue" onclick="upLoadFileAndStartFlow()">
                        <h4>上传《<%=ParamFileType %>》文件并发送审批</h4>
                    </a>
                </td>
                <td>：上传相关文件并启动审批流程
                </td>
            </tr>
        </table>
    </span>
    <%--直接发起流程，暂不显示--%>
    <span style="display: none" id="spGeneralOnlyFlow">
        <table>
            <tr>
                <td>
                    <a style="color: blue" onclick="startFlow()">
                        <h4>发起《<%=ParamFileType %>》流程</h4>
                    </a>
                </td>
                <td>：上传相关文件并启动审批流程
                </td>
            </tr>
        </table>
    </span>
    <%--动态发起流程相关参数--%>
    <input type="hidden" runat="server" id="hiPackageNameTemp" />
    <input type="hidden" runat="server" id="hiXPDLIDTemp" />
    <input type="hidden" runat="server" id="hiFormIDTemp" />

    <%--目前使用 End--%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">文件名称</span>
        <span>
            <asp:TextBox ID="tbListInfo" MaxLength="20" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span>
    </span>
    <span class="filter-block" style="display: none;">
        <span class="filter-block-lb">文件状态</span>
        <span>
            <asp:CheckBoxList runat="server" ID="cblFileState" RepeatDirection="Horizontal"></asp:CheckBoxList>
        </span>
    </span>

    <span class="filter-block" style="display: none" id="spStartWF">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《工程会议纪要》</h4>
            </a></span>
    </span>
    <asp:LinkButton runat="server" ID="lbtnCopy" CssClass="subtoolbarlink" OnClick="lbtnUpload_Click" EnableTheming="false" Style="color: blue; display: none">
    </asp:LinkButton>
    <span class="filter-block" style="display: none" id="spProject">
        <span>
            <a style="color: blue" onclick="showUpload('1')">
                <h4>上传《项目<%=ParamFileType %>》</h4>
            </a></span>
    </span>
    <span class="filter-block" style="display: none" id="spSpeciality">
        <span>
            <a style="color: blue" onclick="showUpload('0')">
                <h4>上传《专业<%=ParamFileType %>》</h4>
            </a></span>
    </span>
    <span class="filter-block" style="display: none" id="spTrain">
        <span>
            <a style="color: blue" onclick="showUploadTrain()">
                <h4>上传《培训登记表》</h4>
            </a></span>
    </span>
    <span class="filter-block" style="display: none" id="spVisitFact">
        <span>
            <a style="color: blue" onclick="showUploadVisit('工程回访报告')">
                <h4>上传《工程回访报告》</h4>
            </a></span>
    </span><span class="filter-block" style="display: none" id="spVisitPlan">
        <span>
            <a style="color: blue" onclick="showUploadVisit('工程回访计划表')">
                <h4>上传《工程回访计划表》</h4>
            </a></span>
    </span>
    <span class="filter-block" style="display: none;">
        <span>
            <a style="color: blue" onclick="return batchDownLoad()">
                <h4>批量下载</h4>
            </a>
        </span>
    </span>
    <span class="filter-block" style="display: none;">
        <span>
            <a style="color: blue" onclick="return openDownLoad()" id="aDownLoad">
                <h4>下载模板</h4>
            </a>
        </span>
    </span>
    <input type="hidden" runat="server" id="hiTrain" value="项目培训" />
    <input type="hidden" runat="server" id="hiMeeting" value="会议纪要" />
    <input type="hidden" runat="server" id="hiMeetingNode" value="设计策划会/启动会、方案讨论会" />
    <input type="hidden" runat="server" id="hiTemplateCount" />
    <input type="hidden" runat="server" id="hiTemplateFileType" />

    <div id="divDownLoad" style="display: none;">
        <asp:DataList runat="server" ID="dlTemplateFile" CssClass="kpms-tablebordernone"
            DataKeyField="TemplateFileURL" Width="100%">
            <ItemTemplate>
                <table style="border: #cbccce 1px solid !important; background: #f3f4f4; width: 100%">
                    <tr>
                        <td>
                            <%# Container.ItemIndex+1 %> 、
                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("TemplateFileURL") %>"
                                target="_blank" title="<%# Eval("TemplateFileName") %>" style="color: Blue; text-decoration: underline">
                                <%# Eval("TemplateFileName").ToString()%>
                            </a>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="FileID" AutoGenerateColumns="False"
        AllowPaging="True" AllowSorting="true" ShowExport="true" BindGridViewMethod="BindList" OnRowCommand="gvList_RowCommand"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="下载" ItemStyle-HorizontalAlign="Center" Visible="false"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileID") %>"
                        title="下载" style="color: blue">下载</a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>

            <zhongsoft:LightTemplateField HeaderText="文件名称" ItemStyle-Width="80px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtn112" OnClientClick='<%# String.Format("return viewFile(\"{0}\",\"view\")",Eval("FileID")) %>'
                        EnableTheming="false" Text='<%# Eval("FileName")%>' Visible="false">    
                    </asp:LinkButton>
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileID") %>"
                        title="下载" style="color: blue" target="_blank"><%# Eval("FileName")%></a>
                    <asp:LinkButton runat="server" ID="lbtnEditFile" EnableTheming="false" Text="在线编辑" Style="color: blue" Visible="false"
                        OnClientClick='<%# String.Format("return viewFile(\"{0}\",\"edit\")",Eval("FileID")) %>'>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnUpgrade" EnableTheming="false" Text="升版" Style="color: blue" Visible="false"
                        OnClientClick='<%# String.Format("return upgradeFile(\"{0}\")",Eval("FileID")) %>'>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="文件状态" ItemStyle-Width="80px">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiParamSpecialtyID" value='<%#Eval("ParamSpecialtyID") %>' />
                    <input type="hidden" runat="server" id="hiFileID" flag="fileID" value='<%#Eval("FileID") %>' />
                    <asp:Label ID="lbFileState" runat="server" Text='<%#Eval("FileState") %>'></asp:Label>
                    <a id="clickmenu" runat="server" visible="false" flag="clickmenu" fileid='<%#Eval("FileID") %>' style="color: blue">提交流程<img src="<%=WebAppPath %>/Themes/Images/ddl.gif" /></a>
                    <div id="overlay" flag="overlay">
                    </div>
                    <div id="poplayer" flag="poplayer">
                        <div class="item-sub sl-shadow">
                            <table class="item-table">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="rblWorkFlow" runat="server"></asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="文件类型" DataField="FileType" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="子文件类型" DataField="ChildFileType" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="版本号" DataField="FileVersion" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="创建者" DataField="CreateUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="创建时间" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="最后修改时间" DataField="LastModifyDate" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="文件分发" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFileDispense" runat="server" CssClass="subtoolbarlink" EnableTheming="false" OnClientClick='<%# String.Format("return dispense(\"{0}\",\"\",\"\")",Eval("FileID")) %>'><span><img id="img8" src="<%=WebAppPath %>/Themes/Images/btn_gongzuoliu.gif" alt="资料分发" width="16" height="16" /></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看流程" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnViewRele" EnableTheming="false" flag="flow" fileId='<%# Eval("FileID")%>'
                        OnClientClick='<%# String.Format("return ViewFormInfo(\"{0}\")",Eval("FileID")) %>' Style="display: none;">
                        <img src="../../../Themes/Images/btn_chakan.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false"
                        OnClientClick='<%# String.Format("return checkProjFileDel(\"{0}\")",Eval("FileID")) %>'
                        CommandArgument='<%# Eval("FileID") %>'>
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div id="divWorkflow" style="display: none">
        <asp:RadioButtonList ID="rblWorkFlow" runat="server"></asp:RadioButtonList>
    </div>
    <input type="hidden" runat="server" id="hiOrganzationID" />
    <input type="hidden" runat="server" id="hiFormCode" value="ProjectDataDispense" />
    <input type="hidden" runat="server" id="hiFormID" />
    <input type="hidden" runat="server" id="hiPackageName" />
    <input type="hidden" runat="server" id="hiXpdlId" />
    <input type="hidden" runat="server" id="hiCurFileID" />
    <%--文件上传的FileSourceID--%>
    <input type="hidden" runat="server" id="hiFileSourceID" />
    <input type="hidden" runat="server" id="hiStartFlow" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            var action = "<%=FileAction %>";
            initOperate();
            document.onmousedown = function () { if (!over) hideMenu(); };
            var paramFileType = '<%=ParamFileType%>';
            if (paramFileType == "技术组织措施" || paramFileType == "现场踏勘工作大纲") {
                //项目
                if (action == "editProj") {
                    $('#spProject').show();
                }
                //专业
                else if (action == "editSpe") {
                    $('#spSpeciality').show();
                }
                //项目和专业
                else if (action == "editProjeditSpe" || action == "editAll") {
                    $('#spProject').show();
                    $('#spSpeciality').show();
                }
                else {
                    $('#spProject').hide();
                    $('#spSpeciality').hide();
                }
            }
            else if (paramFileType == "项目培训") {
                if (action == "editAll") {
                    $('#spTrain').show();
                }
                else {
                    $('#spTrain').hide();
                }
            }
            else if (paramFileType == '<%=ProjectFileType.设计回访%>') {
                if (action != "view") {
                    $('#spVisitPlan').show();
                    $('#spVisitFact').show();
                }
                else {
                    $('#spVisitPlan').hide();
                    $('#spVisitFact').hide();
                }
            }
            else {
                if (action != "view") {
                    $('#spGeneral').show();
                    $('#spGeneralAndFenfa').show();
                    //直接点击列表附件发起流程，不需要单独的发起流程按钮
                    <%--if (paramFileType == '<%=ProjectFileType.会议纪要%>') {
                        $('#spStartWF').show();
                    }--%>

                    var packageName = $('#<%=hiPackageNameTemp.ClientID%>').val();
                    if (packageName != '') {
                        $('#spGeneralAndFlow').show();
                        //$('#spGeneralOnlyFlow').show();
                    }
                }
                else {
                    $('#spGeneral').hide();
                    $('#spGeneralAndFenfa').hide();
                    $('#spGeneralAndFlow').hide();
                    $('#spGeneralOnlyFlow').hide();
                }
            }
            initDownLoad();

            initFlowInfo();
        }

        //初始化查看流程按钮显隐
        function initFlowInfo() {
            var $ids = "";
            $('#<%=gvList.ClientID %> a[flag="flow"]').each(function () {
                $ids += $(this).attr("fileId") + "|";
            });
            $.post("ProjectTemplateFileList.aspx",
                { asyfunc: "GetFileRelateFlowCount", fileIds: $ids },
                function (res) {
                    if (res == "") { return; }
                    var $l = eval('(' + res + ')');
                    $('#<%=gvList.ClientID %> a[flag="flow"]').each(function () {
                        var fileId = $(this).attr("fileId");
                        for (var i = 0; i < $l.length; i++) {
                            var $fileId = $l[i][0];
                            var $cnt = $l[i][1];
                            if (fileId.toLowerCase() == $fileId.toLowerCase()) {
                                var cnt = $cnt;
                                if (cnt > 0) {
                                    $(this).show();
                                }
                            }
                        }
                    });
                }
            );
        }

        //批量下载
        function batchDownLoad() {
            var fileIds = buildGirdRowIds($gridCheckedClientID);
            if (fileIds != "") {
                fileIds = "'" + fileIds.join("','") + "'";
                var url = "/Sys/FileDocument/BatchFileDownload.aspx?fileSourceId=" + fileIds + "&customerPath=1";
                showDivDialog(url, null, 700, 550);
                return false;
            }
            else {
                alert("没有要下载的资料");
            }

            return false;
        }

        function batchFileDispense() {
            var fileIds = buildGirdRowIds($gridCheckedClientID);
            if (fileIds != "") {
                fileIds = fileIds.join("|");
                dispense(fileIds, null, null);
            }
            else {
                alert("请勾选分发资料");
            }
            return false;
        }

        //资料分发
        function dispense(fileId, fileSourceId, fileName) {
            var url = encodeURI("<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=" + $("#<%=hiPackageName.ClientID %>").val() + "&xpdlId=" + $("#<%=hiXpdlId.ClientID %>").val() + "&formId=" + $("#<%=hiFormID.ClientID %>").val() + "&ver=|&OrganizationId=" + $("#<%=hiOrganzationID.ClientID %>").val() + "&FileIDs=" + fileId);

            window.open(url, "workspace");
            return false;
        }

        function viewFile(fileId, action) {
            <%-- var action = "<%=FileAction %>";
            if (createUserId.toLowerCase() == "<%=KPMSUser.UserId %>".toLowerCase()) {
                action = "edit";
            }
            if (fileState != "<%=ProjectFileState.起草.ToString()%>") {
                action = "view";
            }--%>
            //type=revised 传递参数，打开模式为修订
            var url = encodeURI("<%=WebAppPath%>/Sys/FileDocument/DocumentViewEdit.aspx?action=" + action + "&type=revised&FileId=" + fileId.toLowerCase());
            //var url = encodeURI("<%=WebAppPath%>/WebOffice/WebOfficeEdit.aspx?action=" + action + "&type=text&bizId=" + fileId.toLowerCase());
            window.open(url);
            return false;
        }

        //上传文件
        function upLoadFile() {
            var businessId = getGuid();
            $('#<%=hiFileSourceID.ClientID%>').val(businessId);
            showUploadFormAndType(businessId, "ProjectFile", '<%=ParamFileType%>', uploadFileCallBack);
            return false;
        }

        //上传文件并分发
        function upLoadFileAndFenfa() {
            var businessId = getGuid();
            $('#<%=hiFileSourceID.ClientID%>').val(businessId);
            showUploadFormAndType(businessId, "ProjectFile", '<%=ParamFileType%>', uploadAndFenfaFileCallBack);
            return false;
        }

        //上传文件并审批
        function upLoadFileAndStartFlow() {
            var businessId = getGuid();
            $('#<%=hiFileSourceID.ClientID%>').val(businessId);
            showUploadFormAndType(businessId, "ProjectFile", '<%=ParamFileType%>', uploadAndStartFlowFileCallBack);
            return false;
        }

        //启动xx流程
        function startFlow() {
            var packageName = $('#<%=hiPackageNameTemp.ClientID%>').val();
            var xpdlId = $('#<%=hiXPDLIDTemp.ClientID%>').val();
            var formId = $('#<%=hiFormIDTemp.ClientID%>').val();

            startWorkFlow(packageName, xpdlId, formId, '<%=OrganizationID%>');
        }

        //发起资料分发流程
        function fenfa() {
            var packageName = $('#<%=hiPackageName.ClientID%>').val();
            var xpdlId = $('#<%=hiXpdlId.ClientID%>').val();
            var formId = $('#<%=hiFormID.ClientID%>').val();

            startWorkFlow(packageName, xpdlId, formId, '<%=OrganizationID%>');
        }

        //上传文件后执行
        function uploadFileCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnCopy,"") %>
        }

        //上传文件并分发--执行
        function uploadAndFenfaFileCallBack(re) {
            $('#<%=hiStartFlow.ClientID%>').val('分发');
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnCopy,"") %>;
            $('#<%=hiStartFlow.ClientID%>').val('');
        }

        //上传文件并审批--执行
        function uploadAndStartFlowFileCallBack(re) {
            $('#<%=hiStartFlow.ClientID%>').val('审批');
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnCopy,"") %>;
            $('#<%=hiStartFlow.ClientID%>').val('');
        }

        function upgradeFile(fileID) {
            var json = { oldFileID: fileID };
            var url = buildQueryUrl("EPMS/List/ProjectData/ProjectTemplateFileUpgrade.aspx?actiontype=3", json);
            showDivDialog(url, null, 900, 500, uploadFileCallBack);
        }

        function showUpload(isProjectFile) {
            var json = { OrgID: '<%=OrganizationID%>', ParamFileType:'<%=ParamFileType%>', IsProjectFile: isProjectFile, closeHide: 1, TemplateFileType: $("#<%=hiTemplateFileType.ClientID %>").val() };
            var url = buildQueryUrl("EPMS/List/Document/ProjectFileUpload.aspx?actiontype=3", json);
            showDivDialog(url, null, 900, 500, uploadFileCallBack);
        }

        function showUploadMeeting() {
            var json = { OrgID: '<%=OrganizationID%>', ParamFileType:'<%=ParamFileType%>', closeHide: 1, TemplateFileType: $("#<%=hiTemplateFileType.ClientID %>").val() };
            var url = buildQueryUrl("EPMS/List/ProjectData/ProjectFileUploadMeeting.aspx?actiontype=3", json);
            showDivDialog(url, null, 900, 500, uploadFileCallBack);
        }

        function showUploadTrain() {
            var json = { OrgID: '<%=OrganizationID%>', ParamFileType:'<%=ParamFileType%>', closeHide: 1, TemplateFileType: $("#<%=hiTemplateFileType.ClientID %>").val() };
            var url = buildQueryUrl("EPMS/List/ProjectData/ProjectFileUploadTrain.aspx?actiontype=3", json);
            showDivDialog(url, null, 900, 500, uploadFileCallBack);
        }

        function showUploadOutFile() {
            var json = { OrgID: '<%=OrganizationID%>', ParamFileType:'<%=ParamFileType%>', closeHide: 1, TemplateFileType: $("#<%=hiTemplateFileType.ClientID %>").val(), MessageTypeName:'<%=MessageTypeName %>', SpecialtyID:'<%=SpecialtyID %>', CompanyName:'<%=CompanyName %>' };
            var url = buildQueryUrl("EPMS/List/ProjectData/MessageOutgoingUpFile.aspx?actiontype=3", json);
            showDivDialog(url, null, 900, 500, uploadFileCallBack);
        }

        function showUploadVisit(paramFileType) {
            var json = { OrgID: '<%=OrganizationID%>', ParamFileType: paramFileType, closeHide: 1, TemplateFileType: $("#<%=hiTemplateFileType.ClientID %>").val() };
            var url = buildQueryUrl("EPMS/List/ProjectData/ProjectFileUploadVisit.aspx?actiontype=3", json);
            showDivDialog(url, null, 900, 500, uploadFileCallBack);
        }

        function showUploadGeneral() {
            var paramFileType = '<%=ParamFileType%>';
            if (paramFileType == "会议纪要") {
                showUploadMeeting();
            }
            else if (paramFileType == "设计评审单" || paramFileType == "强制性条文计划/检查表") {
                var json = { OrgID: '<%=OrganizationID%>', ParamFileType:'<%=ParamFileType%>', closeHide: 1, TemplateFileType: $("#<%=hiTemplateFileType.ClientID %>").val() };
                var url = buildQueryUrl("EPMS/List/ProjectData/ProjectFileUploadReview.aspx?actiontype=3", json);
                showDivDialog(url, null, 900, 500, uploadFileCallBack);
            }
            else if (paramFileType == "发文") {
                var messageTypeName = "<%=MessageTypeName%>";
                if (messageTypeName == "") {
                    alert("请在左侧目录树选择收件单位和发文文件类别");
                    return false;
                }
                else {
                    //showUploadOutFile();
                    showWorkflowMenu();
                }
                <%--else if (messageTypeName == "一般函件" || messageTypeName == "会议纪要") {
                    showUploadOutFile();
                } else if (messageTypeName == "电子成品发送单" || messageTypeName == "成品宣布可用单" || messageTypeName == "纸质成品发送单") {
                    //window.parent.goNode($("#<%=hiOrganzationID.ClientID %>").val(), "成品出版");
                    showUploadOutFile();
                } else if (messageTypeName == "设计变更单") {
                    //window.parent.goNode($("#<%=hiOrganzationID.ClientID %>").val(), "设计变更");
                    showUploadOutFile();
                } else if (messageTypeName == "审查意见回复单") {
                    if ("<%=Project.ProjectTypeCode%>" == "H") {
                        //window.parent.goNode($("#<%=hiOrganzationID.ClientID %>").val(), "文件审查及宣布可用");
                        showUploadOutFile();
                    } else {
                        //window.parent.goNode($("#<%=hiOrganzationID.ClientID %>").val(), "图纸审查");
                        showUploadOutFile();
                    }
                }--%>
            }
            else {
                showUpload(1);
            }
        }

        function initOperate() {
            $('[flag="clickmenu"]').each(function () {
                $(this).bind('click', function (ev) {
                    showMenu(ev);
                });
            })
        }

        //发起流程
        function startWorkFlow(packageName, xpdlID, formId, orgID) {
            var url = "/Sys/Workflow/FormDetail.aspx";
            var json = { actionType: 2, packageName: packageName, xpdlId: xpdlID, formId: formId, ver: '|' };
            //项目ID、文件ID
            json = $.extend(json, {
                OrganizationId: orgID, FileID: $("#<%=hiCurFileID.ClientID%>").val(),
                FileID: $("#<%=hiCurFileID.ClientID%>").val(), SpecialtyID: '<%=SpecialtyID%>'
            });

            if ("<%=ParamFileType%>" == "发文") {
                var temp = { SpecialtyID: "<%=SpecialtyID%>", MessageTypeName: "<%=MessageTypeName%>" };
                json = $.extend(json, temp);
            }
            else if ("<%=ParamFileType%>" == '<%=ProjectFileType.会议纪要%>') {
                var temp = { MeetingType: '<%=Request.QueryString["MeetingType"]%>' };
                json = $.extend(json, temp);
            }

            //拼接文件来源ID
            var fileSourceId = $('#<%=hiFileSourceID.ClientID%>').val();
            if (fileSourceId != '') {
                var temp = { fileSourceId: fileSourceId };
                json = $.extend(json, temp);
            }

            url = buildQueryUrl(url, json);
            window.open(url, "workspace");
            return false;
        }

        //弹出菜单具体方法
        //用于指定是否禁止原有菜单，主要是为了当右击表头以及翻页行是禁止右键自定义菜单，展示原有右键菜单
        var showInit = null;
        var over = false;
        var menu = null;
        function showMenu(ev) {
            ev = ev || window.event;
            hideMenu();
            var e = ev.srcElement || ev.target;
            if (e.tagName == "TH") {
                showInit = true;
                return;
            }

            var parent = e.parentNode;
            //名称列由于showtooltip的原因多了一层div，导致当前父级为td
            if (e.parentNode.tagName == "TD") {
                parent = e.parentNode.parentNode;
            }
            var id = $(parent).find("[flag='fileID']").val();
            if (id == "" || id == undefined) {
                showInit = true;
                return;
            }
            $("#<%=hiCurFileID.ClientID%>").val(id);
            var x = ev.pageX || ev.clientX + document.documentElement.scrollLeft;
            var y = ev.pageY || ev.clientY + document.documentElement.scrollTop;

            menu = document.createElement("DIV");
            menu.className = "menu";
            menu.style.left = x + 10 + "px";
            menu.style.top = y - ($("#<%=rblWorkFlow.ClientID %>").find("input[type='radio']").length) * 20 + "px";

            showInit = false;
            var resValue = "";
            $.ajaxSettings.async = false;
            $.post("ProjectTemplateFileList.aspx",
                { asyfunc: "GetWorkFlow", fileId: id, organizationID:'<%=OrganizationID%>', paramFileType: '<%=ParamFileType%>', formID: '<%=FormID%>' },
                function (res) {
                    if (res != "") {
                        resValue = res;
                    }
                }
            );

            $.ajaxSettings.async = true;
            $("#<%=rblWorkFlow.ClientID %>").find("input[type='radio']").each(function () {
                $(this).attr("checked", false);
            });
            if (resValue != "") {
                $("#<%=rblWorkFlow.ClientID %>").find("input[type='radio'][value=" + resValue + "]").attr("checked", true);
                var paramFileType = '<%=ParamFileType%>';
                if (paramFileType == "技术组织措施" || paramFileType == "现场踏勘工作大纲" || paramFileType == "质量计划/质保大纲") {
                    $("#<%=rblWorkFlow.ClientID %>").find("input[type='radio'][value=" + resValue + "]").click();
                }
                else {
                    document.body.appendChild(menu);
                    $(menu).append($("#<%=rblWorkFlow.ClientID%>").html());
                }
            }
            else {
                document.body.appendChild(menu);
                $(menu).append($("#<%=rblWorkFlow.ClientID%>").html());
            }
            //menu.innerHTML = $("#<%=rblWorkFlow.ClientID%>").html();
            menu.onmouseover = function () { over = true; };
            menu.onmouseout = function () { over = false; };
        }

        //隐藏菜单
        function hideMenu() {
            if (menu) {
                document.body.removeChild(menu);
                menu = null;
            }
        }

        function showWorkflowMenu(ev) {
            ev = ev || window.event;
            hideMenu();
            var e = ev.srcElement || ev.target;
            var x = ev.pageX || ev.clientX + document.documentElement.scrollLeft;
            var y = ev.pageY || ev.clientY + document.documentElement.scrollTop;

            menu = document.createElement("DIV");
            menu.className = "menu";
            menu.style.left = x + 10 + "px";
            menu.style.top = y - ($("#<%=rblWorkFlow.ClientID %>").find("input[type='radio']").length) * 20 + "px";

            showInit = false;

            document.body.appendChild(menu);
            $(menu).append($("#<%=rblWorkFlow.ClientID%>").html());
            //menu.innerHTML = $("#<%=rblWorkFlow.ClientID%>").html();
            menu.onmouseover = function () { over = true; };
            menu.onmouseout = function () { over = false; };
        }

        function fileCheckIn() {
            $.ajaxSettings.async = false;
            $.post("ProjectTemplateFileList.aspx",
                { asyfunc: "FileCheckIn", fileid: $("#<%=hiCurFileID.ClientID%>").val() },
                function (res) {

                }
            );
            $.ajaxSettings.async = true;
            $("#<%=hiCurFileID.ClientID%>").val("");
            hideMenu();
            rebindGridData();
        }

        function initDownLoad() {
            var width = 500;
            var height = 300;

            //弹出查询框定位到查询按钮下方
            var pX; var pY;
            pX = $('#aDownLoad').offset().left - 200;
            pY = $('#aDownLoad').offset().top + $('#aDownLoad').outerHeight() + 1;
            $("#divDownLoad :ui-dialog").dialog("destroy");
            $("#divDownLoad").dialog({
                title: "下载模板",
                resizable: true,
                autoOpen: false,
                minHeight: height,
                minWidth: width,
                modal: true,
                position: [pX, pY],
                buttons: {
                    "关闭": function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        //下载
        function openDownLoad() {
            var temCount = $("#<%=hiTemplateCount.ClientID%>").val();
            if (temCount == "0" || temCount == "") {
                alert("没有模板可以下载");
                return false;
            }
            else {
                $("#divDownLoad").dialog('open');
                $("#divDownLoad").parent().appendTo("#<%=this.Page.Form.ClientID%>");
            }
            return false;
        }

        //function ViewFormInfo(businessID) {
        //    var url = buildQueryUrl("EPMS/List/ProjectData/ProjectFileExpandInfo.aspx", { "actionType": 1, BusinessID: businessID });
        //    showDivDialog(url, null, 1100, 600, null);
        //    return false;
        //}

        function ViewFormInfo(fileId) {
            var url = buildQueryUrl("EPMS/List/ProjectData/ProjectFileExpandInfo.aspx", { "actionType": 1, FileID: fileId });
            showDivDialog(url, null, 1000, 600, null);
            return false;
        }

        function checkProjFileDel(fileID) {
            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/EPMS/Handler/CheckProjFileDel.ashx", null),
                data: { 'FileID': fileID },
                async: false,
                //dataType: "json",
                cache: false,
                success: function (res) {
                    if (res > 0) {
                        alert('该文件已有发起的流程，不允许删除！');
                        return false;
                    }
                    else {
                        if (!confirm('确认要删除当前文件吗？')) {
                            return false;
                        }
                        $.post("ProjectTemplateFileList.aspx",
                            { asyfunc: "DeleteFileData", fileid: fileID, fileState: '作废' },
                            function (res) {
                                rebindGridData();
                            }
                        );
                    }

                    if (res == "检入" || res == "完成") {
                        alert("该文件已" + res + "，不允许删除，若要删除文件，请联系系统管理员！");
                        return false;
                    }
                    else if (res == "流程中" || res == "审批中") {
                        alert("该文件正在" + res + "，不允许删除，若要删除文件，请流程发起人先删除流程！");
                        return false;
                    }
                    else if (res == "起草") {
                        if (!confirm('确认要作废当前文件吗？')) {
                            return false;
                        }
                        $.post("ProjectTemplateFileList.aspx",
                            { asyfunc: "DeleteFileData", fileid: fileID, fileState: res },
                            function (res) {
                                rebindGridData();
                            }
                        );
                    }
                    else if (res == "作废" || res == '') {
                        if (!confirm('确认要删除当前文件吗？')) {
                            return false;
                        }
                        $.post("ProjectTemplateFileList.aspx",
                            { asyfunc: "DeleteFileData", fileid: fileID, fileState: res },
                            function (res) {
                                rebindGridData();
                            }
                        );
                    }
                    //if (res != "") {
                    //    alert(res);
                    //    return false;
                    //}
                    //else {
                    //    if (!confirm('确认要作废当前文件吗？')) {
                    //        return false;
                    //    }
                    //    $.post("ProjectTemplateFileList.aspx",
                    //        { asyfunc: "DeleteFileData", fileid: fileID },
                    //        function (res) {
                    //            rebindGridData();
                    //        }
                    //    );
                    //}
                },
                error: function (err) {
                    //alert(err);
                }
            });
        }

        //发起《工程会议纪要》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSProjectMeeting.xpdl', xpdlId: 'EPMSProjectMeeting_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProjectMeeting.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>', FileType:'<%=ProjectFileType.会议纪要%>', FileSourceFlag: 'ProjectFile', FileSourceId:'<%=EPMSCataLogID%>'
            });
            window.open(url);
            return false;
        }
    </script>

    <!-- 该样式需要放到最后，否则回发后导致下拉效果失效 mark by tianhl 20180323-->
    <style type="text/css">
        /*下拉弹出层样式开始*/
        a {
            text-decoration: none;
            color: #000;
            background: transparent;
            outline: none;
        }

            a:visited {
            }

            a:focus {
                outline: none;
            }

        #toolbarlay {
            /*width: 140px;
            height: 35px;
            line-height: 35px;*/ /*去掉注释后，legend的标题与按钮同行*/
            z-index: 3;
            /*position: fixed;
            left: 0;
            top: 0;
            right: 0;*/
        }

        #clickmenu {
            cursor: pointer;
            display: block;
            text-align: center;
            margin: 0 auto;
            /*line-height: 35px;*/ /*去掉注释后，legend的标题与按钮同行*/
            color: #000;
        }

            #clickmenu img {
                margin-bottom: 3px;
            }

        #overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #fff;
            opacity: 0;
            filter: alpha(opacity=0);
            display: none;
            z-index: 4;
        }

        #poplayer {
            position: fixed;
            /*top: 25px;
            left: 20px;*/
            width: auto;
            margin: 0;
            display: none;
            z-index: 555;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        th {
            text-align: inherit;
        }

        .sl-shadow {
            -moz-box-shadow: 0 0 4px #999;
            -o-box-shadow: 0 0 4px #999;
            -webkit-box-shadow: 0 0 4px #999;
            box-shadow: 0 0 4px #999;
            -ms-filter: "progid:DXImageTransform.Microsoft.Glow(color=#a0a0a0,strength=0) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=0,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=90,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=180,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=270,strength=2)";
            *filter: progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=0,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=90,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=180,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=270,strength=2)
        }

        .item-sub {
            /*position: absolute;*/
            padding: 12px 3px;
            background: #fff;
            top: 0px;
        }

        .item-table {
            background: none repeat scroll 0 0 #fff;
            white-space: nowrap;
        }

            .item-table td, .item-table th {
                border-right: 1px solid #e7e7e7;
                padding: 3px 16px;
                white-space: nowrap
            }

            .item-table th {
                font-weight: 700;
                padding: 0 14px 3px 17px;
                border-collapse: separate;
                white-space: nowrap
            }

                .item-table th.last, .item-table td.last {
                    border-right: 0
                }

            .item-table a {
                color: #555;
                display: block;
                padding-left: 6px;
                position: relative;
                vertical-align: middle
            }

                .item-table a:hover {
                    background-color: #aaa;
                    border-radius: 2px 2px 2px 2px;
                    color: #fff;
                    text-decoration: none;
                    vertical-align: middle
                }
        /*下拉弹出层样式结束*/

        .menu {
            position: absolute;
            z-index: 101;
            width: 300px;
            border: solid 1px #999;
            padding: 2px;
            background-color: #ffffff;
        }

            .menu label {
                /*display: block;*/
                padding: 3px 6px;
                font-size: 14px;
                color: #000000;
                cursor: default;
                text-decoration: none;
            }

                .menu label:hover {
                    background-color: #507cd1;
                    color: #ffffff;
                    cursor: pointer;
                }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
