<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XFormEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XFormEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <base target="_self" />
    <title></title>
    <style type="text/css">
        html, body
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
            padding: 0px;
            margin: 0px;
        }
        *
        {
            padding: 0px;
            margin: 0px;
        }
        #templateTabs .ui-widget-header
        {
            background: url(../ui/images/f_tabbg.jpg) repeat-x !important;
        }
    </style>
    <link href="../UI/xform.css" rel="Stylesheet" type="text/css" />
    <link href="../UI/Impromptu.css" rel="Stylesheet" type="text/css" />
</head>
<body class="kpms-selectbody">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%">
        <tr>
            <td align="left" class="f-header">
                <div class="f-logo">
                </div>
                <div class="f-h-right">
                    <asp:LinkButton runat="server" CssClass="kpms-btn" OnClientClick="saveAll();return false;"><img src="../../Themes/Images/btn_save.gif" /><span>保存</span></asp:LinkButton>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="templateTabs" style="height: 100%">
                    <ul>
                        <li><a href='#data' id='adata'>元数据<img src="../ui/images/next.gif" /></a></li>
                        <li><a disabled='true' href='#xpdl' id='axpdl'>流程设计<img src="../ui/images/next.gif" /></a></li>
                        <li><a disabled='true' href='#form' id='aform'>表单设计<img src="../ui/images/next.gif" /></a></li>
                        <li><a disabled='true' href='#view' id='aview'>表单预览
                            <img src="/Portal/Themes/Images/btn_finish.gif" /></a></li>
                    </ul>
                    <div id="data">
                        <div style="width: 100%; text-align: left">
                            <table class="tz-table" style="width: 350px; margin: 0; text-align: left;">
                                <tr>
                                    <td class="td-l">
                                        表单名称<span class="req-star">*</span>
                                    </td>
                                    <td class="td-m">
                                        <asp:TextBox ID="tbFormName" runat="server" CssClass="kpms-textbox" field="FormName"
                                            MaxLength="50" req="1" tablename="WorkflowFormDefinition" activestatus="(23.*)"
                                            Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-l">
                                        表单类型<span class="req-star">*</span>
                                    </td>
                                    <td class="td-m">
                                        <asp:DropDownList ID="ddlFormType" runat="server" field="FormType" tablename="WorkflowFormDefinition"
                                            req="1" activestatus="(23.*)" Width="150px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-l">
                                        表单权限<span class="req-star">*</span>
                                    </td>
                                    <td class="td-m">
                                        <asp:DropDownList runat="server" ID="ddlIsPublic" field="IsPublic" req="1" tablename="WorkflowFormDefinition"
                                            activestatus="(23.*)" Width="150px">
                                            <asp:ListItem Value="True">公用</asp:ListItem>
                                            <asp:ListItem Value="False">私有</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-l">
                                        排序<span class="req-star">*</span>
                                    </td>
                                    <td class="td-m">
                                        <asp:TextBox ID="tbSortIndex" runat="server" CssClass="kpms-textbox" field="SortIndex"
                                            MaxLength="4" req="1" tablename="WorkflowFormDefinition" activestatus="(23.*)"
                                            Style="text-align: right" regex="^\d*$" errMsg="排序只能填写非负整数" Width="50px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="height: 30px; line-height: 30px; width: 115px; padding-top: 4px;">
                            <asp:LinkButton runat="server" ID="btnAddDataSource" OnClientClick="addDataSource();return false;"
                                class="kpms-btn">   <img alt =""  src="../../Themes/Images/btn_add.gif"/><span>新增数据源</span></asp:LinkButton>
                        </div>
                        <table class="tz-table" style="width: 350px; margin: 0; text-align: left;">
                            <tr>
                                <td class="td-m" id="divDataSources">
                                </td>
                            </tr>
                        </table>
                        <div style="height: 30px; line-height: 30px; width: 115px; padding-top: 4px;">
                            <asp:LinkButton runat="server" ID="btnEditObjName" OnClientClick="editObjName();return false;"
                                class="kpms-btn">   <img alt =""  src="../../Themes/Images/btn_edit.gif"/><span>流程主题</span></asp:LinkButton>
                        </div>
                        <table class="tz-table" style="width: 350px; margin: 0; text-align: left;">
                            <tr>
                                <td class="td-l">
                                    流程主题
                                </td>
                                <td class="td-m">
                                    <asp:Label runat="server" ID="lbFormat" Width="250" Style="line-height:20px;white-space:pre-wrap;word-warp: break-word; word-break: break-all;"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">
                                    对应字段
                                </td>
                                <td class="td-m">
                                    <asp:Label runat="server" ID="lbFields" Style="display: none"></asp:Label>
                                    <asp:ListBox ID="boxFields" runat="server" Width="250px" SelectionMode="Multiple"
                                        Rows="6">
                                        <asp:ListItem>1111</asp:ListItem>
                                    </asp:ListBox>
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" id="hiIsXForm" value="True" runat="server" field="IsXForm" tablename="WorkflowFormDefinition" />
                        <input type="hidden" runat="server" id="hiXml" field="XFormAttribute" tablename="WorkflowFormDefinition" />
                        <input type="hidden" runat="server" id="hiIsPublic" value="True" field="IsPublic"
                            tablename="WorkflowFormDefinition" />
                        <input type="hidden" id="hiFormID" runat="server" field="FormID" tablename="WorkflowFormDefinition" />
                        <input type="hidden" id="hiobjectId" runat="server" field="objectId" tablename="WorkflowFormDefinition" />
                        <input type="hidden" id="hiFormURI" value="/Custom/List/XForm.ascx" runat="server" field="FormURI"
                            tablename="WorkflowFormDefinition" />
                        <input type="hidden" runat="server" id="hiEmptyXml" />
                        <input type="hidden" runat="server" id="hiUrl" />
                        <input type="hidden" runat="server" id="hiActionType" />
                        <input type="hidden" runat="server" id="hihrefid" value="adata" />
                    </div>
                    <div id="xpdl" style="height: 90%">
                        <script type="text/javascript" src="/Portal/UI/Script/Silverlight.js"></script>
                        <script type="text/javascript">
                            function onSilverlightError(sender, args) {

                            }

                            var slCtl = null;

                            //加载时调用
                            function pluginLoaded(sender) {
                                slCtl = document.getElementById("sliverlight");
                            }

                            //调用保存Xpdl方法
                            function SaveXpdl() {
                                if (slCtl != null) {
                                    //返回值为错误信息，为空表示保存成功
                                    var message = slCtl.Content.Control.SaveXpdl();
                                }
                                return true;
                            }

                            //调用保存Xpdl方法
                            function SaveWorkflow() {
                                if (slCtl != null) {
                                    //返回值为错误信息，为空表示保存成功
                                    var message = slCtl.Content.Control.SaveWorkflow();

                                    if (message == "1") {
                                        saveAllMessage(message);
                                    }
                                    else if (message == "2") {
                                        saveAllMessage("0");
                                    }
                                }
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
                                <param name="initParams" value="ServiceAddress=http://<%=Request.Url.Authority %><%=WebApplicationPath %>/Sys/SOA/WorkflowService.asmx,Action=<%=(int)ActionType %>,XPDLIDCol=<%=hiobjectId.ClientID%>,PackageNameCol=<%=hiobjectId.ClientID%>" />
                                <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration: none">
                                    <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="获取 Microsoft Silverlight"
                                        style="border-style: none" />
                                </a>
                            </object>
                            <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px;
                                border: 0px"></iframe>
                        </div>
                    </div>
                    <div id="form" style="width: 98%">
                        <script src="../UI/Script/xform.js"></script>
                        <script src="../UI/Script/jquery-impromptu.4.0.js"></script>
                        <table class="tz-table">
                            <tr class="xform-btnbg">
                                <td align='left' colspan="2">
                                    <div class="btnContainer">
                                        <a title="table" type='table' class="drag"><span class="table"></span></a><a type='label'
                                            title="label" class="drag"><span class="label"></span></a><a type='textbox' title="textbox"
                                                class="drag"><span class="textbox"></span></a><a title="checkbox" type='checkbox'
                                                    class="drag"><span class="checkbox"></span></a><a type='radiobutton' title="radiobutton"
                                                        class="drag"><span class="radiobutton"></span></a><a type='dropdownlist' title="dropdownlist"
                                                            class="drag"><span class="dropdownlist"></span></a><a type='hidden' title="hidden"
                                                                class="drag"><span class="hidden"></span></a><a type='selector' title="selector"
                                                                    class="drag"><span class="selector"></span></a><a type='gridview' title="gridview"
                                                                        class="drag"><span class="gridview"></span></a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div id="canvas" runat="server" style="background: #fff; width: 100%; border: #b9cbf1 1px solid;
                            z-index: 1">
                        </div>
                    </div>
                    <div id="view" style="height: 90%">
                        <iframe src="" frameborder="0" id="viewForm" name="viewForm" width="100%" height="100%"
                            scrolling="auto" runat="server"></iframe>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td class="f-footer" align="right" valign="middle">
                <asp:LinkButton runat="server" ID="btnLast" CssClass="kpms-btn" OnClientClick="return false;"
                    Style="display: none"><img src="../ui/images/pre.gif" /><span>上一步</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnNext" CssClass="kpms-btn" OnClientClick="return false;"><span>下一步<img src="../ui/images/next.gif" /></span></asp:LinkButton>
                <a id="btnFinish" class="kpms-btn" onclick="window.close()" style="display: none"><span>
                    完成<img src="/Portal/Themes/Images/btn_finish.gif" /></span></a>
            </td>
        </tr>
    </table>
    <div id="saveSuccess" style="display: none" class="form-save">
        <span>保存成功！</span>
    </div>
    <script>

        var saveData = true;
        var saveForm = true;
        var $hrefid = $("#<%=hihrefid.ClientID %>");
        var $hiXml = $("#<%=hiXml.ClientID %>");
        var formType = "<%=FormType %>";
        var bizId = "<%=BusinessObjectId %>";
        var formId = $("#<%=hiFormID.ClientID %>").val();
        var formViewType = "Web";
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

        function setHeight() {
            var divh = $(window).height() - 80;
            var h = $(window).height() - 160;
            $('#canvas').height(h);
            $('#templateTabs').height(divh);
        }

        function initCustomerPlugin() {
            window.onbeforeunload = function () {
                return "窗口即将关闭，请确认数据已经保存！"; //这里可以放置你想做的操作代码 
            }
            setEnabled();
            //调整页面的高度使其自适应
            var h = $(window).height() - 160;
            $('#canvas').height(h);
            var divh = $(window).height() - 80;
            $('#templateTabs').height(divh);
            setInterval("setHeight()", 500);

            $('.btnContainer').painting($('#canvas'));
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
            $('#templateTabs').tabs({ select: function (event, ui) { return checkTabs(ui); } });
            checkRegex();
            if ($hiXml.val() == "") {
                view.loadXML($("#<%=hiEmptyXml.ClientID %>").val());
            }
            else {
                view.loadXML($hiXml.val());

            }
            $("#canvas").html($(view.selectSingleNode("//CtrlHtml")).text());
            $("#divDataSources").html($(view.selectSingleNode("//DataHtml")).text());
            $("#<%=lbFormat.ClientID %>").text($(view.selectSingleNode("//ObjNameFormat")).text());
            $("#<%=lbFields.ClientID %>").text($(view.selectSingleNode("//ObjNameFields")).text());
            setBoxFieds($("#<%=lbFields.ClientID %>").text());
            initDSClick();
        }

        function setBoxFieds(fields) {

            $("#<%=boxFields.ClientID%> option").remove();
            var texts = fields.split('|');
            for (i = 0; i < texts.length; i++) {
                $("#<%=boxFields.ClientID%>").append("<option>" + texts[i] + "</option>");
            }

        }
        function setEnabled() {
            if ("<%=ActionType%>" == "Update") {
                $('#axpdl').removeAttr("disabled");
                $('#aform').removeAttr("disabled");
                $('#aview').removeAttr("disabled");
            }
        }

        function checkTabs(ui) {
            if (!Save()) {
                return false;
            }
            var newid = ui.tab.id;
            $hrefid.val(newid);
            var btnNext = $('#<%=btnNext.ClientID %>');
            var btnLast = $('#<%=btnLast.ClientID %>');
            var btnFinish = $('#btnFinish');
            if (newid == "adata") {
                btnLast.hide();
                btnNext.show();
                btnFinish.hide();
            }
            else if (newid == "aform" || newid == "axpdl") {
                btnLast.show();
                btnNext.show();
                btnFinish.hide();
            }
            else if (newid = "aview") {
                btnLast.show();
                btnNext.hide();
                btnFinish.show();
                document.getElementById('viewForm').src = "XFormDetail.aspx?actionType=2&packageName=" + bizId + "<%=PackageFlag%>&xpdlId=" + bizId + "&formId="
                     + $("#<%=hiFormID.ClientID %>").val();
            }
            return true;
        }

        function editObjName() {

            var url = "XFormObjNameEditor.aspx?actionType=3&FormPageId=" + bizId + "&FormType=" + formType;
            var stringFeatures = "dialogHeight:250px; dialogWidth:600px;resizable: Yes; scroll:auto; status: no;";
            var re = window.showModalDialog(encodeURI(url), null, stringFeatures);
            if (re != undefined && re != null) {
                hasChange = true;
                var objNameXml = new KPMSXml();
                objNameXml.loadXML(re);
                $("#<%=lbFormat.ClientID %>").text($(objNameXml.selectSingleNode("//Format")).text());
                $("#<%=lbFields.ClientID %>").text($(objNameXml.selectSingleNode("//Fields")).text());
                setBoxFieds($(objNameXml.selectSingleNode("//Fields")).text());
                saveDivData();
            }
        }

        function Save() {
            if (typeof (checkReqField) == 'function') {
                if (!checkReqField()) return false;
            }
            if (typeof (KPMSCheckSubmit) == 'function') {
                if (!KPMSCheckSubmit()) return false;
            }
            if (parent.returnValue == undefined || parent.returnValue == null) {
                parent.returnValue = "isSave";
            }
            return true;
        }

        function saveAll() {
            if (hasChange) {
                getViewXml();
                var formName = $("#<%=tbFormName.ClientID %>").val();
                var formType = $("#<%=ddlFormType.ClientID %>").val();
                var sortIndex = $("#<%=tbSortIndex.ClientID %>").val();
                var isPublic = $("#<%=ddlIsPublic.ClientID %>").val();
                var xFormAttribute = $hiXml.val();
                var actiontype = $("#<%=hiActionType.ClientID %>").val();
                $.post("XFormEditor.aspx",
                    { asyfunc: "SaveDivData", FormName: formName, FormType: formType, SortIndex: sortIndex, IsPublic: isPublic, XFormAttribute: xFormAttribute, objectId: bizId, ActionType: actiontype },
                    function (res) {
                        if (res != "<%=SaveFail %>") {
                            $("#<%=hiActionType.ClientID %>").val("Update");
                            if (res != "") {
                                $("#<%=hiFormID.ClientID %>").val(res);
                                formId = res;
                            }
                            hasChange = false;
                        }
                        else {
                            saveData = false;
                        }
                    })
                $.post("XFormEditor.aspx",
                    { asyfunc: "SaveDivForm", XFormAttribute: xFormAttribute, objectId: bizId },
                    function (res) {
                        if (res != "<%=SaveFail %>") {
                            hasChange = false;
                        }
                        else {
                            saveForm = false;
                        }
                    })
            }
            SaveWorkflow();
        }

        function saveAllMessage(saveXpdl) {
            if (saveForm && saveData && saveXpdl) {
                showSaveMsg("保存成功", 0);
                saveForm = true; saveData = true;
            }
            else {
                var errMessage = "";
                if (!saveData)
                    errMessage += "元数据保存失败;\n";
                if (!saveXpdl)
                    errMessage += "流程设计保存失败;\n";
                if (!saveForm)
                    errMessage += "表单设计保存失败;";

                showSaveMsg(errMessage, 1);
                saveForm = true; saveData = true;
            }
        }

        function KPMSCheckSubmit() {
            var ahref = $hrefid.val();
            if (ahref == "adata") {
                return saveDivData();
            }
            else if (ahref == "aform") {
                return saveDivForm();
            }
            else if (ahref == "axpdl") {
                return SaveXpdl();
            }
            return true;
        }



        function getViewXml() {

            var xmlstr = $("#<%=hiEmptyXml.ClientID %>").val();
            view.loadXML(xmlstr);

            var objectlists = $('#canvas [CtrlType]');
            var datas = $('#divDataSources [CtrlType]');
            $('#canvas span').css('border', '');
            $('#divDataSources span').css('border', '');
            view.createCtrlHtml($('#canvas').html());
            view.createDataHtml($('#divDataSources').html());
            view.createModifyTime();
            view.createObjName($("#<%=lbFormat.ClientID %>").text(), $("#<%=lbFields.ClientID %>").text());
            for (var i = 0; i < objectlists.length; i++) {
                view.createCtrl(objectlists.eq(i));
            }
            for (var i = 0; i < datas.length; i++) {
                view.createDataSource(datas.eq(i));
            }
            $hiXml.val(view.xml());
        }

        function saveDivData() {
            if (hasChange) {
                getViewXml();
                var formName = $("#<%=tbFormName.ClientID %>").val();
                var formType = $("#<%=ddlFormType.ClientID %>").val();
                var sortIndex = $("#<%=tbSortIndex.ClientID %>").val();
                var isPublic = $("#<%=ddlIsPublic.ClientID %>").val();
                var xFormAttribute = $hiXml.val();
                var actiontype = $("#<%=hiActionType.ClientID %>").val();
                $.post("XFormEditor.aspx",
                    { asyfunc: "SaveDivData", FormName: formName, FormType: formType, SortIndex: sortIndex, IsPublic: isPublic, XFormAttribute: xFormAttribute, objectId: bizId, ActionType: actiontype },
                    function (res) {
                        if (res != "<%=SaveFail %>") {
                            $("#<%=hiActionType.ClientID %>").val("Update");
                            if (res != "") {
                                $("#<%=hiFormID.ClientID %>").val(res);
                                formId = res;
                            }
                            hasChange = false;
                            showSaveMsg("元数据自动保存成功", 0);
                        }
                        else {
                            saveData = false;
                            showSaveMsg("元数据保存失败", 1);
                        }
                    })
            }
            return true;
        }

        function saveDivForm() {
            if (hasChange) {
                getViewXml();
                var xFormAttribute = $hiXml.val();
                $.post("XFormEditor.aspx",
                    { asyfunc: "SaveDivForm", XFormAttribute: xFormAttribute, objectId: bizId },
                    function (res) {
                        if (res != "<%=SaveFail %>") {
                            hasChange = false;
                            showSaveMsg("表单自动保存成功", 0);
                        }
                        else {
                            saveForm = false;
                            showSaveMsg("表单保存失败", 1);
                        }
                    })
            } return true;
        }
        $("#<%=tbSortIndex.ClientID %>").live("blur", function () { hasChange = true; });
        $("#<%=tbFormName.ClientID %>").live("blur", function () { hasChange = true; });
        $("#<%=ddlFormType.ClientID %>").live("change", function () { hasChange = true; });
        $("#<%=ddlIsPublic.ClientID %>").live("change", function () { hasChange = true; });
    </script>
    </form>
</body>
</html>
