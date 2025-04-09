var xpdlXml = null;
var curActIndex = -1;
var $endActId = null;
function initXpdlAct() {
    //判断是不是英文环境
    var isEn = $appCtx.currentLan.indexOf("en") > -1;
    xpdlXml = new KPMSXml();
    xpdlXml.loadXML("<root></root>");
    for (var i = 0; i < xpdlActs.length; i++) {
        var a = xpdlActs[i];
        var $t = null;

        //add by lins on 20150428
        var localaName = a.Name;
        var localpname = a.PartName;
        if (isEn) {
            if (a.LocalizedNames) {
                var jsonLAN = JSON.parse(a.LocalizedNames);
                if (jsonLAN["en"]) {
                    localaName = jsonLAN["en"];
                }
            }
            if (a.PartLocalizedNames) {
                var jsonLPN = JSON.parse(a.PartLocalizedNames);
                if (jsonLPN["en"]) {
                    localpname = jsonLPN["en"];
                }
            }
        }
        //endadd

        if (a.ActType == "End") {
            var endMark = isEn ? "End:" : "结束："; //判断中英文
            $t = $("<div index=" + i + " aid=" + a.Id + " class='xpdl-actend'>" + endMark + localaName + "</div>");
            $endActId = a.Id;
        }
        else {
            var $cls = ""; var $f = "";
            if (a.Orientation == 0) {
                $cls = "xpdl-actblue";
                $f = isEn ? "Send:" : "发送："; //判断中英文
            }
            else {
                $cls = "xpdl-actyellow";
                $f = isEn ? "Back:" : "回退："; //判断中英文
            }
            var $t1 = "<div index=" + i + " aid=" + a.Id + " class='" + $cls + "'>";
            if (a.InstName == "") {
                $t = $($t1 + $f + localaName + "&nbsp;[" + localpname + "]</div>");
            }
            else {
                $t = $($t1 + $f + a.InstName + "</div>");
            }
        }
        $t.appendTo("#actWidget");
    }
}
//绑定步骤选择事件
function bindActClick() {
    $('#actWidget div[index]').click(function () {
        $('#partWidget').html(''); //清空备选人员列表
        var index = $(this).attr("index");
        curActIndex = index;
        var a = xpdlActs[index];
        if (!a.PartMore || a.ActType == "End") { $("#btnMoreParts").hide(); $('#formSelectp').hide(); } //btnMore
        else $("#btnMoreParts").show();
        if (a.ActType == "End") {
            $("#btnSelAllParts").hide();
            $("#spNoPart").text('该步骤为系统处理步骤，不用选择处理人！');
            $("#spNoPart").show();
            if (!checkRule(a)) return;
            $(this).addClass("xpdl-actendbg").siblings().removeClass("xpdl-actbluebg xpdl-actyellowbg");
            addSelActWidget(index);
        }
        else {
            $("#btnSelAllParts").show();
            if (a.Orientation == 1) {
                $(this).addClass("xpdl-actyellowbg").siblings().removeClass("xpdl-actbluebg xpdl-actyellowbg xpdl-actendbg");
            } else {
                $(this).addClass("xpdl-actbluebg").siblings().removeClass("xpdl-actbluebg xpdl-actyellowbg xpdl-actendbg");
            }
            for (var i = 0; i < xpdlParts[index].length; i++) {
                var p = xpdlParts[index][i];
                bindPartToList(index, p, i); //addSelPart(index, p.Id, p.Name);
            }
            //如果对应步骤有人，将选择更多隐藏 Added by Tianhl 20120419
            //            if (xpdlParts[index].length >0) {
            //                $("#btnMoreParts").hide();
            //            }
            //add by lins on 2012/05/02 for:不是结束步骤时显示提示。
            if (xpdlParts[index].length == 0) {
                $("#spNoPart").show();
            }
            else {
                $("#spNoPart").hide();
            }
        }
    });
    if (xpdlActs.length == 1) $('#actWidget div[index=0]').click(); //default
}
//绑定参与人到列表
function bindPartToList(index, p, uIndex) {
    //add by lins on 20150428
    var orgName = "";
    var role = "";
    var orgRole = "";
    if (p.OrgName) {
        orgName = p.OrgName;
    }
    if (p.Role) {
        role = p.Role;
    }
    if (p.LocalizedRole && p.LocalizedRole != "") {
        role = p.LocalizedRole;
    }
    if (p.LocalizedOrgName && p.LocalizedOrgName != "") {
        orgName = p.LocalizedOrgName;
    }

    if (orgName != "" && role != "") {
        orgRole = orgName + "-" + role;
    }
    else if (orgName != "" && role == "") {
        orgRole = orgName;
    }
    else if (orgName == "" && role != "") {
        orgRole = role;
    } //END ADD

    //姓名多语言化
    var partName = p.Name;
    if (p.LocalizedNames && p.LocalizedNames != "") {
        partName = p.LocalizedNames;
    }

    //使用orgName替换div innertext中的p.OrgName
    var $p = $("<div unindex=" + uIndex + " index=" + index + " pid=" + p.Id + " oid=" + p.OrgId + " oname='" + p.OrgName + "' pname=" + p.Name + " localPName='" + p.LocalizedNames + "' gcode=" + p.GroupCode + " t='" + p.Type + "' r='" + p.Role + "' class='xpdl-widget-part'>" + partName + "&nbsp;<font style='font-weight:normal'>" + (orgRole == null ? "" : orgRole) + "</font></div>");
    $p.appendTo("#partWidget");
    $p.hover(function () {
        $(this).addClass('ui-state-default');
    }, function () {
        $(this).removeClass('ui-state-default');
    });
    bindPartClick($p);
    //设置默认选中处理人时，判断没有选择结束步骤时才自动选中 modify by xiedx 170719
    if (xpdlActs[index].AddParts && !xpdlXml.isExistByAttVal("id", $endActId, "a")) $p.click();
}
//绑定参与人选择
function bindPartClick($p) {
    $p.click(function () {
        var actIndex = $(this).attr("index"); //步骤索引
        var uIndex = $(this).attr("unindex");

        var pId = $(this).attr("pid");
        var pName = $(this).attr("pname");
        var pOId = $(this).attr("oid");
        var pOName = $(this).attr("oname");
        var pGCode = $(this).attr("gcode");
        var pT = $(this).attr("t");
        var pR = $(this).attr("r");
        var localPName = $(this).attr("localPName");

        var posUnitId = xpdlParts[actIndex][uIndex].PosUnitId;

        var a = xpdlActs[actIndex];
        if (!checkRule(a)) return;
        if (!xpdlXml.isExistById(a.Id, "a")) {
            addSelActWidget(actIndex);
        }
        if (!xpdlXml.isExistBySplitIdAndParent(pId, "p", a.Id)) {
            var aEle = xpdlXml.getElementById(a.Id, "a");
            appendPartElement(aEle, pId, pName, pOId, pOName, pGCode, pT, pR, posUnitId);

            //选择步骤后，显示为英文
            if (localPName && localPName != "" && localPName != "null") {
                pName = localPName;
            }
            addSelPart(actIndex, pId, pName);
        }
    });
}
function addSelPart(actIndex, pId, pName) {
    var a = xpdlActs[actIndex];
    var $selActsWidget = $("div.xpdl-sel-widget-parts[index=" + actIndex + "]");
    var $selPart = $("<div class='ui-state-default xpdl-sel-widget-part'></div>");
    //weihc 2015-01-27 加粗显示选择的流程步骤处理人
    var $p = $("<div class='xpdl-sel-part' style='color:#000; font-size:14px;'>" + pName + "</div>");
    var $c = $("<span class='ui-icon ui-icon-close'></span>");
    $p.appendTo($selPart); $c.appendTo($selPart);
    $selPart.appendTo($selActsWidget);
    $c.click(function () {//删除参与人
        $(this).parent('.xpdl-sel-widget-part').remove();
        xpdlXml.removeChildNodeByParent(pId, "p", a.Id);
        if ($selActsWidget.children().length == 0) {
            $selActsWidget.parent().remove(); //移除selWidget
            xpdlXml.removeChildNode(a.Id, "a");
        }
    });
}

//添加选择的ActWidget
function addSelActWidget(actIndex) {
    var a = xpdlActs[actIndex];
    appendActElement(a);

    var isEn = $appCtx.currentLan.indexOf("en") > -1;
    var localaName = a.Name;
    if (isEn) {
        if (a.LocalizedNames) {
            var jsonLAN = JSON.parse(a.LocalizedNames);
            if (jsonLAN["en"]) {
                localaName = jsonLAN["en"];
            }
        }
    }

    var $selWidget = $("<div class='xpdl-sel-widget'><div class='xpdl-sel-widget-act'><div class='xpdl-sel-act'>" + localaName + "</div><span class='ui-icon ui-icon-close'></span></div><div index=" + actIndex + " class='xpdl-sel-widget-parts'></div></div>");
    $selWidget.appendTo("#selectedWidget");
    $selWidget.find(".ui-icon-close").click(function () {
        var msg = "确定移除【" + localaName + "】吗？";
        if (isEn)
            msg = "Do you remove【" + localaName + "】?";
        if (!window.confirm(msg)) return;
        $(this).parent().parent(".xpdl-sel-widget").remove();
        xpdlXml.removeChildNode(a.Id, "a");
    });
}
//判断选择步骤约束
function checkRule(a) {
    //如果选择了结束，其他步骤都不能选取
    if (a.ActType == "End") {
        var node = xpdlXml.selectSingleNode("//a");
        if (node != null) {
            if (node.getAttribute("id") != a.Id) {
                alert("对不起，不能选择【结束】步骤，请您先移除其他步骤！");
            }
            return false;
        }
    } else {
        if (xpdlXml.isExistByAttVal("id", $endActId, "a")) {
            alert("对不起，您已经选择了【结束】步骤！");
            return false;
        }
    }
    //只能选择或只能存在一个返回步骤
    if (a.Orientation == 0) {
        if (xpdlXml.isExistByAttVal("o", "1", "a")
        || xpdlXml.isExistByAttVal("o", "2", "a")) {
            alert("对不起，您已经选择返回步骤，不能再选择其他步骤！");
            return false;
        }
        if (xpdlCur.ChoiceMode == 0) {//check onlyone
            var node = xpdlXml.selectSingleNode("//a");
            if (node != null && node.getAttribute("id") != a.Id) {
                alert("对不起，您只能选择一个步骤！");
                return false;
            }
        }
    } else {
        var node = xpdlXml.selectSingleNode("//a");
        if (node != null && node.getAttribute("id") != a.Id) {//不是同一个回退
            alert("对不起，您只能选择一个返回步骤！");
            return false;
        }
    }
    return true;
}
//校验选择
function checkXpdlSel() {
    if (xpdlCur.ChoiceMode == 0) {//onlyone
    }
    else if (xpdlCur.ChoiceMode == 1) {//all
        if (xpdlXml.isExistByAttVal("o", "1", "a")
        || xpdlXml.isExistByAttVal("o", "2", "a")
        || xpdlXml.isExistByAttVal("id", $endActId, "a")) {
            //return true;
        } else {
            for (var i = 0; i < xpdlActs.length; i++) {
                var a = xpdlActs[i];
                if (a.Orientation != 0) continue;
                if (a.ActType == "End") continue;
                if (!xpdlXml.isExistById(a.Id, "a")) {
                    alert("对不起，您必须选择所有发送步骤！");
                    return false;
                }
            }
        }
        $('#formSelectp').hide('slide'); //close moreperson div
    }
    else if (xpdlCur.ChoiceMode == 2) {//any
    }
    else if (xpdlCur.ChoiceMode == 3) {//specified
    }
    if (xpdlXml.selectSingleNode("//a") == null) {
        alert("提示：请至少选择一个步骤！");
        return false;
    }
    //weihc 2015-01-27 去掉点击发送时的提示
    //if (!window.confirm("您确定发送吗？")) return false;
    $("#hiXpdlXml").val(xpdlXml.xml());
    return true;
}
//选择所有参与人
function selAllParts() {
    var a = xpdlActs[curActIndex];
    if (!checkRule(a)) return;
    for (var i = 0; i < xpdlParts[curActIndex].length; i++) {
        var a = xpdlActs[curActIndex];
        var p = xpdlParts[curActIndex][i];
        var pId = p.Id;
        var pName = p.Name;
        var pOId = p.OrgId;
        var pOName = p.OrgName;
        var gCode = p.GroupCode;
        var pT = p.Type;
        var pR = p.Role;
        var localPName = p.LocalizedNames;
        var posUnitId = p.PosUnitId;

        if (!xpdlXml.isExistById(a.Id, "a")) {
            addSelActWidget(curActIndex);
        }
        if (!xpdlXml.isExistBySplitIdAndParent(pId, "p", a.Id)) {
            var aEle = xpdlXml.getElementById(a.Id, "a");
            appendPartElement(aEle, pId, pName, pOId, pOName, gCode, pT, pR, posUnitId);

            //选择步骤后，显示为英文
            if (localPName && localPName != "") {
                pName = localPName;
            }
            addSelPart(curActIndex, pId, pName);
        }
    }
}
//获取更多参与人
function getMoreParts() {
    if (curActIndex == -1) { alert("提示：请先选择一个步骤！"); return; }

    var param = new InputParamObject("m");
    if (getUsers("hiPartsXml", param, null) == null) return;
    var partsXml = new KPMSXml();
    partsXml.loadXML($("#hiPartsXml").val());

    var a = xpdlActs[curActIndex];
    if (!checkRule(a)) return;

    var nodes = partsXml.getElementsByTagName("o");
    for (var i = 0; i < nodes.length; i++) {
        var pId = nodes[i].getAttribute("id");
        var pName = nodes[i].getAttribute("name");
        var pOId = nodes[i].getAttribute("att3");
        var pOName = nodes[i].getAttribute("att4");
        if (pOId == null) {
            pOId = nodes[i].getAttribute("OrganizationId");
            pOName = nodes[i].getAttribute("OrganizationName");
        }
        if (!xpdlXml.isExistById(a.Id, "a")) {
            addSelActWidget(curActIndex);
        }
        if (!xpdlXml.isExistBySplitIdAndParent(pId, "p", a.Id)) {
            var aEle = xpdlXml.getElementById(a.Id, "a");
            appendPartElement(aEle, pId, pName, pOId, pOName, null, 4, "", "");
            addSelPart(curActIndex, pId, pName);
        }
    }
}

//附加Act
function appendActElement(a) {
    var root = xpdlXml.selectSingleNode("root");
    var aEle = xpdlXml.createElement("a");
    var attId = xpdlXml.createAttribute("id");
    attId.value = a.Id;
    aEle.setAttributeNode(attId);
    var attName = xpdlXml.createAttribute("name");
    attName.value = a.Name;
    aEle.setAttributeNode(attName);
    var attPn = xpdlXml.createAttribute("pn");
    attPn.value = a.PartName;
    aEle.setAttributeNode(attPn);
    var attCm = xpdlXml.createAttribute("cm");
    attCm.value = a.ChoiceMode;
    aEle.setAttributeNode(attCm);
    var attO = xpdlXml.createAttribute("o");
    attO.value = a.Orientation;
    aEle.setAttributeNode(attO);
    var attPer = xpdlXml.createAttribute("per");
    if (a.Performer == null)
        attPer.value = "";
    else
        attPer.value = a.Performer;
    aEle.setAttributeNode(attPer);
    var attPm = xpdlXml.createAttribute("pm");
    attPm.value = a.PartMore;
    aEle.setAttributeNode(attPm);
    root.appendChild(aEle);
}
//附加参与人
function appendPartElement(a, pid, pname, poid, poname, gcode, t, r, posUnitId) {
    var pEle = xpdlXml.createElement("p");
    var attId = xpdlXml.createAttribute("id");
    var attName = xpdlXml.createAttribute("name");
    var attOId = xpdlXml.createAttribute("oid");
    var attOname = xpdlXml.createAttribute("oname");
    var attGcode = xpdlXml.createAttribute("gcode");
    var attType = xpdlXml.createAttribute("t");
    var attR = xpdlXml.createAttribute("r");
    var attPUId = xpdlXml.createAttribute("punitid");

    attId.value = pid;
    attName.value = pname;
    //当poid、poname为null时报脚本错误
    //添加是否为null的判断  add by xuning 20150316
    if (poid == null)
        attOId.value = "";
    else
        attOId.value = poid;
    if (poname == null)
        attOname.value = "";
    else
        attOname.value = poname;
    //    attOId.value = poid;
    //    attOname.value = poname;
    if (gcode == null)
        attGcode.value = "";
    else
        attGcode.value = gcode;
    attType.value = t;

    if (r == null)
        attR.value = "";
    else attR.value = r;

    if (posUnitId == null)
        attPUId.value = "";
    else attPUId.value = posUnitId;


    pEle.setAttributeNode(attId);
    pEle.setAttributeNode(attName);
    pEle.setAttributeNode(attOId);
    pEle.setAttributeNode(attOname);
    pEle.setAttributeNode(attGcode);
    pEle.setAttributeNode(attType);
    pEle.setAttributeNode(attR);
    pEle.setAttributeNode(attPUId);


    a.appendChild(pEle);
}