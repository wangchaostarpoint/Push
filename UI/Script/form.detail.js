if (window.screen) {
    var myw = screen.availWidth;
    var myh = screen.availHeight;
    window.moveTo(0, 0);
    window.resizeTo(myw, myh);
}
var $IsAttention = null; //关注、收藏,"false:未关注","true:已关注"
function initFormPlugin() {
    try {
        window.onbeforeunload = function (e) {
            var ev = e || this.event;
            if (ev.clientY) {
                var n = window.event.screenX - window.screenLeft;
                var b = n > document.documentElement.scrollWidth - 50;
                if (b && ev.clientY < 0 || window.event.altKey)
                    return "页面要关闭或刷新，您确定保存数据了吗？";
            }
        }
    } catch (e) { }
    initSenderUI();

    if (typeof (setImageSignCache) == 'function') { setImageSignCache(); }
    if (typeof (setESignProtect) == 'function') { setESignProtect(); }

    $(window).resize(function () {
        initSenderUI();
        checkScrCookie();
    });
    $doneGetWorkTracking = false;
    $isMenuLoaded = false;
    $('#form-loading').dialog({
        autoOpen: false,
        modal: true
    });
    $('a.ui-dialog-titlebar-close').hide();
    $('.ui-dialog-titlebar').hide();
    if (typeof (initFormToolbarHref) == 'function') { initFormToolbarHref(); }
    if (typeof (initOpinion) == 'function') { initOpinion(); }
    if (typeof (initFormOpinion) == 'function') { initFormOpinion(); }
    //    initOpinion();
    bindBtnScr();
    checkScrCookie();
    initPartsMore();
    $onHandleData = false;
    $formAction = -1;
    freezeToolBar();
    window.onscroll = function () {
        freezeToolBar();
    };

    initAttention();
}

//固定顶部工具条
function freezeToolBar() {
    $(".kpms-ppwindow").css("top", (document.documentElement.scrollTop + 133) + "px");
    $(".kpms-ppwindow").css("right", -(document.documentElement.scrollLeft) + "px");
    var numTop = $(this).scrollTop()
    if (numTop > 66) {
        $('.form-tabs').css({ position: 'fixed', top: 0 })
    } else {
        $('.form-tabs').css({ position: 'inherit', top: 0 })
    }
}

function initSenderUI() {
    $('#backActivity').width($('.form-container').width()).height($('.form-container').height()).position({
        of: $('.form-container'),
        my: 'center' + ' ' + 'top',
        at: 'center' + ' ' + 'top'
    });
    $('#xpdlSender').css({
        position: 'absolute',
        left: ($(window).width() - $('#xpdlSender').outerWidth()) / 2,
        top: ($(window).height() - $('#xpdlSender').outerHeight()) / 2 + $(window).scrollTop()
    }).draggable({ handle: ".xpdl-sendtitle" });
}

//发送、回退按钮悬浮显示下一步骤信息
function initNextActs() {
    $('#FormToolBar_LinkSend').attr('title', '后续步骤：\n' + (sendActs != '' ? sendActs : '无'));
    $('#FormToolBar_LinkBack').attr('title', '后续步骤：\n' + (backActs != '' ? backActs : '无'));
}

var signAlert = false; var $opiAlert = false;
var $formAction = -1; //0:发送 1:回退 2:保存 3:转交 -1:null
function sendForm() {
    $formAction = 0;
    //调整发送验证必填、业务判断的顺序，先把基础信息填写完成后，再进行业务验证更加合理 tianhl 20181120
    if (!checkReqField()) {//validator
        //必填项未填写完整，进行提示 tianhl 20140729
        //        alert("请检查页面必填项是否填写完全。");
        return false;
    }

    if (typeof (checkForm) == 'function') {
        if (!checkForm()) return false;
    }

    //控制是否签名
    //if (!signAlert && doESign == "false") {
    //signAlert = true;第二次不需要签名直接发送
    //    alert("您没有【签名】，请【签名】后再处理！");
    //    return false;
    //}
    //控制填写意见
    //if ($("#" + $opiObjId).val() == "" && !$opiAlert) {
    //    alert("提示：请填写处理意见，再处理流程！");
    //$opiAlert = true;第二次弹出后可以发送
    //    $("#" + $opiObjId).focus();
    //    return false;
    //}

    return true;
}
var $onHandleData = false;
function saveForm() {
    $formAction = 2;
    if (typeof (checkForm) == 'function') {
        if (!checkForm()) return false;
    }
    //    if (!checkReqField()) {
    //        //必填项未填写完整，进行提示 tianhl 20140729
    //        //        alert("请检查页面必填项是否填写完全。");
    //        return false;
    //    }
    if ($onHandleData) return false;
    $onHandleData = true;
    return true;
}
function backForm() {
    $formAction = 1;
    if (typeof (checkForm) == 'function') {
        if (!checkForm()) return false;
    }
    //回退控制是否签名
    if (doESign == "false") {
        alert("您没有【签名】，请【签名】后再处理！");
        return false;
    }
    //控制填写意见
    //校审流程回退不需要填写意见（已有校审意见）
    if ($("#" + $opiObjId).val() == "" && !$opiAlert && $formCtx.formId != '521') {
        alert("提示：需修改的情况，请填写处理意见！");
        //$opiAlert = true; 第二次弹出后可以发送
        $("#" + $opiObjId).focus();
        return false;
    }
    return true;
}
function printForm() {
    if (typeof (beforePrint) == "function") {
        if (!beforePrint())
            return false;
    }
    window.open(buildQueryUrl("Sys/Workflow/PrintPage.aspx", { actInstId: $formCtx.actInstId, prcInstId: $formCtx.prcInstId }));
}

//关注/收藏 add zhaoxm 20150402
function initAttention() {
    if ($bizCtx.action != 2) {
        if ($IsAttention == null) {
            WorkflowAttention("isattention");
        }
        //为按钮添加文本、click事件
        if ("true" == $IsAttention.toLowerCase()) {
            $("#attention").text("取消关注");
            $("#attention").bind("click", function () {
                WorkflowAttention("cancel")
            });
        }
        else {
            $("#attention").text("加关注");
            $("#attention").bind("click", function () {
                WorkflowAttention("add")
            });
        }
    }
    else {
        $("#attention").hide();
    }
}
function WorkflowAttention(type) {
    $.ajax({
        type: "POST",
        url: buildQueryUrl("Sys/Handler/WorkflowAttentionHandler.ashx", null),
        data: { prcInstId: $formCtx.prcInstId, userId: $appCtx.userId, type: type },
        async: false,
        success: function (result) {
            if ("isattention" == type.toLowerCase()) {
                $IsAttention = result;
            }
            else {
                var $type;
                if ("add" == type) {
                    $type = "cancel";
                    $("#attention").text("取消关注");
                    $IsAttention = "true";
                }
                else {
                    $type = "add";
                    $("#attention").text("加关注");
                    $IsAttention = "false";
                }
                //为按钮添加文本、click事件
                $('#attention').unbind("click");
                $("#attention").bind("click", function () {
                    WorkflowAttention($type)
                });
                alert(result);
            }
        }
    });
    return false;
}
function showWfVisual() {//WorkTracking.aspx
    window.open(buildQueryUrl("Sys/Workflow/WorkflowVisual.aspx", { pName: $formCtx.packName, pId: $formCtx.xpdlId, prcInstId: $formCtx.prcInstId, actInstId: $formCtx.actInstId, actName: escape($formCtx.actName) }));
}

function openWorkTracking() {
    window.open(buildQueryUrl("Sys/Workflow/WorkTracking.aspx", { pName: $formCtx.packName, pId: $formCtx.xpdlId, prcInstId: $formCtx.prcInstId, actInstId: $formCtx.actInstId, actName: encodeURI($formCtx.actName), bizId: $bizCtx.bizId, formid: $formCtx.formId }));
}

function showFormWorkflow() {
    var frameWorkflow = $("#frameWorkflow");
    if (frameWorkflow[0].src == "") {
        var url = buildQueryUrl("Sys/Workflow/FormWorkflowPage.aspx", { pName: $formCtx.packName, pId: $formCtx.xpdlId, prcInstId: $formCtx.prcInstId, actInstId: $formCtx.actInstId, actName: escape($formCtx.actName), bizId: $bizCtx.bizId, formid: $formCtx.formId });
        frameWorkflow[0].src = url;
    }
    openDetail('formWorkflow');
    var offset = frameWorkflow.offset().top + frameWorkflow.height();
    $("html,body").animate({ scrollTop: offset }, 1000);
}

function selUserToForward() {
    var param = new InputParamObject("m");
    buildDivSelectorNoAutoClose("", param, null, buildQueryUrl("Sys/Workflow/FormForward.aspx", { prcInstId: $formCtx.prcInstId, actInstId: $formCtx.actInstId }), 730, 620);
    //buildSelector("temp", param, null, buildQueryUrl("Sys/Workflow/FormForward.aspx", { prcInstId: $formCtx.prcInstId, actInstId: $formCtx.actInstId }), 730, 620);
    return false;
}
//补签传阅
function showExtendForwardForm() {
    var param = new InputParamObject("m");
    buildSelector("temp", param, null, buildQueryUrl("Sys/Workflow/FormForward.aspx", { prcInstId: $formCtx.prcInstId, actInstId: $formCtx.actInstId, extendId: $extendId }), 730, 620);
    return false;
}
function getHelp() {
    var url = "../../help/Form/" + $formId + "/" + $formId + ".html";
    window.open(url);
    return false;
}
var $doneGetWorkTracking = false;
function getWorkTracking() {
    if ($doneGetWorkTracking) return;
    $.ajax({
        type: "POST",
        url: "WorkflowTrackingHandler.ashx",
        data: "exeflow=1&prcInstId=" + $formCtx.prcInstId + "&actInstId=" + $formCtx.actInstId + "&userId=" + $appCtx.userId,
        cache: true,
        async: false,
        success: function (html) {
            $("#AsyncTracking").append(html);
            $doneGetWorkTracking = true;
        }
    });
}
//重新获取流程跟踪数据
function reAsyncWorkTracking() {
    $doneGetWorkTracking = false;
    $("#AsyncTracking").html("");
    getWorkTracking();
    for (var i = 0; i < $hisSubActs.length; i++) {
        $("#TrackingView").find("[id='btnSub" + $hisSubActs[i] + "']").click();
    }
}

var $formSending = false;
//add by xuning 判断是否点击的传阅页面的发送按钮
var $formReading = false;
var $sendErr = 0;
function beginFormRequest(sender, args) {
    $('#form-loading').dialog({ height: 120, width: 270, resizable: false });
    var b = args.get_postBackElement().id
    if (b == "FormToolBar_LinkSave" || b == "FormToolBar_LinkSend")
        $('#form-loading').dialog('open');
    if (b == $sendBtnId || b == $readBtnId) { $formSending = true; $sendErr = 0; }
    else $formSending = false;
    if (b == $readBtnId) { $formReading = true; $sendErr = 0; }
    else $formReading = false;
}
function endFormRequest(sender, args) {
    $('#form-loading').dialog('close');
    if (($formSending || $formSending) && $sendErr == 0) {
        try {
            //传阅台账刷新
            window.opener.location = window.opener.location;
        } catch (e) {
            //项目站点回到原来打开的节点
            //window.parent.goSelectNode();
        }

        formFeedback();
    }
}

function formFeedback() {
    if (typeof ($msgFeedback) != "undefined") {
        $("#formContainer").remove();
        var msg = "";
        var actLen = 0;

        for (act in $msgFeedback) {
            if ($msgFeedback[act].length == 0) continue;
            msg += "[" + act + "] " + $msgFeedback[act] + "\n";
            actLen++;
        }
        if (actLen > 0) {
            //注释by xiedx 20160115 发送后不提示
            //if (msg != "")
            //    alert("已发给如下人员:\n" + msg);
            showFormMsg("已发给如下人员:<br/>" + msg, true);
        }
        else {//结束
            closeWindow();
        }
    }
    else { closeWindow(); }
}
function showFormMsg(msg, close) {
    $("#formMessage").dialog({
        resizable: false,
        autoOpen: true,
        minHeight: 100,
        minWidth: 400,
        modal: true,
        buttons: {
            "确定": function () {
                if (close) $(this).dialog("close");
            }
        },
        close: function (event, ui) { if (close) closeWindow(); }
    });
    $("#formMessage").html(msg);
}
function formCallback(funcName, jsonParam) {
    var sys = { asyfunc: funcName, formuri: $formUri };
    var json = $.extend({}, sys, jsonParam);
    var result = null;
    $.ajax({
        type: "POST",
        async: false,
        url: "FormDetail.aspx",
        data: json
    }).done(function (msg) {
        result = msg;
    });
    return result;
}
//追加流程
function showAppendTask(prcInstId, actInstId) {
    var url = buildQueryUrl("sys/workflow/processTaskAppend.aspx", { actionType: 3, prcInstId: prcInstId, actInstId: actInstId });
    var re = window.showModal(url, null, 430, 400);
    if (re != undefined) reAsyncWorkTracking();
}
function showFinishTask(prcInstId, actInstId) {
    var url = buildQueryUrl("sys/workflow/ProcessTaskFinish.aspx", { actionType: 3, prcInstId: prcInstId, actInstId: actInstId });
    var re = window.showModal(url, null, 400, 400);
    if (re != undefined) reAsyncWorkTracking();
}
var $hisSubActs = [];
function showSubActs(actInstId) {
    var has = false;
    for (var i = 0; i < $hisSubActs.length; i++) {
        if ($hisSubActs[i] == actInstId) {
            has = true; break;
        }
    }
    if (!has) $hisSubActs.push(actInstId);
}
function showDeliverForm() {
    //Modify by xiedx 171201 转交将表单中填写的意见自动带出，同时修改存储过程P_WF_ACTIVITYDELIVER
    var op = $("#" + $opiObjId).val();
    if (op != "") { $("#tbDeliverRemark").val(op); }
    $("#formDeliver:ui-dialog").dialog("destroy");
    $("#formDeliver").dialog({
        resizable: false,
        autoOpen: false,
        minHeight: 100,
        minWidth: 350,
        modal: true,
        buttons: {
            "确定": function () {
                //if ($("#tbDeliverUser").val() == "") {
                //    $("#tbDeliverUser").addClass("kpms-textboxred");
                //    addAlert("tbDeliverUser");
                //    return false;
                //}
                if ($("#lbsDeliverUser_hivalue").val() == "") {
                    alert("未选择接收人！");
                    return false;
                }
                if (!window.confirm("您确定转交吗？")) return false;
                btnDeliverClick();
            },
            "取消": function () {
                $(this).dialog("close");
            }
        }
    });
    $('#formDeliver').dialog('open');
    $("#formDeliver").parent().appendTo("form");
    $("#btnSelDeliverUser").unbind('click');
    $("#btnSelDeliverUser").click(function () {
        var param = new InputParamObject("s");
        var re = getUsers("hiDeliverUser", param, "");
        if (null != re) {
            $("#tbDeliverUser").val(re.buildAttrJson("o", "name"));
        }
    });

    return false;
}
var $partsMoreLoaded = false;

function initPartsMore() {
    $('#btnMoreParts').click(function () {
        if (!$partsMoreLoaded) {
            $partsMoreLoaded = true;
            $('head').append("<script src='" + $appCtx.appPath + "/UI/script/partmore.js'><\/script>");
            $('head').append("<script src='" + $appCtx.appPath + "/UI/script/jquery.ztree.core-3.5.js'><\/script>");
            buildUnitTree(); buildUserList("", "user");
            $("#txtPartFilter").keyup(function () {
                buildUserList($(this).val(), "user");
            });
        }
        $('#formSelectp').css({ top: $(this).offset().top - 40, left: $(this).offset().left + 254 }).toggle('slide');
    });
}

//标准表单打印
function StandardFormPrint() {
    var url = buildQueryUrl($StandardizedForm + "StandardizedFormPrint.aspx", { processInstanceId: $prcInstId, currentUserId: $currUserId });
    window.open(url);
}

//针对某个模板进行标准表单打印
//打印
function stdPrint(exportId, businessId) {
    if (typeof (beforePrint) == "function") {
        if (!beforePrint())
            return false;
    }

    var url = buildQueryUrl($StandardizedForm + "ExportService.aspx", { exportId: exportId, businessId: businessId });
    window.open(url);
    //$('#form-loading').dialog({ height: 120, width: 270, resizable: false });
    //$('#form-loading').dialog('open');
    //$.ajax({
    //    async: false,
    //    type: "POST",
    //    url: $StandardizedForm + "ExportService.aspx",
    //    data: {
    //        exportId: exportId, businessId: businessId
    //    },
    //    success: function (data) {
    //        var result = JSON.parse(data);
    //        if (result.success == true) {
    //            $('#form-loading').dialog('close');
    //            var url = $appCtx.appPath + "\\App_Temp\\" + result.data.filename;
    //            window.open(url);
    //        }
    //        else {
    //            $('#form-loading').dialog('close');
    //            alert("导出失败！" + result.message);
    //        }
    //    },
    //    error: function (XMLHttpRequest) {
    //        $('#form-loading').dialog('close');
    //        alert(XMLHttpRequest.responseText);
    //    }
    //});
}

$('#aMore').live("mouseover", function () {
    showMoreMenu();
});

//add zhaoxm 20150331 添加人员的搜索条件
$(function () {
    $('#txtActPartFilter').live("focus", function () {
        if ($(this).val() == '请输入关键字') {
            $(this).val('');
            $(this).css('color', '#000');
        }
    }).live("blur", function () {
        if ($(this).val() == '') {
            $(this).val('请输入关键字');
            $(this).css('color', '#ccc');
        }
    })
});
//先找出人员信息，便于循环
var $allUser = null;
$("#txtActPartFilter").live("keyup", function () {
    $('#partWidget').html('');
    var filter = $("#txtActPartFilter").val();
    if ("" == filter) {
        for (var i = 0; i < xpdlParts[curActIndex].length; i++) {
            var p = xpdlParts[curActIndex][i];
            bindPartToList(curActIndex, p, i);
        }
    }
    else {
        if ($allUser == null) {
            $.ajax({
                type: "POST", url: "JsonSelectorHandler.ashx", data: { term: "" + ",alluser" }, dataType: "json", async: false, success: function (data) { $allUser = data; }
            });
        }
        for (var i = 0; i < xpdlParts[curActIndex].length; i++) {
            var p = xpdlParts[curActIndex][i];
            var userId = p.Id.split('|');
            for (var j = 0; j < $allUser.length; j++) {
                var split = $allUser[j].id.split(',');
                var tpName = $allUser[j].value;
                var tpId = split[0];
                var loginId = split[1];
                var tpAbbrName = split[4];
                if (userId[0].toLowerCase() == tpId.toLowerCase()
                    && (tpName.toLowerCase().indexOf(filter.toLowerCase()) > -1
                        || tpAbbrName.toLowerCase().indexOf(filter.toLowerCase()) > -1
                        || loginId.toLowerCase().indexOf(filter.toLowerCase()) > -1)) {
                    bindPartToList(curActIndex, p, i);
                    break;
                }
            }
        }
    }
});

var $isMenuLoaded = false;
//加载其他菜单信息
function showMoreMenu() {
    //只在第一次悬浮调用加载
    if (!$isMenuLoaded) {
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/Sys/Handler/MenuLoadHandler.ashx", null),
            data: { formId: $formObjId, businessId: $currBizId },
            async: false,
            //dataType: "json",
            cache: false,
            success: function (res) {
                if (res == '') {
                    //如果没有新的更多菜单信息，则更改现在最后一个菜单的样式没有下划线样式 tianhl 20141224
                    $('#divMore a:last').addClass('MT-list-last');
                }
                $('#divMore').append(res);
                $isMenuLoaded = true;
            },
            error: function (err) {
                //alert(err);
            }
        });
    }
}

//关联流程
function RelateFlow(callback) {
    var param = new InputParamObject("m");
    //var re = setWorkflowMapping("", param, $formCtx.prcInstId + "|" + $formCtx.formId, callback);
    var re = setWorkflowMapping("", param, $formCtx.prcInstId + "|" + $formCtx.formId, callback);
    return false;
}

//正文处理
function openTextBody(type, action) {
    //判断是否有正文
    var haveText = true;
    $.ajax({
        type: "POST",
        url: buildQueryUrl("KOA/SOA/KOAHandler.ashx", null),
        data: { BizId: $bizCtx.bizId, OperateType: "HaveText" },
        async: false,
        success: function (result) {
            if (result == "false") {
                haveText = false;
            }
        }
    });
    if (!haveText) {
        alert("未上传正文！");
        return false;
    }
    var url = buildQueryUrl("sys/FileDocument/DocumentEdit.aspx", { action: action, type: type, bizId: $bizCtx.bizId });
    var re = window.open(url);

    return false;
}

function openFileBody(type, action, bizdId) {
    var url = buildQueryUrl("sys/FileDocument/DocumentViewEdit.aspx", { action: action, type: type, FileId: bizdId });
    var re = window.open(url);

    return false;
}