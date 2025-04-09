<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupTemplate.aspx.cs"
    Inherits="Zhongsoft.Portal.Metro.List.GroupTemplate" %>

<%@ Register Src="../Controls/TilesContainer.ascx" TagName="TilesContainer" TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal.Metro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>企业一体化运营管理平台-领导</title>
    <link href="/Portal/themes/custom/styles/metro.css" rel="stylesheet" />
    <script src="../../UI/Script/spin.min.js" type="text/javascript"></script>
    <script type="text/javascript">
       
    </script>
    <style type="text/css">
        .tileanchor
        {
            margin: 0px !important;
            border-width: 0px;
            float: left;
            position: relative;
            cursor: pointer;
            display: inline-block;
        }
        
        .tileanchor span
        {
            display: inline-block;
            position: absolute;
            bottom: 5px;
            right: 8px;
            font-size: 12px;
            color: #fff;
            font-weight: bold;
            line-height: 25px !important;
            font-family: "微软雅黑";
        }
        .metrogrouptitle
        {
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            line-height: 20px;
            display: block;
            text-align: right;
            cursor: pointer;
        }
        .metrogroup
        {
            float: left;
        }
        
        .tilescontainer
        {
            float: left;
        }
        .groupimgicon
        {
            float: left;
        }
        .unpurchasetext
        {
            display: inline-block;
            position: absolute;
            top: 5px;
            left: 8px;
            font-size: 14pt;
            color: Red;
            font-weight: bold;
            line-height: 25px !important;
            font-family: "微软雅黑";
        }
        .unpurchase
        {
            background-color: Gray;
        }
        .nopermissontext
        {
            display: inline-block;
            position: absolute;
            top: 5px;
            left: 8px;
            font-size: 14pt;
            color: Black;
            font-weight: bold;
            line-height: 25px !important;
            font-family: "微软雅黑";
        }
        .nopermisson
        {
            background-color: Gray;
        }
        
        .tilescontainer > a > iframe
        {
            border: none;
        }
        
        .divLock
        {
            background-color: Gray;
            display: none;
            height: 25px;
            width: 100%;
            position: absolute;
            display: inline-block;
            bottom: 0px;
            left: 0px;
            line-height: 25px;
            cursor: pointer;
        }
        .divLock img
        {
            /*margin-top: 4px;*/
            position: absolute;
            display: inline-block;
            bottom: 3px;
        }
        
    </style>
</head>
<base target="_self"></base>
<body style="">
    <form id="form1" runat="server">
    <a id="reload" href="GroupTemplate.aspx?editBaseView=1&metroId=<%= MetroId %>" style="display:none"></a>    
    <div style="margin-top:30px; margin-left:120px;">
        <div id="divContainer" runat="server" class="metrogroupcontainer" style="min-width:1200px;">
            <asp:Repeater runat="server" ID="metroGroups" OnItemDataBound="metroGroups_ItemDataBound" OnItemCommand="metroGroups_ItemCommand">
                <ItemTemplate>
                    <div groupid='<%#Eval("GroupId") %>' class="metrogroup" runat="server" id="divGroupContainer">
                       <table width="100%">
                          <tr>
                             <td align="right" style=" width:50%;">
                                <asp:Label runat="server" ID="lbGroupTitle" CssClass="metrogrouptitle"  ></asp:Label>
                            </td>
                            <td align="left"  style=" width:50%;">
                                <asp:LinkButton ID="lbtnAdd" runat="server" CommandName="AddData" EnableTheming="false" Visible="false" >
                                        <img alt="添加" id="ibtnAdd" onclick="return addOrEditTile(2,'','<%# Eval("GroupId").ToString() %>')"
                                        border="0" src="../../Themes/Images/btn_new.gif" style="cursor: hand" />
                                </asp:LinkButton> 
                        
                           </td>
                       </tr>
                  </table>     
                        <div runat="server" id="divGroup">
                            <uc1:TilesContainer ID="tileContainer" runat="server" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <asp:LinkButton ID="lbtnClear" runat="server" OnClick="lbtnClear_Click" Style="display: none"
        attrClick="true">
    </asp:LinkButton>
    <!-- 代码 结束 -->
    </form>
    <script>
        var opts = {
            lines: 10, // 花瓣数目
            length: 5, // 花瓣长度
            width: 3, // 花瓣宽度
            radius: 5, // 花瓣距中心半径
            corners: 1, // 花瓣圆滑度 (0-1)
            rotate: 0, // 花瓣旋转角度
            direction: 1, // 花瓣旋转方向 1: 顺时针, -1: 逆时针
            color: 'blue', // 花瓣颜色
            speed: 1, // 花瓣旋转速度
            trail: 60, // 花瓣旋转时的拖影(百分比)
            shadow: false, // 花瓣是否显示阴影
            hwaccel: false, //spinner 是否启用硬件加速及高速旋转            
            className: 'spinner', // spinner css 样式名称
            zIndex: 2e9, // spinner的z轴 (默认是2000000000)
            top: 8, // spinner 相对父容器Top定位 单位 px
            left: 28// spinner 相对父容器Left定位 单位 px
        };


        var $metroId = "<%=MetroId %>"
        var $editBaseView = parseBool("<%=EditBaseView %>") ? "1" : "0";
        var $groupsItems = [];
        var $tileItems = [];

        var $masks = [];

        function showUpdating(id, sel) {

            var divMask = $("<div id='divMask' ></div>");
            var spinner = new Spinner(opts);

            $masks.push({ id: id, div: divMask, spinner: spinner });
            var target = $(sel);
            var msgDivHeight = 40;
            var msgDivWidth = 80;
            var msgDivLeft = (target.width() - msgDivWidth) / 2
            var msgDivTop = (target.height() - msgDivHeight) / 2
            divMask.css({
                position: 'relative',
                top: 0,
                left: 0,
                'z-index': 9999,
                width: target.width(),
                height: target.height(),
                'background-color': "#fff",
                opacity: 0.1
            }).append($('<div  style=" position:absolute;width:' + msgDivWidth
                + 'px;height:' + msgDivHeight + 'px; padding:2px;background:#ccca;top:' + msgDivTop +
                'px;left:' + msgDivLeft +
                'px"></div>')); ;

            target.append(divMask);
            spinner.spin(divMask.children().eq(0).get(0));
        }

        function initCustomerPlugin() {
            //loadAnimetion();

            $tileItems = $(".tilescontainer").sortable({ update: function (event, ui) {
                saveSortResult(1, ui.item);
            }
            });
            $tileItems.disableSelection();

            if ("<%=MetroView.ContentType %>" == "<%=(int)MetroContentType.MetroView %>") {
                $groupsItems = $(".metrogroupcontainer").sortable({ update: function (event, ui) {
                    saveSortResult(0, ui.item);
                }
                });
                $groupsItems.disableSelection();
            }
            else {
                $groupsItems = $(".metrogroupcontainer");
            }
        }

        function saveSortResult(type, item) {
            var selectorExp = "body";
            var id = $metroId;
            var idArray = [];
            var idAttrName = "groupid";
            if (type == 1) {
                idAttrName = "tileid";
                selectorExp = "#" + item[0].parentElement.id;
                id = item[0].parentElement.parentElement.parentElement.attributes["groupid"].value
            }

            $.each(item[0].parentElement.children, function (i, ele) {
                idArray.push(ele.attributes[idAttrName].value);
            })

            var stringIds = idArray.join('|');

            $.ajax({
                url: 'GroupTemplate.aspx?metroId=' + $metroId + "&editBaseView=" + $editBaseView,
                data: { asyfunc: "SaveSortResult",
                    parentId: id,
                    type: type,
                    idArray: stringIds
                },
                type: "POST",
                success: function (res) {
                    hideUpdating(id);
                },
                error: function (ex) {
                    alert(ex.statusText);
                    hideUpdating(id);
                },
                beforeSend: function () {
                    showUpdating(id, selectorExp);
                }
            });
        }

        function hideUpdating(id) {
            var index = 0;
            $.each($masks, function (i, obj) {
                if (obj.id == id) {
                    obj.spinner.stop();
                    obj.div.fadeOut(3000).delay(3000).remove();
                    index = i;
                    return false;
                }
            })

            $masks.splice(index, 1);
        }

        function loadAnimetion() {
            $("#myController1").jFlow({
                slides: "#slides1",
                controller: ".jFlowControl1",
                slideWrapper: "#jFlowSlide1",
                selectedWrapper: "jFlowSelected1",
                auto: true,
                duration: 600,
                width: "260px",
                height: "230px",
                prev: ".jPrev",
                next: ".jNext"
            });
            $("#myController2").jFlow({
                slides: "#slides2",
                controller: ".jFlowControl2",
                slideWrapper: "#jFlowSlide2",
                selectedWrapper: "jFlowSelected2",
                auto: true,
                duration: 600,
                width: "260px",
                height: "230px",
                prev: ".jPrev",
                next: ".jNext"
            });
            $("#myController3").jFlow({
                slides: "#slides3",
                controller: ".jFlowControl3",
                slideWrapper: "#jFlowSlide3",
                selectedWrapper: "jFlowSelected3",
                auto: true,
                duration: 600,
                width: "260px",
                height: "230px",
                prev: ".jPrev",
                next: ".jNext"
            });
            $("#myController4").jFlow({
                slides: "#slides4",
                controller: ".jFlowControl4",
                slideWrapper: "#jFlowSlide4",
                selectedWrapper: "jFlowSelected4",
                auto: true,
                duration: 600,
                width: "260px",
                height: "230px",
                prev: ".jPrev",
                next: ".jNext"
            });
            $("#myController5").jFlow({
                slides: "#slides5",
                controller: ".jFlowControl5",
                slideWrapper: "#jFlowSlide5",
                selectedWrapper: "jFlowSelected5",
                auto: true,
                duration: 600,
                width: "260px",
                height: "230px",
                prev: ".jPrev",
                next: ".jNext"
            });
            $("#myController6").jFlow({
                slides: "#slides6",
                controller: ".jFlowControl6",
                slideWrapper: "#jFlowSlide6",
                selectedWrapper: "jFlowSelected6",
                auto: true,
                duration: 600,
                width: "260px",
                height: "230px",
                prev: ".jPrev",
                next: ".jNext"
            });
            $("#myController7").jFlow({
                slides: "#slides7",
                controller: ".jFlowControl7",
                slideWrapper: "#jFlowSlide7",
                selectedWrapper: "jFlowSelected7",
                auto: true,
                duration: 600,
                width: "260px",
                height: "230px",
                prev: ".jPrev",
                next: ".jNext"
            });
            $("#myController8").jFlow({
                slides: "#slides8",
                controller: ".jFlowControl8",
                slideWrapper: "#jFlowSlide8",
                selectedWrapper: "jFlowSelected8",
                auto: true,
                duration: 600,
                width: "260px",
                height: "230px",
                prev: ".jPrev",
                next: ".jNext"
            });
        }

        function addOrEditTile(actType, bId, groupId) {
            var param = { actionType: actType, bizId: bId, groupID: groupId };
            var url = buildQueryUrl("/Metro/List/TileEditor.aspx", param);
            showDivDialog(encodeURI(url), null, 600, 400, afterParamFilter);
            return false;
        }
        function afterParamFilter(dom) {
            if (dom != null && dom != "undefined") {
                reload.click();
                return false;
            }
            else {
                return false;
            }
        }

        function openTileWindow(metroId, groupId, tileId, url, target) {
            if (target == "workspace" || target == "_self") {
                refreshTabBar(metroId, groupId, tileId);
            }
            if (url != "") {
                window.open(url, target);
            }
        }

        function refreshTabBar(metroId, groupId, tileId) {
            parent.setBannerCallback(metroId, groupId, tileId);
        }

        if (parseBool("<%=EditBaseView %>"))
       {
            $('html').css('background', 'url(../../Themes/custom/images/banner_bg88.jpg)');
            $('html').css('background-attachment', 'fixed');
        }

        function showLock(obj) {
            $("#" + obj).show(); //显示 
        }
        function hideLock(obj) {
            $("#" + obj).hide(); //隐藏 
        }

        function editPermission(menuId, menuName, isModule) {
            var url = buildQueryUrl("sys/Acl/AclMgr.aspx", { secObjId: menuId, secObjName: encodeURI(menuName), ismodule: isModule });
            showModal(url, null, 980, 590);
            document.getElementById('<%=lbtnClear.ClientID %>').click();
            //showDivDialog(url, null, 980, 590, afterPermission);
            return false;
        }
        function afterPermission(dom) {
            document.getElementById('<%=lbtnClear.ClientID %>').click();
            return true;
        }

        //编辑业务门户内容 1210 xiedx
        function editList(type, bizId) {
            if (type == 0 || type == 1 || type == 2) {
                var url = null;
                var json = null;
                if (type == 0) {
                    url = "Custom/List/DashboardEditor.aspx";
                    json = { "IsBaseView": "1" };
                }
                else if (type == 1) {
                    json = { "IsBaseView": "1", "IsCustom": "1" };
                    url = "Custom/List/ListEditor.aspx";
                }
                else if (type == 2) {
                    url = "Custom/List/XChartEditor.aspx";
                }
                url = buildBizUrl(3, bizId, url, { "IsBaseView": "1" });
                showDivDialog(url, null, 1080, 600, json);
            }
            else {
                alert("没有可编辑的视图！");
                return false;
            }
        }
    </script>
</body>
</html>
