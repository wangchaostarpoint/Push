(function ($) {
    function addAlert(id, self) {
        if ($("img[aid=" + id + "]").length > 0) return;
        var $aim = $("#" + id);
        var $a = $("<img aid=" + id + " style='margin:3px 0px 3px 1px;vertical-align:middle;display:none' src='/portal/themes/images/form-alert.gif'/>");
        $aim.parent().append($a);
        $a.show();
        if (self == null)
            $aim.focus(function () { removeAlert(id); });
        else {
            $aim.click(function () { removeAlert(id); });
        }
    }

    function removeAlert(id) {
        $("img[aid=" + id + "]").remove();
    }

    $.fn.extend({
        checkReqField: function () {
            var r = true; var msg = "";
            var id = "";
            this.each(function () {
                var sr = true;
                var c = $(this).attr("class");
                if (c == undefined) c = "";
                if (c.indexOf("kpms-radio") > -1 || c.indexOf("kpms-chklist") > -1) {
                    //modify by lins on 20140613 for:不可用的单选框和复选框校验结果为true
                    if ($(this).find("input[disabled]").length > 0) {

                    }
                    else if ($(this).find("input:checked").length == 0) {
                        r = false; sr = false;
                        $(this).addClass("kpms-textboxred");
                    }
                }
                else if ($(this).is("span")) {
                    if ($.trim($(this).text()) == "") {
                        r = false; sr = false;
                        $(this).addClass("kpms-textboxred");
                    }
                }
                else {
                    if ($(this).val() == "") {
                        r = false; sr = false;
                        $(this).addClass("kpms-textboxred");

                        if (id == "")
                            id = $(this).attr('id');

                    }
                }
                if (!sr) { var m = $(this).attr("reqmsg"); if (m != undefined) msg = (msg + m + '\r\n'); }
            });
            if (!r) {
                if (msg != "") {
                    alert(msg);
                }
                else {
                    alert("请检查页面必填项是否填写完全。");
                }
                if (id != "") {
                    var tabid = $("#" + id).attr("reqtabid");
                    var tabindex = $("#" + id).attr("reqtabindex");
                    if (tabid != undefined && tabindex != undefined) {
                        if (tabindex != $("#" + tabid).tabs("option", "active")) {
                            $("#" + tabid).tabs("option", "active", tabindex);
                        }
                    }
                    //                    $("html,body").animate({ scrollTop: $("#" + id).offset().top }, 1000);
                }
            }
            return r;
        },
        checkRegex: function () {
            var isValid = true;
            $(this).find(":enabled[regex][errmsg]").each(function () {
                var text = $(this).val()
                var reg = $(this).attr("regex")
                if (text != "" && reg != "") {
                    if (!text.match(reg)) {
                        $(this).focus();
                        isValid = false;
                    }
                }
            });
            return isValid;
        }
    });

})(jQuery);
function checkReqField() {
    return $("[disabled!='disabled'][req=1]").checkReqField();
}
function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
function isMoney(m) {
    var reg = /(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)|([|])/;
    var text = m;
    if (!text.match(reg)) {
        return false;
    }
    else {
        return true;
    }
}
//最大长度
function checkMaxLength() {
    $("[maxtext]").each(function () {
        var enterNum = 0;
        $(this).keyup(function () {
            if ($(this).is("span")) {
                if ($(this).text().indexOf('\n') > -1) {
                    var reg = /[\r\n]+/g;
                    enterNum = $(this).text().match(reg).length;

                }
                if ($(this).text().length + enterNum >= $(this).attr("maxtext")) {
                    $(this).text($(this).text().substring(0, $(this).attr("maxtext") - enterNum));
                }
            }
            else {
                if ($(this).val().indexOf('\n') > -1) {
                    var reg = /[\r\n]+/g;
                    enterNum = $(this).val().match(reg).length;

                }
                if ($(this).val().length + enterNum >= $(this).attr("maxtext")) {
                    $(this).val($(this).val().substring(0, $(this).attr("maxtext") - enterNum));
                }
            }
        });
        $(this).focus(function () {
            if ($(this).is("span")) {
                if ($(this).text().indexOf('\n') > -1) {
                    var reg = /[\r\n]+/g;
                    enterNum = $(this).text().match(reg).length;

                }
                if ($(this).text().length + enterNum > $(this).attr("maxtext")) {
                    $(this).text($(this).text().substring(0, $(this).attr("maxtext") - enterNum));
                }
            }
            else {
                if ($(this).val().indexOf('\n') > -1) {
                    var reg = /[\r\n]+/g;
                    enterNum = $(this).val().match(reg).length;
                }
                if ($(this).val().length + enterNum > $(this).attr("maxtext")) {
                    $(this).val($(this).val().substring(0, $(this).attr("maxtext") - enterNum));
                }
            }
        });
    });
}
//add by lins on 2011-12-05 for:验证文本框中值是否满足Regex属性内正则表达式
function checkRegex() {
    $(":enabled[regex][errmsg]").live("blur", function () {
        var text = $(this).val()
        var reg = $(this).attr("regex")
        if (text != "" && reg != "") {
            if (!text.match(reg)) {
                alert($(this).attr("errmsg"))
                $(this).focus();
                $(this).val("")
            }
        }
    });
}

//时间控件比较
function compare() {
    $('[compare]').each(function (i) {
        var idBegin = $(this).attr('id');
        var idEnd;
        var c = $(this).attr('compare');

        $('[compare]:gt(' + i + ')').each(function () {
            if ($(this).attr('compare') == c) {
                idEnd = $(this).attr('id');
            }
        })
        if (idEnd != undefined) {
            $('#' + idBegin).click(function () {
                if ($(this).attr('isDisabled') != 'true') {
                    WdatePicker({ maxDate: '#F{$dp.$D(\'' + idEnd + '\')}' })
                }
            })

            $('#' + idEnd).click(function () {
                if ($(this).attr('isDisabled') != 'true') {
                    WdatePicker({ minDate: '#F{$dp.$D(\'' + idBegin + '\')}' })
                }
            })
        }
    })
}

//比较日期信息 日期类型为(2014-07-19 08:20)
function compareDate(startTime, endTime) {
    if (startTime != '' && endTime != '') {
        var begin = startTime.replace('-', '/');
        var end = endTime.replace('-', '/');
        if (Date.parse(begin) > Date.parse(end)) {
            return false;
        }
    }
    return true;
}

//设置控件的req属性，在控件可用的情况下才设置req
function setReq(obj) {
    if ($(obj).attr('isDisabled') == undefined || !$(obj).attr('isDisabled')) {
        $(obj).attr('req', '1');
    }
}