<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectInfoPublic.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProjectData.ProjectInfoPublic" MasterPageFile="~/UI/Master/ObjectList.Master" Title="项目公用信息" %>

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
    <span class="filter-block" runat="server" id="spUploadFile">
        <span>
            <a style="color: blue" onclick="return upLoadFile()" id="aUpLoadFile" runat="server">
                <h4>上传《合同》</h4>
            </a>
            <asp:LinkButton runat="server" ID="lbtnCopy" CssClass="subtoolbarlink" OnClick="lbtnUpload_Click" EnableTheming="false" Style="color: blue; display: none">
                <h4>上传《合同》</h4>
            </asp:LinkButton>
        </span>
    </span>
    <span class="filter-block" runat="server" id="spGeneralAndFenfa">
         <span>
            <a style="color: blue" onclick="return upLoadFileAndFenfa()" id="aGeneralAndFenfa" runat="server">
                <h4>上传《<%=ParamFileType %>》文件并分发</h4>
            </a>
        </span>
    </span>
    <span class="filter-block" id="spMbxz" runat="server" visible="false">
        <span>
            <a style="color: blue" onclick="return openDownLoad()" id="aDownLoad">
                <h4>下载模板</h4>
            </a>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <table width="100%">
        <tr>
            <td class="td-m" style="font-size: 16px !important; line-height: 22px">1.项目概况（工程概况、背景等引用到技措、月报等其他文件）<br />
                2.项目详细介绍（引用至说明书等其他文件）<br />
                3.厂址位置及地形地貌（引用至说明书等其他文件）
            </td>
        </tr>
    </table>
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="FileID,OldVersionFileID" AutoGenerateColumns="False"
        AllowPaging="True" AllowSorting="true" ShowExport="true" BindGridViewMethod="BindList" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="下载" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px" Visible="false">
                <ItemTemplate>
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileID") %>"
                        title="下载" style="color: blue">下载</a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>

            <zhongsoft:LightTemplateField HeaderText="文件名称" ItemStyle-Width="80px">
                <ItemTemplate>
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileID") %>"
                        title="下载" style="color: blue" target="_blank"><%# Eval("FileName")%></a>
                    <asp:LinkButton runat="server" ID="lbtn112" OnClientClick='<%# String.Format("return viewFile(\"{0}\",\"view\")",Eval("FileID")) %>'
                        EnableTheming="false" Text='<%# Eval("FileName")%>' Visible="false"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnEditFile" EnableTheming="false" Text="在线编辑" Style="color: blue" Visible="false"
                        OnClientClick='<%# String.Format("return viewFile(\"{0}\",\"edit\")",Eval("FileID")) %>'>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="文件状态" ItemStyle-Width="80px" Visible="false">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiFileID" flag="fileID" value='<%#Eval("FileID") %>' />
                    <asp:Label ID="lbFileState" runat="server" Text='<%#Eval("FileState") %>'></asp:Label>
                    <a id="clickmenu" runat="server" visible="false" flag="clickmenu" fileid='<%#Eval("FileID") %>' style="color: blue">提交流程<img src="<%=WebAppPath %>/Themes/Images/ddl.gif" /></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="文件类型" DataField="FileType" Visible="false">
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
            <zhongsoft:LightTemplateField HeaderText="关联及属性" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnViewFile" EnableTheming="false"
                        OnClientClick='<%# String.Format("return ViewFormInfo(\"{0}\")",Eval("WorkflowBizID")) %>'>
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

    <input type="hidden" runat="server" id="hiTemplateCount" />
    <input type="hidden" runat="server" id="hiTemplateFileType" />
    <%--文件上传的FileSourceID--%>
    <input type="hidden" runat="server" id="hiFileSourceID" />
    <input type="hidden" runat="server" id="hiStartFlow" />
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
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            initOperate();
            initDownLoad();
            document.onmousedown = function () { if (!over) hideMenu(); };
        }

        function initOperate() {
            $('[flag="clickmenu"]').each(function () {
                $(this).bind('click', function (ev) {
                    showMenu(ev);
                });
            })
        }

        function upLoadFile() {
            var businessId = getGuid();
            $('#<%=hiFileSourceID.ClientID%>').val(businessId);
            showUploadFormAndType(businessId, "ProjectFile", null, uploadFileCallBack);
            return false;
        }

        function uploadFileCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnCopy,"") %>
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

        function initDownLoad() {
            var width = 500;
            var height = 300;

            //弹出查询框定位到查询按钮下方
            var pX; var pY;
            try {
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
            } catch (e) {

            }

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

            //window.open(url);

            //window.location.href = url;
            window.open(url, "workspace");
            return false;
        }

        function viewFile(fileId, action) {

            var url = encodeURI("<%=WebAppPath%>/Sys/FileDocument/DocumentViewEdit.aspx?action=" + action + "&type=revised&FileId=" + fileId.toLowerCase());

            window.open(url);
            return false;
        }

        function goTo(pageName) {


            window.parent.goNode($("#<%=hiOrganzationID.ClientID %>").val(), pageName);

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
            } else if (e.parentNode.tagName == "A") {
                parent = e.parentNode.parentNode.parentNode;
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
            menu.style.left = x + 4 + "px";
            menu.style.top = y + "px";
            document.body.appendChild(menu);
            showInit = false;

            $(menu).append($("#<%=rblWorkFlow.ClientID%>").html());

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

        function fileCheckIn() {
            $.ajaxSettings.async = false;
            $.post("ProjectContractFile.aspx",
                { asyfunc: "FileCheckIn", fileid: $("#<%=hiCurFileID.ClientID%>").val() },
                function (res) {

                }
            );
            $.ajaxSettings.async = true;
            $("#<%=hiCurFileID.ClientID%>").val("");
            hideMenu();
            rebindGridData();
        }

        function createReport() {
            var url = buildQueryUrl("/EPMS/List/ProjectData/ProjectMonthlyReportCreate.aspx?actionType=1", { OrganizationID: '<%=OrganizationID %>' });
            showDivDialog(url, null, 800, 500, rebindGridData);
            return false;
        }

        function startWorkFlow(packageName, xpdlID, formId, orgID) {
            <%--var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: packageName, xpdlId: xpdlID, formId: formId, ver: '|', OrganizationId: orgID, FileID: $("#<%=hiCurFileID.ClientID%>").val()
            });--%>

            var url = "/Sys/Workflow/FormDetail.aspx";
            var json = {
                actionType: 2, packageName: packageName, xpdlId: xpdlID, formId: formId, ver: '|', OrganizationId: orgID, FileID: $("#<%=hiCurFileID.ClientID%>").val()
            };

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

        function ViewFormInfo(businessID) {
            var url = buildQueryUrl("EPMS/List/ProjectData/ProjectFileExpandInfo.aspx", { "actionType": 1, BusinessID: businessID });
            showDivDialog(url, null, 1100, 600, null);
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
                        $.post("ProjectInfoPublic.aspx",
                            { asyfunc: "DeleteFileData", fileid: fileID, fileState: '作废' },
                            function (res) {
                                rebindGridData();
                            }
                        );
                    }

                    if (res == "检入") {
                        alert("该文件已检入，不允许删除，若要删除文件，请联系系统管理员！");
                        return false;
                    }
                    else if (res == "流程中") {
                        alert("该文件正在流程中，不允许删除，若要删除文件，请流程发起人先删除流程！");
                        return false;
                    }
                    if (res == "起草") {
                        if (!confirm('确认要作废当前文件吗？')) {
                            return false;
                        }
                        $.post("ProjectInfoPublic.aspx",
                            { asyfunc: "DeleteFileData", fileid: fileID, fileState: res },
                            function (res) {
                                rebindGridData();
                            }
                        );
                    }
                    if (res == "作废") {
                        if (!confirm('确认要删除当前文件吗？')) {
                            return false;
                        }
                        $.post("ProjectInfoPublic.aspx",
                            { asyfunc: "DeleteFileData", fileid: fileID, fileState: res },
                            function (res) {
                                rebindGridData();
                            }
                        );
                    }

                },
                error: function (err) {
                    //alert(err);
                }
            });
        }

        function startReport() {
            var url = buildQueryUrl("/EPMS/List/ProjectData/ProjectWeekReportNotice.aspx?actionType=1", { OrganizationID: '<%=OrganizationID %>', EPMSCatalogID: '<%=EPMSCatalogID %>' });
            showDivDialog(url, null, 800, 500, null);
            return false;
        }

        //上传文件并分发
        function upLoadFileAndFenfa() {
            var businessId = getGuid();
            $('#<%=hiFileSourceID.ClientID%>').val(businessId);
            showUploadFormAndType(businessId, "ProjectFile", '<%=ParamFileType%>', uploadAndFenfaFileCallBack);
            return false;
        }

        //上传文件并分发--执行
        function uploadAndFenfaFileCallBack(re) {
            $('#<%=hiStartFlow.ClientID%>').val('分发');
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnCopy,"") %>;
            $('#<%=hiStartFlow.ClientID%>').val('');
        }

        //发起资料分发流程
        function fenfa() {
            var packageName = $('#<%=hiPackageName.ClientID%>').val();
            var xpdlId = $('#<%=hiXpdlId.ClientID%>').val();
            var formId = $('#<%=hiFormID.ClientID%>').val();

            startWorkFlow(packageName, xpdlId, formId, '<%=OrganizationID%>');
        }

    </script>
    <style type="text/css">
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
