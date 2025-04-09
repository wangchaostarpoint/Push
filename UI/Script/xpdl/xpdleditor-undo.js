/* 
* xpdl editor undo manager, by sunan
*  
* Copyright (c) 2014, Zhongsoft Inc.
* All rights reserved.
*/
var XPDL_TRAN_DIRECTION = { FROM: "F", TO: "T" };
var undoActionStack = [];
var undoPointer = 0;
function UndoMgr() {
    this.action = { "CREATE":"C", "UPDATE": "U", "DELETE": "D" };
    this.copy = [];
}
UndoMgr.prototype.exe = function (trans) {
    for (var i = 0; i < trans.length; i++) {
        var o = {};$.extend(o, trans[i]);this.copy.push(o);
    }
    undoActionStack[undoPointer] = this;
    undoPointer++;
    return this;
}
UndoMgr.prototype.getTransBag = function () {
    return {newEntity:null,oldEntity:null,type:"",scope:"",action:"",tag:null};
}
UndoMgr.prototype.undo = function () {
    alert("NotImplemented");
}
UndoMgr.prototype.redo = function () {
    alert("NotImplemented");    
}
function ActivityTrans() {
    this.copy = [];
}
ActivityTrans.prototype = new UndoMgr();
ActivityTrans.prototype.undo = function () {
    for (var i = 0; i < this.copy.length; i++) {
        var bag = this.copy[i];
        if (bag.action == this.action.DELETE) {
            if (bag.type == XPDL_TYPE.activity) {
                var acts = $xpdlBuilder.getChildren($inputActs, bag.scope);
                acts.push(bag.oldEntity);
                $xpdlBuilder.addActivity(bag.oldEntity);
            }
            else if (bag.type == XPDL_TYPE.transition) {
                var trans = $xpdlBuilder.getChildren($inputTrans, bag.scope);
                trans.push(bag.oldEntity);
                $xpdlBuilder.addTransition(bag.oldEntity);
            }
        }
    }
    $xpdlBuilder.zr.refresh();
}
ActivityTrans.prototype.redo = function () {

    for (var i = 0; i < this.copy.length; i++) {
        var bag = this.copy[i];
        if (bag.action == this.action.DELETE) {
            if (bag.type == XPDL_TYPE.activity) {
                this.deleteActivity(bag.oldEntity.id);
            }
        }
    }
    $xpdlBuilder.zr.refresh();
}
ActivityTrans.prototype.deleteActivity = function (id) {
    var transObjs = [];

    var actShape = $xpdlBuilder.getActShape(id);
    var sinkList = actShape.sinkList;
    var sourceList = actShape.sourceList;
    var copy = deleteJsonById($xpdlBuilder.actsEntity, id);

    if (!isValidProp(copy)) return;

    $xpdlBuilder.zr.delShape(actShape.child.id);

    var bag = this.getTransBag();
    bag.oldEntity = copy[0];
    bag.type = XPDL_TYPE.activity;
    bag.scope = $xpdlBuilder.scopeId;
    bag.action = this.action.DELETE;
    transObjs.push(bag);

    var copyTran = null;
    for (var i = 0; i < sinkList.length; i++) {
        var sinktr = sinkList[i];
        var from = sinktr.getFromShape();
        $xpdlBuilder.zr.delShape(sinktr.arrowId);
        $xpdlBuilder.zr.delShape(sinktr.spId);
        $xpdlBuilder.zr.delShape(sinktr.id);
        deleteJsonById(from.sourceList, sinktr.id);

        copyTran = deleteJsonById($xpdlBuilder.transEntity, sinktr.id);
        bag = this.getTransBag();
        bag.oldEntity = copyTran[0];
        bag.type = XPDL_TYPE.transition;
        bag.scope = $xpdlBuilder.scopeId;
        bag.action = this.action.DELETE;
        transObjs.push(bag);
    }

    for (var i = 0; i < sourceList.length; i++) {
        var sourcetr = sourceList[i];
        var to = sourcetr.getToShape();
        $xpdlBuilder.zr.delShape(sourcetr.arrowId);
        $xpdlBuilder.zr.delShape(sourcetr.spId);
        $xpdlBuilder.zr.delShape(sourcetr.id);
        deleteJsonById(to.sinkList, sourcetr.id);

        copyTran = deleteJsonById($xpdlBuilder.transEntity, sourcetr.id);
        bag = this.getTransBag();
        bag.oldEntity = copyTran[0];
        bag.type = XPDL_TYPE.transition;
        bag.scope = $xpdlBuilder.scopeId;
        bag.action = this.action.DELETE;
        transObjs.push(bag);
    }
    deleteJsonById($xpdlBuilder.actsShape, id);
    actShape.sinkList = [];
    actShape.sourceList = [];

    $xpdlBuilder.zr.delShape(id);
    $xpdlBuilder.zr.refresh();
    return transObjs;
}
function TransitionTrans() {
    this.copy = [];
}
TransitionTrans.prototype = new UndoMgr();
TransitionTrans.prototype.updateDirection = function (actShape, tranShape, type) {
    var transObjs = [];
    var bag = this.getTransBag();
    var o = {};
    $.extend(o, tranShape.entity);
    bag.oldEntity = o;
    bag.type = XPDL_TYPE.transition;
    bag.scope = $xpdlBuilder.scopeId;
    bag.action = this.action.UPDATE;

    if (type == XPDL_TRAN_DIRECTION.TO) {
        var oldTo = $xpdlBuilder.getActShape(tranShape.entity.to);
        deleteJsonById(oldTo.sinkList, tranShape.entity.id);
        tranShape.entity.to = actShape.id; //new id of to
        bag.tag = XPDL_TRAN_DIRECTION.TO;
    }
    else if (type == XPDL_TRAN_DIRECTION.FROM) {
        var oldFrom = $xpdlBuilder.getActShape(tranShape.entity.from);
        deleteJsonById(oldFrom.sourceList, tranShape.entity.id);
        tranShape.entity.from = actShape.id; //new id of from
        bag.tag = XPDL_TRAN_DIRECTION.FROM;
    }
    o = {};$.extend(o, tranShape.entity);bag.newEntity = o;
    transObjs.push(bag);
    return transObjs;
}
TransitionTrans.prototype.undo = function () {
    for (var i = 0; i < this.copy.length; i++) {
        var bag = this.copy[i];
        if (bag.action == this.action.UPDATE) {
            if (bag.type == XPDL_TYPE.transition) {
                var tranShape = $xpdlBuilder.getTranShape(bag.oldEntity.id);
                if (bag.tag == XPDL_TRAN_DIRECTION.TO) {
                    var newTo = $xpdlBuilder.getActShape(bag.newEntity.to);
                    deleteJsonById(newTo.sinkList, bag.newEntity.to);
                    
                    tranShape.entity.to = bag.oldEntity.to;
                    var oldTo = $xpdlBuilder.getActShape(bag.oldEntity.to);
                    $xpdlBuilder.makeTranDirection(oldTo, tranShape);
                }
                else {
                    var newFrom = $xpdlBuilder.getActShape(bag.newEntity.from);
                    deleteJsonById(newFrom.sourceList, bag.newEntity.from);

                    tranShape.entity.from = bag.oldEntity.from;
                    var oldFrom = $xpdlBuilder.getActShape(bag.oldEntity.from);
                    $xpdlBuilder.makeTranDirection(oldFrom, tranShape);
                }
            }
        }//end action
    }
    $xpdlBuilder.zr.refresh();
}
TransitionTrans.prototype.redo = function () {
    for (var i = 0; i < this.copy.length; i++) {
        var bag = this.copy[i];
        if (bag.action == this.action.UPDATE) {
            if (bag.type == XPDL_TYPE.transition) {
                var tranShape = $xpdlBuilder.getTranShape(bag.oldEntity.id);
                if (bag.tag == XPDL_TRAN_DIRECTION.TO) {
                    var toShape = $xpdlBuilder.getActShape(bag.newEntity.to);
                    this.updateDirection(toShape, tranShape, XPDL_TRAN_DIRECTION.TO);
                    $xpdlBuilder.makeTranDirection(toShape, tranShape);
                }
                else {
                    var fromShape = $xpdlBuilder.getActShape(bag.newEntity.from);
                    this.updateDirection(fromShape, tranShape, XPDL_TRAN_DIRECTION.FROM);
                    $xpdlBuilder.makeTranDirection(fromShape, tranShape);
                }
            }
        }
    }
    $xpdlBuilder.zr.refresh();
}
function undoXPDL() {
    if (undoPointer == 0) return;
    undoPointer--; //移动指针
    var now = undoActionStack[undoPointer];
    now.undo();
}
function redoXPDL() {
    if (undoActionStack.length ==  undoPointer
    || undoActionStack.length == 0) return;

    var now = undoActionStack[undoPointer];
    now.redo();
    undoPointer++; //移动指针
}