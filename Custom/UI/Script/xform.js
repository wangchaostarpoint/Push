var hasChange = false;
var view = new formView();
var windowIsSave = 'isSave';

// JavaScript Document
/***表单设计***/
(function ($) {
    $.paint = function (t, p) {
        var type; //生成元素类型
        var $I = ''; //内部拖动对象
        var right; //canvas边缘宽度
        var bottom; //canvas边缘高度
        var $btnCopy = $('<div class="btnCopy"></div>'); //toolbar 拖动时的效果
        var isdashtemp = parseBool(p.attr("isdashtemp")); //是否dashboard模板
        function dragStart(dragtype, e, obj) {
            type = $(obj).attr('type');
            if (dragtype == 'move') {//column header drag
                $btnCopy.html(type);
                $btnCopy.css({
                    textAlign: obj.align
                });
                $('body').append($btnCopy);
            }
            $('body').noSelect();
        }
        function dragMove(e) {
            if ($('.btnCopy').length > 0) {//拖动对象是按钮
                $('body').css('cursor', 'move');
                $btnCopy.css({
                    top: e.pageY + 1,
                    left: e.pageX + 2,
                    display: 'block'
                });
            }
            if ($('.innerDrag').length > 0) {//拖动对象是生成的元素
                $('body').css('cursor', 'move');
                $('.innerDrag').css({
                    top: e.pageY + 1,
                    left: e.pageX + 2
                });
            }
        }
        function dragEnd(e) {
            var hset = p.offset();
            right = hset.left + p.width();
            bottom = hset.top + p.height();
            var c = $(e.target).index(); //列索引
            var r = $(e.target).parent().index(); //行索引
            var tID = $(e.target).parents('table').attr('id'); //parent的id值
            if ($('.btnCopy').length > 0) {//拖动上面的按钮生成元素
                hasChange = true;
                $('.btnCopy').remove();
                if (e.pageX > right || e.pageX < hset.left || e.pageY > bottom || e.pageY < hset.top) {
                } else {
                    if (type == 'table' && $(e.target).parent().attr('id') == 'canvas') {//如果目标是span，则要放到div里面去
                        var factory = new ctrlFactory();
                        var element = factory.createInput(type);
                        var sset = $(e.target).offset(); //判断距离，如果是在下边就放到下面，如果是在上面就放到上面
                        var sright = sset.left + $(e.target).width();
                        var sbottom = sset.top + $(e.target).height();
                        if (e.pageY > sbottom) {
                            $(e.target).after(element);
                        } else {
                            $(e.target).before(element);
                        }
                    } else {
                        if ($(e.target).attr('CtrlType') == undefined) {//判断是否放到控件上
                            if (type != 'table' && $(e.target).parent('tr').index() == -1) {//如果是控件，并且放到控件上面
                                alert('请将控件放到td中去，如果有table的td不能再放入其他控件');
                            } else {
                                if (type == 'table' && $(e.target).parent('tr').index() != -1 && $(e.target).html() != '') {
                                    alert('不能重复放入table');
                                } else {
                                    var factory = new ctrlFactory();
                                    var element = factory.createInput(type);
                                    $(e.target).append(element);
                                }
                            }
                        } else {
                            alert('不能放到控件上，请重新选择位置');
                        }
                    }
                    $(e.target).children('span').children().attr({ Tdpos: c, Trpos: r, ParentId: tID });
                }

            }
            if ($('.innerDrag').length > 0) {//内部元素拖动
                hasChange = true;
                if (e.pageX > right || e.pageX < hset.left || e.pageY > bottom || e.pageY < hset.top) {
                } else {
                    if ($I.children().attr('CtrlType') == 'table' && $(e.target).parent().attr('id') == 'canvas') {//如果目标是span，则要放到div里面去
                        var sset = $(e.target).offset(); //判断距离，如果是在下边就放到下面，如果是在上面就放到上面
                        var sright = sset.left + $(e.target).width();
                        var sbottom = sset.top + $(e.target).height();
                        if (e.pageY > sbottom) {
                            $(e.target).after($I);
                        } else {
                            $(e.target).before($I);
                        }
                    } else {
                        if ($(e.target).attr('CtrlType') == undefined) {//判断是否放到控件上
                            if ($I.children().attr('CtrlType') != 'table' && $(e.target).parent('tr').index() == -1) {//如果是控件，并且放到控件上面
                                alert('请将控件放到td中去，如果有table的td不能再放入其他控件');
                            } else {
                                if ($I.children().attr('CtrlType') == 'table' && $(e.target).parent('tr').index() != -1 && $(e.target).html() != '') {
                                    alert('不能重复放入table');
                                } else {
                                    $(e.target).append($I);
                                }
                            }
                        } else {
                            alert('不能放到控件上，请重新选择位置');
                        }
                    }
                    $(e.target).children('span').children().attr({ Tdpos: c, Trpos: r, ParentId: tID });
                }
                $I.removeClass('innerDrag');
            }

            $('body').css('cursor', 'default');
            $('body').noSelect(false);

        }
        //add document events
        $(document).mousemove(function (e) {
            dragMove(e);
        }).mouseup(function (e) {
            dragEnd(e);
        }).mousedown(function (e) {
            var hset = p.offset();
            right = hset.left + p.width();
            var bottom = hset.top + p.height();
            if (e.pageX > right || e.pageX < hset.left || e.pageY > bottom || e.pageY < hset.top) {
                $('.move').remove();
                $('.edit').remove();
                $('.del').remove();
                $('.rightMenu').remove();
                if ($I != '') {
                    $I.css('border', '');
                }
                document.oncontextmenu = function () {
                    return true;
                }
            }
        });

        //添加双击事件 by wenwen 2012-10-15
        function editCtrl() {
            $I.addClass('editTarget');
            var ctrlId = $I.children().attr("id");
            var ctrltype = $I.children().attr("CtrlType");
            if (ctrltype == "selector") {
                var url = "XObjectRefbtnEditor.aspx?actionType=3&CtrlId=" + ctrlId + "&FormPageId=" + bizId + "&FormType=" + formType;
                if (formType.toLowerCase() == "xform") {
                    url += "&FormId=" + formId + "&FormViewType=" + formViewType;
                }
                var stringFeatures = "dialogHeight:500px; dialogWidth:800px;resizable: Yes; scroll:auto; status: no;";
                var re = window.showModalDialog(encodeURI(url), $I, stringFeatures);
                if (re != undefined && re != null) {
                    $I.html(re);
                    saveDivForm();
                }
            }
            else if (ctrltype == "gridview") {
                var url = "XGridViewEditor.aspx?actionType=3&CtrlId=" + ctrlId + "&FormPageId=" + bizId + "&FormType=" + formType;
                if (formType.toLowerCase() == "xform") {
                    url += "&FormId=" + formId + "&FormViewType=" + formViewType;
                }
                var stringFeatures = "dialogHeight:500px; dialogWidth:800px;resizable: Yes; scroll:auto; status: no;";
                var re = window.showModalDialog(encodeURI(url), $I, stringFeatures);
                if (re != undefined && re != null) {
                    $I.html(re);
                    saveDivForm();
                }
            }
            else if (ctrltype == "filelink") {
                var url = "XFileLinkEditor.aspx?actionType=3&CtrlId=" + ctrlId + "&FormPageId=" + bizId + "&FormType=" + formType;
                if (formType.toLowerCase() == "xform") {
                    url += "&FormId=" + formId + "&FormViewType=" + formViewType;
                }
                var stringFeatures = "dialogHeight:500px; dialogWidth:800px;resizable: Yes; scroll:auto; status: no;";
                var re = window.showModalDialog(encodeURI(url), $I, stringFeatures);
                if (re != undefined && re != null) {
                    $I.html(re);
                    saveDivForm();
                }
            }
            else {
                var url = "XFormCtrlEditor.aspx?actionType=3&CtrlType=" + ctrltype + "&CtrlId=" + ctrlId + "&FormPageId=" + bizId + "&FormType=" + formType;
                if (formType.toLowerCase() == "xform") {
                    url += "&FormId=" + formId + "&FormViewType=" + formViewType;
                }
                var stringFeatures = "dialogHeight:500px; dialogWidth:800px;resizable: Yes; scroll:auto; status: no;";
                var re = window.showModalDialog(encodeURI(url), $I, stringFeatures);
                if (re != undefined && re != null) {
                    $I.html(re);
                    saveDivForm();
                }
            }
        }

        p.dblclick(function (e) {
            $('.move').remove();
            $('.edit').remove();
            $('.del').remove();
            $('.rightMenu').remove();
            if ($I != '') {
                $I.css('border', '');
            }
            if ($(this).children().length > 0) {
                editCtrl();
            }
        })

        p.mousedown(function (e) {
            hasChange = true;
            $('.move').remove();
            $('.edit').remove();
            $('.del').remove();
            $('.rightMenu').remove();
            if ($I != '') {
                $I.css('border', '');
            }
            if (1 == e.which) {//左键单击事件
                if ($(this).children().length > 0) {
                    if ($(e.target).closest('span').html() != null) {
                        var $moveElement = $('<a class="move"><span title="移动"></span></a>');
                        var $editElement = $('<a class="edit"><span title="编辑"></span></a>');
                        var $delElement = $('<a class="del"><span title="删除"></span></a>');
                        var p = $(e.target).closest('span').offset();
                        var x = p.left;
                        var y = p.top - 20;
                        if (y > 0) {
                            $I = $(e.target).closest('span');
                            $I.css('border', '#ff0000 1px solid');
                            $('body').append($moveElement);
                            $moveElement.css({ left: x, top: y });
                            $('body').append($editElement);
                            $editElement.css({ left: x + 24, top: y });
                            $('body').append($delElement);
                            $delElement.css({ left: x + 48, top: y });
                            movedown(); //添加class为move的对象的mousedown事件
                        }
                    }
                }
            }
            if (3 == e.which) {//获取右键单击事件，添加右键菜单
                if ($(e.target).parent('tr').html() != null) {
                    var $rightMenu = $('<div class="rightMenu">' + '<li><a class="leftInsert"><img src="../UI/images/leftInsert.gif" /><span>左侧插入列</span></a></li>' +
                '<li><a class="rightInsert"><img src="../UI/images/rightInsert.gif" /><span>右侧插入列</span></a></li>' +
                '<li><a class="upInsert"><img src="../UI/images/upInsert.gif" /><span>上面插入行</span></a></li>' +
                '<li><a class="downInsert"><img src="../UI/images/downInsert.gif" /><span>下面插入行</span></a></li>' +
                '<li><a class="delCol"><img src="../UI/images/delCol.gif" /><span>删除该列</span></a></li>' +
                '<li><a class="delRow"><img src="../UI/images/delRow.gif" /><span>删除该行</span></a></li>' +
                '<li><a class="colSpan"><img src="../UI/images/colSpan.gif" /><span>合并列</span></a></li>' +
                '<li><a class="rowSpan"><img src="../UI/images/rowSpan.gif" /><span>合并行</span></a></li>' +
                '<li><a class="cancelCol"><img src="../UI/images/cancelCol.gif" /><span>撤销合并列</span></a></li>' +
                '<li><a class="cancelRow"><img src="../UI/images/cancelRow.gif" /><span>撤销合并行</span></a></li>' + '</div>');
                    if (isdashtemp) {
                        $rightMenu = $('<div class="rightMenu">' + '<li><a class="leftInsert"><img src="../UI/images/leftInsert.gif" /><span>左侧插入列</span></a></li>' +
                    '<li><a class="rightInsert"><img src="../UI/images/rightInsert.gif" /><span>右侧插入列</span></a></li>' +
                    '<li><a class="upInsert"><img src="../UI/images/upInsert.gif" /><span>上面插入行</span></a></li>' +
                    '<li><a class="downInsert"><img src="../UI/images/downInsert.gif" /><span>下面插入行</span></a></li>' +
                    '<li><a class="delCol"><img src="../UI/images/delCol.gif" /><span>删除该列</span></a></li>' +
                    '<li><a class="delRow"><img src="../UI/images/delRow.gif" /><span>删除该行</span></a></li>' +
                    '<li><a class="colSpan"><img src="../UI/images/colSpan.gif" /><span>合并列</span></a></li>' +
                    '<li><a class="rowSpan"><img src="../UI/images/rowSpan.gif" /><span>合并行</span></a></li>' +
                    '<li><a class="cancelCol"><img src="../UI/images/cancelCol.gif" /><span>撤销合并列</span></a></li>' +
                    '<li><a class="cancelRow"><img src="../UI/images/cancelRow.gif" /><span>撤销合并行</span></a></li>' +
                    '<li><a class="setHeight"><img src="../UI/images/cancelCol.gif" /><span>设置高度</span></a></li>' +
                    '<li><a class="setWidth"><img src="../UI/images/cancelCol.gif" /><span>设置宽度</span></a></li>' +
                    '<li><a class="setArrange"><img src="../UI/images/cancelCol.gif" /><span>设置排列</span></a></li>' + '</div>');
                    }

                    $('body').append($rightMenu);
                    if (e.pageX + $rightMenu.width() > right) {
                        $rightMenu.css({ left: e.pageX - $rightMenu.width() });
                    } else {
                        $rightMenu.css({ left: e.pageX });
                    }
                    if (e.pageY + $rightMenu.height() > bottom) {
                        $rightMenu.css({ top: e.pageY - $rightMenu.height() });
                    } else {
                        $rightMenu.css({ top: e.pageY });
                    }

                    document.oncontextmenu = function () {
                        return false;
                    }

                }
                Insert($(e.target));
                //添加hover事件
                $('.rightMenu li a').hover(function () {
                    $(this).addClass('rightMenuahover');
                }, function () {
                    $(this).removeClass('rightMenuahover');
                })
            }

        })
        //添加hover事件
        $('.drag').hover(function () {
            $(this).addClass('draghover');
        }, function () {
            $(this).removeClass('draghover');
        })

        function Insert($t) {
            var c = $t.index(); //列索引
            var r = $t.parent().index(); //行索引
            var $table = $t.parent('tr').parent('tbody').parent('table');
            var $tr = $t.parent('tr').parent('tbody').children('tr');
            var col = $table.attr('Col');
            var row = $table.attr('Row');

            $('.rightInsert').click(function () {//插入列
                InsertCol(1);
            })
            $('.leftInsert').click(function () {
                InsertCol(2);
            })
            function InsertCol(num) {//插入列方法
                var fr; //判断是从本列右侧插入，还是从左侧插入
                if (num == 2) {
                    fr = c;
                } else {
                    fr = c + 1;
                }
                var hidnum = 0;
                var rowsnum = 0;
                $tr.each(function () {//判断是否有合并
                    if ($(this).children('td').eq(fr).attr('rowspan') > 1) {
                        rowsnum = rowsnum + (parseInt($(this).children('td').eq(fr).attr('rowspan')) - 1);
                    }
                    if ($(this).children('td').eq(fr).is(':hidden')) {
                        hidnum++;
                    }
                })

                if (hidnum != rowsnum) {
                    alert('该行有合并，请选择合适的行插入');
                    $('.rightMenu').remove();
                    return true;
                } else {
                    $table.attr('Col', parseInt(col) + 1); //修改table的列数量
                    $tr.each(function () {
                        var tdstr = '<td width="150px"></td>';
                        if (isdashtemp) {
                            tdstr = '<td></td>'
                        }
                        if (fr == col) {//判断是否最后一行
                            $(this).children('td').eq(parseInt(fr) - 1).after(tdstr);
                        } else {
                            $(this).children('td').eq(fr).before(tdstr);
                        }
                        $(this).children('td:gt(' + c + ')').each(function () {//修改列索引
                            var tdpos = parseInt($(this).children('span').children().attr('Tdpos')) + 1;
                            $(this).children('span').children().attr('Tdpos', tdpos);
                        });
                    })
                }
                $('.rightMenu').remove();
            }


            $('.delCol').click(function () {//删除列
                var hidnum = 0;
                var rowsnum = 0;
                var colsnum = 0;
                $tr.each(function () {//判断是否有合并
                    if ($(this).children('td').eq(c).attr('colspan') > 1) {
                        colsnum = $(this).children('td').eq(c).attr('colspan');
                    }
                    if ($(this).children('td').eq(c).attr('rowspan') > 1) {
                        rowsnum = rowsnum + parseInt($(this).children('td').eq(c).attr('rowspan')) - 1;
                    }
                    if ($(this).children('td').eq(c).is(':hidden')) {
                        hidnum++;
                    }
                })
                if (colsnum > 1 || (parseInt(rowsnum) != parseInt(hidnum))) {
                    alert('有合并，请检查撤消合并后再删除');
                    $('.rightMenu').remove();
                    return true;
                } else {
                    var flag = false;
                    $tr.each(function () {//判断是否有控件
                        if ($(this).children('td').eq(c).children().length > 0) {
                            flag = true;
                            return false;
                        }
                    })
                    if (flag) {
                        var bool = window.confirm("该列里有内容，您确定要删除？");
                        if (bool) {
                            DelCol();
                        }
                    } else {
                        DelCol();
                    }
                }
                $('.rightMenu').remove();
            })
            function DelCol() {//删除列方法
                var b = false;
                $tr.each(function () {
                    if ($(this).children('td').length == 1) {
                        var flag = window.confirm('确定删除最后一行吗，如果删除，table也将被删除');
                        if (flag) {
                            $(this).parent('tbody').parent('table').parent('span').remove();
                            return false;
                        } else {
                            return false;
                        }
                    } else {
                        b = true;
                        $(this).children('td').eq(c).remove(); //删除列
                        $(this).children('td:gt(' + c + ')').each(function () {//修改列索引
                            var tdpos = parseInt($(this).children('span').children().attr('Tdpos')) - 1;
                            $(this).children('span').children().attr('Tdpos', tdpos);
                        });
                        $(this).children('td').eq(c).children('span').children().attr('Tdpos', (parseInt($(this).children('td').eq(c).children('span').children().attr('Tdpos')) - 1));
                    }
                })
                if (b) {
                    $table.attr('Col', parseInt(col) - 1); //修改table的列数量
                }
            }

            $('.upInsert').click(function () {//插入行
                InsertRow(1);
            })
            $('.downInsert').click(function () {
                InsertRow(2);
            })
            function InsertRow(num) {
                var fr; //判断是从本行上面插入，还是从下一行上面插入
                if (num == 1) {
                    fr = r;
                } else {
                    fr = r + 1;
                }
                var hidnum = 0;
                var colsnum = 0;
                $tr.eq(fr).children('td').each(function () {
                    if ($(this).is(':hidden')) {
                        hidnum++;
                    }
                    if ($(this).attr('colspan') > 1) {
                        colsnum = colsnum + parseInt($(this).attr('colspan')) - 1;
                    }
                })
                if (hidnum != colsnum) {
                    alert('该行有合并，请选择合适的行插入');
                    $('.rightMenu').remove();
                    return true;
                } else {
                    $table.attr('Row', parseInt(row) + 1); //修改table的列数量
                    var $instr = $('<tr></tr>');
                    for (var i = 0; i < col; i++) {
                        if (isdashtemp) {
                            $instr.append('<td></td>');
                        }
                        else {
                            $instr.append('<td width="150px"></td>');
                        }
                    }
                    if (fr == row) {//判断是否是最后一行，如果是则肯定是在下插入一行
                        $tr.eq(parseInt(fr) - 1).after($instr);
                    } else {
                        $tr.eq(fr).before($instr);
                    }
                    $t.parent('tr').parent().children('tr:gt(' + r + ')').each(function () {//修改行索引
                        $(this).children('td').each(function () {
                            var trpos = parseInt($(this).children('span').children().attr('Trpos')) + 1;
                            $(this).children('span').children().attr('Trpos', trpos);
                        })

                    });
                }
                $('.rightMenu').remove();
            }


            $('.delRow').click(function () {//删除行
                var $tarTr = $t.parent('tr');
                var hidnum = 0;
                var rowsnum = 0;
                var colsnum = 0;
                $tarTr.children('td').each(function () {//判断是否有合并
                    if ($(this).attr('rowspan') > 1) {
                        rowsnum = $(this).attr('rowspan');
                    }
                    if ($(this).attr('colspan') > 1) {
                        colsnum = colsnum + parseInt($(this).attr('colspan')) - 1;
                    }
                    if ($(this).is(':hidden')) {
                        hidnum++;
                    }
                })
                if (rowsnum > 1 || (parseInt(colsnum) != parseInt(hidnum))) {
                    alert('有合并，请检查撤消合并后再删除');
                    $('.rightMenu').remove();
                    return true;
                } else {

                    if ($tarTr.children('td').children().length > 0) {
                        var flag = window.confirm("该行里有内容，您确定要删除？");
                        if (flag) {
                            DelRow();
                        }
                    } else {
                        DelRow();
                    }
                }
                $('.rightMenu').remove();
            })
            function DelRow() {//删除行方法
                var $tr = $t.parent('tr');
                var $tbody = $tr.parent('tbody');
                if ($tbody.children('tr').length == 1) {
                    var flag = window.confirm('确定删除最后一行吗，如果删除，table也将被删除');
                    if (flag) {
                        $tbody.parent('table').parent('span').remove();
                    }
                } else {
                    $tr.remove();
                    $table.attr('Row', parseInt(row) - 1); //修改table的列数量
                    $tbody.children('tr:gt(' + r + ')').each(function () {//修改行索引
                        $(this).children('td').each(function () {
                            var trpos = parseInt($(this).children('span').children().attr('Trpos')) - 1;
                            $(this).children('span').children().attr('Trpos', trpos);
                        })
                    });
                    $tbody.children('tr').eq(r).each(function () {//修改行索引
                        $(this).children('td').each(function () {
                            var trpos = parseInt($(this).children('span').children().attr('Trpos')) - 1;
                            $(this).children('span').children().attr('Trpos', trpos);
                        })
                    });
                }
            }

            $('.colSpan').click(function () {//合并列
                var txt = '向后连同自身共合并:<input type="text" id="numCol" name="numCol" value="" />列';
                function mycallbackform(e, v, m, f) {
                    var $an = m.children('#numCol');
                    var patrn = /^\d*$/; //JS中关于数字的正则
                    if (v == true && (!patrn.test(f.numCol) || f.numCol == '')) {
                        alert('请正确输入数字');
                        $an.css("border", "solid #ff0000 1px").focus();
                        return false;
                    } else if (v == true) {
                        var e = parseInt(f.numCol) + c; //右侧合并到的列索引
                        var h = 0; //colspan隐藏数
                        var hidnum = 0; //实际隐藏数
                        var rowspan = $t.attr('rowspan');
                        if (rowspan == 1) {
                            rowspan = 'undefined';
                        }
                        var flag = false; //判断rowspan是否有不相等的
                        for (var q = c; q < e; q++) {
                            var compare = $t.parent('tr').children('td').eq(q).attr('rowspan');
                            if (compare == 1) {
                                compare = 'undefined';
                            }
                            if (compare != rowspan) {
                                flag = true;
                            }
                            if ($t.parent('tr').children('td').eq(q).attr('colspan') > 1) {
                                e = e + (parseInt($t.parent('tr').children('td').eq(q).attr('colspan')) - 1); //实际隐藏到的列数
                                h = h + (parseInt($t.parent('tr').children('td').eq(q).attr('colspan')) - 1); //隐藏的列数
                                q = q + parseInt($t.parent('tr').children('td').eq(q).attr('colspan'));
                                q--;
                            }
                        }
                        for (var t = c; t < e; t++) {
                            if ($t.parent('tr').children('td').eq(t).is(':hidden')) {
                                hidnum++;
                            }
                        }
                        if (flag || hidnum != h) {
                            alert('不能合并，请检查是否有冲突');
                            $('.rightMenu').remove();
                            return true;
                        } else {
                            var n = col - (parseInt(c)) - h; //右侧的列数
                            if (n < f.numCol) {
                                alert('合并的列数不能大于右侧列数，请重新填写。');
                                $an.css("border", "solid #ff0000 1px").val('').focus();
                                return false;
                            } else {
                                for (var i = parseInt(c) + 1; i < e; i++) {
                                    $t.append($t.parent('tr').children('td').eq(i).html());
                                    $t.parent('tr').children('td').eq(i).css('display', 'none').html('');
                                    $t.parent('tr').children('td').eq(i).attr({ colspan: '1', rowspan: '1' }); //隐藏部分都设为1
                                    if (isdashtemp) {
                                        $t.parent('tr').children('td').eq(i).attr("widht", '');
                                    }
                                }
                                $t.children('span').children().attr('Tdpos', c);
                                $t.attr('colspan', parseInt(f.numCol) + h);
                                $t.attr('width', '');
                            }
                        }
                    }
                    $('.rightMenu').remove();
                }
                function focus(e) {//文本框在初始化时获得焦点
                    $(e.target).find('#numCol').focus();
                }
                $.prompt(txt, {//弹出页面
                    submit: mycallbackform,
                    loaded: focus,
                    buttons: { 确定: true, 取消: false }
                });

            })

            $('.cancelCol').click(function () {//拆分列
                var cols = $t.attr('colspan');
                if (cols > 1) {
                    for (var j = c + 1; j < c + parseInt(cols); j++) {
                        $t.parent('tr').children('td').eq(j).css('display', '').attr('rowspan', $t.attr('rowspan'));
                    }
                    $t.attr("colspan", '1'); //该部分在兼容模式下有错误，目前还没有解决
                    if (isdashtemp) {
                        $t.attr("width", "");
                    }
                }
                $('.rightMenu').remove();
            })

            $('.rowSpan').click(function () {
                var txt = '向下连同自身共合并:<input type="text" id="numRow" name="numRow" value="" />行';

                function mycallbackform(e, v, m, f) {
                    var $an = m.children('#numRow');
                    var patrn = /^\d*$/; //JS中关于数字的正则

                    if (v == true && (!patrn.test(f.numRow) || f.numRow == '')) {
                        alert('请正确输入数字');
                        $an.css("border", "solid #ff0000 1px").focus();
                        return false;
                    } else if (v == true) {
                        var colspan = $t.attr('colspan');

                        if (colspan == 1) {
                            colspan = 'undefined';
                        }
                        var e = parseInt(r) + parseInt(f.numRow); //下面合并到的行索引
                        var h = 0; //colspan隐藏数
                        var hidnum = 0; //实际隐藏数

                        var flag = false;
                        for (var q = r; q < e; q++) {

                            var compare = $tr.eq(q).children('td').eq(c).attr('colspan');
                            if (compare == 1) {
                                compare = 'undefined';
                            }
                            if (compare != colspan) {
                                flag = true;
                            }
                            if ($tr.eq(q).children('td').eq(c).attr('rowspan') > 1) {
                                e = e + (parseInt($tr.eq(q).children('td').eq(c).attr('rowspan')) - 1); //实际隐藏到的列数
                                h = h + (parseInt($tr.eq(q).children('td').eq(c).attr('rowspan')) - 1); //隐藏的行数
                                q = q + parseInt($tr.eq(q).children('td').eq(c).attr('rowspan'));
                                q--;
                            }
                        }
                        for (var t = r; t < e; t++) {
                            if ($tr.eq(t).children('td').eq(c).is(':hidden')) {
                                hidnum++;
                            }
                        }

                        if (flag || hidnum != h) {
                            alert('不能合并，请检查是否有冲突');
                            $('.rightMenu').remove();
                            return true;
                        } else {
                            var n = row - (parseInt(r)) - h; //下面的行数
                            if (n < f.numRow) {
                                alert('合并的行数不能大于下面的行数，请重新填写。');
                                $an.css("border", "solid #ff0000 1px").val('').focus();
                                return false;
                            } else {
                                for (var i = parseInt(r) + 1; i < e; i++) {
                                    $t.append($tr.eq(i).children('td').eq(c).html());
                                    $tr.eq(i).children('td').eq(c).css('display', 'none').html('');
                                    $tr.eq(i).children('td').eq(c).attr({ rowspan: '1', colspan: '1' });
                                    if (isdashtemp) {
                                        $tr.eq(i).children('td').eq(c).attr("height", "");
                                    }
                                }
                                $t.children('span').children().attr('Trpos', r);
                                $t.attr('rowspan', parseInt(f.numRow) + h);
                                if (isdashtemp) {
                                    $t.attr('height', '');
                                }
                            }
                        }
                    }
                    $('.rightMenu').remove();
                }
                function focus(e) {//文本框在初始化时获得焦点
                    $(e.target).find('#numRow').focus();
                }
                $.prompt(txt, {//弹出页面
                    submit: mycallbackform,
                    loaded: focus,
                    buttons: { 确定: true, 取消: false }
                });

            })

            $('.cancelRow').click(function () {//拆分行
                var rows = $t.attr('rowspan');
                if (rows > 1) {
                    var n = parseInt(r) + rows; //下面行数的索引
                    for (var j = parseInt(r) + 1; j < n; j++) {
                        $tr.eq(j).children('td').eq(c).css('display', '').attr('colspan', $t.attr('colspan'));
                    }
                    $t.attr("rowspan", '1'); //该部分在兼容模式下有错误，目前还没有解决
                    if (isdashtemp) {
                        $t.attr("height", '');
                    }
                }
                $('.rightMenu').remove();
            })

            $('.setHeight').click(function () {//设置高度
                var heightStr = $t.attr('height') == undefined ? "" : $t.attr('height');
                if (heightStr != "") {
                    heightStr += "px";
                }
                var txt = '高度:<input type="text" id="rowHeight" name="rowHeight" value="' + heightStr + '"/>';
                function mycallbackform(e, v, m, f) {
                    var $an = m.children('#rowHeight');
                    var patrn = /^\d*px$/; //JS中关于数字的正则
                    if (v == true && (!patrn.test(f.rowHeight) || f.rowHeight == '')) {
                        alert('高度只能输入正整数像素值');
                        $an.css("border", "solid #ff0000 1px").focus();
                        return false;
                    } else if (v == true) {
                        $t.attr('height', f.rowHeight + "px");
                        var $tds = $tr.eq(r).children("td");
                        for (var i = 0; i < $tds.length; i++) {
                            if (!$tds.eq(i).is(':hidden') && $tds.eq(i).attr('rowspan') == $t.attr('rowspan')) {
                                $tds.eq(i).attr('height', f.rowHeight + "px");
                            }
                        }
                    }
                    $('.rightMenu').remove();
                }
                function focus(e) {//文本框在初始化时获得焦点
                    $(e.target).find('#rowHeight').focus();
                }
                $.prompt(txt, {//弹出页面
                    submit: mycallbackform,
                    loaded: focus,
                    buttons: { 确定: true, 取消: false }
                });

                $('.rightMenu').remove();

            })
            $('.setWidth').click(function () {//设置宽度
                var widthStr = $t.attr("width") == undefined ? "" : $t.attr('width');
                if (widthStr.indexOf('%') == -1 && widthStr != "") {
                    widthStr += "px";
                }
                var txt = '宽度:<input type="text" id="colWidth" name="colWidth" value="' + widthStr + '" />';
                function mycallbackform(e, v, m, f) {
                    var $an = m.children('#colWidth');
                    var patrn = /^(\d*px)|(\d*%)$/; //JS中关于数字的正则
                    if (v == true && (!patrn.test(f.colWidth) || f.colWidth == '')) {
                        alert('宽度只能设置为正整数百分比或正整数像素');
                        $an.css("border", "solid #ff0000 1px").focus();
                        return false;
                    } else if (v == true) {
                        $t.attr("width", f.colWidth);
                        for (var i = 0; i < $tr.length; i++) {
                            var $td = $tr.eq(i).children('td').eq(c);
                            if (!$td.is(":hidden") && $t.attr("colspan") == $td.attr('colspan')) {
                                $td.attr("width", f.colWidth);
                            }
                        }
                    }
                    $('.rightMenu').remove();
                }
                function focus(e) {//文本框在初始化时获得焦点
                    $(e.target).find('#colWidth').focus();
                }
                $.prompt(txt, {//弹出页面
                    submit: mycallbackform,
                    loaded: focus,
                    buttons: { 确定: true, 取消: false }
                });
                $('.rightMenu').remove();
            })

            $('.setArrange').click(function () {
                var selctarr = $t.attr('arrange');
                var tab = "";
                if (selctarr != undefined) {
                    if (selctarr == "Tab") {
                        tab = "selected";
                    }
                }
                var txt = '关闭:<select  id="arrange" name="arrange" ><option value="Normal">Normal</option><option value="Tab" ' + tab + '>Tab</option></select>';
                function mycallbackform(e, v, m, f) {
                    if (v == true) {
                        $t.attr('arrange', f.arrange);
                    }
                    $('.rightMenu').remove();
                }
                function focus(e) {//文本框在初始化时获得焦点
                    $(e.target).find('#arrange').focus();
                }
                $.prompt(txt, {//弹出页面
                    submit: mycallbackform,
                    loaded: focus,
                    buttons: { 确定: true, 取消: false }
                });
                $('.rightMenu').remove();
            })
        }



        function movedown() {
            $('.move').mousedown(function (e) {
                $('.move').remove();
                $('.edit').remove();
                $('.del').remove();
                $I.addClass('innerDrag');
                $I.css('border', '');
                $('.innerDrag').css({ left: e.clientX + 1, top: e.clientY + 1 });
                dragMove(e);
            })

            $('.edit').mousedown(function (e) {
                $('.move').remove();
                $('.edit').remove();
                $('.del').remove();
                editCtrl();

            })


            $('.del').mousedown(function (e) {
                var flag = window.confirm('确定要删除？');
                if (flag) {
                    $('.move').remove();
                    $('.edit').remove();
                    $('.del').remove();
                    $I.remove();
                }
            })
        }

        $(t).children('a').each(function () {//开始拖动
            $(this).mousedown(function (e) {
                type = $(this).attr('type');
                if (type != 'table' && p.html() == '') {
                    view.tableNum = 0;
                    alert('请先拖动table');
                } else {
                    dragStart('move', e, this);
                }
            });
        });

    }
    //End

    var docloaded = false;
    $(document).ready(function () {
        docloaded = true;
    });
    $.fn.painting = function (p) {
        return $(this).each(function () {
            if (!docloaded) {
                //$(this).hide();
                var t = this;
                $(document).ready(function () {
                    $.paint(t, p);
                });
            } else {
                $.paint(this, p);
            }

        });
    }; //end painting
    $.fn.noSelect = function (p) { //no select plugin by me :-)
        var prevent = (p == null) ? true : p;
        if (prevent) {
            return this.each(function () {
                if ($.browser.msie || $.browser.safari) $(this).bind('selectstart', function () {
                    return false;
                });
                else if ($.browser.mozilla) {
                    $(this).css('MozUserSelect', 'none');
                    $('body').trigger('focus');
                } else if ($.browser.opera) $(this).bind('mousedown', function () {
                    return false;
                });
                else $(this).attr('unselectable', 'on');
            });
        } else {
            return this.each(function () {
                if ($.browser.msie || $.browser.safari) $(this).unbind('selectstart');
                else if ($.browser.mozilla) $(this).css('MozUserSelect', 'inherit');
                else if ($.browser.opera) $(this).unbind('mousedown');
                else $(this).removeAttr('unselectable', 'on');
            });
        }
    }; //end noSelect
})(jQuery);

function ctrlFactory() {
}
ctrlFactory.prototype.createInput = function (type) {
    switch (type) {

        case 'label':
            return "<span style='display:inline-block'><div  CtrlType='label' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " readonly='true' style='border:blue 1px solid'>label</div></span>";
            break;
        case 'textbox':
            return "<span style='display:inline-block'><input  CtrlType='textbox' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " type='text' readonly='true' style='border:blue 1px solid'/></span>";
            break;
        case 'checkbox':
            return "<span style='display:inline-block'><input  CtrlType='checkbox' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " type='checkbox' readonly='true' style='border:blue 1px solid'/></span>";
            break;
        case 'radiobutton':
            return "<span style='display:inline-block'><input  CtrlType='radiobutton' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " type='radio' readonly='true' style='border:blue 1px solid'/></span>";
            break;
        case 'dropdownlist':
            return "<span style='display:inline-block'><select  CtrlType='dropdownlist' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " style='border:blue 1px solid'><option>请选择</option></select></span>";
            break;
        case 'button':
            return "<span style='display:inline-block'><input  CtrlType='button' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " type='button' readonly='true' value='button' style='border:blue 1px solid'/></span>";
            break;
        case 'hidden':
            return "<span style='display:inline-block'><div  CtrlType='hidden' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " type='text' readonly='true' style='border:blue 1px solid'>hidden</div></span>";
            break;
        case 'selector':
            return "<span style='display:inline-block'><div  CtrlType='selector' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " type='text' readonly='true' style='border:blue 1px solid' ><img src='/portal/Themes/Images/look-up.gif'/></div></span>";
            break;
        case 'gridview':
            return "<span style='display:inline-block'><div  CtrlType='gridview' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " type='text' readonly='true' style='border:blue 1px solid'><img src='/portal/Custom/UI/images/gridview.gif'/></div></span>";
            break;
        case 'filelink':
            return "<span style='display:inline-block'><div  CtrlType='filelink' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " type='text' readonly='true' style='border:blue 1px solid'><img src='/portal/Custom/UI/images/hyperlink.gif'/></div></span>";
            break;
        case 'table':
            var t = "<span style='display:block;margin:5px; padding:5px;'><table CtrlType='table' Col='2' Row='3' width='98%' Tdpos='' Trpos='' ParentId='' id=" + view.getNewId(type) + " class='xform-table'><tr><td width='150px'></td><td width='150px'></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr></table></span>";
            view.tableNum++;
            return t;
            break;
    }

}

function getTableCodes(type) {
    var datas;
    if (type == 0) datas = $('#divDataSources [CtrlType]');
    else if (type == 1) datas = $("#divDataSources [CtrlType][DataSourceType!='从表']");
    else if (type == 2) datas = $("#divDataSources [CtrlType][DataSourceType='从表']");
    var tablecodes = '';
    for (var i = 0; i < datas.length; i++) {
        tablecodes += datas.eq(i).attr('tablecode') + "|";
    }
    tablecodes = tablecodes.substring(0, tablecodes.length - 1);
    return tablecodes;
}

/*** 数据源 ***/
var $D = '';
function addDataSource() {
    var button = "<input CtrlType='data' class='xform_databutton'  type='button'/>";
    var url = "XFormDataSourceEditor.aspx?actionType=2&FormPageId=" + bizId + "&FormType=" + formType;
    var stringFeatures = "dialogHeight:250px; dialogWidth:600px;resizable: Yes; scroll:auto; status: no;";
    var re = window.showModalDialog(encodeURI(url), button, stringFeatures);
    if (re != undefined && re != null) {
        hasChange = true;
        var $srcBtn = $("<span style='display:inline-block'>" + re + "</span>");
        $("#divDataSources").append($srcBtn);
        saveDivData();
    }
}

function initDSClick() {
    $('.xform_databutton').live('click', function () {
        $('.editData').remove();
        $('.delData').remove();
        if ($D != '') {
            $D.css('border', '');
        }
        var edit = $("<a class='editData'><span title='编辑'></span></a>");
        var del = $("<a class='delData'><span title='删除'></span></a>");
        $('body').append(edit).append(del);
        $D = $(this).closest('span');
        $D.css('border', '#ff0000 1px solid');
        var x = $(this).offset().left;
        var y = $(this).offset().top - 20;
        $(edit).css({ left: x, top: y });
        $(del).css({ left: x + 24, top: y });
        addEdit(this);
    })
    $('.xform_databutton').live('dblclick', function () {//双击
        eidtDataClick(this);
    })
}
function eidtDataClick(obj) {
    $('.editData').remove();
    $('.delData').remove();
    var url = "XFormDataSourceEditor.aspx?actionType=3&SelfCode=" + $(obj).attr("tablecode") + "&FormPageId=" + bizId + "&FormType=" + formType; ;
    var stringFeatures = "dialogHeight:250px; dialogWidth:600px;resizable: Yes; scroll:auto; status: no;";
    var re = window.showModalDialog(encodeURI(url), $D, stringFeatures);
    if (re != undefined && re != null) {
        hasChange = true;
        $D.html(re)
        saveDivData();
    }
}
function addEdit(btn) {
    $('.editData').click(function () {
        eidtDataClick(btn);
    });
    $('.delData').click(function () {
        $('.editData').remove();
        $('.delData').remove();
        var flag = window.confirm('确定要删除？');
        if (flag) {
            hasChange = true;
            $D.remove();
            saveDivData();
        }
    });
}

/*** FormView ***/

function formView() {
    this.tabelNum = 0;
    this.idIndex = 0;
    this.xmlDoc = new KPMSXml();
}

function addChildNode(node, root, childNodeName, childNodeText) {
    var nodeChild = root.createElement(childNodeName);
    if (childNodeText != "" && childNodeText != undefined) {
        $(nodeChild).text(childNodeText);
    }
    node.appendChild(nodeChild);
}

formView.prototype.loadXML = function (xmlstr) {
    this.xmlDoc.loadXML(xmlstr);
    var nodes = this.xmlDoc.selectNodes("//ID");
    var tables = this.xmlDoc.selectNodes("//XHtmlTable");
    this.tableNum = tables.length;
    if (nodes.length > 0) {
        for (var i = 0; i < nodes.length; i++) {
            var j = parseInt($(nodes[i]).text().split('_')[1]);
            if (j > this.idIndex)
                this.idIndex = j;
        }
    }
}

formView.prototype.selectSingleNode = function (xpath) {
    return this.xmlDoc.selectSingleNode(xpath);
}

formView.prototype.selectNodes = function (xpath) {
    return this.xmlDoc.selectNodes(xpath);
}

formView.prototype.getNewId = function (type) {
    this.idIndex++;
    return type + "_" + this.idIndex;
}

formView.prototype.createCtrlHtml = function (htmlstring) {
    $(this.xmlDoc.selectSingleNode("//CtrlHtml")).text(htmlstring);
}

formView.prototype.createDataHtml = function (htmlstring) {
    $(this.xmlDoc.selectSingleNode("//DataHtml")).text(htmlstring);
}

formView.prototype.createModifyTime = function () {
    var d = new Date();
    var vYear = d.getFullYear();
    var vMon = d.getMonth() + 1;
    var vDay = d.getDate();
    var h = d.getHours();
    var m = d.getMinutes();
    var se = d.getSeconds();
    var s = vYear + "-" + (vMon < 10 ? "0" + vMon : vMon) + "-" + (vDay < 10 ? "0" + vDay : vDay) + " " + (h < 10 ? "0" + h : h) + ":" + (m < 10 ? "0" + m : m) + ":" + (se < 10 ? "0" + se : se);

    $(this.xmlDoc.selectSingleNode("//ModifyTime")).text(s);
}

formView.prototype.createObjName = function (format, fields) {
    $(this.xmlDoc.selectSingleNode("//ObjNameFormat")).text(format);
    $(this.xmlDoc.selectSingleNode("//ObjNameFields")).text(fields);
}

formView.prototype.createDataSource = function (ctrl) {
    var datanode = new KPMSXml();
    datanode.loadXML("<DataSources><DataSource/></DataSources>");
    var node = datanode.selectSingleNode("//DataSource");
    addChildNode(node, datanode, 'TableCode', ctrl.attr("tablecode"));
    addChildNode(node, datanode, 'TableName', ctrl.attr("tablename"));
    addChildNode(node, datanode, 'PKCode', ctrl.attr("pkcode"));
    addChildNode(node, datanode, 'DataSourceType', ctrl.attr("DataSourceType"));
    view.selectSingleNode("//DataSources").appendChild(node);
}

formView.prototype.createCtrl = function (ctrl) {
    var ctrltype = ctrl.attr("ctrltype");
    if (ctrltype == "table") {
        createXHtmlTable(ctrl);
    }
    else if (ctrltype == "label") {
        createXLabel(ctrl);
    }
    else if (ctrltype == "textbox") {
        createXHtmlInputText(ctrl);
    }
    else if (ctrltype == "dropdownlist") {
        createXHtmlSelect(ctrl);
    }
    else if (ctrltype == "checkbox") {
        createXHtmlInputCheckbox(ctrl);
    }
    else if (ctrltype == "radiobutton") {
        createXHtmlInputRadioButton(ctrl);
    }
    else if (ctrltype == "hidden") {
        createXHtmlInputHidden(ctrl);
    }
    else if (ctrltype == "selector") {
        createXObjectRefbtn(ctrl);
    }
    else if (ctrltype == "gridview") {
        createXGridView(ctrl);
    }
    else if (ctrltype == "filelink") {
        createXFileLink(ctrl);
    }
}

function addChildNode(node, root, childNodeName, childNodeText) {
    var nodeChild = root.createElement(childNodeName);
    if (childNodeText != "" && childNodeText != undefined) {
        $(nodeChild).text(childNodeText);
    }
    node.appendChild(nodeChild);
}

function addBaseNode(node, root, ctrl) {
    addChildNode(node, root, 'ID', ctrl.attr("id"));
    addChildNode(node, root, 'ParentId', ctrl.attr("parentid"));
    addChildNode(node, root, 'Trpos', ctrl.attr("trpos"));
    addChildNode(node, root, 'Tdpos', ctrl.attr("tdpos"));
    var actives = ctrl.attr("ActiveStatus");
    var ActiveStatus = "";
    if (actives != "" && actives != undefined) {
        var status = actives.split("|");
        for (var i = 0; i < status.length; i++)
            ActiveStatus += "(23." + status[i] + ")";
    }
    if (ctrl.attr("ctrltype") != "label")
        addChildNode(node, root, 'ActiveStatus', ActiveStatus);
    else
        addChildNode(node, root, 'ActiveStatus', "");
    var displays = ctrl.attr("DisplayStatus");
    var DisplayStatus = "";
    if (displays != "" && displays != undefined) {
        var status = displays.split("|");
        for (var i = 0; i < status.length; i++)
            DisplayStatus += "(123." + status[i] + ")";
    }
    addChildNode(node, root, 'DisplayStatus', DisplayStatus);

}

function addParamNode(node, root, ctrl) {
    addChildNode(node, root, 'FieldParam', ctrl.attr("FieldParam"));
}

function addNameAndField(node, root, ctrl) {
    addChildNode(node, root, 'CtrlName', ctrl.attr("ctrlname"));
    addChildNode(node, root, 'DefaultValue', ctrl.attr("defaultvalue"));
    addChildNode(node, root, 'DefaultAct', ctrl.attr("defaultact"));
    var ctrltype = ctrl.attr("ctrltype");
    if (ctrltype == "textbox" || ctrltype == "dropdownlist" 
     || ctrltype == "checkbox" || ctrltype == "radiobutton" || ctrltype == "hidden") {
        addChildNode(node, root, 'IsDataCustom', ctrl.attr("IsDataCustom"));
    }
    addChildNode(node, root, 'Field', ctrl.attr("field"));
    addChildNode(node, root, 'TableName', ctrl.attr("tablename"));
}

function createXHtmlTable(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XHtmlTable/></Controls>");
    var node = ctrlnode.selectSingleNode("//XHtmlTable");
    addBaseNode(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'Title', ctrl.attr("title"));
    addChildNode(node, ctrlnode, 'Row', ctrl.attr("row"));
    addChildNode(node, ctrlnode, 'Col', ctrl.attr("col"));
    //获取table的RowSpan和ColSpan信息
    var nodeSpans = ctrlnode.createElement("Spans");
    var trs = ctrl.children('tbody').children('tr')
    for (var i = 0; i < trs.length; i++) {
        var tds = trs.eq(i).children('td');
        for (var j = 0; j < tds.length; j++) {

            if ((tds.eq(j).attr('rowSpan') != undefined && tds.eq(j).attr('rowSpan') != 1)
            || (tds.eq(j).attr('colSpan') != undefined && tds.eq(j).attr('colSpan') != 1)) {
                var nodeSpan = ctrlnode.createElement("Span");
                var nodetr = ctrlnode.createElement("Tr");
                $(nodetr).text(i);
                var nodetd = ctrlnode.createElement("Td");
                $(nodetd).text(j);
                var noderowspan = ctrlnode.createElement("RowSpan");
                $(noderowspan).text(tds.eq(j).attr('rowSpan'));
                var nodecolspan = ctrlnode.createElement("ColSpan");
                $(nodecolspan).text(tds.eq(j).attr('colSpan'));
                nodeSpan.appendChild(nodetr);
                nodeSpan.appendChild(nodetd);
                nodeSpan.appendChild(noderowspan);
                nodeSpan.appendChild(nodecolspan);
                nodeSpans.appendChild(nodeSpan);
            }
        }
    }
    node.appendChild(nodeSpans);
    view.selectSingleNode("//Controls").appendChild(node);

}


function createXLabel(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XLabel/></Controls>");
    var node = ctrlnode.selectSingleNode("//XLabel");
    addBaseNode(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'DefaultValue', ctrl.attr("defaultvalue"));
    addChildNode(node, ctrlnode, 'ReqStar', ctrl.attr("ReqStar"));
    view.selectSingleNode("//Controls").appendChild(node);

}

function createXFileLink(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XFileLink/></Controls>");
    var node = ctrlnode.selectSingleNode("//XFileLink");
    addBaseNode(node, ctrlnode, ctrl);
    addNameAndField(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'FileIdField', ctrl.attr("FileIdField"));
    view.selectSingleNode("//Controls").appendChild(node);
}


function createXHtmlInputText(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XHtmlInputText/></Controls>");
    var node = ctrlnode.selectSingleNode("//XHtmlInputText");
    addBaseNode(node, ctrlnode, ctrl);
    addNameAndField(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'Req', ctrl.attr("req"));
    addChildNode(node, ctrlnode, 'Width', ctrl.attr("xwidth"));
    addChildNode(node, ctrlnode, 'DataType', ctrl.attr("datatype"));
    addChildNode(node, ctrlnode, 'MaxLength', ctrl.attr("length"));
    addChildNode(node, ctrlnode, 'TextAlign', ctrl.attr("TextAlign"));
    addChildNode(node, ctrlnode, 'IsReadOnly', ctrl.attr("isreadonly"));
    addChildNode(node, ctrlnode, 'TextType', ctrl.attr("TextType"));
    addChildNode(node, ctrlnode, 'RegexType', ctrl.attr("RegexType"));
    view.selectSingleNode("//Controls").appendChild(node);
}

function createXHtmlSelect(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XHtmlSelect/></Controls>");
    var node = ctrlnode.selectSingleNode("//XHtmlSelect");
    addBaseNode(node, ctrlnode, ctrl);
    addNameAndField(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'Req', ctrl.attr("req"));

    addChildNode(node, ctrlnode, 'IsSaveText', ctrl.attr("issavetext"));
    addChildNode(node, ctrlnode, 'TextField', ctrl.attr("textfield"));
    addParamNode(node, ctrlnode, ctrl);
    view.selectSingleNode("//Controls").appendChild(node);
}

function createXHtmlInputCheckbox(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XHtmlInputCheckbox/></Controls>");
    var node = ctrlnode.selectSingleNode("//XHtmlInputCheckbox");
    addBaseNode(node, ctrlnode, ctrl);
    addNameAndField(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'Req', ctrl.attr("req"));
    addChildNode(node, ctrlnode, 'IsSingle', ctrl.attr("issingle"));
    addChildNode(node, ctrlnode, 'SingleText', ctrl.attr("singletext"));
    addChildNode(node, ctrlnode, 'Direction', ctrl.attr("direction"));
    addChildNode(node, ctrlnode, 'RepeatColumns', ctrl.attr("RepeatColumns"));
    addParamNode(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'SaveAsXml', ctrl.attr("SaveAsXml"));
    view.selectSingleNode("//Controls").appendChild(node);
}

function createXHtmlInputRadioButton(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XHtmlInputRadioButton/></Controls>");
    var node = ctrlnode.selectSingleNode("//XHtmlInputRadioButton");
    addBaseNode(node, ctrlnode, ctrl);
    addNameAndField(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'Req', ctrl.attr("req"));
    addChildNode(node, ctrlnode, 'Direction', ctrl.attr("direction"));
    addChildNode(node, ctrlnode, 'RepeatColumns', ctrl.attr("RepeatColumns"));
    addChildNode(node, ctrlnode, 'IsSaveText', ctrl.attr("issavetext"));
    addChildNode(node, ctrlnode, 'TextField', ctrl.attr("textfield"));
    addParamNode(node, ctrlnode, ctrl);
    view.selectSingleNode("//Controls").appendChild(node);
}

function createXHtmlInputHidden(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XHtmlInputHidden/></Controls>");
    var node = ctrlnode.selectSingleNode("//XHtmlInputHidden");
    addBaseNode(node, ctrlnode, ctrl);
    addNameAndField(node, ctrlnode, ctrl);
    view.selectSingleNode("//Controls").appendChild(node);
}

function createXObjectRefbtn(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XObjectRefBtn/></Controls>");
    var node = ctrlnode.selectSingleNode("//XObjectRefBtn");
    addBaseNode(node, ctrlnode, ctrl);

    addChildNode(node, ctrlnode, 'XReq', ctrl.attr("XReq"))
    addChildNode(node, ctrlnode, 'IsSaveXml', ctrl.attr("IsSaveXml"));
    addChildNode(node, ctrlnode, 'XmlField', ctrl.attr("XmlField"));
    addChildNode(node, ctrlnode, 'IsDataCustom', ctrl.attr("IsDataCustom"));
    addChildNode(node, ctrlnode, 'TableName', ctrl.attr("tablename"));
    addChildNode(node, ctrlnode, 'Field', ctrl.attr("field"));
    addChildNode(node, ctrlnode, 'PageWidth', ctrl.attr("PageWidth"));
    addChildNode(node, ctrlnode, 'PageHeight', ctrl.attr("PageHeight"));
    addChildNode(node, ctrlnode, 'SelectorPageId', ctrl.attr("SelectorPageId"));
    addChildNode(node, ctrlnode, 'FullClassName', ctrl.attr("FullClassName"));
    addChildNode(node, ctrlnode, 'Param', ctrl.attr("Param"));
    addChildNode(node, ctrlnode, 'SingleMutiple', ctrl.attr("SingleMutiple"))
    addChildNode(node, ctrlnode, 'ResultAttr', ctrl.attr("ResultAttr"))
    addChildNode(node, ctrlnode, 'ControlsAndFields', ctrl.attr("ControlsAndFields"));
    addChildNode(node, ctrlnode, 'SaveToExTable', ctrl.attr("SaveToExTable"));
    addChildNode(node, ctrlnode, 'ExTableCode', ctrl.attr("ExTableCode"));
    addChildNode(node, ctrlnode, 'FKCode', ctrl.attr("FKCode"));
    addChildNode(node, ctrlnode, 'AttrsAndFields', ctrl.attr("AttrsAndFields"));
    addChildNode(node, ctrlnode, 'AppFlag', ctrl.attr("AppFlag"));
    addChildNode(node, ctrlnode, 'AppResultAttr', ctrl.attr("AppResultAttr"));
    addChildNode(node, ctrlnode, 'AppControlsAndFields', ctrl.attr("AppControlsAndFields"));
    addChildNode(node, ctrlnode, 'DefaultValue', ctrl.attr("DefaultValue"));
    addChildNode(node, ctrlnode, 'DefaultAct', ctrl.attr("DefaultAct"));
    view.selectSingleNode("//Controls").appendChild(node);
}

function createXGridView(ctrl) {
    var ctrlnode = new KPMSXml();
    ctrlnode.loadXML("<Controls><XGridView/></Controls>");
    var node = ctrlnode.selectSingleNode("//XGridView");
    addBaseNode(node, ctrlnode, ctrl);
    addChildNode(node, ctrlnode, 'HasCreate', ctrl.attr("HasCreate"));
    addChildNode(node, ctrlnode, 'HasRead', ctrl.attr("HasRead"));
    addChildNode(node, ctrlnode, 'HasEdit', ctrl.attr("HasEdit"))
    addChildNode(node, ctrlnode, 'HasDelete', ctrl.attr("HasDelete"));
    addChildNode(node, ctrlnode, 'IsOpenPage', ctrl.attr("IsOpenPage"));
    addChildNode(node, ctrlnode, 'CreateText', ctrl.attr("CreateText"));
    addChildNode(node, ctrlnode, 'EditorPage', ctrl.attr("EditorPage"));
    addChildNode(node, ctrlnode, 'DataTableCode', ctrl.attr("DataTableCode"));
    addChildNode(node, ctrlnode, 'FKCode', ctrl.attr("FKCode"));
    addChildNode(node, ctrlnode, 'SQL', ctrl.attr("SQL"));
    var nodeChild = ctrlnode.createElement("BoundFields");
    if (ctrl.attr("BoundFields") != "" && ctrl.attr("BoundFields") != undefined) {
        var options = ctrl.attr("BoundFields").split('|');
        var cvArray = null;
        var eidtArray = null;
        if (ctrl.attr("CvArray") != "" && ctrl.attr("CvArray") != undefined) {
            cvArray = eval("(" + decodeURI(ctrl.attr("CvArray")) + ")");
        }
        if (ctrl.attr("EidtArray") != "" && ctrl.attr("EidtArray") != undefined) {
            eidtArray = eval("(" + decodeURI(ctrl.attr("EidtArray")) + ")");
        }

        for (var i = 0; i < options.length; i++) {
            var bdfield = ctrlnode.createElement("XGridField");
            var items = options[i].split(';');
            var headertext = ctrlnode.createElement("HeaderText");
            $(headertext).text(items[0]);
            bdfield.appendChild(headertext);
            var dispcode = ctrlnode.createElement("DispCode");
            $(dispcode).text(items[1]);
            bdfield.appendChild(dispcode);
            var aliascode = ctrlnode.createElement("DataField");
            $(aliascode).text(items[2]);
            bdfield.appendChild(aliascode);
            var datatype = ctrlnode.createElement("Type");
            $(datatype).text(items[3]);
            bdfield.appendChild(datatype);
            var width = ctrlnode.createElement("Width");
            $(width).text(items[4]);
            bdfield.appendChild(width);
            var isshow = ctrlnode.createElement("Visible");
            $(isshow).text(items[5]);
            bdfield.appendChild(isshow);

            var converter = ctrlnode.createElement("Converter");
            if (cvArray != null) {
                $(converter).text(cvArray[i]);
            }
            bdfield.appendChild(converter);

            var editAttr = ctrlnode.createElement("EditAttr");
            if (eidtArray != null) {
                $(editAttr).text(eidtArray[i]);
            }
            bdfield.appendChild(editAttr);

            nodeChild.appendChild(bdfield);
        }
    }
    node.appendChild(nodeChild);
    addChildNode(node, ctrlnode, 'GridName', ctrl.attr("GridName"));
    addChildNode(node, ctrlnode, 'EditOnMobile', ctrl.attr("EditOnMobile"));
    addChildNode(node, ctrlnode, 'IsAutoAdd', ctrl.attr("IsAutoAdd"));
    addChildNode(node, ctrlnode, 'BanAddDelete', ctrl.attr("BanAddDelete"));
    addChildNode(node, ctrlnode, 'RowAclType', ctrl.attr("RowAclType"));
    addChildNode(node, ctrlnode, 'RowAclField', ctrl.attr("RowAclField"));
    view.selectSingleNode("//Controls").appendChild(node);
}


formView.prototype.xml = function () {
    return this.xmlDoc.xml();
}


