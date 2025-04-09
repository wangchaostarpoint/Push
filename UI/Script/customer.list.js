function buildMenu() {
    $('.menu-div').hover(function () {
        var id = $(this).attr('menu');
        var $a = $(this).children('a');
        $(id).css({ display: '', top: $a.offset().top + $a.height(), left: $a.offset().left + ($a.width() - $(id).width() - 10) });
    }, function () {
        var id = $(this).attr('menu');
        $(id).css({ display: 'none' });
    })
    $('.menu-item').hover(function () {
        $(this).addClass('menu-active');
    }, function () {
        $(this).removeClass('menu-active');
    })
}


function buildFilter(filterFlag) {
    var w;
    var h;
    var l;
    var uup = '/portal/Themes/Images/fleximages/uup.png';
    var ddn = '/portal/Themes/Images/fleximages/ddn.png';
    var up = '/portal/Themes/Images/fleximages/up.png';
    var dn = '/portal/Themes/Images/fleximages/dn.png';
    var $s = $('#hide-filter');
    var $btn = $('#showSearch');
    if (filterFlag.val() == "1") {
        $s.removeClass('hide-filter').addClass('show-filter');
        $btn.children('img').attr('src', uup);
    }
    else {
        $s.removeClass('show-filter').addClass('hide-filter');
        $btn.children('img').attr('src', ddn);
    }

    $btn.toggle(function () {
        $s.removeClass('hide-filter').addClass('show-filter');
        $(this).children('img').attr('src', uup);
        filterFlag.val("1");
    }, function () {
        $s.removeClass('show-filter').addClass('hide-filter');
        $(this).children('img').attr('src', ddn);
        filterFlag.val("0");
    })
    $(window).resize(function () {
        w = $btn.prev('td').width();
        $s.css({ width: w + 'px' });
    })
    $btn.hover(function () {
        var $img = $(this).children('img');
        if ($img.attr('src') == uup) {
            $img.attr('src', up);
        } else if ($img.attr('src') == ddn) {
            $img.attr('src', dn);
        }
    }, function () {
        var $img = $(this).children('img');
        if ($img.attr('src') == up) {
            $img.attr('src', uup);
        } else if ($img.attr('src') == dn) {
            $img.attr('src', ddn);
        }
    })

    $('.flex-search .ui-icon-close').click(function () {
        $(this).parent('span').remove();
    })
}





//function getDesignObj() {
//    var $xml = $("#" + $hiViewId);
//    var $t = new KPMSXml();
//    $t.loadXML($xml.val());
//    return $t;
//}
//function changeSize(n, nwidth, gvid) {
//    var $view = getDesignObj();
//    var xp = "//LightBoundField[" + n + "]/Width";
//    var s = $view.selectSingleNode(xp);
//    s.text = nwidth;
//    $("#" + $hiViewId).val($view.xml());
//    $sflag.val("1");
//    showSave();
//}
//function dragCol(n, o, gvid) {
//    var $desginView = getDesignObj();
//    var s = $desginView.selectNodes("//LightBoundField");
//    var node = s[n].cloneNode(true);
//    if (n > o) {
//        s[n].parentNode.removeChild(s[n]);
//        if (s[o].parentNode != null)
//            s[o].parentNode.insertBefore(node, s[o]);
//    }
//    else {
//        s[n].parentNode.removeChild(s[n]);
//        if (o == s.length - 1) {
//            if (s[o].parentNode != null)
//                s[o].parentNode.appendChild(node);
//        }
//        else {
//            if (s[o].parentNode != null)
//                s[o].parentNode.insertBefore(node, s[o + 1]);
//        }
//    }
//    $("#" + $hiViewId).val($desginView.xml());
//    $sflag.val("1");
//    showSave();
//}
function customerFilter(wrapper) {
    this.wrapperId = wrapper;
}

customerFilter.prototype.appendFilter = function (xmlstr) {

}