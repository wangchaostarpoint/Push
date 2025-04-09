var $treeUnitItems;
function buildUnitTree() {
    $.post("JsonSelectorHandler.ashx",
    { term: "|" + $currUserId + ",groupandunit_tree," },
        function (res) {

            $treeUnitItems = res;
            $('#formSelectp').css('width', '361px');
            $('#formSelectp').draggable({ handle: ".selectp-header" });
            $.fn.zTree.init($("#selectp-part"), { view: { showIcon: false }, callback: { onClick: unitTreeClick} }, $treeUnitItems);
        }, "json"
    );
}
function unitTreeClick(event, treeId, treeNode) {
    var key = treeNode.id.split('|');
    //第一位是部门ID或者分组ID
    var grouporUnitId = key[0];
    if (key[1] != undefined && key[1] != "") {
        //第二位是人员ID
        buildUserList(treeNode.id, "group_user");
    }
    else
        buildUserList(treeNode.id, "unit_user");
}
function buildUserList(f, type) {
    $("#morePartsList").html("");
    $.post("JsonSelectorHandler.ashx",
                { term: f + "," + type },
                    function (res) {
                        for (var i = 0; i < res.length; i++) {
                            var tpName = res[i].value;
                            var split = res[i].id.split(',');
                            var tpId = split[0];
                            var loginId = split[1];
                            var toId = split[2];
                            var toName = split[3];

                            var p = $("<div class='xpdl-widget-part' pid=" + tpId + " pname=" + tpName + " oid=" + toId + " oname=" + toName + " >" + tpName + "<font style='font-weight: normal'>[" + loginId + "]</font></div>");
                            if ($("#morePartsList").html().indexOf(loginId) < 0) {
                                p.appendTo("#morePartsList");
                            }
                            p.click(function () {
                                var a = xpdlActs[curActIndex];
                                if (!a.PartMore) return;
                                if (!checkRule(a)) return;

                                if (!xpdlXml.isExistById(a.Id, "a")) {
                                    addSelActWidget(curActIndex);
                                }
                                var pId = $(this).attr("pid"); var pName = $(this).attr("pname");
                                var oId = $(this).attr("oid"); var oName = $(this).attr("oname");
                                if (!xpdlXml.isExistBySplitIdAndParent(pId, "p", a.Id)) {
                                    var aEle = xpdlXml.getElementById(a.Id, "a");
                                    appendPartElement(aEle, pId, pName, oId, oName, null, 4, "", oId);
                                    addSelPart(curActIndex, pId, pName);
                                }
                            }).hover(function () {
                                $(this).addClass('ui-state-default');
                            }, function () {
                                $(this).removeClass('ui-state-default');
                            });
                            if (type == "group_user") {
                                p.click();
                            }
                        }

                    }, "json"
                );
}

$('#close-part').toggle(function () {
    $('#part').css('display', 'none');
    $('#formSelectp').css("width", "165px");
    $(this).find('img').attr('src', '../../Themes/Images/open-part.gif');
}, function () {
    $('#part').css('display', '');
    $('#formSelectp').css('width', '361px');
    $(this).find('img').attr('src', '../../Themes/Images/close-part.gif');
})

$('.selectp-key').focus(function () {
    if ($(this).val() == '请输入关键字') {
        $(this).val('');
        $(this).css('color', '#000');
    }
}).blur(function () {
    if ($(this).val() == '') {
        $(this).val('请输入关键字');
        $(this).css('color', '#ccc');
    }
})
$('#closePartMore').click(function () {
    $('#formSelectp').hide();

})
    

