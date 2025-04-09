/* 
Global.js Zhongsoft 2014 
PortalApp 通用脚本库
*/
//判断本页面是否是Dashboard页
function isDashboardPage() {
    return window.location.pathname.toLowerCase() == buildQueryUrl("/Custom/List/Dashboard.aspx", null).toLowerCase();
}

//DashBoard部件间传参
function setDashboardParam(param, btn) {
    if (isDashboardPage() && btn != undefined) {
        var triggerid = $(btn).closest(".webPartDiv[webpartid]").attr("webpartid");
        setWebPartParam(triggerid, param);
    }
    else {
        window.parent.setWebPartParam(self.frameElement.id, param);
    }
    return false;
}

//DashBoard部件tab页跳转
function setDashboardTab(key) {
    if (isDashboardPage()) {
        setWebPartTab(key);
    } else {
        window.parent.setWebPartTab(key);
    }
    return false;
}

function setIInherentParamSelctor(id, json) {
    $("#" + id + "").autocomplete(
        {
            source: json,
            minLength: 0,
            select: function (event, ui) {
                if (ui.item) {
                    var str = $(this).val();
                    var index = str.lastIndexOf("@");
                    if (index >= 0) {
                        str = str.substring(0, index);
                        $(this).val(str + ui.item.value)
                    }
                    else {
                        return true;
                    }
                }
                return false;
            }

        }).keyup(
            function () {
                var str = $(this).val();
                var index = str.lastIndexOf("@");
                if (index >= 0) {
                    var last = str.substring(index, str.length)
                    $(this).autocomplete("search", last);
                }
            });
}
function openDetail(mid) {
    $("#" + mid).toggle();
    //var evtOd = "#" + mid;
    //if (event != null) {
    //    evtOd = event.srcElement;
    //}

    //通过父级查找对应切换图片，之前方式查找范围大了有问题，导致把工具栏按钮图片也修改了
    //根据显隐，切换图片
    if ($("#" + mid).css('display') == 'none') {
        //元素下有多个图片，更新第二个
        if ($("#" + mid).parent().find('img').length > 1) {
            $("#" + mid).parent().find('img')[1].src = buildQueryUrl("themes/images/rright.png", null);
        }
        else {
            $("#" + mid).parent().find('img').attr('src', buildQueryUrl("themes/images/rright.png", null));
        }
    }
    else {
        //元素下有多个图片，更新第二个
        if ($("#" + mid).parent().find('img').length > 1) {
            $("#" + mid).parent().find('img')[1].src = buildQueryUrl("themes/images/lright.png", null);
        }
        else {
            $("#" + mid).parent().find('img').attr('src', buildQueryUrl("themes/images/lright.png", null));
        }
    }
}
function search() {
    if (event.keyCode == 13) {
        event.returnValue = false;
        event.cancel = true;
        $("[content='searchResult']").click();
    }
}
function showModal(url, param, width, height) {
    return window.showModalDialog(url, param, "resizable:1;scroll:1;dialogHeight:" + height + "px; dialogWidth:" + width + "px;");
}

function hexadecimal() {
    return Math.floor((1 + Math.random() * 0x10000)).toString(16).substring(1);
}

//生成guid
function buildGuid() {
    return hexadecimal() + hexadecimal() +
        "-" + hexadecimal() + "-" + hexadecimal() + "-" + hexadecimal()
        + "-" + hexadecimal() + hexadecimal() + hexadecimal();
}

function showDivDialog(url, param, w, h, callback) {
    var $dialogDiv = buildIframeDialogDiv();
    $dialogDiv.children("input").val(param);
    url = buildQueryUrl(url, { "dialog_mode": "Dialog", param_hi_id: $dialogDiv.children("input").attr("id") });
    var target = self;
    while (target.frameElement) { //循环查找最外层页面
        target = target.parent;
    }
    var title = '';
    //为上传页面设置title
    if (url.indexOf("sys/filedocument/fileuploader.aspx") > 0)
        title = '文件上传';
    target.returnValue = null;
    $dialogDiv.dialog({
        width: w,
        height: h,
        modal: true,
        title: title,
        open: function () { $dialogDiv.children("iframe").attr("src", url); },
        close: function () {
            var re = target.returnValue;
            $dialogDiv.children("iframe").removeAttr("src");
            $dialogDiv.dialog("destroy");
            //ie 9下会出脚本错误，暂时将下面一行注释 leixf
            //$dialogDiv.remove();
            if (checkReturn(re)) {
                if (typeof (callback) == 'function') {
                    callback(re);
                }
            } else {
                if (url.indexOf("sys/filedocument/fileuploader.aspx") > 0) {
                    if (typeof (callback) == 'function') {
                        callback(re);
                    }
                }
            }
        }
    });
    setDivDialogZIndex($dialogDiv);
    return false;
}

//关闭窗口时，带有提示框
function showDivDialogTip(url, param, w, h, callback) {
    var $dialogDiv = buildIframeDialogDiv();
    $dialogDiv.children("input").val(param);
    url = buildQueryUrl(url, { "dialog_mode": "Dialog", param_hi_id: $dialogDiv.children("input").attr("id") });
    var target = self;
    while (target.frameElement) { //循环查找最外层页面
        target = target.parent;
    }
    var title = '';
    //为上传页面设置title
    if (url.indexOf("sys/filedocument/fileuploader.aspx") > 0)
        title = '文件上传';
    target.returnValue = null;
    $dialogDiv.dialog({
        width: w,
        height: h,
        modal: true,
        title: title,
        beforeClose: function () {
            //点击页面右上角的关闭时，提示是否保存，选择确定，则进行保存完关闭页面；选择取消，则不关闭页面
            //如果是点击页面上的关闭按钮触发的该事件，则不执行该方法 
            if (target.returnValue == "Saved" || target.returnValue == "Cancle") {
                return true;
            } else {
                if (!confirm('窗口即将关闭，请确认数据已经保存！')) {
                    closeWindow();
                    return false;
                }
                else {
                    return true;
                }
            }
        },
        open: function () { $dialogDiv.children("iframe").attr("src", url); },
        close: function () {
            var re = target.returnValue;
            $dialogDiv.children("iframe").removeAttr("src");
            $dialogDiv.dialog("destroy");
            //ie 9下会出脚本错误，暂时将下面一行注释 leixf
            //$dialogDiv.remove();
            if (checkReturn(re)) {
                if (typeof (callback) == 'function') {
                    callback(re);
                }
            } else {
                if (url.indexOf("sys/filedocument/fileuploader.aspx") > 0) {
                    if (typeof (callback) == 'function') {
                        callback(re);
                    }
                }
            }
        }
    });
    setDivDialogZIndex($dialogDiv);
    return false;
}

//新建弹出页面弹出层div
function buildIframeDialogDiv() {
    var target = self;
    while (target.frameElement) { //循环查找最外层页面
        target = target.parent;
    }
    var newid = buildGuid();
    var divId = newid + "_div";
    var iframeId = newid + "_iframe";
    var hiParamId = newid + "_hiparam";
    target.jQuery("#" + divId).remove();
    var $dialogDiv = target.jQuery("<div id='" + divId + "' style='display: none'>"
        + "<iframe id='" + iframeId + "' name='dialogiframe' src='' frameborder='0' width='100%' height='100%' "
        + "allowtransparency='true'></iframe>"
        + "<input type='hidden' id='" + hiParamId + "'></div>");
    $dialogDiv.appendTo($(target.document.body));

    return $dialogDiv;
}

//修改弹出层的z-index，使新的弹出层可以覆盖上一个弹出层
function setDivDialogZIndex($dialogIframeDiv) {
    if (self.frameElement) {
        var dialog = $(self.parent.document.body).find("#" + self.frameElement.id).closest(".ui-dialog");
        if (dialog.length > 0) {
            var zindex = parseInt(dialog.css("z-index"));
            $dialogIframeDiv.parent("div").css("z-index", zindex + 2); //修改打开的dialog的z-index
            $dialogIframeDiv.parent("div").prev("div").css("z-index", zindex + 1); //修改遮罩层的z-index
        }
    }
}

function closeWindow() {
    if (self.frameElement != undefined
        && self.frameElement.parentNode.parentNode != undefined
        && self.frameElement.parentNode.parentNode.className != undefined
        && self.frameElement.parentNode.parentNode.className.indexOf("ui-dialog") >= 0) {
        if (typeof (parent.closeIframeDialog) == 'function') {
            parent.closeIframeDialog(self.frameElement.parentNode.id);
        }
    }
    else {
        //如果是在项目网站打开流程，流程操作后跳转到原页面
        if ($.isFunction(window.parent.goSelectNode)) {
            window.parent.goSelectNode();
        }
        else {
            window.opener = null; window.open('', '_self'); window.close();
        }
    }
}

function closeIframeDialog(dialogiframedivid) {
    $("#" + dialogiframedivid).dialog("close");
}

//设置弹出层的title标题
function setDialogTitle(hiParamId) {
    //通过hidden控件找到当前层位置，进行title赋值，避免将所有title修改
    $(window.parent.document).find('#' + hiParamId).parent().parent().find('.ui-dialog-title').text($(window.document).attr('title'));
}

function showTooltip(x, y, contents) {
    $('<div id="tooltip">' + contents + '</div>').css({
        position: 'absolute',
        display: 'none',
        top: y + 5,
        left: x + 15,
        border: '1px solid #fdd',
        padding: '2px',
        "background-color": '#fee',
        opacity: 0.80,
        "z-index": 2000
    }).appendTo("body").fadeIn(200);
}
var $dictFormDetailParam = {};

function readFormDetail(extendAttribute) {
    var param = { ExtendAttribute: extendAttribute, PageType: "Other", FormDetail: 1 };

    if ($dictDialogParam[extendAttribute] == undefined || $dictDialogParam[extendAttribute] == null) {
        $.ajax({
            type: "post",
            async: false,
            url: buildQueryUrl("/sys/Handler/DialogParamHandler.ashx", param),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (json) {
                if (json != "" && json != null) {
                    $dictDialogParam[extendAttribute] = json;
                }
            },
            error: function (err) {
            }
        });
    }
    var urlStr = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", $dictDialogParam[extendAttribute]);
    window.open(urlStr);
    return false;
}

function viewFormDetail(bizId, isOld) {
    var url = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizId, IsOld: isOld });
    window.open(url);
    return false;
}

function initDate() {//初始化时间控件
    $(".kpms-textbox-date").click(function () { WdatePicker(); });
    $(".kpms-textbox-wholedate").click(function () { WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm', autoPickDate: 'true' }); })
}
function buildBizUrl(actType, bizId, path, j) {//构建业务传递参数
    if (j == null) j = {};
    j["actionType"] = actType == null ? "" : actType;
    j["bizId"] = bizId == null ? "" : bizId;
    return buildQueryUrl(path, j);
}
function buildQueryUrl(path, j) {
    var url = null;
    if (path.indexOf($appCtx.appPath + "/") == 0 || path.indexOf($appCtx.portalUrl) == 0) {
        url = path;
    }
    else if (path.toLowerCase().indexOf("/dicp/") > 0) {
        //链接到旧平台系统页面，对于url不需要处理
        url = path;
    }
    else if (path.indexOf("http://") == 0) {
        //已经是http方式开头，不做处理
        url = path;
    }
    else {
        if (path.indexOf("/") == 0) {
            url = $appCtx.appPath + path;
        }
        else {
            url = $appCtx.appPath + "/" + path;
        }
    }

    if (url.indexOf("http://") != 0) {
        url = $appCtx.portalUrl.replace($appCtx.appPath, "") + url;
    }

    if (j != null) {
        if (url.indexOf('?') == -1) {
            url += "?";
        }
        else {
            url += "&";
        }
        for (var k in j) {
            url += k + "=" + j[k] + "&";
        }
        url = url.substr(0, url.length - 1);
    }
    return url;
}
function checkReturn(r) {
    return r != undefined && r != null;
}
//初始化功能
function initFunction() {
    initDate();
    initFormInput(); fitTextArea(); $("span[tip='1'],div[tip='1']").tooltip();
    compare();
    checkRegex();
    checkMaxLength();
    if (typeof (dropCheckBoxListShow) == 'function') {
        dropCheckBoxListShow();
    }
    if (typeof (setLightCheckField) == 'function') {
        setLightCheckField();
    }
    if (typeof (initFormPlugin) == 'function') {//系统固化
        initFormPlugin();
    }
    if (typeof (initCustomerPlugin) == 'function') {//用户自定义
        initCustomerPlugin();
    }
    if (typeof (initECharts) == 'function') {//ECharts初始化
        initECharts();
    }
    initRadioCheckStyle();
}
//页面初始化方法
$(function () {
    initFunction();
    try {//捕获UpdatePanel事件
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);
    }
    catch (e) { }
});
function beginRequestHandler(sender, args) {
    if (typeof (beginFormRequest) == 'function') {
        beginFormRequest(sender, args);
    }
}
function endRequestHandler(sender, args) {
    try {
        initFunction(); //重新初始化功能
        if (typeof (endFormRequest) == 'function') {
            endFormRequest(sender, args);
        }
    }
    catch (e) { }
}
function initFormInput() {
    $(':input[class^=kpms]:not("disabled")').bind('focus', function () {
        $(this).addClass('kpms-textboxfocus');
    }).bind('blur', function () {
        $(this).removeClass('kpms-textboxfocus');
        $(this).removeClass('kpms-textboxred');
    });
    //可选择控件的样式
    $(':input[readonly][disabled!="disabled"]').css('background', '#eef8fc');
    //不可编辑控件的样式
    $(':input[isDisabled="true"]').css('background', '#ffffff');

}
var autoTextarea = function (elem, extra, maxHeight) {
    extra = extra || 0;
    var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
        isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
        addEvent = function (type, callback) {
            elem.addEventListener ?
                elem.addEventListener(type, callback, false) :
                elem.attachEvent('on' + type, callback);
        },
        getStyle = elem.currentStyle ? function (name) {
            var val = elem.currentStyle[name];


            if (name === 'height' && val.search(/px/i) !== 1) {
                var rect = elem.getBoundingClientRect();
                return rect.bottom - rect.top -
                    parseFloat(getStyle('paddingTop')) -
                    parseFloat(getStyle('paddingBottom')) + 'px';
            };


            return val;
        } : function (name) {
            return getComputedStyle(elem, null)[name];
        },
        minHeight = parseFloat(getStyle('height'));




    elem.style.resize = 'none';


    var change = function () {
        var scrollTop, height,
            padding = 0,
            style = elem.style;


        if (elem._length === elem.value.length) return;
        elem._length = elem.value.length;


        if (!isFirefox && !isOpera) {
            padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
        };
        scrollTop = document.body.scrollTop || document.documentElement.scrollTop;


        elem.style.height = minHeight + 'px';
        if (elem.scrollHeight > minHeight) {
            if (maxHeight && elem.scrollHeight > maxHeight) {
                height = maxHeight - padding;
                style.overflowY = 'auto';
            } else {
                height = elem.scrollHeight - padding;
                style.overflowY = 'hidden';
            };
            style.height = height + extra + 'px';
            //解决页面回发后，页面滚动到页面最上方的问题
            elem.currHeight = parseInt(height + extra);
            scrollTop += parseInt(height + extra) - elem.currHeight;
            document.body.scrollTop = scrollTop;
            document.documentElement.scrollTop = scrollTop;
            //elem.currHeight = parseInt(style.height);
        };
    };


    addEvent('propertychange', change);
    addEvent('input', change);
    addEvent('focus', change);
    change();
};
function fitTextArea() {
    $.each($('textarea[class^="kpms-textarea"]'), function (i, n) {

        try {
            var isbar = $(this).attr("isBar")
            if (isbar != 1) {
                $(this).css('overflow', 'hidden').css('word-wrap', 'break-word');
                autoTextarea(this);
            }
            else {
                if (this.scrollHeight > 48) {
                    // this.style.height = this.scrollHeight + 'px';
                }
                $(this).bind({
                    propertychange: function () {
                        if (this.scrollHeight > 48) {
                            // this.style.height = this.scrollHeight + 'px';
                        }
                    },
                    input: function () {
                        if (this.scrollHeight > 48) {
                            // this.style.height = this.scrollHeight + 'px';
                        }
                    }
                });
            }
        } catch (e) { }

    });
}

//ShowModal页面触发导出功能
function triggerExport() {
    $(".btn-img-p[id$='BtnExcel'],.btn-img-p[id$='BtnWord']").each(function () {
        $(this).click(function () {
            $("base").attr('target', '_blank');
            setTimeout(check, 1000);
        });
        function check() {
            $("base").attr('target', '_self');
        }
    });
}

function showWorkTracking(prcInstId, packName, processId, actInstId, actName) {
    var url = buildQueryUrl("sys/workflow/WorkTracking.aspx", { prcInstId: prcInstId, pName: packName, pid: processId, actInstId: actInstId, actName: escape(actName) });
    showDivDialog(encodeURI(url), null, 1040, 600);
    return false;
}
function showUploadForm(entityId, srcFlag) {
    var url = buildQueryUrl("sys/filedocument/fileuploader.aspx", { fileSourceId: entityId, fileSourceFlag: srcFlag });
    window.showModal(url, null, 500, 320);
    return true;
}
function showUploadFormAndType(entityId, srcFlag, fileType, callUploadBack) {
    var url = buildQueryUrl("sys/filedocument/fileuploader.aspx", { fileSourceId: entityId, fileSourceFlag: srcFlag, fileType: fileType });
    //window.showModal(url, null, 500, 320);
    showDivDialog(encodeURI(url), null, 500, 405, callUploadBack);
    return false;
}
function showUploadDivForm(entityId, srcFlag, callUploadBack) {
    var url = buildQueryUrl("sys/filedocument/fileuploader.aspx", { fileSourceId: entityId, fileSourceFlag: srcFlag });
    showDivDialog(encodeURI(url), null, 550, 350, callUploadBack);
    return false;
}
//不允许上传同名文件 add by xuning 20150316
function showUploadFormNoSameName(entityId, srcFlag) {
    var url = buildQueryUrl("sys/filedocument/fileuploader.aspx", { fileSourceId: entityId, fileSourceFlag: srcFlag, allowSameName: false });
    window.showModal(url, null, 500, 320);
    return true;
}
function validateForm() {
    if (typeof (Page_Validators) != "undefined") {
        for (i = 0; i < Page_Validators.length; i++) {
            var val = Page_Validators[i];
            if (typeof (val.evaluationfunction) == "function") {
                try {
                    val.isvalid = val.evaluationfunction(val);
                    if (!val.isvalid) {
                        $("#" + val.controltovalidate).addClass("kpms-textboxred");
                    }
                } catch (e) { }
            }
        }
    }
}
function showJQMsg(msg) {
    $("#reqMsg").remove();
    var $m = $("<div id='reqMsg' title='信息提示' style='display:none'>" + msg + "</div>").appendTo("body");
    $('#reqMsg').dialog({
        autoOpen: true,
        modal: false,
        resizable: false,
        open: function (event, ui) {
            setTimeout(function () {
                $('#reqMsg').dialog('close');
            }, 3000);
        }
    });
}
function showMessage(content, title, width, height, time) {

    if (!title) {
        title = "提示";
    }
    if (!width) {
        width = 300;
    }
    if (!height) {
        height = 200;
    }
    if (!time) {
        time = 4000;
    }
    $.messager.show({
        title: title,
        msg: content,
        showType: 'slide',
        timeout: -1,
        height: height,
        width: width
    });

}
function alertMessage(content, title, width, height, time) {
    if (!title) {
        title = "提示";
    }
    if (!width) {
        width = 300;
    }
    if (!height) {
        height = 200;
    }
    if (!time) {
        time = 4000;
    }
    $.messager.defaults = $.extend($.messager.defaults, { height: height, width: width });

    $.messager.alert(title, content);
}

function alertWarning(title, content, width, height, time) {
    if (!title) {
        title = "警告";
    }
    if (!width) {
        width = 300;
    }
    if (!height) {
        height = 200;
    }
    $.messager.defaults = $.extend($.messager.defaults, { height: height, width: width });

    $.messager.alert(title, content, 'warning');
}

function alertSucces(content, title, width, height) {
    if (!title) {
        title = "提示";
    }
    if (!width) {
        width = 300;
    }
    if (!height) {
        height = 200;
    }
    $.messager.defaults = $.extend($.messager.defaults, { height: height, width: width });
    $.messager.alert(title, content, 'succes');

}

function alertError(content, title, width, height) {
    if (!title) {
        title = "错误";
    }
    if (!width) {
        width = 300;
    }
    if (!height) {
        height = 200;
    }
    $.messager.defaults = $.extend($.messager.defaults, { height: height, width: width });
    $.messager.alert(title, content, 'error');

}

function deleteJsonById(jsonArray, id) {
    var t = -1;
    for (var i = 0; i < jsonArray.length; i++) {
        if (jsonArray[i].id == id) {
            t = i;
            break;
        }
    }
    if (t != -1) {
        return jsonArray.splice(t, 1);
    }
}
function addJson(jsonArray, json) {
    for (var i = 0; i < jsonArray.length; i++) {
        if (jsonArray[i].id == json.id) {
            return;
        }
    }
    jsonArray.push(json);
}
function createOption(select, text, value) {
    $('#' + select).append($("<option></option>").attr("value", value).text(text));
}
function createJsonOption(select, jsonList) {
    for (var i = 0; i < jsonList.length; i++) {
        var json = jsonList[i];
        var tObjName = "";
        if (json[2] != "" && json[2] != undefined)
            tObjName = json[1] + "[" + json[2] + "]";
        else
            tObjName = json[1];
        createOption(select, tObjName, json[0]);
    }
}

//ajax调用后台设置session值
function setParamTransfer(name, value) {
    $.ajax({
        type: 'POST',
        url: buildQueryUrl("/sys/Handler/ParamTransferHandler.ashx", null),
        data: { SessionName: name, SessionValue: value },
        async: false,
        dataType: "json",
        cache: false,
        success: function (msg) {
            if (msg != "" && msg != null)
                alert(msg);
        },
        error: function (err) {
            alert(err);
        }
    });
}


var $dictDialogParam = { Editor: {}, Selector: {} };

function getDialogUrlJson(dictCode, pageType, userId, secId) {
    var param = { DictCode: dictCode, PageType: pageType };
    if (userId != null) {
        param = $.extend(param, { UserId: userId });
    }
    if (secId != null) {
        param = $.extend(param, { SecId: secId });
    }
    $.ajax({
        type: "post",
        async: false,
        url: buildQueryUrl("/sys/Handler/DialogParamHandler.ashx", param),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        cache: false,
        success: function (json) {
            $dictDialogParam[pageType][dictCode] = json;
        },
        error: function (err) {

        }
    });
    return $dictDialogParam[pageType][dictCode];
}

var $dictPageUrlParam = {};
function getPageCodeUrlJson(pageCode) {

    var param = { PageCode: pageCode };
    if ($dictPageUrlParam[pageCode] == undefined || $dictPageUrlParam[pageCode] == null) {
        $.ajax({
            type: "post",
            async: false,
            url: buildQueryUrl("/sys/Handler/DialogParamHandler.ashx", param),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (json) {
                $dictPageUrlParam[pageCode] = json;
            },
            error: function (err) {

            }
        });
    }
    return $dictPageUrlParam[pageCode];

}

var $dictPageIdUrlParam = {};
//根据pageid获取页面url
function getPageIdUrlJson(pageid) {
    var param = { PageId: pageid };
    if ($dictPageIdUrlParam[pageid] == undefined || $dictPageIdUrlParam[pageid] == null) {
        $.ajax({
            type: "post",
            async: false,
            url: buildQueryUrl("/sys/Handler/DialogParamHandler.ashx", param),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (json) {
                $dictPageIdUrlParam[pageid] = json;
            },
            error: function (err) {

            }
        });
    }
    return $dictPageIdUrlParam[pageid];

}

function parseBool(string) {
    if (string == undefined || string == null) {
        return false;
    }
    switch (string.toLowerCase()) {
        case "true": case "yes": case "1": return true;
        case "false": case "no": case "0": return false;
        default: return Boolean(string);
    }
}

//日期格式化
function parseDate(dateStr, hasTime) {
    var date = new Date(dateStr.replace(/-/g, "/"));
    if (hasTime)
        return date.parseStr("@YYYY@-@MM@-@DD@ @hh@:@mm@:@ss@");
    return date.parseStr("@YYYY@-@MM@-@DD@");
}

//减法
function accSub(arg1, arg2) {
    var r1, r2, m, n;
    try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
    m = Math.pow(10, Math.max(r1, r2));
    //last modify by deeka
    //动态控制精度长度
    //n = (r1 >= r2) ? r1 : r2;
    return ((arg1 * m - arg2 * m) / m).toFixed(2);
}

//加法
function accAdd(arg1, arg2) {
    var r1, r2, m;
    try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
    m = Math.pow(10, Math.max(r1, r2))
    return ((arg1 * m + arg2 * m) / m).toFixed(2);

}

//加法，控制小数点后显示的位数
function accAddFloat6(arg1, arg2) {
    var r1, r2, m, max;
    try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }

    //获取小数点后的位数
    max = Math.max(r1, r2);
    m = Math.pow(10, max)

    if (max < 6) {
        return (((arg1 * m + arg2 * m) / m).toFixed(max))
    }
    else {
        return (((arg1 * m + arg2 * m) / m).toFixed(6));
    }
}

//除法
function accDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2;
    try { t1 = arg1.toString().split(".")[1].length } catch (e) { }
    try { t2 = arg2.toString().split(".")[1].length } catch (e) { }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""))
        r2 = Number(arg2.toString().replace(".", ""))
        return ((r1 / r2) * pow(10, t2 - t1)).toFixed(2);
    }
}

//除法
function accDivLeaveNum(arg1, arg2, floatNum) {
    var t1 = 0, t2 = 0, r1, r2;
    try { t1 = arg1.toString().split(".")[1].length } catch (e) { }
    try { t2 = arg2.toString().split(".")[1].length } catch (e) { }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""))
        r2 = Number(arg2.toString().replace(".", ""))
        return ((r1 / r2) * pow(10, t2 - t1)).toFixed(floatNum);
    }
}

//乘法
function accMul(arg1, arg2) {
    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
    try { m += s1.split(".")[1].length } catch (e) { }
    try { m += s2.split(".")[1].length } catch (e) { }
    return (Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m)).toFixed(2);
}

//乘法  floatNum
function accMulLeaveNum(arg1, arg2, floatNum) {
    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
    try { m += s1.split(".")[1].length } catch (e) { }
    try { m += s2.split(".")[1].length } catch (e) { }
    return (Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m)).toFixed(floatNum);
}

function floatParse(num) {
    if (isNaN(parseFloat(num)) || num == "" || !isFinite(num)) {
        return 0;
    }
    else {
        return parseFloat(num);
    }
}

function intParse(num) {

    if (isNaN(parseInt(num)) || num == "" | !isFinite(num)) {
        return 0;
    }
    else {
        return parseInt(num);
    }
}

//清空radiobuttonlist
function setRadlNoSelectItem(radl) {
    $("#" + radl + " input:checked").removeAttr("checked");
}

//单选按钮、复选框只读状态下文字不变灰，选中的文字加粗
function initRadioCheckStyle() {
    $("input[type='radio']").each(function (i) {
        if (this.checked) {
            $(this).next().css('font-weight', 'bold');
        }
        else { $(this).next().css('font-weight', 'normal'); }
    });
    $("table[class='kpms-radio']").bind('click', function () {
        $("input[type='radio']").each(function (i) {
            if (this.checked) {
                $(this).next().css('font-weight', 'bold');
            }
            else { $(this).next().css('font-weight', 'normal'); }
        });
    });

    $("table[class='kpms-radio']").removeAttr("disabled");
    $("input[type='radio']").parent("span").removeAttr("disabled");

    $("input[type='checkbox']").each(function (i) {
        if (this.checked) {
            $(this).next().css('font-weight', 'bold');
        }
        else { $(this).next().css('font-weight', 'normal'); }
    });
    $("table[class='kpms-chklist']").bind('click', function () {
        $("input[type='checkbox']").each(function (i) {
            if (this.checked) {
                $(this).next().css('font-weight', 'bold');
            }
            else { $(this).next().css('font-weight', 'normal'); }
        });
    });

    $("table[class='kpms-chklist']").removeAttr("disabled");
    $("input[type='checkbox']").parent("span").removeAttr("disabled");
}

//获取资源值
function getResByKey(key) {
    var res = '';
    $.ajax({
        type: "POST",
        url: "/Portal/Sys/Handler/ResourceHandler.ashx",
        data: { ResKey: key },
        async: false,
        success: function (data) {
            res = data;
        }
    });

    return res;
}

/** XML by sunan**/
function KPMSXml() {
    this.xmlDoc = null;
    this.parser = null;
    this.isDom = false;

    try {
        this.xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        this.xmlDoc.async = "false";
        this.isDom = false;
    }
    catch (e) {
        this.parser = new DOMParser();
        this.isDom = true;
    }
}
KPMSXml.prototype.loadXML = function (xmlstr) {
    if (!this.isDom) { this.xmlDoc.loadXML(xmlstr); }
    else this.xmlDoc = this.parser.parseFromString(xmlstr, "text/xml");
}

KPMSXml.prototype.xml = function () {
    if (!this.isDom)
        return this.xmlDoc.xml;
    else {
        var serial = new XMLSerializer();
        var str = serial.serializeToString(this.xmlDoc);
        return str;
    }
}
KPMSXml.prototype.createElement = function (name) {
    return this.xmlDoc.createElement(name);
}
KPMSXml.prototype.createNode = function (pos, name, namingspace) {
    return this.xmlDoc.createElement(name);
}
KPMSXml.prototype.createAttribute = function (name) {
    return this.xmlDoc.createAttribute(name);
}
KPMSXml.prototype.selectSingleNode = function (xpath) {
    if (!this.isDom) {
        return this.xmlDoc.selectSingleNode(xpath);
    }
    else {
        var $r = this.xmlDoc.evaluate(xpath, this.xmlDoc, null, XPathResult.ANY_TYPE, null);
        return $r.iterateNext();
    }
}
KPMSXml.prototype.selectNodes = function (xpath) {
    if (!this.isDom)
        return this.xmlDoc.selectNodes(xpath);
    else {
        var result = this.xmlDoc.evaluate(xpath, this.xmlDoc, null, XPathResult.ANY_TYPE, null);
        var found = []; var res; while (res = result.iterateNext()) found.push(res);
        return found;
    }
}
KPMSXml.prototype.getAttrVal = function (oindex, tagName, att) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        if (oindex == i)
            return nodes[i].getAttribute(att);
    }
}
KPMSXml.prototype.getElementsByTagName = function (tagName) {
    return this.xmlDoc.getElementsByTagName(tagName);
}
KPMSXml.prototype.isExistById = function (id, tagName) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].getAttribute("id") == id)
            return true;
    }
    return false;
}
KPMSXml.prototype.isExistByAttVal = function (attName, attVal, tagName) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].getAttribute(attName) == attVal)
            return true;
    }
    return false;
}
KPMSXml.prototype.isExistByIdAndParent = function (id, tagName, parentId) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].getAttribute("id").toLowerCase() == id.toLowerCase()
            && nodes[i].parentNode.getAttribute("id").toLowerCase() == parentId.toLowerCase())
            return true;
    }
    return false;
}


//用于发送页面，人员添加时作比较
KPMSXml.prototype.isExistBySplitIdAndParent = function (id, tagName, parentId) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        var nodeIds = nodes[i].getAttribute("id").split("|");
        var ids = id.split("|");
        if (nodeIds.length == ids.length) {//都包含或都不包含“|”时，直接比较
            if (nodes[i].getAttribute("id").toLowerCase() == id.toLowerCase()
                && nodes[i].parentNode.getAttribute("id").toLowerCase() == parentId.toLowerCase())
                return true;
        }
        else {//不同时包含“|”时，比较前半部分
            if (nodeIds[0].toLowerCase() == ids[0].toLowerCase()
                && nodes[i].parentNode.getAttribute("id").toLowerCase() == parentId.toLowerCase())
                return true;
        }
    }
    return false;
}

KPMSXml.prototype.getElementById = function (id, tagName) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].getAttribute("id") == id)
            return nodes[i];
    }
    return null;
}
KPMSXml.prototype.removeChildNode = function (id, tagName) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].getAttribute("id") == id) {
            nodes[i].parentNode.removeChild(nodes[i]);
            break;
        }
    }
}
KPMSXml.prototype.removeChildNodeByParent = function (id, tagName, parentId) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].getAttribute("id") == id
            && nodes[i].parentNode.getAttribute("id") == parentId) {
            nodes[i].parentNode.removeChild(nodes[i]);
            break;
        }
    }
}
KPMSXml.prototype.removeAll = function (tagName) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        nodes[i].parentNode.removeChild(nodes[i]);
    }
}
KPMSXml.prototype.removeEntityByOption = function (selectId, tagName) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    var id = $("#" + selectId).val();
    var removeNode;
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].getAttribute("id") == id) {
            removeNode = nodes[i];
            $("#" + selectId + " option[value='" + id + "']").remove();
            break;
        }
    }
    if (removeNode == null) return;
    this.xmlDoc.documentElement.removeChild(removeNode);
}
KPMSXml.prototype.copyEntityToOption = function (selectId, tagName) {
    $("#" + selectId).val("");
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        createOption(selectId, nodes[i].getAttribute("name"), nodes[i].getAttribute("id"));
    }
}
KPMSXml.prototype.copyEntityTitleToOption = function (selectId, tagName) {
    $("#" + selectId).val("");
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        var ex = nodes[i].getAttribute(nodes[i].attributes[2].name);
        var txt = nodes[i].getAttribute("name");
        if (ex != "") txt = nodes[i].getAttribute("name") + "[" + ex + "]";
        createOption(selectId, txt, nodes[i].getAttribute("id"));
    }
}
KPMSXml.prototype.getAttributeById = function (id, attr, tagName) {
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].getAttribute("id") == id)
            return nodes[i].getAttribute(attr);
    }
}
KPMSXml.prototype.getId = function () {
    return this.getVal("id");
}
KPMSXml.prototype.getName = function () {
    return this.getVal("name");
}
KPMSXml.prototype.getVal = function (attr) {
    return this.getAttrVal(0, "o", attr);
}
KPMSXml.prototype.buildAttrJson = function (tagName, attr) {
    var temp = [];
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        temp.push(nodes[i].getAttribute(attr));
    }
    return temp;
}
KPMSXml.prototype.buildAttrJsonList = function (tagName) {
    var result = [];
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        var temp = [];
        for (var a = 0; a < nodes[i].attributes.length; a++) {
            temp.push(nodes[i].getAttribute(nodes[i].attributes[a].name));
        }
        result.push(temp);
    }
    return result;
}

KPMSXml.prototype.getJsonList = function (tagName) {
    var result = "[";
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        var temp = "{";
        for (var a = 0; a < nodes[i].attributes.length; a++) {
            //modify by yangyj 2016-03-09 解决ExtendedAttribute有值时脚本错误
            var jsonValue = nodes[i].getAttribute(nodes[i].attributes[a].name);
            if (nodes[i].attributes[a].name == 'ExtendedAttribute') {
                jsonValue = jsonValue.replaceAll('\'', '');
            }
            temp += "" + nodes[i].attributes[a].name + ":'" + jsonValue + "'";
            if (a != nodes[i].attributes.length - 1) temp += ",";
        }
        temp += "}";
        if (i != nodes.length - 1) temp += ",";
        result += temp;

    }
    result += "]";
    return eval('(' + result + ')');
}

KPMSXml.prototype.splitAttr = function (tagName, attr, by) {
    var array = this.buildAttrToArray(tagName, attr);
    var temp = "";
    for (var i = 0; i < array.length; i++) {
        if (i == (array.length - 1)) temp += array[i];
        else temp += array[i] + by;
    }
    return temp;
}

String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
}

//扩展日期格式化方法
Date.prototype.parseStr = function (format) {
    var YYYY = this.getFullYear(); //2011  

    //    var YY = YYYY.substring(2);   // 11  
    format = format.replaceAll("@YYYY@", YYYY);
    //    format = format.replaceAll("@YY@", YY);

    var M = this.getMonth() + 1;
    var MM = (M < 10) ? "0" + M : M;
    //    var MMM = mths[M - 1];
    //    format = format.replaceAll("@MMM@", MMM);
    format = format.replaceAll("@MM@", MM);
    format = format.replaceAll("@M@", M);

    var D = this.getDate();
    var DD = (D < 10) ? "0" + D : D;
    format = format.replaceAll("@DD@", DD);
    format = format.replaceAll("@D@", D);

    var h = this.getHours();
    var hh = (h < 10) ? "0" + h : h;
    format = format.replaceAll("@hh@", hh);
    format = format.replaceAll("@h@", h);
    var m = this.getMinutes();
    var mm = (m < 10) ? "0" + m : m;
    format = format.replaceAll("@mm@", mm);
    format = format.replaceAll("@m@", m);
    var s = this.getSeconds();
    var ss = (s < 10) ? "0" + s : s;
    format = format.replaceAll("@ss@", ss);
    format = format.replaceAll("@s@", s);
    //    var dayOfWeek = this.getDay();
    //    format = format.replaceAll("@WEEK@", WEEKs[dayOfWeek]);
    //    format = format.replaceAll("@WEK@", WEKs[dayOfWeek]);
    return format;
}

//获取指定参数的参数值
function getUrlParam(paraName) {
    var url = document.location.toString();
    var arrObj = url.split("?");

    if (arrObj.length > 1) {
        var arrPara = arrObj[1].split("&");
        var arr;

        for (var i = 0; i < arrPara.length; i++) {
            arr = arrPara[i].split("=");

            if (arr != null && arr[0] == paraName) {
                return arr[1];
            }
        }
        return "";
    }
    else {
        return "";
    }
}

function createG() {
    return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
}
function getGuid() {
    return (createG() + createG() + "-" + createG() + "-" + createG() + "-" + createG() + "-" + createG() + createG() + createG()).toUpperCase();
}