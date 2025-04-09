/** TreeGrid **/
function initTreeGrid() {
    $('.TreeGrid_btn').click(function () {
        var pid = $(this).attr('sid');
        var treeId = $(this).attr('TreeId');

        var isShow = true;
        if ($(this).attr('bc') == 'f') {
            isShow = true;

            $(this).attr('bc', 't');
            $(this).attr('src', treeGridMinus);
        }
        else {
            isShow = false;

            $(this).attr('bc', 'f');
            $(this).attr('src', treeGridPlus);
        }

        $('#' + treeId + ' div[id^="' + pid + '_"]').each(function () {
            var a = $(this).parent().parent();
            if (isShow) {

                if ($(this).attr("cb") == pid) {

                    a.show();
                    $(this).attr("cb", "");
                }
            }
            else {
                if ($(this).attr("cb") == "") {
                    $(this).attr("cb", pid);
                    a.hide();
                }
            }
        });
    });
}

//默认设置TreeGridView控件处于关闭状态
//modify by wanglj 20150625
function initTreeDefaultColse() {
    $('img[sid][TreeId]').each(function () {
        var pid = $(this).attr('sid');
        var treeId = $(this).attr('TreeId');
        $('#' + treeId + ' div[id^="' + pid + '_"]').parent().parent().hide();
        $(this).attr("src", treeGridPlus);
        $(this).attr('bc', 'f');

        $('#' + treeId + ' div[id^="' + pid + '_"]').each(function () {
            var a = $(this).parent().parent();
            if ($(this).attr("cb") == "") {
                $(this).attr("cb", pid);
                a.hide();
            }
        });
    });
}
