<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkPlat.aspx.cs" Inherits="Zhongsoft.Portal.WorkPlat" %>

<%@ Register Src="Metro/Controls/MetroHeader.ascx" TagName="MetroHeader" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>
    <link href="Themes/custom/styles/global.css" rel="stylesheet" type="text/css" />
    <link href="Themes/custom/styles/defaultpage.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .fhome {
            color: #ceeaf6;
        }

        a.fhome:hover {
            color: #ecf7fb;
        }
        /*.astyle
        {
            color: #000000;
            margin-bottom: 3px;
        }*/
        .welcome {
            float: right;
            font-size: 12px;
            margin-top: 30px;
            color: #f7f7f7;
        }

            .welcome a {
                color: #f7f7f7;
            }

                .welcome a:hover {
                    text-decoration: underline;
                    color: #f7f7f7;
                }

        .leftmenu {
            overflow: hidden;
            width: 180px;
        }

            .leftmenu span {
                width: 178px;
                padding-left: 0;
            }

            .leftmenu a:hover {
                color: #000000;
                display: block;
            }

        .leftmenu-t {
            width: 197px;
            margin: 5px 0px 0px 10px;
            padding-bottom: 8px;
            overflow: auto;
        }
        /*.nav{ border-top:none;}*/
        .imp {
            font-weight: bold !important;
            float: none !important; /*color:Red;*/
            color: #f9a949;
        }

        .wp_main {
            border: none;
        }
        /* .wp_header div a
        {
            float: none;
        }
        .wp_header div a:link, .wp_header div a:visited
        {
            float: none;
        }
        */
        .left {
            padding: 7px 3px 0px 4px;
            background: #eff2f7;
        }

        .logotitle {
            padding-left: 15px;
            width: 300px;
            color: #ffffff;
            font-family: 黑体;
            font-size: 16pt;
            background: #56596a;
            word-break: keep-all;
            white-space: nowrap;
        }
    </style>
    <script type="text/javascript">

        var pading = 6; //统一边框距离

        window.onresize = function () {

            setSize();
        }

    </script>
    <script type="text/javascript">
        var isShow = false;
        function selectTag(showContent, selfObj) {
            // 操作标签
            var tag = document.getElementById("tags").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }
            selfObj.parentNode.className = "selectTag";
            // 操作内容
            for (i = 0; j = document.getElementById("tagContent" + i); i++) {
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";
        }

        var isOpen = true;


        function showLeft() {
            $("#tdleftMenu").toggle(null, null, 500);
            if (isOpen) {
                $("#leftStatus").attr("src", "Themes/Images/pic_openbtn.gif");
                $('#workSpace').width(($(window).width() - pading) + 'px');
                isOpen = false;
            }
            else {
                var leftW = $('.wp_main').width();
                $("#leftStatus").attr("src", "Themes/Images/pic_closebtn.gif");
                $('#workSpace').width(($(window).width() - leftW - pading) + 'px');
                isOpen = true;
            }
        }

        function showUserConfig() {
            showModal(buildBizUrl("3", "", "Sys/OrgUsers/UserConfigEditor.aspx", null), "", 500, 500);
        }

        function showMoreMenu() {
            $("li[name='hiddenModule']").each(function () {
                $(this).attr("style", "display:block;");
            })
            $("#divMoreMenu").attr("style", "display:none;");
        }

        function SetNoRemSignPwd() {
            $.post("Default.aspx",
                { asyfunc: "SetNoRemSignPwd" },
                function () {
                    $("#cbRemeberPwd").attr("disabled", "disabled");
                }
            )
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="metroheader" style="height: 40px;">
            <uc2:MetroHeader ID="metroHeader" runat="server" />
        </div>
        <table cellpadding="0" cellspacing="0" width="100%" style="margin-top: 4px">
            <tr>
                <td rowspan="2" valign="top" id="tdleftMenu" class="left">
                    <div class="wp_listleft">
                        <div class="wp_main" id="divParent" style="width: 205px; top: -5px; padding-right: 10px; padding-bottom: 3px; position: relative; overflow-x: hidden; overflow-y: auto">
                            <div class="lefttop">
                                <span style="padding-left: 7px; color: #3a3a3a; font-size: 14px; font-weight: bold"
                                    id="spanCatalog"></span><%-- |<a href="http://10.102.131.13/" target="_blank" style="">
                                <span style="padding-left: 7px; color:Blue; font-size: 12px; font-weight: bold"
                                id="span1">
                                原OA入口
                                </span>
                                </a>--%>
                            </div>
                            <div class="leftmenu-t" id="leftmenu" style="height: 70%" runat="server">
                                <%=ChildrenPages%>
                            </div>
                            <div class="nav">
                                <ul id="nav">
                                    <%=ParentMenuUrl%>
                                    <li></li>
                                    <br />
                                </ul>
                                <div id="divMoreMenu" style="display: none">
                                    &nbsp;&nbsp;&nbsp;<a href="javascript:showMoreMenu()">更多…</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                <td rowspan="2" valign="top" onclick="showLeft()" style="background: #22334d;">
                    <div class="closeleft">
                    </div>
                </td>
                <td style="display: none"></td>
            </tr>
            <tr>
                <td valign="top">
                    <iframe name="workSpace" src="<%=WebAppPath%>/Sys/Workflow/WorkToDoList.aspx?secid=0E790AE9-18D4-4C13-9536-9557B04EDD86" frameborder="0"
                        id="workSpace"></iframe>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            //信息传阅
            var info;
            var workTodoInfo;
            var alertinfo;
            var emailInfo;
            var flagInfo = "信息传阅";
            var flagPassInfo = "我的待阅";
            var flagWorkToDoInfo = "待办工作";
            var flagToDoInfo = "我的待办";
            var alertInof = "通知公告";
            var flagEmailInfo = "电子邮件";

            var projectSZInfo;
            var flagProjectSZInfo = "担任项目设总";
            var projectZRGInfo;
            var flagProjectZRGInfo = "担任专业设总";
            var projectZSRInfo;
            var flagProjectZSRInfo = "担任专业主设人";
            var projectSJRInfo;
            var flagProjectSJRInfo = "担任设计人";
            var projectJHRInfo;
            var flagProjectJHRInfo = "担任校核人";
            var projectSCRInfo;
            var flagProjectSCRInfo = "担任审查人";

            function initCustomerPlugin() {
                if ($(".current").length > 0) {
                    $("#spanCatalog").html($($(".current")[0]).children('a').attr('catalog'));
                }
                $("#nav li").click(function () {
                    var target = $(this).children('a').attr('target');
                    $("#nav").children("li").removeClass('current');
                    $(this).addClass('current');
                    $('.leftmenu').css('display', 'none');
                    $('#' + target).css('display', '');
                    var span = $(this).children('a').attr('catalog');
                    $("#spanCatalog").html(span);

                    //1127 xiedx 自动滚到到最上方
                    var e = document.getElementById("leftmenu");
                    var divParent = document.getElementById("divParent");
                    e.scrollTop = "0px";
                    divParent.scrollTop = "0px";
                });

                //左侧菜单效果
                $('.leftmenu a').each(function () {
                    var target = $(this).attr('target');
                    var subDivId = $(this).attr('subDivId');
                    if (target == 'workSpace' || target == '_blank') {
                        $(this).click(function () {
                            $('.leftmenu a').removeClass('leftmenuclick');
                            $(this).addClass('leftmenuclick');
                            $("#spanTitle").html($(this).children('span').text());
                        })
                    }
                    if (subDivId != undefined && subDivId != "") {
                        $(this).click(function () {
                            var dis = $('#' + subDivId).css('display');
                            if (dis == "block") {
                                $('#' + subDivId).css('display', 'none');
                                $(this).children('span').children('img').attr('src', 'Themes/Images/btn-plus.gif');
                            }
                            else {
                                $('#' + subDivId).css('display', '');
                                $(this).children('span').children('img').attr('src', 'Themes/Images/btn-minus.gif');
                            }
                        })
                    }
                    return true;
                });

                setSize();

                $("#<%=leftmenu.ClientID %>").find('a').each(function () {
                    $(this).click(function () {
                        if (this.innerText != "" || this.innerText != null || this.innerText != undefined) {
                            $("#<%=leftmenu.ClientID %>").find('td').css("background-color", "transparent");
                            $(this).parent("td").css('background-color', '#CBCBFE');

                        }
                    })
                });

                var action = getUrlParam('action');
                //下载信息传阅数量
                $("#<%=leftmenu.ClientID %>").find('a').each(function () {
                    if (this.innerText != "" || this.innerText != null || this.innerText != undefined) {
                        if (action != '') {
                            //如果在门户首页点击了“发起任务”，则自动定位到员工自助
                            if (action == 'newTask') {
                                if (this.innerText == "员工自助" || this.innerText == "发起流程") {
                                    var formUrl = $(this).attr('href');
                                    //自动定位到具体业务模块                                
                                    var defaultType = getUrlParam('DefaultWFType');
                                    if (defaultType != undefined && defaultType != '')
                                        formUrl += '&DefaultWFType=' + defaultType;
                                    $('#workSpace').attr('src', formUrl);
                                    $(this).click();
                                }
                            }
                            else if (action == 'myDone') {
                                if (this.innerText == "我的已办") {
                                    var formUrl = $(this).attr('href');
                                    //自动定位到具体业务模块                                
                                    $('#workSpace').attr('src', formUrl);
                                    $(this).click();
                                }
                            }

                            try {
                                var newUrl = '';
                                //修改地址栏中的地址，去掉传参重新定位为Portal主页
                                var stateObject = {};
                                history.pushState(stateObject, 'x', newUrl);
                            }
                            catch (ex) { };
                        }

                        if (this.innerText == flagInfo || this.innerText == flagPassInfo) {
                            info = this;
                            getInfo(this);
                        }
                        //else if (this.innerText == alertInof) {
                        //    alertinfo = this;
                        //    getAlertInfo();
                        //}
                        else if (this.innerText == flagWorkToDoInfo || this.innerText == flagToDoInfo) {
                            workTodoInfo = this;
                            getTodo(this);
                        }
                        else if (this.innerText == flagEmailInfo) {
                            emailInfo = this;
                            getEmailNum();
                        }
                        else if (this.innerText == flagProjectSZInfo) {
                            projectSZInfo = this;
                            getSzNum();
                        }
                        else if (this.innerText == flagProjectZRGInfo) {
                            projectZRGInfo = this;
                            getZrgNum();
                        }
                        else if (this.innerText == flagProjectZSRInfo) {
                            projectZSRInfo = this;
                            getZsrNum();
                        }
                        else if (this.innerText == flagProjectSJRInfo) {
                            projectSJRInfo = this;
                            getSjrNum();
                        }
                        else if (this.innerText == flagProjectJHRInfo) {
                            projectJHRInfo = this;
                            getJHRNum();
                        }
                        else if (this.innerText == flagProjectSCRInfo) {
                            projectSCRInfo = this;
                            getSCRNum();
                        }
                    }
                });
                //setTimeout(getDeptProjNum(), 10000);
            }

            function setSize() {
                var headerH = $("#metroheader").height();
                var leftW = $('.wp_main').width();
                var letftop = $('.lefttop').height();
                //存在问题$(window).height()？？？
                $('#workSpace').height(($(window).height() - headerH) + 'px');
                $('.closeleft').height(($(window).height() - headerH) + 'px');

                //控制左侧高度10-28
                var c = "<%=parentMenuCount %>";
                if (c > 6) {
                    c = 6;
                }
                //增加父级菜单区域高度
                var h = 45 * c + 55;
                $('.nav').height(h.toString() + 'px');
                var letftop = $('.lefttop').height();
                $('#leftmenu').height(($(window).height() - headerH - letftop - $('.nav').height()) + 'px');

                $('#workSpace').width(($(window).width() - leftW - pading - 15) + 'px');
            }

            //获取待办
            function getTodo(info) {
                $.post("<%=WebAppPath %>/Sys/Workflow/WorkToDoList.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (res == "") { return; }
                        var flag = info.innerText;
                        var index = workTodoInfo.innerHTML.indexOf(flag);
                        workTodoInfo.innerHTML = workTodoInfo.innerHTML.substring(0, index) + flag + '(<font color="red">' + res + '</font>)';
                    }
                );
            }

            //获取待办
            function getTodo() {
                $.post("<%=WebAppPath %>/Sys/Workflow/WorkToDoList.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (res == "") { return; }
                        var flag = flagWorkToDoInfo;
                        var index = workTodoInfo.innerHTML.indexOf(flagWorkToDoInfo);
                        if (index == -1) {
                            flag = flagToDoInfo;
                            index = workTodoInfo.innerHTML.indexOf(flagToDoInfo);
                        }

                        workTodoInfo.innerHTML = workTodoInfo.innerHTML.substring(0, index) + flag + '(<font color="red">' + res + '</font>)';
                    }
                );
            }

            //$(window).load(function () {
            //    getSzNum();
            //    //getJhgcsNum();
            //    getZsrNum();
            //    getZrgNum();
            //    getSjrNum();
            //    //getDeptProjNum();
            //});
            function showWorkSpace(pageUrl) {
                var url;
                if (pageUrl.indexOf("/") > 0) {
                    url = $appCtx.appPath + "/" + pageUrl;
                } else {
                    url = $appCtx.appPath + pageUrl;
                }
                $("#workSpace").attr("src", url);
            }

            //设置树节点展开隐藏
            function showExpanded(obj) {
                $(obj).parent().parent().find("a")[0].click();
                return false;
            }

            //获取传阅
            function getInfo(info) {
                $.post("<%=WebAppPath %>/Sys/Workflow/WorkForwardList.aspx",
                    { asyfunc: "GetForwardItemsCount" },
                    function (res) {
                        if (res == "") { return; }
                        var flag = info.innerText;
                        var index = info.innerHTML.indexOf(flag);
                        info.innerHTML = info.innerHTML.substring(0, index) + flag + '(<font color="red">' + res + '</font>)';
                    }
                );
            }
            //获取工作提醒数量
            function getAlertInfo() {
                $.post("<%=WebAppPath %>/EPMS/List/Sys/PortalAlertList.aspx",
                    { asyfunc: "GetPortalAlertAlertNum" },
                    function (res) {
                        if (res == "") { return; }
                        var index = alertinfo.innerHTML.indexOf(alertInof);
                        alertinfo.innerHTML = alertinfo.innerHTML.substring(0, index) + alertInof + '(<font color="red">' + res + '</font>)';
                    }
                );
            }
            //获取电子邮件数量
            function getEmailNum() {
                $.post("<%=WebAppPath %>/EPMS/List/Sys/PortalAlertInboxList.aspx",
                    { asyfunc: "GetPortalAlertAlertNum" },
                    function (res) {
                        if (res == "") { return; }
                        var index = emailInfo.innerHTML.indexOf(flagEmailInfo);
                        emailInfo.innerHTML = emailInfo.innerHTML.substring(0, index) + flagEmailInfo + '(<font color="red">' + res + '</font>)';
                    }
                );
            }
            //获取担任设总
            function getSzNum() {
                $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectList.aspx",
                    { asyfunc: "GetMyProjectNumber", strRoleName: 'Sz' },
                    function (res) {
                        if (res == "") { return; }
                        var all = projectSZInfo.innerHTML;
                        all = all.replace(flagProjectSZInfo, flagProjectSZInfo + '[' + res + ']');
                        projectSZInfo.innerHTML = all;
                    }
                );

            }
            //担任专业主设人
            function getZsrNum() {
                $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListZsr.aspx",
                    { asyfunc: "GetMyProjectNumber", roleName: 'Zsr' },
                    function (res) {
                        if (res == "") { return; }
                        var all = projectZSRInfo.innerHTML;
                        all = all.replace(flagProjectZSRInfo, flagProjectZSRInfo + '[' + res + ']');
                        projectZSRInfo.innerHTML = all;
                    }
                );
            }
            //担任专业设总
            function getZrgNum() {
                $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListZsr.aspx",
                    { asyfunc: "GetMyProjectNumber", roleName: 'Zrg' },
                    function (res) {
                        if (res == "") { return; }
                        var all = projectZRGInfo.innerHTML;
                        all = all.replace(flagProjectZRGInfo, flagProjectZRGInfo + '[' + res + ']');
                        projectZRGInfo.innerHTML = all;
                    }
                );
            }

            //担任设计人
            function getSjrNum() {
                $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListSjr.aspx",
                    { asyfunc: "GetMyProjectNumber"},
                    function (res) {
                        if (res == "") { return; }
                        var all = projectSJRInfo.innerHTML;
                        all = all.replace(flagProjectSJRInfo, flagProjectSJRInfo + '[' + res + ']');
                        projectSJRInfo.innerHTML = all;
                    }
                );
            }
            //担任校核人
            function getJHRNum() {
                $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListZsr.aspx",
                    { asyfunc: "GetMyProjectNumber", roleName: 'Jhr' },
                    function (res) {
                        if (res == "") { return; }
                        var all = projectJHRInfo.innerHTML;
                        all = all.replace(flagProjectJHRInfo, flagProjectJHRInfo + '[' + res + ']');
                        projectJHRInfo.innerHTML = all;
                    }
                );
            }
            //担任审查人
            function getSCRNum() {
                $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListZsr.aspx",
                    { asyfunc: "GetMyProjectNumber", roleName: 'SCR' },
                    function (res) {
                        if (res == "") { return; }
                        var all = projectSCRInfo.innerHTML;
                        all = all.replace(flagProjectSCRInfo, flagProjectSCRInfo + '[' + res + ']');
                        projectSCRInfo.innerHTML = all;
                    }
                );
            }
            //获取本部项目数量
            function getDeptProjNum() {
                //加载部门数量
                var $ids = "";
                $("#<%=leftmenu.ClientID %> a[deptProj]").each(function () {
                    $ids += $(this).attr("deptProj") + "|";
                });
                $.post("<%=WebAppPath %>/EPMS/List/Project/DeptProjectSpecList.aspx",
                    { asyfunc: "GetDeptProjectNum", strDeptIDs: $ids },
                    function (res) {
                        if (res == "") { return; }
                        var $l = eval('(' + res + ')');
                        $("#<%=leftmenu.ClientID %> a[deptProj]").each(function () {
                            var $specID = $(this).attr("deptProj");
                            for (var i = 0; i < $l.length; i++) {
                                var $id = $l[i][0];
                                var $num = $l[i][1];
                                if ($specID == $id) {
                                    var tip = $(this).text();
                                    var all = $(this).html();
                                    all = all.replace(tip, tip + '[' + $num + ']');
                                    $(this).html(all);
                                }
                            }
                        });
                    }
                );
                $ids = "";
                $("#<%=leftmenu.ClientID %> a[deptProjSpec]").each(function () {
                    $ids += $(this).attr("deptProjSpec") + "|";
                });
                //科室
                $.post("<%=WebAppPath %>/EPMS/List/Project/DeptProjectSpecList.aspx",
                    { asyfunc: "GetOrgUnitProjectNum", strDeptIDs: $ids },
                    function (res) {
                        if (res == "") { return; }
                        var $l = eval('(' + res + ')');
                        $("#<%=leftmenu.ClientID %> a[deptProjSpec]").each(function () {
                            var $specID = $(this).attr("deptProjSpec");
                            for (var i = 0; i < $l.length; i++) {
                                var $id = $l[i][0];
                                var $num = $l[i][1];
                                if ($specID == $id) {
                                    var tip = $(this).text();
                                    var all = $(this).html();
                                    all = all.replace(tip, tip + '[' + $num + ']');
                                    $(this).html(all);
                                }
                            }
                        });
                    }
                );
                $ids = "";
                $("#<%=leftmenu.ClientID %> a[orgProjSpec]").each(function () {
                    $ids += $(this).attr("orgProjSpec") + "|";
                });
                $.post("<%=WebAppPath %>/EPMS/List/Project/DeptProjectSpecList.aspx",
                    { asyfunc: "GetOrgUnitSpecProjectNum", strDeptIDs: $ids },
                    function (res) {
                        if (res == "") { return; }
                        var $l = eval('(' + res + ')');
                        $("#<%=leftmenu.ClientID %> a[orgProjSpec]").each(function () {
                            var $specID = $(this).attr("orgProjSpec");
                            for (var i = 0; i < $l.length; i++) {
                                var $id = $l[i][0];
                                var $num = $l[i][1];
                                if ($specID == $id) {
                                    var tip = $(this).text();
                                    var all = $(this).html();
                                    all = all.replace(tip, tip + '[' + $num + ']');
                                    $(this).html(all);
                                }
                            }
                        });
                    }
                );
            }
        </script>
    </form>
</body>
</html>
