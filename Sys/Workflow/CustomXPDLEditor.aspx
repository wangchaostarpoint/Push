<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomXPDLEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.CustomXPDLEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>表单设计</title>
    <link href="../../Custom/UI/Impromptu.css" rel="stylesheet" type="text/css" />
    <link href="../../Custom/UI/xform.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td>
                <div id="templateTabs" style="height: 100%;">
                    <ul>
                        <li index="adata"><a href='#data' id='adata'>流程定义<img src="../../Custom/ui/images/next.gif" /></a></li>
                        <li index="axpdl"><a disabled='true' href='#xpdl' id='axpdl'>流程设计<img src="../../Custom/ui/images/next.gif" /></a></li>
                        <li index="asource"><a disabled='true' href='#souce' id='asource'>元数据
                            <img src="../../Custom/ui/images/next.gif" /></a></li>
                        <li index="aconfig"><a disabled='true' href='#config' id='aconfig'>相关配置<img src="../../Custom/ui/images/next.gif" /></a></li>
                        <li index="aform"><a disabled='true' href='#form' id='aform'>表单设计<img src="../../Themes/Images/btn_finish.gif" /></a></li>
                    </ul>
                    <div id="data">
                        <div style="width: 1100px; text-align: left">
                            <table class="tz-table">
                                <tr>
                                    <td valign="top" style="width: 500px">
                                        <table class="tz-table">
                                            <tr>
                                                <td class="td-l">
                                                    表单编号<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <zhongsoft:LightTextBox ID="tbFormCode" runat="server" CssClass="kpms-textbox" field="FormCode"
                                                        DataType="EnNumStr" MaxLength="50" req="1" tablename="WorkflowFormDefinition"
                                                        activestatus="(23.*)"></zhongsoft:LightTextBox>
                                                    <input type="hidden" runat="server" id="hiFormCode" field="FormCode" tablename="WorkflowFormDefinition" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    表单名称<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:TextBox ID="tbFormName" runat="server" CssClass="kpms-textbox" field="FormName"
                                                        MaxLength="50" req="1" tablename="WorkflowFormDefinition" activestatus="(23.*)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    包名称<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:TextBox ID="tbPackageName" runat="server" CssClass="kpms-textbox" field="PackageName"
                                                        MaxLength="50" req="1" tablename="WorkflowFormDefinition" activestatus="(23.*)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    XPDLID<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:TextBox ID="tbXPDLID" runat="server" CssClass="kpms-textbox" field="XPDLID"
                                                        MaxLength="50" req="1" tablename="WorkflowFormDefinition" activestatus="(23.*)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    表单模块<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:DropDownList ID="ddlFormType" runat="server" field="ModuleId" tablename="WorkflowFormDefinition"
                                                        req="1" activestatus="(23.*)">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    自定义表单<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:DropDownList ID="ddlIsXForm" runat="server" field="IsXForm" tablename="WorkflowFormDefinition"
                                                        req="1" activestatus="(23.*)">
                                                        <asp:ListItem Value="0">定制表单</asp:ListItem>
                                                        <asp:ListItem Value="1">自定义表单</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trHorizontalScope">
                                                <td class="td-l">
                                                    表单分类
                                                </td>
                                                <td class="td-m">
                                                    <zhongsoft:LightObjectSelector runat="server" ID="lbsScope" PageUrl="~/Sys/Workflow/ScopeSelector.aspx"
                                                        ResultAttr="name" ResultForControls="{hiScopeIds:'id'}" IsMutiple="true" TextBoxMode="MultiLine"
                                                        CssClass="kpms-textarea" EnableTheming="false" BeforeSelect="beforeSel();" Writeable="true"
                                                        activestatus="(23.*)" />
                                                    <input type="hidden" id="hiScopeIds" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    表单URL<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:TextBox ID="tbFormURI" runat="server" CssClass="kpms-textbox" field="FormURI"
                                                        MaxLength="100" req="1" tablename="WorkflowFormDefinition" activestatus="(23.*)"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    排序<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:TextBox ID="tbSortIndex" runat="server" CssClass="kpms-textbox" field="Sort"
                                                        MaxLength="4" req="1" tablename="WorkflowFormDefinition" activestatus="(23.*)"
                                                        Style="text-align: right" regex="^\d*$" errMsg="排序只能填写非负整数"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    表单权限<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:DropDownList runat="server" ID="ddlIsPublic" field="IsPublic" req="1" tablename="WorkflowFormDefinition"
                                                        activestatus="(23.*)">
                                                        <asp:ListItem Value="1">公用</asp:ListItem>
                                                        <asp:ListItem Value="0">私有</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    移动端权限等级<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:DropDownList runat="server" ID="ddlAppAcl" req="1" tablename="WorkflowFormDefinition"
                                                        field="AppAcl" activestatus="(23.*)">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td-l">
                                                    启动方式<span class="req-star">*</span>
                                                </td>
                                                <td class="td-m">
                                                    <asp:DropDownList runat="server" ID="ddlStartMode" req="1" tablename="WorkflowFormDefinition"
                                                        field="StartMode" activestatus="(23.*)">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td valign="top" style="width: 600px; min-height: 400px">
                                        <div style="text-align: center">
                                            同编号表单</div>
                                        <div style="width: 100%; height: 100%; min-height: 400px">
                                            <iframe name="codeFormFrame" frameborder="0" id="codeFormFrame" width="100%" height="400px"
                                                scrolling="auto"></iframe>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" id="hiobjectId" runat="server" />
                            <input type="hidden" id="hiFormID" runat="server" field="FormID" tablename="WorkflowFormDefinition" />
                        </div>
                    </div>
                    <div id="xpdl" style="height: 90%">
                        <script type="text/javascript" src="<%=WebAppPath %>/UI/Script/Silverlight.js"></script>
                        <script type="text/javascript">
                            function onSilverlightError(sender, args) {

                            }

                            var $silverCtrl = null;

                            //加载时调用
                            function pluginLoaded(sender) {
                                $silverCtrl = document.getElementById("sliverlight");
                                $silverCtrl.Content.Control.SetParamValue("wfformid", $("#<%=hiobjectId.ClientID %>").val());
                            }

                            //调用保存Xpdl方法
                            function saveXPDL() {
                                if ($silverCtrl != null) {
                                    //返回值为错误信息，为空表示保存成功
                                    var msg = $silverCtrl.Content.Control.SaveXPDL();
                                }
                                return true;
                            }
                            function setPackageName() {
                                if ($silverCtrl != null) {
                                    $silverCtrl.Content.Control.SetPackageName();
                                }
                            }
                            function showParticipantCfg(pkgName, xpdlId, partId) {
                                var url = buildQueryUrl("sys/Workflow/partCfg.aspx", { PackageName: pkgName, XPDLID: xpdlId, partId: partId });
                                showModal(encodeURI(url), null, 650, 450);
                            }
                        </script>
                        <div id="silverlightControlHost" style="height: 100%">
                            <object data="data:application/x-silverlight-2," id="sliverlight" type="application/x-silverlight-2"
                                width="100%" height="100%">
                                <param name="source" value="/Portal/Sys/ClientBin/ZhongsoftXPDLOnline.xap" />
                                <param name="onError" value="onSilverlightError" />
                                <param name="onload" value="pluginLoaded" />
                                <param name="background" value="white" />
                                <param name="minRuntimeVersion" value="5.0.61118.0" />
                                <param name="autoUpgrade" value="true" />
                                <param name="enableGPUAcceleration" value="true" />
                                <param name="windowless" value="false" />
                                <param name="initParams" value="ServiceAddress=http://<%=Request.Url.Authority %>/Portal/Sys/SOA/WorkflowService.asmx,Action=<%=(int)ActionType %>,XPDLIdVar=<%=tbXPDLID.ClientID%>,PackageNameVar=<%=tbPackageName.ClientID%>" />
                                <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration: none">
                                    <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="获取 Microsoft Silverlight"
                                        style="border-style: none" />
                                </a>
                            </object>
                            <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px;
                                border: 0px"></iframe>
                        </div>
                    </div>
                    <div id="souce" style="height: 90%; width: 600px">
                        <div style="width: 100%; height: 100%;">
                            <iframe name="sourceFrame" frameborder="0" id="sourceFrame" width="100%" height="100%"
                                scrolling="auto"></iframe>
                        </div>
                    </div>
                    <div id="config" style="height: 90%">
                        <div id="configTabs" style="height: 90%">
                            <ul>
                                <li><a href='#rule'>规则映射</a></li>
                                <li><a href='#trigger'>触发器</a></li>
                            </ul>
                            <div id="rule" style="height: 100%">
                                <iframe name="ruleFrame" frameborder="0" id="ruleFrame" width="100%" height="100%"
                                    scrolling="auto"></iframe>
                            </div>
                            <div id="trigger" style="height: 100%">
                                <iframe name="triggerFrame" frameborder="0" id="triggerFrame" width="100%" height="100%"
                                    scrolling="auto"></iframe>
                            </div>
                        </div>
                    </div>
                    <div id="form" style="height: 90%; width: 600px">
                        <iframe name="viewFrame" frameborder="0" id="viewFrame" width="100%" height="100%"
                            scrolling="auto"></iframe>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td class="f-footer" align="right" valign="middle" style="padding-right: 10px">
                <asp:LinkButton runat="server" ID="btnLast" CssClass="kpms-btn" OnClientClick="return false;"
                    Style="display: none"><img src="../../Custom/ui/images/pre.gif" /><span>上一步</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnNext" CssClass="kpms-btn" OnClientClick="return false;"><span>下一步<img src="../../Custom/ui/images/next.gif" /></span></asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="kpms-btn" OnClientClick="saveAll();return false;">
                    <img src="../../Themes/Images/btn_save.gif" /><span>保存</span></asp:LinkButton>
                <a id="btnFinish" class="btn-link" onclick="closeWindow()" style="display: none"><span>
                    <img src="../../Themes/Images/btn_finish.gif" />完成</span></a> <a id="btnPublish"
                        class="btn-link" onclick="publish();" style="display: none"><span>
                            <img src="../../Themes/Images/btn_finish.gif" />发布</span></a>
            </td>
        </tr>
    </table>
    <div id="saveSuccess" style="display: none" class="form-save">
        <span>保存成功！</span>
    </div>
    <input type="hidden" runat="server" id="hihrefid" value="adata" />
    </form>
    <script>
        var hasChange = false;
        var $hrefid = $("#<%=hihrefid.ClientID %>");
        function initCustomerPlugin() {
            window.onbeforeunload = function () {
                return "窗口即将关闭，请确认数据已经保存！";
            }
            setEnabled();
            //调整页面的高度使其自适应
            var h = $(window).height() - 160;
            var divh = $(window).height() - 80;
            $('#templateTabs').height(divh);

            $('#<%=btnNext.ClientID %>').click(function () {
                var ahref = $('#templateTabs').find('div:visible').next().attr('id');
                $('#templateTabs').find('a').each(function () {
                    if ($(this).attr('href') == ('#' + ahref)) {
                        $(this).trigger('click');
                        $(this).removeAttr('disabled');
                    }
                })
            })

            $('#<%=btnLast.ClientID %>').click(function () {
                var ahref = $('#templateTabs').find('div:visible').prev().attr('id');
                $('#templateTabs').find('a').each(function () {
                    if ($(this).attr('href') == ('#' + ahref)) {
                        $(this).trigger('click');
                        $(this).removeAttr('disabled');
                    }
                })
            })
            $('#configTabs').tabs();
            $('#templateTabs').tabs(
            {
                activate: function (event, ui) { },
                beforeActivate: function (event, ui) { return checkTabs(ui); }
            });
            checkRegex();
            if ($("#<%=ddlIsXForm.ClientID %>").val() == "1") {
                $tbFormURI.attr("ReadOnly", "true");
                $tbFormURI.css("background", "#eef8fc");
            }
            else {
                $tbFormURI.removeAttr("ReadOnly", "true");
                $tbFormURI.css("background", "");
            }
            loadCodeForm();
        }

        function loadCodeForm() {
            var url = buildQueryUrl("Sys/Workflow/CodeFormManager.aspx", { FormCode: $("#<%=tbFormCode.ClientID %>").val(), ObjectId: $("#<%=hiobjectId.ClientID %>").val() })
            document.getElementById('codeFormFrame').src = url;
        }


        function setHeight() {
            var divh = $(window).height() - 80;
            var h = $(window).height() - 160;
            $('#templateTabs').height(divh);
        }

        function setEnabled() {
            if ("<%=ActionType%>" == "Update") {
                $('#axpdl').removeAttr("disabled");
                $('#asource').removeAttr("disabled");
                $('#aconfig').removeAttr("disabled");
                $('#aform').removeAttr("disabled");
            }
        }

        function checkTabs(ui) {
            if (!beforeSave()) {
                return false;
            }
            var newid = $(ui.newTab).attr("index");
            $hrefid.val(newid);
            var btnNext = $('#<%=btnNext.ClientID %>');
            var btnLast = $('#<%=btnLast.ClientID %>');
            var btnFinish = $('#btnFinish');
            var btnPublish = $('#btnPublish');
            if (newid == "asource") {
                if (document.getElementById('sourceFrame').src == "") {
                    var url = buildQueryUrl("BDM/List/XDataSourceList.aspx", { FormType: "<%=FormType %>", ObjectId: $("#<%=hiobjectId.ClientID %>").val() })
                    document.getElementById('sourceFrame').src = url;
                }
            }
            if (newid == "aform") {
                if (document.getElementById('viewFrame').src == "") {
                    var url = buildQueryUrl("Custom/List/XFormViewList.aspx", { FormType: "<%=FormType %>", ObjectId: $("#<%=hiobjectId.ClientID %>").val() })
                    document.getElementById('viewFrame').src = url;
                }
            }

            if (newid == "aconfig") {
                if (document.getElementById('ruleFrame').src == "") {
                    var url = buildQueryUrl("sys/Workflow/FormRuleMapping.aspx", { PackageName: $("#<%=tbPackageName.ClientID %>").val(), XPDLID: $("#<%=tbXPDLID.ClientID %>").val() })
                    document.getElementById('ruleFrame').src = url;
                }
                if (document.getElementById('triggerFrame').src == "") {
                    var url = buildQueryUrl("/sys/workflow/TriggerMgr.aspx", { sourceType: "0", sourceId: $("#<%=hiobjectId.ClientID %>").val() })
                    document.getElementById('triggerFrame').src = url;
                }
            }

            if (newid == "adata") {
                btnLast.hide();
                btnNext.show();
                btnFinish.hide();
                btnPublish.hide();
            }
            else if (newid == "aform") {
                //setPackageName();
                btnLast.show();
                btnNext.hide();
                btnFinish.show();
                btnPublish.show();
            } else {
                btnLast.show();
                btnNext.show();
                btnFinish.hide();
                btnPublish.hide();
            }
            return true;
        }

        function publish() {
            var objectId = $("#<%=hiobjectId.ClientID %>").val();
            $.ajax({
                type: "POST",
                url: 'CustomXPDLEditor.aspx',
                data: { asyfunc: "Publish", objectId: objectId }
            })
            if (parent.returnValue == undefined || parent.returnValue == null) {
                parent.returnValue = "isSave";
            }
            closeWindow();
        }

        function showSaveMsg(message, i) {
            if (i == "0") {
                $('#saveSuccess').css('background', '#ffe156');
            }
            else {
                $('#saveSuccess').css({ background: '#e94545', color: '#fff' });
            }
            $('#saveSuccess').css({ left: ($(window).width() - $('#saveSuccess').width()) / 2 });
            $('#saveSuccess span').html(message);
            $('#saveSuccess').animate({ opacity: 'show' }, 500).animate({ opacity: 1 }, 700).animate({ opacity: 'hide' }, 500);

        }

        function saveFormData() {
            var ahref = $hrefid.val();
            if (ahref == "adata") {
                return saveBasicData();
            }
            if (ahref == "axpdl") {
                return saveXPDL();
            }
            return true;
        }

        function beforeSave() {
            if (typeof (checkReqField) == 'function') {
                if (!checkReqField()) return false;
            }
            if (typeof (saveFormData) == 'function') {
                if (!saveFormData()) return false;
            }
            if (parent.returnValue == undefined || parent.returnValue == null) {
                parent.returnValue = "isSave";
            }
            return true;
        }

        function saveAll() {
            if (typeof (checkReqField) == 'function') {
                if (!checkReqField()) return false;
            }
            saveBasicData();
            saveXPDL();

            return false;
        }

        function showTrigger(sourceId, bizId, param, type) {
            var actType = 3;
            if (bizId == null || bizId == "") {
                actType = 2;
            }
            var url = buildQueryUrl("Sys/Workflow/TriggerEditor.aspx",
            {
                sourceId: sourceId,
                actionType: actType,
                bizId: bizId,
                triggerType: type,
                param: param
            });
            showModal(url, null, 800, 500, null);
        }

        function showRuleMapping(mapId, tagName, xpdlId, actId, partId, tranId) {
            var ruleType = "";
            var actType = 3;
            if (mapId == null || mapId == "") {
                actType = 2;
                mapId = ""; //保证数据为空，去除null
            }

            if (tagName == "WorkflowProcess")
                ruleType = "WorkflowEvent";
            else if (tagName == "Transition") {
                ruleType = "TransitionEvent";
            }
            else if (tagName == "Activity") {
                ruleType = "ActivityEvent";
            }
            else if (tagName == "Participant") {
                ruleType = "ParticipantEvent";
            }
            var url = buildQueryUrl("Sys/workflow/FormRuleMappingEditor.aspx",
            {
                bizId: mapId,
                actiontype: actType,
                packagename: $("#<%=tbPackageName.ClientID %>").val(),
                xpdlid: $("#<%=tbXPDLID.ClientID %>").val(),
                actId: actId,
                partId: partId,
                tranId: tranId,
                ruleType: ruleType
            });
            showModal(url, null, 800, 500, null);
        }

        function saveBasicData() {

            if (hasChange) {
                var formName = $("#<%=tbFormName.ClientID %>").val();
                var formCode = $("#<%=tbFormCode.ClientID %>").val();
                var packageName = $("#<%=tbPackageName.ClientID %>").val();
                var xpdlID = $("#<%=tbXPDLID.ClientID %>").val();
                var formType = $("#<%=ddlFormType.ClientID %>").find("option:selected").text();
                var moduleId = $("#<%=ddlFormType.ClientID %>").val();
                var formURI = $("#<%=tbFormURI.ClientID %>").val();
                var isXForm = $("#<%=ddlIsXForm.ClientID %>").val();
                var sortIndex = $("#<%=tbSortIndex.ClientID %>").val();
                var isPublic = $("#<%=ddlIsPublic.ClientID %>").val();
                var objectId = $("#<%=hiobjectId.ClientID %>").val();
                var scopeIds = $("#<%=hiScopeIds.ClientID %>").val();
                var appAcl = $("#<%=ddlAppAcl.ClientID %>").val();
                var startMode = $("#<%=ddlStartMode.ClientID %>").val();
                $.ajax({
                    url: 'CustomXPDLEditor.aspx',
                    data: { asyfunc: "SaveDivData",
                        FormName: formName,
                        FormCode: formCode,
                        PackageName: packageName,
                        XPDLID: xpdlID,
                        FormType: formType,
                        FormURI: formURI,
                        SortIndex: sortIndex,
                        IsPublic: isPublic,
                        objectId: objectId,
                        IsXForm: isXForm,
                        ModuleId: moduleId,
                        scopeIds: scopeIds,
                        AppAcl: appAcl,
                        StartMode: startMode
                    },
                    type: "POST",
                    success: function (res) {
                        if (res == "") {
                            if ($("#<%=tbFormCode.ClientID %>") != $("#<%=hiFormCode.ClientID %>").val()) {
                                $("#<%=hiFormCode.ClientID %>").val($("#<%=tbFormCode.ClientID %>"));
                                loadCodeForm();
                            }
                            hasChange = false;
                            showSaveMsg("流程定义保存成功。", 0);
                        }
                        else {
                            showSaveMsg("流程定义保存失败。", 1);
                        }
                    }
                });
            }
            return true;
        }

        $("#<%=tbFormCode.ClientID %>").live("blur", function () {
            hasChange = true;
        });

        $("#<%=tbFormName.ClientID %>").live("blur", function () { hasChange = true; });
        $("#<%=tbPackageName.ClientID %>").live("blur", function () { hasChange = true; });
        $("#<%=tbXPDLID.ClientID %>").live("blur", function () { hasChange = true; });
        $("#<%=ddlFormType.ClientID %>").live("change", function () { hasChange = true; });
        $("#<%=tbFormURI.ClientID %>").live("blur", function () { hasChange = true; });
        $("#<%=tbSortIndex.ClientID %>").live("blur", function () { hasChange = true; });
        $("#<%=ddlIsPublic.ClientID %>").live("change", function () { hasChange = true; });
        $("#<%=ddlAppAcl.ClientID %>").live("change", function () { hasChange = true; });
        $("#<%=ddlStartMode.ClientID %>").live("change", function () { hasChange = true; });
        $tbFormURI = $("#<%=tbFormURI.ClientID %>");
        $("#<%=ddlIsXForm.ClientID %>").live("change", function () {
            hasChange = true;
            if ($(this).val() == "1") {
                $tbFormURI.val("<%=XFormUrl%>");
                $tbFormURI.attr("ReadOnly", "true");
                $tbFormURI.css("background", "#eef8fc");
            }
            else {
                $tbFormURI.val("");
                $tbFormURI.removeAttr("ReadOnly", "true");
                $tbFormURI.css("background", "");
            }

        });
        function beforeSel() {
            hasChange = true;
            return true;
        }
    </script>
</body>
</html>
