var $dragToId;
var $hiGroup;
var $hiFieldsXml;
var $dragToIdFlag;
var $hiGroupFlag;
var $hiFieldsXmlFlag;


function getXmlObj() {
    var $xml = $("#" + $hiFieldsXml);
    var $t = new KPMSXml();
    $t.loadXML($xml.val());
    return $t;
}

function dragCol(n, o, gvid) {
    $hiFieldsXml = gvid + $hiFieldsXmlFlag;
    var $t = getXmlObj();
    var s = $t.selectNodes("//LightBoundField[Visible='True']");
    var node = s[n].cloneNode(true);
    if (n > o) {
        s[n].parentNode.removeChild(s[n]);
        if (s[o].parentNode != null)
            s[o].parentNode.insertBefore(node, s[o]);
    }
    else {
        s[n].parentNode.removeChild(s[n]);
        if (o == s.length - 1) {
            if (s[o].parentNode != null)
                s[o].parentNode.appendChild(node);
        }
        else {
            if (s[o].parentNode != null)
                s[o].parentNode.insertBefore(node, s[o + 1]);
        }
    }
    $("#" + $hiFieldsXml).val($t.xml());
    if (typeof (setShowSave) == 'function')
        setShowSave();
}

function changeSize(n, nwidth, gvid) {
    $hiFieldsXml = gvid + $hiFieldsXmlFlag;
    var $t = getXmlObj();
    var xp = "//LightBoundField[Visible='True'][" + n + "]/Width";
    var s = $t.selectSingleNode(xp);
    s.text = nwidth;
    $("#" + $hiFieldsXml).val($t.xml());
    if (typeof (setShowSave) == 'function')
        setShowSave();
}

function dragColTo(i, id, gvid) {
    $dragToId = id;
    $hiGroup = gvid + $hiGroupFlag;
    $hiFieldsXml = gvid + $hiFieldsXmlFlag;
    var $t = getXmlObj();
    var s = $t.selectNodes("//LightBoundField[Visible='True']");
    var node = s[i].cloneNode(true);
    var name = node.selectSingleNode("HeaderText").text;
    var code = node.selectSingleNode("DataField").text;

    var hasContain = false;
    $("#" + $dragToId + " input").each(function() {
        if ($(this).val() == code) {
            hasContain = true;
            return;
        }
    })
    if (hasContain) return;
    $span = $("<span class='filter-block'><span stlye='text-align:left;width:" + (name.length + 1) * 10 + "px'>" + name + "</span>"
            + "<span><input type='hidden'  name='" + code + "' value='" + code + "' /></span><span class='ui-icon ui-icon-close' onclick=\"removeGroup('" + code + "','" + $dragToId + "','" + $hiGroup + "')\"></span></span>");
    $span.appendTo("#" + $dragToId);
    var group = $("#" + $hiGroup).val();
    if (group == "")
        group += code;
    else
        group += "," + code;
    $("#" + $hiGroup).val(group);


}

function removeGroup(code, toid, hiid) {
    $("#" + toid + " input").each(function() {
        if ($(this).val() == code) {
            $(this).parent().parent().remove();
            var groups = $("#" + hiid).val().split(',');
            var group = "";
            for (var i = 0; i < groups.length; i++) {
                if (groups[i] != code && groups[i] != "") {
                    if (group == "")
                        group += groups[i];
                    else
                        group += "," + groups[i];
                }
            }
            $("#" + hiid).val(group);
        }
    })
}
//Modify by huahn 2014-6-3 调整图片引用路径与图片存放路径一致
function initGroupGrid() {
    $('.GroupGrid_btn').live("click", function () {
        var pid = $(this).attr('sid');
        var groupId = $(this).attr('GroupId');
        var isShow = true;
        if ($(this).attr('bc') == 'f') {
            isShow = true;
            $(this).attr('bc', 't');
            $(this).attr('src', '/portal/Themes/Images/TreeImages/minus.gif');
        }
        else {
            isShow = false;
            $(this).attr('bc', 'f');
            $(this).attr('src', '/portal/Themes/Images/TreeImages/plus.gif');
        }
        $('#' + groupId + ' span[pid="' + pid + '"]').each
            (
                function () {
                    if (isShow) {

                        $(this).parent().parent().parent().show();
                    }
                    else {
                        $(this).parent().parent().parent().hide();

                    }
                }
            );
    });
}


function hasGroup() {
    if ($("#" + $hiGroup).val() == "") {
        alert("请选择分类类别！");
        return false;
    } else {
        return true;
    }
}