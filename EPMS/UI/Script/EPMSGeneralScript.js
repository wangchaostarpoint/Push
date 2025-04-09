/*EPMS通用脚本*/

//获取项目信息
///reObj 接收选择的项目
//param 单选，多选参数
//projectType 选择的项目类型
//receiveXml 接收选择值的控件
function getProjectInfo(param, json, projectType, receiveXml) {
    var reObj = null;
    if (projectType == "1") {//选择生产项目
        reObj = getProject(receiveXml, param, json);
    }
    else if (projectType == "4") {//选择科技项目
        reObj = getTechProject(receiveXml, param, json);
    }
    else if (projectType == "2") {//选择总承包项目
        reObj = getGCProject(receiveXml, param, json);
    }
    else {
        reObj = getProject(receiveXml, param, json);
    }

    return reObj;
}

//根据CheckBoxList决定CheckBox全选状态
function initCBoxAll(cbl, cbAll) {
    var len = $('#' + cbl + ' input:checkbox').length;
    var checkedLen = $('#' + cbl + ' input:checkbox:checked').length;
    if (len > 0 && len == checkedLen) {
        $('#' + cbAll).attr('checked', true);
    }
    else {
        $('#' + cbAll).attr('checked', false);
    }
}

//全选、反选
function initCBoxList(cbl, cbAll) {
    var allChecked = $('#' + cbAll).is(':checked');
    if (allChecked) {
        //input:checkbox之间不可以空格！
        $('#' + cbl + ' input:checkbox').each(function () {
            $(this).attr('checked', true);
        });
    }
    else {
        $('#' + cbl + ' input:checkbox').each(function () {
            $(this).attr('checked', false);
        });
    }
}