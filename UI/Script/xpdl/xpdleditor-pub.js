/**xpdl editor public **/
function buildShapeEntity(type) {
    if (type == "point") {
        return { x: 0, y: 0 };
    }
    else if (type == "line") {
        return { x1: 0, y1: 0, x2: 0, y2: 0 };
    }
}
var XPDL_TYPE = {
    process: "prc",
    activity: "act",
    transition: "tran",
    participant: "part",
    block: "block"
};
var XPDL_STYLE = {
    APP_HIDE_X: -9999, //隐藏坐标
    ACT_C: 'rgba(229, 229, 229, 1)',
    ACT_HL_C: 'rgba(178, 178, 178, 0.5)', //高亮
    ACT_START_C: 'rgba(193, 244, 193, 1)',
    ACT_END_C: 'rgba(232, 155, 155, 1)',
    ACT_FOCUS_C: 'rgba(247, 155, 69, 0.8)',
    ACT_BLOCK_C: 'rgba(192, 214, 237, 1)',
    ACT_WH: { w: 60, h: 40 },
    ACT_END_WH: { w: 40, h: 40 },
    ACT_ICO: $appCtx.appPath + "/themes/images/ico_activity.gif",
    ACT_START_ICO: $appCtx.appPath + "/themes/images/ico_act_start.png",
    ACT_END_ICO: $appCtx.appPath + "/themes/images/ico_act_end.png",
    ACT_BLOCK_ICO: $appCtx.appPath + "/themes/images/ico_blockactivity.gif",
    TRAN_WIDTH:2.2,
    TRAN_C: 'rgba(153, 153, 153,1)', //迁移颜色
    TRAN_COND_C: '',
    TRAN_EXP_C: '',
    PART_DRAGBAR_C: 'rgba(229, 229,96, 0.3)',
    PART_DRAGBAR_H: 40,
    ARROW_C: 'rgba(102, 102,102, 1)',
    SP_C: 'rgba(204, 204,204, 1)',
    GRIDLINE_C: 'rgba(229, 229, 229,1)',
    PART_BORDER_C: 'rgba(204, 204, 204, 1)',
    CONST_LANE_WIDTH: 160,
    CONST_LANE_ACT_SPACE: 8, //环节和泳道的间隔
    CONST_SRC_POINT_R: 5 //源点半径
};
var XPDL_MSG = {
    ACT_MOVE: "act_move",
    ACT_DRAG_START: "act_drag_start",
    ACT_DRAG_END: "act_drag_end",
    ARROW_DRAG_START: "arrow_drag_start",
    ARROW_DRAG_END: "arrow_drag_end",
    ARROW_MOVE: "arrow_move",
    SP_DRAG_START: "sp_drag_start",
    SP_DRAG_END: "sp_drag_end",
    SP_MOVE: "sp_move"
};
var PARTBAR_DRAG_ID = {
    PART_DRAG_BAR: "part_drag_bar",
    PART_DRAG_LEFT: "part_drag_left",
    PART_DRAG_RIGHT: "part_drag_right"
}
function buildXPDLEntity(type) {

}
function isInsideRectangle(area, x, y) {
    if (x >= area.x
            && x <= (area.x + area.width)
            && y >= area.y
            && y <= (area.y + area.height)
        ) {
        return true;
    }
    return false;
}
function movePos(source, n, m) {
    n = n < 0 ? 0 : (n > source.length - 1 ? source.length - 1 : n);
    m = m < 0 ? 0 : (m > source.length - 1 ? source.length - 1 : m);
    if (n === m) {
        return source;
    }
    else {
        if (n > m){
            var temp = [source[m], source[m] = source[n]][0];  
            for (var i = m + 1; i <= n; i++) {
                temp = [source[i], source[i] = temp][0];
            }
        }
        else {  
            var temp = [source[m], source[m] = source[n]][0];
            for (var i = m - 1; i >= n; i--) {
                temp = [source[i], source[i] = temp][0];
            }
        }
        return source;
    }
}
function buildArrow(fromPoint, toPoint, width, height) {
    var theta = 0, sint = 0, cost = 0;
    theta = Math.atan2(fromPoint.y - toPoint.y, fromPoint.x - toPoint.x);
    sint = Math.sin(theta);
    cost = Math.cos(theta);

    var pt3 = buildShapeEntity("point");
    var pt4 = buildShapeEntity("point");

    pt3.x = toPoint.x + (width * cost - height * sint);
    pt3.y = toPoint.y + (width * sint + height * cost);

    pt4.x = toPoint.x + (width * cost + height * sint);
    pt4.y = toPoint.y + (width * sint - height * cost);

    var result = [];
    result.push([toPoint.x, toPoint.y]);
    result.push([pt3.x, pt3.y]);
    result.push([pt4.x, pt4.y]);
    return result;
}
function moveScroll(x, y) {
    var w = $("#xpdlContainer").width();
    var h = $("#xpdlContainer").height();

    var l = $("#xpdlContainer").scrollLeft();
    var t = $("#xpdlContainer").scrollTop();
    var test = {
        x: l,
        y: t,
        width: w,
        height: h
    };
    var inArea = isInsideRectangle(test, x, y) && isInsideRectangle(test, x + $xpdlBuilder.actWidth, y + $xpdlBuilder.actHeight);
    if (!inArea) {
        $("#xpdlContainer").scrollLeft(x - w / 2);
        $("#xpdlContainer").scrollTop(y - h / 2);
    }
}

function debugText(c) {
    document.getElementById("debugText").innerHTML = c;
}
function handleStartSPDrag(ep) {
    $xpdlBuilder.dragSPShape = ep.dragSPShape;
}
function handleSPMove(ep) {
    if ($xpdlBuilder.dragSPShape == null) return;

    var fp = buildShapeEntity('point');
    fp.x = $xpdlBuilder.dragSPShape.style.x;
    fp.y = $xpdlBuilder.dragSPShape.style.y;
    var tranShape = $xpdlBuilder.dragSPShape.tranShape;
    var toShape = tranShape.getToShape();
    var directLine = buildShapeEntity("line");
    var toCenter = toShape.getCenter();
    directLine.x1 = fp.x;
    directLine.y1 = fp.y;
    directLine.x2 = toCenter.x;
    directLine.y2 = toCenter.y;
    var tp = $xpdlBuilder.getFocusPoint(toShape, directLine);
    var line = $xpdlBuilder.buildLink(fp, tp, null);
    var arrow = $xpdlBuilder.buildTranArrow(fp, tp);
    $xpdlBuilder.zr.modShape(tranShape.id, line);
    $xpdlBuilder.zr.modShape(tranShape.arrowId, arrow);
    $xpdlBuilder.zr.refresh();
}
function handleEndSPMove(ep) {
    var a = $xpdlBuilder.findActShape($xpdlBuilder.mx, $xpdlBuilder.my);
    if (a == null) return;

    var tranShape = ep.dragSPShape.tranShape;

    var update = new TransitionTrans();
    var bag = update.updateDirection(a, tranShape, XPDL_TRAN_DIRECTION.FROM);
    update.exe(bag);
    $xpdlBuilder.makeTranDirection(a, tranShape, XPDL_TRAN_DIRECTION.FROM);
    $xpdlBuilder.zr.refresh();


    /*
    var oldFrom = $xpdlBuilder.getActShape(tranShape.entity.from);
    tranShape.entity.from = a.id; //new id of to

    deleteJsonById(oldFrom.sourceList, tranShape.entity.id);

    var tran = $xpdlBuilder.buildTransition(tranShape.entity);
    var newTranShape = tran[0];
    newTranShape.arrowId = tranShape.arrowId;
    newTranShape.spId = tranShape.spId;

    a.sourceList.push(newTranShape);
    var arrow = $xpdlBuilder.buildTranArrow(newTranShape.fp(), newTranShape.tp());

    var sp = $xpdlBuilder.buildTranSP(newTranShape.fp());

    $xpdlBuilder.zr.modShape(newTranShape.id, newTranShape);
    $xpdlBuilder.zr.modShape(newTranShape.arrowId, arrow);
    $xpdlBuilder.zr.modShape(newTranShape.spId, sp);

    $xpdlBuilder.zr.refresh();
    */
}
function handleStartArrowDrag(ep) {
    $xpdlBuilder.dragArrowShape = ep.dragArrowShape;
}
function handleArrowMove(ep) {
    if ($xpdlBuilder.dragArrowShape == null) return;

    var tranShape = $xpdlBuilder.dragArrowShape.tranShape;
    var fromShape = tranShape.getFromShape();
    var tp = buildShapeEntity('point');
    tp.x = $xpdlBuilder.mx;
    tp.y = $xpdlBuilder.my;

    var directLine = buildShapeEntity("line");
    var fromCenter = fromShape.getCenter();
    directLine.x1 = tp.x;
    directLine.y1 = tp.y;
    directLine.x2 = fromCenter.x;
    directLine.y2 = fromCenter.y;
    var fp = $xpdlBuilder.getFocusPoint(fromShape, directLine);

    var line = $xpdlBuilder.buildLink(fp, tp, null);
    var fp = $xpdlBuilder.buildTranSP(fp);

    $xpdlBuilder.zr.modShape(tranShape.id, line);
    $xpdlBuilder.zr.modShape(tranShape.spId, fp);

    $xpdlBuilder.zr.refresh();
}
function handleEndArrowDrag(ep) {
    var a = $xpdlBuilder.findActShape($xpdlBuilder.mx, $xpdlBuilder.my);
    if (a == null) return;

    var tranShape = ep.dragArrowShape.tranShape;

    var update = new TransitionTrans();
    var bag = update.updateDirection(a, tranShape, XPDL_TRAN_DIRECTION.TO);
    update.exe(bag);
    $xpdlBuilder.makeTranDirection(a, tranShape, XPDL_TRAN_DIRECTION.TO);
    $xpdlBuilder.zr.refresh();
}
function handleStartActDrag(ep) {
    $xpdlBuilder.dragActShape = ep.dragActShape;
}
function handleEndActDrag(ep) {
    $xpdlBuilder.adjustPerformer(ep.dragActShape);
    $xpdlBuilder.adjustLaneWidth();
    $xpdlBuilder.updateActXY(ep.dragActShape);
    $xpdlBuilder.zr.refresh();
}
function handleActMove(eventPacket) {
    if ($xpdlBuilder.dragActShape == null) return;
    moveActivity($xpdlBuilder.dragActShape);
    $xpdlBuilder.zr.refresh();
}
function moveActivity(shape) {
    var arrow = null;
    var srcP = null;
    for (var i = 0; i < shape.sinkList.length; i++) {
        var t = shape.sinkList[i];
        var fromShape = $xpdlBuilder.getActShape(t.from);
        var tran = $xpdlBuilder.buildTransition(t.entity);
        $xpdlBuilder.zr.modShape(t.id, tran[0]);

        arrow = $xpdlBuilder.buildTranArrow(tran[0].fp(), tran[0].tp());
        $xpdlBuilder.zr.modShape(t.arrowId, arrow);

        srcP = $xpdlBuilder.buildTranSP(tran[0].fp());
        $xpdlBuilder.zr.modShape(t.spId, srcP);
    }
    for (var i = 0; i < shape.sourceList.length; i++) {
        var t = shape.sourceList[i];
        var toShape = t.getToShape(); //$xpdlBuilder.getActShape(t.to);
        var tran = $xpdlBuilder.buildTransition(t.entity);
        $xpdlBuilder.zr.modShape(t.id, tran[0]);

        arrow = $xpdlBuilder.buildTranArrow(tran[0].fp(), tran[0].tp());
        $xpdlBuilder.zr.modShape(t.arrowId, arrow);

        srcP = $xpdlBuilder.buildTranSP(tran[0].fp());
        $xpdlBuilder.zr.modShape(t.spId, srcP);
    }
    if (isValidProp(shape.child)) {
        shape.child.move(shape);
    }
}
function isValidProp(p) {
    return p != undefined && p != null && p != "";
}
function initXPDLEditor() {
    var treeSetting = {
        view: {
            showIcon: true, showLine: true
        },
        callback: {
            onClick: xpdlTreeClick
        }
    };
    $.fn.zTree.init($("#xpdlTree"), treeSetting, $inputActs);
    $('#editor-content').layout({
        size: 'auto',
        applyDefaultStyles: true,
        center__paneSelector: "#xpdlContainer",
        west__paneSelector: "#xpdlTreeContainer",
        east__paneSelector: "#xpdlProperty",
        east__size: 280,
        center__maxHeight: 800
    });
    $("#cActivity").draggable({
        helper: 'clone',
        start: startCreate,
        stop: endCreate
    });
    $("#cBlock").draggable({ helper: 'clone',
        start: startCreate,
        stop: endCreate
    });
    $("#cStartAct").draggable({ helper: 'clone',
        start: startCreate,
        stop: endCreate
    });
    $("#cEndAct").draggable({ helper: 'clone',
        start: startCreate,
        stop: endCreate
    });
    $("#cPart").draggable({ helper: 'clone',
        start: startCreate,
        stop: endCreate
    });
}
function startCreate(event, ui) {
    $xpdlBuilder.createXPDLType = event.target.id;
}
function endCreate(event, ui){
    $xpdlBuilder.createXPDLType = null;
}
