var myMessageCenter = {};
function XPDLMgr(zr) {
    this.partsShape = []; //存储参与人shape
    this.actsShape = []; //存储环节shape
    this.transShape = []; //迁移shape
    this.zr = zr;
 
    this.scopeId = null;
    this.gridLineZLevel = 0;
    this.partZLevel = 0;
    this.partBarZLevel = 1; 
    this.actZLevel = 2;
    this.tranZLevel = 2;
    this.arrowZLevel = 2;
    this.srcPointZLevel = 2;

    this.dragActShape = null; //Activity拖拽对象
    this.dragArrowShape = null;
    this.dragSPShape = null;

    this.focusActShape = null; //当前焦点步骤
    this.selectedEntity = null;//

    this.createXPDLType = null; //新建xpdl元素类型

    this.mx = 0; //鼠标移动X
    this.my = 0; //鼠标移动Y

    this.actionType = 1; //1:read,2:create,3:update,4:delete
    this.canDrag = false; //用户是否可拖动元素

    this.zrEvent = require('../../ui/script/zrender/src/tool/event');
    this.zrEvent.Dispatcher.call(myMessageCenter);

    myMessageCenter.bind(
    XPDL_MSG.ACT_MOVE,
    handleActMove); //this发生变化，需要global function

    myMessageCenter.bind(
    XPDL_MSG.ACT_DRAG_START,
    handleStartActDrag);

    myMessageCenter.bind(
    XPDL_MSG.ACT_DRAG_END,
    handleEndActDrag);

    myMessageCenter.bind(
    XPDL_MSG.ARROW_MOVE,
    handleArrowMove);

    myMessageCenter.bind(
    XPDL_MSG.ARROW_DRAG_START,
    handleStartArrowDrag);

    myMessageCenter.bind(
    XPDL_MSG.ARROW_DRAG_END,
    handleEndArrowDrag);

    myMessageCenter.bind(
    XPDL_MSG.SP_DRAG_START,
    handleStartSPDrag);

    myMessageCenter.bind(
    XPDL_MSG.SP_MOVE,
    handleSPMove);

    myMessageCenter.bind(
    XPDL_MSG.SP_DRAG_START,
    handleStartSPDrag);

    myMessageCenter.bind(
    XPDL_MSG.SP_DRAG_END,
    handleEndSPMove);

    this.config = require('../../ui/script/zrender/src/config');
    this.zr.on(this.config.EVENT.MOUSEMOVE, this.globalMouseMove);
    this.zr.on(this.config.EVENT.MOUSEUP, this.globalMouseUp);
}
XPDLMgr.prototype.globalMouseMove = function (ep) {
    $xpdlBuilder.mx = $xpdlBuilder.zrEvent.getX(ep.event);
    $xpdlBuilder.my = $xpdlBuilder.zrEvent.getY(ep.event);
    //debugText("X:"+ $xpdlBuilder.mx+"Y:"+ $xpdlBuilder.my);
    myMessageCenter.dispatch(
        XPDL_MSG.ACT_MOVE,
        'event', {}
    );
}
XPDLMgr.prototype.globalMouseUp = function (ep) {
    $xpdlBuilder.createXPDLElement(ep);
}
XPDLMgr.prototype.getFocusPoint = function (rect, line) {
    var tempPoint = buildShapeEntity("point");
    var test = {
        x: (line.x1 <= line.x2) ? line.x1 : line.x2,
        y: (line.y1 <= line.y2) ? line.y1 : line.y2,
        width: Math.abs(line.x1 - line.x2),
        height: Math.abs(line.y1 - line.y2)

    }
    //Left
    var y = 0;
    y = (rect.getLeft() - line.x1) / (line.x2 - line.x1) * (line.y2 - line.y1) + line.y1;
    tempPoint.x = rect.getLeft();
    tempPoint.y = y;

    var r = isInsideRectangle(
            test,
            tempPoint.x,
             tempPoint.y

    );
    if (y >= rect.getTop() && y <= rect.getBottom() && r) {
        return tempPoint;
    }
    //Top
    var x = 0;
    x = (rect.getTop() - line.y1) / (line.y2 - line.y1) * (line.x2 - line.x1) + line.x1;
    tempPoint.x = x;
    tempPoint.y = rect.getTop();

    var r = isInsideRectangle(
            test,
            tempPoint.x,
             tempPoint.y

    );
    if (x >= rect.getLeft() && x <= rect.getRight() && r) {
        return tempPoint;
    }
    //Right
    y = 0;
    y = (rect.getRight() - line.x1) / (line.x2 - line.x1) * (line.y2 - line.y1) + line.y1;
    tempPoint.x = rect.getRight();
    tempPoint.y = y;

    var r = isInsideRectangle(
            test,
            tempPoint.x,
            tempPoint.y

    );
    if (y >= rect.getTop() && y <= rect.getBottom() && r) {
        return tempPoint;
    }
    //Bottom
    x = 0;
    x = (rect.getBottom() - line.y1) / (line.y2 - line.y1) * (line.x2 - line.x1) + line.x1;
    tempPoint.x = x;
    tempPoint.y = rect.getBottom();

    var r = isInsideRectangle(
            test,
            tempPoint.x,
            tempPoint.y

    );

    if (x >= rect.getLeft() && x <= rect.getRight() && r) {
        return tempPoint;
    }

    return tempPoint;
}

XPDLMgr.prototype.getId = function (type) {
    var date = new Date();
    var ticket = date.getTime();
    switch (type) {
        case XPDL_TYPE.activity:
            return XPDL_TYPE.activity + "_" + ticket.toString();
        case XPDL_TYPE.transition:
            return XPDL_TYPE.transition + "_" + ticket.toString();
        case XPDL_TYPE.block:
            return XPDL_TYPE.block + "_" + ticket.toString();
        case XPDL_TYPE.participant:
            return XPDL_TYPE.participant + "_" + ticket.toString();
        default:
            return this.zr.newShapeId(type);
    }
}
XPDLMgr.prototype.createBase = function () {
    var o = { id: "", name: "", shape: null,
        getLeft: function () { return this.shape.style.x },
        getTop: function () { return this.shape.style.y },
        getRight: function () { return this.getLeft() + this.shape.style.width },
        getBottom: function () { return this.getTop() + this.shape.style.height },
        getCenter: getCenterImpl
    };
    return o;
}
function getCenterImpl() {
    var point = buildShapeEntity("point");
    point.x = this.getLeft() + this.style.width / 2;
    point.y = this.getTop() + this.style.height / 2;
    return point;
}
XPDLMgr.prototype.findActShape = function (x, y) {
    for (var i = 0; i < this.actsShape.length; i++) {
        if (isInsideRectangle(this.actsShape[i].style, x, y))
            return this.actsShape[i];
    }
    return null;
}
XPDLMgr.prototype.getPartShape = function (partId) {
    for (var i = 0; i < this.partsShape.length; i++) {
        if (this.partsShape[i].id == partId) {
            return this.partsShape[i];
        }
    }
}
XPDLMgr.prototype.getActShape = function (actId) {
    for (var i = 0; i < this.actsShape.length; i++) {
        if (this.actsShape[i].id == actId) {
            return this.actsShape[i];
        }
    }
}
XPDLMgr.prototype.getTranShape = function (tranId) {
    for (var i = 0; i < this.transShape.length; i++) {
        if (this.transShape[i].id == tranId) {
            return this.transShape[i];
        }
    }
}
XPDLMgr.prototype.getActEntity = function (acts, id) {
    var a = null;
    for (var i = 0; i < acts.length; i++) {
        if (acts[i].id == id) {
            a = acts[i];
        }
        else {
            if (acts[i].children != undefined) {
                a = this.getActEntity(acts[i].children, id);
            }
        }
        if (a != null) break;
    }
    return a;
}
XPDLMgr.prototype.getArrowId = function (tranId) {
    return tranId + "arrow";
}
XPDLMgr.prototype.getspId = function (tranId) {
    return tranId + "sp";
}
XPDLMgr.prototype.addTransition = function (entity) {
    var result = this.buildTransition(entity);
    var trShape = result[0];

    result[1].sourceList.push(trShape);
    result[2].sinkList.push(trShape);


    var arrow = this.addTranArrow(trShape);
    arrow.id = this.getArrowId(trShape.id);
    arrow.tranShape = trShape;

    var sp = this.addTranSP(trShape);
    sp.id = this.getspId(trShape.id);
    sp.tranShape = trShape;

    trShape.arrowId = arrow.id;
    trShape.spId = sp.id;

    this.transShape.push(trShape);
    this.zr.addShape(trShape);
    this.zr.addShape(arrow);
    this.zr.addShape(sp);
}
XPDLMgr.prototype.buildTransition = function (entity) {
    var id = entity.id;
    var name = entity.name;
    var from = entity.from;
    var to = entity.to;

    var fromShape = this.getActShape(from);
    var toShape = this.getActShape(to);
    var points = entity.points;

    var directLine = buildShapeEntity("line");
    var fromCenter = fromShape.getCenter();
    var toCenter = toShape.getCenter();
    directLine.x1 = fromCenter.x;
    directLine.y1 = fromCenter.y;
    directLine.x2 = toCenter.x;
    directLine.y2 = toCenter.y;

    var fromPoint = this.getFocusPoint(fromShape, directLine);
    var toPoint = this.getFocusPoint(toShape, directLine);
    var trShape = this.buildLink(fromPoint, toPoint, points);
    trShape.entity = entity;
    trShape.id = id;
    trShape.name = name == null ? "迁移" + trShape.id : name;
    return [trShape, fromShape, toShape];
}
XPDLMgr.prototype.buildLink = function (fromPoint, toPoint, points) {
    var shape = {
        shape: 'line',
        zlevel: this.tranZLevel,
        entity: null,
        style: {
            xStart: fromPoint.x,
            yStart: fromPoint.y,
            xEnd: toPoint.x,
            yEnd: toPoint.y,
            strokeColor: XPDL_STYLE.TRAN_C,
            lineWidth: XPDL_STYLE.TRAN_WIDTH
        },
        draggable: false,
        name: "",
        fp: function () { return { x: this.style.xStart, y: this.style.yStart }; },
        tp: function () { return { x: this.style.xEnd, y: this.style.yEnd }; },
        getToShape: function () {
            return $xpdlBuilder.getActShape(this.entity.to);
        },
        getFromShape: function () {
            return $xpdlBuilder.getActShape(this.entity.from);
        },
        points: points,
        arrowId: "",
        spId: ""
    }
    return shape;
}
XPDLMgr.prototype.addTranArrow = function (tr) {
    var arrow = this.buildTranArrow(tr.fp(), tr.tp());
    arrow.zlevel = this.arrowZLevel;
    return arrow;
}
XPDLMgr.prototype.buildTranArrow = function (fromPoint, toPoint) {
    var points = buildArrow(fromPoint, toPoint, 10, 4);
    var s = {
        zlevel: this.arrowZLevel,
        shape: 'polygon',
        tranShape: null,
        style: {
            pointList: points,
            color: XPDL_STYLE.ARROW_C
        },
        draggable: this.canDrag,
        ondragstart: XPDLMgr.prototype.onArrowDragStart,
        ondragend: XPDLMgr.prototype.onArrowDragEnd,
        ondrift: function (shape, dx, dy) {
            var tp = buildShapeEntity('point');
            tp.x = $xpdlBuilder.mx;
            tp.y = $xpdlBuilder.my;
            var a = $xpdlBuilder.buildTranArrow(shape.tranShape.fp(), tp);

            myMessageCenter.dispatch(
            XPDL_MSG.ARROW_MOVE,
            'event', {});

            $xpdlBuilder.zr.modShape(shape.id, a);
            //$xpdlBuilder.zr.refresh(); 统一刷新                    
            return true;
        }
    };
    return s;
}
XPDLMgr.prototype.onArrowDragStart = function (params) {
    myMessageCenter.dispatch(
        XPDL_MSG.ARROW_DRAG_START,
        'event',
        { dragArrowShape: params.target, dragevent: params.event }
    );
}
XPDLMgr.prototype.onArrowDragEnd = function (params) {
    $xpdlBuilder.dragArrowShape = null;
    myMessageCenter.dispatch(
        XPDL_MSG.ARROW_DRAG_END,
        'event',
        { dragArrowShape: params.target, dragevent: params.event }
    );
}
XPDLMgr.prototype.addTranSP = function (trShape) {
    var p = this.buildTranSP(trShape.fp());
    p.zlevel = this.srcPointZLevel;
    return p;
}
XPDLMgr.prototype.buildTranSP = function (point) {
    var s = {
        shape: 'circle',
        style: {
            x: point.x,
            y: point.y,
            r: XPDL_STYLE.CONST_SRC_POINT_R,
            color: XPDL_STYLE.SP_C
        },
        draggable: this.canDrag,
        tranShape: null,
        ondragstart: function (params) {
            myMessageCenter.dispatch(
                XPDL_MSG.SP_DRAG_START,
                'event',
                { dragSPShape: params.target, dragevent: params.event }
                );
        },
        ondragend: function (params) {
            $xpdlBuilder.dragSPShape = null;
            myMessageCenter.dispatch(
                XPDL_MSG.SP_DRAG_END,
                'event',
                { dragSPShape: params.target, dragevent: params.event }
                );
        },
        ondrift: function (shape, dx, dy) {
            shape.style.x += dx;
            shape.style.y += dy;

            myMessageCenter.dispatch(
                    XPDL_MSG.SP_MOVE,
                    'event', {});

            $xpdlBuilder.zr.modShape(shape.id, shape);
            //$xpdlBuilder.zr.refresh();
            return true;
        }
    };
    return s;
}
XPDLMgr.prototype.addParticipant = function (id, name, index) {

    name = name == null ? id : name;

    var partX = 0;
    partX = index * XPDL_STYLE.CONST_LANE_WIDTH;

    var shape = {
        shape: 'rectangle',
        zlevel: this.partZLevel,
        id: id,
        index: index,
        style: {
            x: partX,
            y: 0,
            width: XPDL_STYLE.CONST_LANE_WIDTH,
            height: 3000,
            lineWidth: 1,
            color: 'rgba(247, 246, 244, 0.1)',
            strokeColor: XPDL_STYLE.PART_BORDER_C,
            brushType: 'both',
            text: name,
            textPosition: 'specific',
            textColor: 'black',
            textFont: 'bold 12px verdana',
            textAlign: 'center',
            textX: partX + XPDL_STYLE.CONST_LANE_WIDTH / 2,
            textY: 7
        },
        highlightStyle: {
            lineWidth: 0,
            brushType: 'fill',
            opacity: 0.2,
            color: 'orange'
        },
        getLeft: function () { return this.style.x },
        getTop: function () { return this.style.y },
        getRight: function () { return this.getLeft() + this.style.width },
        getBottom: function () { return this.getTop() + this.style.height },
        onmouseover: function (ep) {
            if ($xpdlBuilder.my <= XPDL_STYLE.PART_DRAGBAR_H) {
                $xpdlBuilder.showPartBar(ep.target);
            }
            else { $xpdlBuilder.hidePartBar(); }
        },
        draggable: false
    };

    this.partsShape.push(shape);
    this.zr.addShape(shape);
    return shape;
}
XPDLMgr.prototype.addActivity = function (entity) {
    var actShape = this.buildActivityShape(entity);
    this.actsShape.push(actShape);
    this.zr.addShape(actShape);
    if (isValidProp(actShape.child)) {
        this.zr.addShape(actShape.child);
    }
}
XPDLMgr.prototype.buildActivityShape = function (entity) {//id, name, x, y, p,t
    var id = entity.id;
    var name = entity.name;
    name = name == null ? id : name;
    var part = this.getPartShape(entity.performer);
    var x = part.getLeft() + entity.x; //偏移
    var s = {
        shape: 'rectangle',
        name: name,
        id: id,
        zlevel: this.actZLevel,
        entity: entity,
        style: {
            x: x,
            y: entity.y,
            width: XPDL_STYLE.ACT_WH.w,
            height: XPDL_STYLE.ACT_WH.h,
            text: name,
            textPosition: 'bottom',
            textColor: 'black',
            textFont: 'bold 12px verdana'
        },
        highlightStyle: {
            lineWidth: 2,
            color: XPDL_STYLE.ACT_HL_C
        },
        draggable: this.canDrag,
        sinkList: [],
        sourceList: [],
        child: "",
        getLeft: function () { return this.style.x },
        getTop: function () { return this.style.y },
        getRight: function () { return this.getLeft() + this.style.width },
        getBottom: function () { return this.getTop() + this.style.height },
        getCenter: getCenterImpl,
        ondragstart: XPDLMgr.prototype.onActDragStart,
        ondragend: XPDLMgr.prototype.onActDragEnd,
        ondrift: function (shape, dx, dy) {
            shape.style.x += dx;
            shape.style.y += dy;
            return true;
        },
        onmousedown: function (ep) {
            $xpdlBuilder.focusOn(ep.target.entity);
            $xpdlBuilder.showProperty(ep.target.id);
        }
    }
    var style = this.getACT_STYLE(s);
    s.style.color = style.color;
    s.style.width = style.width;
    s.style.height = style.height;
    s.child = style.ico;
    return s;
}
XPDLMgr.prototype.getACT_STYLE = function (shape) {
    var r = { color: "", width: XPDL_STYLE.ACT_WH.w, height: XPDL_STYLE.ACT_WH.h, ico: "" };
    var t = shape.entity.type;

    var ico = {
        shape: 'image',
        id: shape.entity.id + "ico",
        zlevel: this.actZLevel,
        style: {
            x: shape.style.x,
            y: shape.style.y,
            image: XPDL_STYLE.ACT_ICO,
            width: 16,
            height: 16
        },
        draggable: false,
        move: function (parentShape) {
            $xpdlBuilder.zr.modShape(
                parentShape.child.id,
                { style: { x: parentShape.style.x, y: parentShape.style.y} }
            );
        }
    };
    if (isValidProp(this.selectedEntity)
    && shape.id == this.selectedEntity.id) {
        r.color = XPDL_STYLE.ACT_FOCUS_C;
    }
    else {
        if (t == 'Implementation') {
            if (shape.entity.isstart) {
                r.color = XPDL_STYLE.ACT_START_C;
                ico.style.image = XPDL_STYLE.ACT_START_ICO;
            }
            else if (shape.entity.isend) {
                r.color = XPDL_STYLE.ACT_END_C;
                r.width = XPDL_STYLE.ACT_END_WH.w;
                r.height = XPDL_STYLE.ACT_END_WH.h;
                ico.style.image = XPDL_STYLE.ACT_END_ICO;
            }
            else {
                r.color = XPDL_STYLE.ACT_C;
            }
        }
        else if (t == 'BlockActivity') {
            r.color = XPDL_STYLE.ACT_BLOCK_C;
            ico.style.image = XPDL_STYLE.ACT_BLOCK_ICO;
        }
    }
    r.ico = ico;
    return r;
}
XPDLMgr.prototype.onActDragStart = function (params) {
    myMessageCenter.dispatch(
        XPDL_MSG.ACT_DRAG_START,
        'event',
        { dragActShape: params.target, dragevent: params.event }
    );
}
XPDLMgr.prototype.onActDragEnd = function (params) {
    $xpdlBuilder.dragActShape = null;

    myMessageCenter.dispatch(
       XPDL_MSG.ACT_DRAG_END,
        'event',
        { dragActShape: params.target, dragevent: params.event }
    );
}
XPDLMgr.prototype.clearXPDL = function () {
    this.partsShape = [];
    this.actsShape = [];
    this.transShape = [];
    this.zr.clear();
}
XPDLMgr.prototype.getChildren = function (e, key) {
    var child = null;
    for (var i = 0; i < e.length; i++) {
        if (e[i].id == key) {
            child = e[i].children;
        }
        else {
            if (e[i].children != undefined) {
                child = this.getChildren(e[i].children, key);
            }
        }
        if (child != null) break;
    }
    return child;
}
XPDLMgr.prototype.getParent = function (e, childId) {
    if (childId == $wfId) return $wfId;
    var c = null; var p = null;
    c = e.children;
    if (c == undefined) return null;
    for (var j = 0; j < c.length; j++) {
        if (c[j].id == childId) {
            p = e.id;
        }
        else {
            if (c[j].children != undefined) {
                p = this.getParent(c[j], childId);
            }
        }
        if (p != null) break;
    }

    return p;
}
XPDLMgr.prototype.focusOn = function (entity) {
    var c = null;
    var old = this.selectedEntity;
    this.selectedEntity = entity;
    if (old != null) {
        if (old.type == "Implementation" || old.type == "BlockActivity") {

            c = this.getACT_STYLE(this.getActShape(old.id));
            this.zr.modShape(old.id, {
                style: {
                    color: c.color
                }
            });
        }
    }
    var selShape = this.getActShape(this.selectedEntity.id);
    c = this.getACT_STYLE(selShape);
    this.zr.modShape(this.selectedEntity.id, {
        style: {
            color: c.color
        }
    });
    this.zr.refresh();
    return selShape;
}
XPDLMgr.prototype.adjustLaneWidth = function (pIndex) {//调节泳道宽度
    var partShape = null;
    var index = 0;
    if (pIndex != undefined) index = pIndex;

    var d = 0, width = 0;
    for (var p = index; p < this.partsOrder.length; p++) {
        partShape = this.getPartShape(this.partsOrder[p]);

        d = this.getRightmost(partShape, this.actsEntity);

        if (d != null) {
            width = partShape.style.width + d;
            if (width < XPDL_STYLE.CONST_LANE_WIDTH) {//小于标准宽度
                d = d + (XPDL_STYLE.CONST_LANE_WIDTH - width); //重新计算移动距离
                width = XPDL_STYLE.CONST_LANE_WIDTH;
            }
            partShape.style.width = width;
        }
        else {//泳道不存在环节
            d = XPDL_STYLE.CONST_LANE_WIDTH - partShape.style.width;
            partShape.style.width = XPDL_STYLE.CONST_LANE_WIDTH;
        }
        partShape.style.textX = partShape.style.x + partShape.style.width / 2; //重新计算文本位置 
        this.zr.modShape(partShape.id, partShape);
        if (p  < this.partsOrder.length - 1 ) {//最后一个lane不用调整
            this.adjustOtherLane(p + 1,  d);
        }
    }
}

XPDLMgr.prototype.adjustOtherLane = function (sIndex, d) {//[lane,act,tran] to adjust
    var parts = this.partsOrder;
    var acts = this.actsEntity;
    var partShape = null;
    for (var i = sIndex; i < parts.length; i++) {
        partShape = this.getPartShape(parts[i]);
        if (d != 0) {
            partShape.style.x += d; //lane move
        } else {  //新建泳道，泳道已经调整完毕，此时d为0。           
            var beforeIndex = sIndex - 1;
            if (beforeIndex > 0) {
                var beforeLast = this.getPartShape(this.partsOrder[beforeIndex]);
                if (isValidProp(beforeLast)) {
                    var tempd = 0;
                    tempd = beforeLast.getRight() - partShape.style.x;
                    if (tempd > 0) {
                        partShape.style.x += tempd;
                    }
                }
            }
        }
        this.zr.modShape(partShape.id, partShape);
        for (var j = 0; j < acts.length; j++) {//泳道包含的环节
            var a = acts[j];
            if (a.performer != partShape.id) continue;

            var actShape = this.getActShape(a.id);
            actShape.style.x += d; //act move
            this.zr.modShape(actShape.id, actShape);

            moveActivity(actShape);
        }
    }
}
XPDLMgr.prototype.getRightmost = function (partShape, acts) {

    var d = null;
    for (var i = 0; i < acts.length; i++) {
        var a = acts[i];
        if (a.performer != partShape.id) continue;

        var actShape = this.getActShape(a.id);
        if (actShape == undefined) continue;

        var right = actShape.getRight();
        var tempd = partShape.getRight() - right;

        if (d == null || tempd < d) {
            d = tempd;
        }
    }
    if (d == null) return null;
    return (-d + XPDL_STYLE.CONST_LANE_ACT_SPACE);
}

XPDLMgr.prototype.adjustPerformer = function (actShape) {//调整环节所属参与人
    var partShape = null;
    for (var i = 0; i < this.partsShape.length; i++) {
        partShape = this.partsShape[i];
        var test = {
            x: partShape.style.x,
            y: partShape.style.y,
            width: partShape.style.width,
            height: partShape.style.height
        }

        if (isInsideRectangle(test, actShape.style.x, actShape.style.y)) {
            actShape.entity.performer = partShape.id;
            break;
        }
    }
}
XPDLMgr.prototype.updateActXY = function (actShape) {
    var act = $xpdlBuilder.getActEntity($inputActs, actShape.id);
    var p = $xpdlBuilder.getPartShape(act.performer);
    act.x = actShape.style.x - p.style.x;
    act.y = actShape.style.y;
}
XPDLMgr.prototype.showPartBar = function (partShape) {
    var x = partShape.style.x;
    this.zr.modShape(PARTBAR_DRAG_ID.PART_DRAG_BAR, { invisible: false, style: { x: x, width: partShape.style.width} });
    this.zr.modShape(PARTBAR_DRAG_ID.PART_DRAG_LEFT, { invisible: false, index: partShape.index, style: { x: x} });
    var rx = x + partShape.style.width - 16;
    this.zr.modShape(PARTBAR_DRAG_ID.PART_DRAG_RIGHT,
     {
         invisible: false,
         index: partShape.index,
         style: { x: rx }
     });
    this.zr.refresh();
}
XPDLMgr.prototype.hidePartBar = function () {
    this.zr.modShape(PARTBAR_DRAG_ID.PART_DRAG_BAR, { invisible: true, style: { x: XPDL_STYLE.APP_HIDE_X} });
    this.zr.modShape(PARTBAR_DRAG_ID.PART_DRAG_LEFT, { invisible: true, style: { x: XPDL_STYLE.APP_HIDE_X} });
    this.zr.modShape(PARTBAR_DRAG_ID.PART_DRAG_RIGHT, { invisible: true, style: { x: XPDL_STYLE.APP_HIDE_X} });
    this.zr.refresh();
}
XPDLMgr.prototype.addPartBar = function () {//part toolbar
    var bar = {
        shape: 'rectangle',
        hoverable: false,
        id: PARTBAR_DRAG_ID.PART_DRAG_BAR,
        zlevel: this.partBarZLevel,
        invisible: true,
        style: {
            x: XPDL_STYLE.APP_HIDE_X,
            y: 0,
            width: XPDL_STYLE.CONST_LANE_WIDTH,
            height: XPDL_STYLE.PART_DRAGBAR_H,
            color: XPDL_STYLE.PART_DRAGBAR_C
        },
        highlightStyle: {
            lineWidth: 0
        },
        draggable: false
    };
    var left = {
        shape: 'image',
        id: PARTBAR_DRAG_ID.PART_DRAG_LEFT,
        invisible: true,
        zlevel: this.partBarZLevel,
        style: {
            x: XPDL_STYLE.APP_HIDE_X,
            y: 15,
            image: $appCtx.appPath + "/themes/images/jquery/ui-icons_222222_256x240.png",
            width: 16,
            height: 16,
            sx: 144,
            sy: 192,
            sWidth: 16,
            sHeight: 16
        },
        index: -1,
        onmouseup: function (ep) {
            var i = ep.target.index;
            var r = movePos($xpdlBuilder.partsOrder, i, --i);
            $xpdlBuilder.clearXPDL();
            $xpdlBuilder.buildXPDL();
        },
        draggable: false
    };
    var right = {
        shape: 'image',
        id: PARTBAR_DRAG_ID.PART_DRAG_RIGHT,
        invisible: true,
        zlevel: this.partBarZLevel,
        style: {
            x: XPDL_STYLE.APP_HIDE_X,
            y: 15,
            image: $appCtx.appPath + "/themes/images/jquery/ui-icons_222222_256x240.png",
            width: 16,
            height: 16,
            sx: 112,
            sy: 192,
            sWidth: 16,
            sHeight: 16
        },
        index: -1,
        onmouseup: function (ep) {

            var i = ep.target.index;
            if (i == ($xpdlBuilder.partsOrder.length - 1)) return;
            var r = movePos($xpdlBuilder.partsOrder, i, ++i);
            $xpdlBuilder.clearXPDL();
            $xpdlBuilder.buildXPDL();
        },
        draggable: false
    };
    this.zr.addShape(bar);
    this.zr.addShape(left);
    this.zr.addShape(right);
}
XPDLMgr.prototype.buildGrid = function () {
    var w = this.zr.getWidth();
    var h = this.zr.getHeight();
    var span = 15;
    var vlc = w / 5;
    var hlc = h / 5;

    var offset = 0;
    for (var i = 0; i < vlc; i++) {
        offset += span;
        var s = {
            shape: 'line',
            zlevel: this.gridLineZLevel,
            style: {
                xStart: offset,
                yStart: 0,
                xEnd: offset,
                yEnd: h,
                strokeColor: XPDL_STYLE.GRIDLINE_C,
                lineWidth: 1

            },
            hoverable: false,
            draggable: false
        };
        this.zr.addShape(s);
    }
    offset = 0;
    for (var i = 0; i < hlc; i++) {
        offset += span;
        var s = {
            shape: 'line',
            zlevel: this.gridLineZLevel,
            style: {
                xStart: 0,
                yStart: offset,
                xEnd: w,
                yEnd: offset,
                strokeColor: XPDL_STYLE.GRIDLINE_C,
                lineWidth: 1
            },
            hoverable: false,
            draggable: false
        };
        this.zr.addShape(s);
    }
}

XPDLMgr.prototype.showProperty = function (id) {
    $("#xpdlProperty [proptype]").each(function () {
        var type = $(this).attr('proptype');
        var entity = $xpdlBuilder.getActEntity($inputActs, id);
        $(this).val(entity[type]);
    });
}
XPDLMgr.prototype.createXPDLElement = function (ep) {

    if (!isValidProp(this.createXPDLType)) return;
    if (ep.target == undefined && this.createXPDLType != "cPart") return;

    var entity = { "id": "", "name": "" };

    if (this.createXPDLType != "cPart") {
        entity.performer = ep.target.id;
        var part = this.getPartShape(entity.performer);
        entity["y"] = this.my;
        entity["x"] = this.mx - part.style.x;
        entity["__type"] = "";
        entity["type"] = "";
    }

    switch (this.createXPDLType) {
        case "cActivity":
            entity.__type = "ActivityView:#Zhongsoft.SOA.Workflow";
            entity.type = "Implementation";
            entity.id = this.getId(XPDL_TYPE.activity);
            entity.name = "步骤";

            this.actsEntity.push(entity);
            this.addActivity(entity);
            break;

        case "cBlock":
            entity.id = this.getId(XPDL_TYPE.block);
            entity.type = "BlockActivity";
            entity.name = "块步骤";

            this.actsEntity.push(entity);
            this.addActivity(entity);

            break;

        case "cStartAct":

            for (var i = 0; i < this.actsEntity.length; i++) {
                if (this.actsEntity[i].isstart) {
                    this.createXPDLType = null;
                    return;
                }
            }

            entity.__type = "ActivityView:#Zhongsoft.SOA.Workflow";
            entity.type = "Implementation";
            entity.isstart = true;
            entity.id = this.getId(XPDL_TYPE.activity);
            entity.name = "开始";

            this.actsEntity.push(entity);
            this.addActivity(entity);

            break;

        case "cEndAct":
            for (var i = 0; i < this.actsEntity.length; i++) {
                if (this.actsEntity[i].isend) {
                    this.createXPDLType = null;
                    return;
                }
            }

            entity.__type = "ActivityView:#Zhongsoft.SOA.Workflow";
            entity.type = "Implementation";
            entity.isend = true;
            entity.id = this.getId(XPDL_TYPE.activity);
            entity.name = "结束";

            this.actsEntity.push(entity);
            this.addActivity(entity);

            break;

        case "cPart":

            entity.id = this.getId(XPDL_TYPE.participant);
            entity.name = "参与人";
            $inputParts.push(entity);
            this.partsOrder.push(entity.id);

            var newIndex = this.partsOrder.length - 1;
            var newPart = this.addParticipant(entity.id, entity.name, newIndex);
            var index = newIndex - 1;
            if(index > 0 ) this.adjustLaneWidth(index);

            break;

        default:
    }
    this.createXPDLType = null;
    this.zr.refresh();
}
XPDLMgr.prototype.makeTranDirection = function (actShape, tranShape, type) {
    var tran = this.buildTransition(tranShape.entity);
    var newTranShape = tran[0];
    newTranShape.arrowId = tranShape.arrowId;
    newTranShape.spId = tranShape.spId;

    if (type == XPDL_TRAN_DIRECTION.TO) {
        actShape.sinkList.push(newTranShape);
    }
    else {
        actShape.sourceList.push(newTranShape);        
    }
    var arrow = this.buildTranArrow(newTranShape.fp(), newTranShape.tp());
    var sp = this.buildTranSP(newTranShape.fp());

    this.zr.modShape(newTranShape.id, newTranShape);
    this.zr.modShape(tranShape.arrowId, arrow);
    this.zr.modShape(newTranShape.spId, sp);
}
XPDLMgr.prototype.buildXPDL = function (scopeId) {
    this.buildGrid();
    if (scopeId != undefined)
        this.scopeId = scopeId;
    this.partsOrder = this.getChildren($wfPartsOrder, this.scopeId);
    for (var i = 0; i < this.partsOrder.length; i++) {//按顺序取出
        for (var u = 0; u < $inputParts.length; u++) {
            if (this.partsOrder[i] == $inputParts[u].id) {
                this.addParticipant($inputParts[u].id, $inputParts[u].name, i);
                break;
            }
        }
    }
    this.actsEntity = this.getChildren($inputActs, this.scopeId);
    for (var i = 0; i < this.actsEntity.length; i++) {
        var a = this.actsEntity[i];
        if (a.type == "ActivitySet") continue;

        this.addActivity(a);
    }

    this.transEntity = this.getChildren($inputTrans, this.scopeId);
    for (var i = 0; i < this.transEntity.length; i++) {
        var t = this.transEntity[i];
        this.addTransition(t);
    }
    this.adjustLaneWidth(0);
    this.addPartBar();
    this.zr.render();
}