<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Workbench.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.Workbench" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <title></title>
    <link href="../../../Themes/custom/styles/global.css" rel="stylesheet" type="text/css" />
    <link href="../../../Themes/custom/styles/defaultpage.css" rel="stylesheet" type="text/css" />
    <style>
        .fhome
        {
            color: #ceeaf6;
        }
        a.fhome:hover
        {
            color: #ecf7fb;
        }
        .astyle
        {
            color: #000000;
            margin-bottom: 3px;
        }
        .imp
        {
            font-weight: bold !important;
            float: none !important; /*color:Red;*/
            color: #f9a949;
        }
        .wp_main
        {
            border: none;
        }
        .wp_header div a
        {
            float: none;
        }
        .wp_header div a:link, .wp_header div a:visited
        {
            float: none;
        }
        .left
        {
            padding: 7px 3px 0px 4px;
        }
    </style>
    <script type="text/javascript">

        var pading = 6; //统一边框距离

        window.onresize = function () {

            setSize();
        }



        function setSize() {
            var headerH = $("#tdHeader").height();
            var footH = $("#tdFoot").height();
            var leftW = $('.wp_main').width();
            var letftop = $('.wp_header').height();

            $('#workSpace').height(($(window).height() - headerH - footH) + 'px');
            $('#workSpace').width(($(window).width() - leftW - pading - 15) + 'px');
            $('.wp_main').height(($('#workSpace').height() - 8) + 'px');
            $('.closeleft').height($('.wp_main').height() + letftop + 'px');
            //alert($('#workSpace').height());
            //alert($('.wp_main').height())
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
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td rowspan="2" valign="top" id="tdleftMenu" class="left">
                <div class="wp_listleft">
                    <div class="wp_header" style="display: none">
                        <div>
                            <span id="spImp">按&nbsp;
                                <asp:LinkButton ID="lkbProject" runat="server" OnClientClick="changeTree('Project')"
                                    OnClick="btnChangeTree_Click" EnableTheming="false" CssClass="astyle">工程</asp:LinkButton>&nbsp;/
                                <asp:LinkButton ID="lkbTaskd" runat="server" OnClientClick="changeTree('TaskType')"
                                    OnClick="btnChangeTree_Click" EnableTheming="false" CssClass="astyle">任务类型</asp:LinkButton>&nbsp;
                                分类 </span>
                        </div>
                    </div>
                    <div class="wp_main" id="divParent" style="width: 205px; top: -1px; padding-right: 10px;
                        padding-bottom: 3px; position: relative; overflow-x: hidden; overflow-y: auto">
                        <div class="wp_content" id="leftmenu" style="width: 100%; overflow: auto;">
                            <table class="wp_table">
                                <tr>
                                    <td>
                                        <span>
                                            <asp:TreeView ID="tvProjTree" runat="server" Height="100%" Width="100%">
                                            </asp:TreeView>
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </td>
            <td rowspan="2" valign="top" onclick="showLeft()" style="background: #22334d;">
                <div class="closeleft">
                </div>
            </td>
            <td style="display: none">
            </td>
        </tr>
        <tr>
            <td valign="top">
                <iframe name="workSpace" src="<%=WebAppPath%>/Sys/Workflow/WorkToDoList.aspx" frameborder="0"
                    id="workSpace"></iframe>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiTreeType" value="TaskType" />
    <!--上次分类-->
    <input type="hidden" runat="server" id="hiLastType" value="Project" />
    <input type="hidden" runat="server" id="hiArrangeType" value="" />
    <script type="text/javascript">
        //信息传阅
        var info;
        var workTodoInfo;
        var alertinfo;
        var flagInfo = "信息传阅";
        var flagWorkToDoInfo = "待办流程";
        var alertInof = "工作提醒";
        function initCustomerPlugin() {
            var txt = $('#spImp').html();
            var replaceTxt = '';
            var treeType = $('#<%=hiTreeType.ClientID %>').val();
            if (treeType == 'Project') {
                replaceTxt = '工程';
                showWorkSpace('<%=MyTeskPageUrl %>');
            }
            else if (treeType == 'TaskType') {
                replaceTxt = '任务类型';
            }
            if (replaceTxt != '') {
                $('#spImp').html(txt.replace(replaceTxt, "<span class='imp'>" + replaceTxt + "</span>"));
            }

            $("#<%=lkbProject.ClientID %>").attr('title', '点击按工程分类');
            $("#<%=lkbTaskd.ClientID %>").attr('title', '点击按任务类型分类');

            setSize();

            $("#<%=tvProjTree.ClientID %>").find('a').each(function () {
                $(this).click(function () {
                    if (this.innerText != "" || this.innerText != null || this.innerText != undefined) {
                        $("#<%=tvProjTree.ClientID %>").find('td').css("background-color", "transparent");
                        $(this).parent("td").css('background-color', '#CBCBFE');

                    }
                })
            });
            //下载信息传阅数量
            $("#<%=tvProjTree.ClientID %>").find('a').each(function () {
                if (this.innerText != "" || this.innerText != null || this.innerText != undefined) {
                    if (this.innerText == flagInfo) {
                        info = this;
                        getInfo();
                    } else if (this.innerText == alertInof) {
                        alertinfo = this;
                        getAlertInfo();
                    } else if (this.innerText == flagWorkToDoInfo) {
                        workTodoInfo = this;
                        getTodo();
                    }

                }
            });


            //setTimeout(getDeptProjNum(), 10000);
        }
        //获取待办
        function getTodo() {
            $.post("<%=WebAppPath %>/Sys/Workflow/WorkToDoList.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (res == "") { return; }
                        var index = workTodoInfo.innerHTML.indexOf(flagWorkToDoInfo);
                        workTodoInfo.innerHTML = workTodoInfo.innerHTML.substring(0, index) + flagWorkToDoInfo + '(<font color="red">' + res + '</font>)';
                    }
            );
        }

        $(window).load(function () {
            getSzNum();
            getJhgcsNum();
            getZsrNum();
            getZrgNum();
            getSjrNum();
            getDeptProjNum();
        });
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

        function viewProjSite(projectPhaseId) {
            var url = '<%=ProjSiteUrl %>?ActionType=2&projectPhaseID=' + projectPhaseId;
            window.open(buildQueryUrl(url, null));
            return false;
        }

        //改变分类显示
        function changeTree(type) {
            $('#<%=hiTreeType.ClientID %>').val(type);
        }

        //获取传阅
        function getInfo() {
            $.post("<%=WebAppPath %>/Sys/Workflow/WorkForwardList.aspx",
                    { asyfunc: "GetForwardItemsCount" },
                    function (res) {
                        if (res == "") { return; }
                        var index = info.innerHTML.indexOf(flagInfo);
                        info.innerHTML = info.innerHTML.substring(0, index) + flagInfo + '(<font color="red">' + res + '</font>)';
                    }
            );
        }
        //获取工作提醒数量
        function getAlertInfo() {
            $.post("<%=WebAppPath %>/EPMS/List/Sys/PortalAlertList.aspx",
                    { asyfunc: "GetPortalAlertAlertNum" },
                    function (res) {
                        if (res == "") { return; }
                        var index = info.innerHTML.indexOf(alertInof);
                        alertinfo.innerHTML = alertinfo.innerHTML.substring(0, index) + alertInof + '(<font color="red">' + res + '</font>)';
                    }
            );
        }
        //获取担任设总
        function getSzNum() {
            $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectList.aspx",
                    { asyfunc: "GetMyProjectNumber", strRoleName: 'Sz' },
                    function (res) {
                        if (res == "") { return; }
                        var $zsProject = $("[id='szProject']");
                        $zsProject.text($zsProject.text() + '[' + res + ']');

                    }
            );

        }
        //获取担任计划工程师
        function getJhgcsNum() {
            $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectList.aspx",
                    { asyfunc: "GetMyProjectNumber", strRoleName: 'Jhgcs' },
                    function (res) {
                        if (res == "") { return; }
                        var $jhgcsProject = $("[id='jhgcsProject']");
                        $jhgcsProject.text($jhgcsProject.text() + '[' + res + ']');

                    }
            );

        }
        //担任主设人
        function getZsrNum() {
            $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListZsr.aspx",
                    { asyfunc: "GetMyProjectNumber", roleName: 'Zsr' },
                    function (res) {
                        if (res == "") { return; }
                        var $zsrProject = $("[id='zsrProject']");
                        $zsrProject.text($zsrProject.text() + '[' + res + ']');
                    }
            );
        }
        //担任主任工
        function getZrgNum() {
            $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListZsr.aspx",
                    { asyfunc: "GetMyProjectNumber", roleName: 'Zrg' },
                    function (res) {
                        if (res == "") { return; }
                        var $zsrProject = $("[id='zrgProject']");
                        $zsrProject.text($zsrProject.text() + '[' + res + ']');
                    }
            );
        }
        //担任设计人
        function getSjrNum() {
            $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListSjr.aspx",
                    { asyfunc: "GetMyProjectNumber" },
                    function (res) {
                        if (res == "") { return; }
                        var $sjrProject = $("[id='sjrProject']");
                        $sjrProject.text($sjrProject.text() + '[' + res + ']');

                    }
            );
        }
        //获取本部项目数量
        function getDeptProjNum() {
            //加载部门数量
            var $ids = "";
            $("#<%=tvProjTree.ClientID %> a[deptProj]").each(function () {
                $ids += $(this).attr("deptProj") + "|";
            });
            $.post("<%=WebAppPath %>/EPMS/List/Project/DeptProjectSpecList.aspx",
                    { asyfunc: "GetDeptProjectNum", strDeptIDs: $ids },
                    function (res) {
                        if (res == "") { return; }
                        var $l = eval('(' + res + ')');
                        $("#<%=tvProjTree.ClientID %> a[deptProj]").each(function () {
                            var $specID = $(this).attr("deptProj");
                            for (var i = 0; i < $l.length; i++) {
                                var $id = $l[i][0];
                                var $num = $l[i][1];
                                if ($specID == $id) {
                                    $(this).text($(this).text() + '[' + $num + ']');
                                }
                            }
                        });
                    }
            );
            $ids = "";
            $("#<%=tvProjTree.ClientID %> a[deptProjSpec]").each(function () {
                $ids += $(this).attr("deptProjSpec") + "|";
            });
            //科室
            $.post("<%=WebAppPath %>/EPMS/List/Project/DeptProjectSpecList.aspx",
                    { asyfunc: "GetOrgUnitProjectNum", strDeptIDs: $ids },
                    function (res) {
                        if (res == "") { return; }
                        var $l = eval('(' + res + ')');
                        $("#<%=tvProjTree.ClientID %> a[deptProjSpec]").each(function () {
                            var $specID = $(this).attr("deptProjSpec");
                            for (var i = 0; i < $l.length; i++) {
                                var $id = $l[i][0];
                                var $num = $l[i][1];
                                if ($specID == $id) {
                                    $(this).text($(this).text() + '[' + $num + ']');
                                }
                            }
                        });
                    }
            );
            $ids = "";
            $("#<%=tvProjTree.ClientID %> a[orgProjSpec]").each(function () {
                $ids += $(this).attr("orgProjSpec") + "|";
            });
            $.post("<%=WebAppPath %>/EPMS/List/Project/DeptProjectSpecList.aspx",
                    { asyfunc: "GetOrgUnitSpecProjectNum", strDeptIDs: $ids },
                    function (res) {
                        if (res == "") { return; }
                        var $l = eval('(' + res + ')');
                        $("#<%=tvProjTree.ClientID %> a[orgProjSpec]").each(function () {
                            var $specID = $(this).attr("orgProjSpec");
                            for (var i = 0; i < $l.length; i++) {
                                var $id = $l[i][0];
                                var $num = $l[i][1];
                                if ($specID == $id) {
                                    $(this).text($(this).text() + '[' + $num + ']');
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
