
function timeRangeSelected(start, end, location) {

    //var sFeatures = "dialogHeight:600px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:yes; status: no;";
    var url = buildQueryUrl("/KMS/List/Meet/MeetingRoomPredeEditor.aspx?actionType=2&start=" + start.toStringSortable() + "&end=" + end.toStringSortable());
    if (location) {
        url += "&location=" + location;
    }
    //使用弹出层方式   
    if (showDivDialog(url, "", 950, 600, refeshCallBack) != undefined) {
        dp.commandCallBack('refresh');
    }
    dp.clearSelection();
}

function eventClick(e) {

    //var sFeatures = "dialogHeight:600px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:yes; status: no;";
    var url = buildQueryUrl("/KMS/List/Meet/MeetingRoomPredeEditor.aspx?actionType=3&bizId=" + e.value());
    var strStart = e.data.start.replace("T", " ").replace("-", "/");
    var start = Date.parse(strStart);
    var today = new Date();
    if (e.data.backColor == undefined && start > today) {
        var url = buildQueryUrl("/KMS/List/Meet/MeetingRoomPredeEditor.aspx?actionType=3&bizId=" + e.value());
    }
    if (showDivDialog(url, "", 950, 600, refeshCallBack) != undefined) {
        dp.commandCallBack('refresh');
    }
    dp.clearSelection();
}

function refeshCallBack() {
    dp.commandCallBack('refresh');
}

function afterRender() {
    //    $.get('Control/ConflictsCount.ascx', function (data) {
    //        $('#conflicts').html(data);
    //    });
}

