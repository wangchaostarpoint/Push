<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMuti.aspx.cs" Inherits="Zhongsoft.Portal.MM.BH.ProjectMuti" %>

<%@ Register Src="~/MM/BH/WBSDelayInfo.ascx" TagName="WBSDelayInfo" TagPrefix="uc1" %>
<%@ Register Src="~/MM/BH/ProjExistsProblems.ascx" TagName="ProjExistsProblems" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "" "">
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>众城软件-当前项目</title>
    <!-- Favicon -->
    <link href="assets/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <!-- For iPhone -->
    <link href="assets/images/apple-touch-icon-57-precomposed.png" rel="apple-touch-icon-precomposed">
    <!-- For iPhone 4 Retina display -->
    <link href="assets/images/apple-touch-icon-114-precomposed.png" rel="apple-touch-icon-precomposed" sizes="114x114">
    <!-- For iPad -->
    <link href="assets/images/apple-touch-icon-72-precomposed.png" rel="apple-touch-icon-precomposed" sizes="72x72">
    <!-- For iPad Retina display -->
    <link href="assets/images/apple-touch-icon-144-precomposed.png" rel="apple-touch-icon-precomposed" sizes="144x144">
    <!-- CORE CSS FRAMEWORK - START -->
    <link href="index-ico-user_files/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen">
    <link href="index-ico-user_files/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="index-ico-user_files/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
    <link href="index-ico-user_files/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="index-ico-user_files/cryptocoins.css" rel="stylesheet" type="text/css">
    <link href="index-ico-user_files/animate.min.css" rel="stylesheet" type="text/css">
    <link href="index-ico-user_files/perfect-scrollbar.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link href="index-ico-user_files/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt ie 9]>
       <script src="js/html5shiv.js"></script>
       <script src="js/respond.min.js"></script>
    <![endif]-->
    <style>
        .navbar-header {
            padding: 0px 10px;
        }

        .navbar-brand {
            padding: 15px 15px 0px;
            height: auto;
        }

        .text-black {
            color: #000 !important;
        }
    </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->

<body class=" ">
    <!-- START CONTAINER -->
    <div class="page-container row-fluid container-fluid">
        <!-- START CONTENT -->
        <section class=" " id="main-content">
            <div class="navbar-header">
                <div class="navbar-brand" style="font-size: 1em; color: #000000; font-weight: bold;">
                    <asp:Label runat="server" ID="lbPrefix"></asp:Label><a href="#">
                        <asp:Label runat="server" ID="lbProjectName"></asp:Label></a>
                </div>
            </div>
            <div class="wrapper main-wrapper row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <section class="box nobox marginBottom0">
                        <div class="content-body">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <section class="box" style="height: 467px">
                                        <header class="panel_header">
                                            <h2 class="title pull-left" style="margin-left: 30px;">包含工程</h2>
                                            <div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                                <a class="box_close fa fa-times"></a>
                                            </div>
                                        </header>
                                        <div class="content-body" style="padding: 5px 30px;">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <table class="table table-bordered table-striped no-mb">
                                                        <colgroup>
                                                            <col style="width: 30.0%;">
                                                            <col style="width: 10.0%;">
                                                            <col style="width: 10.0%;">
                                                            <col style="width: 25.0%;">
                                                            <col style="width: 25.0%;">
                                                            <col style="width: 30px">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr class="project-table-title">
                                                                <td class="project-title-parent">工程名称</td>
                                                                <td>状态</td>
                                                                <td>设总</td>
                                                                <td>卷册进度</td>
                                                                <td>提资进度</td>
                                                                <td>*</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div class="project-content" id="divProject">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <section class="box ">
                                        <header class="panel_header">
                                            <h2 class="title pull-left" style="margin-left: 30px;">合同额</h2>
                                            <div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                <a class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></a>
                                                <a class="box_close fa fa-times"></a>
                                            </div>
                                        </header>
                                        <div class="content-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div id="project_echart2" style="height: 347px;"></div>
                                                </div>
                                                <div class="col-xs-12">
                                                    <div class="statistics-wraper">
                                                        <div class="statistics-info" style="text-align: center;">
                                                            <h5>合同额：<label id="lbContractValue"></label>&nbsp;&nbsp;<i class="fa fa-caret-left" style="font-size: 1.3em;"></i><i class="fa fa-caret-right" style="color: #e45431; font-size: 1.3em;"></i>&nbsp;&nbsp;<span style="color: #e45431;">已收款：<label id="lbChargeContractValue"></label></span></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                            <uc1:WBSDelayInfo ID="wBSDelayInfo" runat="server" />
                            <uc2:ProjExistsProblems ID="projExistsProblems" runat="server" />
                        </div>
                    </section>
                </div>

                <div class="clearfix"></div>

            </div>
        </section>

        <!-- END CONTENT -->
    </div>
    <!-- END CONTAINER -->
    <!-- LOAD FILES AT PAGE END FOR FASTER LOADING -->
    <!-- CORE JS FRAMEWORK - START -->
    <script src="index-ico-user_files/jquery-1.11.2.min.js"></script>

    <script src="index-ico-user_files/jquery.easing.min.js"></script>

    <script src="index-ico-user_files/bootstrap.min.js"></script>

    <script src="index-ico-user_files/pace.min.js"></script>

    <script src="index-ico-user_files/perfect-scrollbar.min.js"></script>

    <script src="index-ico-user_files/viewportchecker.js"></script>

    <!-- CORE JS FRAMEWORK - END -->
    <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START -->
    <script src="index-ico-user_files/echarts.min.js"></script>
    <script src="index-ico-user_files/create-highcarts.js"></script>
    <script type="text/javascript" src="index-ico-user_files/my_echarts.js"></script>
    <script type="text/javascript">
        var $appCtx = { appPath:"<%=WebAppPath%>", portalUrl:"<%=PortalAddress%>" };
        //项目信息
        function getProject() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/ProjectMuti.aspx',
                dataType: 'json',
                data: { asyfunc: "GetProject", projectPackageID: "<%=ProjectPackageID%>", marketProjectID: "<%=MarketProjectID%>" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        var ht = '<table class="table table-bordered table-hover table-small-font"><colgroup><col style="width: 30.0%;"><col style="width: 10.0%;"><col style="width: 10.0%;"><col style="width: 25.0%;"><col style="width: 25.0%;"></colgroup><tbody>';
                        for (var i = 0; i < data.length; i++) {
                            ht += '<tr class="' + data[i].rowClass + '" id="' + data[i].rowID + '" MarketProjectID="' + data[i].MarketProjectID + '"><td><span class="project-title no-break">' + data[i].ProjectName
                                + '</span ></td ><td><span class="' + data[i].ProjectStateClass + '">' + data[i].ProjectState + '</span></td><td>' + data[i].ManagerUserName + '</td>' +
                                '<td><div class="row"><div class="col-xs-2"><span>' + data[i].RollInfo + '</span></div><div class="col-xs-10">' +
                                '<div class="progress no-mb"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="' + data[i].RollRate + '" aria-valuemin="0" aria-valuemax="100" style="min-width:2em;width:' + data[i].RollRate + '%">' +
                                '' + data[i].RollRate + '%</div ></div ></div ></div ></td > <td><div class="row"><div class="col-xs-2"><span>' + data[i].FileInfo + '</span></div><div class="col-xs-10"><div class="progress no-mb">' +
                                '<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="' + data[i].FileRate + '" aria-valuemin="0" aria-valuemax="100" style="min-width:2em;width:' + data[i].FileRate + '%">' + data[i].FileRate + '%</div></div></div ></div ></td>'
                                + '</tr>';
                        }
                        ht += '</table>';
                        $("#divProject").html(ht);

                        //$('tr.parent').css("cursor", "pointer").attr("title", "点击这里展开/关闭").click(function () {
                        //    $(this).siblings("[id='" + $(this).attr("MarketProjectID") + "']").toggle(); //当前点击某行同胞行，查找制定子元素类，折叠隐藏
                        //});
                        $('tr.parent')
                            .css("cursor", "pointer")
                            .attr("title", "点击这里展开/关闭")
                            .click(function () {
                                $(this).siblings('.child-' + this.id).toggle(); //当前点击某行同胞行，查找制定子元素类，折叠隐藏
                            });
                    }
                }
            })
        }

        //合同信息
        function getContract() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/ProjectMuti.aspx',
                dataType: 'json',
                data: { asyfunc: "GetContractInfo", projectPackageID: "<%=ProjectPackageID%>", marketProjectID: "<%=MarketProjectID%>" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        $('#lbContractValue').html(data[0].ContractValue);
                        $('#lbChargeContractValue').html(data[0].ChargeContrctValue);
                    }
                }
            })
        }
    </script>
    <script>
        $(function () { $(".table-wenti tr td span").tooltip({ html: true }); });
        $(document).ready(function () {
            getProject();
            getContractPie();
            getContract();
            getWbsInfo();
            getProblemInfo();
            $(".project-title").width($(".project-title-parent").width() - 15);
            $(".table-juance-xmmc").width(($(".table-juance").width()) * 0.25 - 15);
            $(".table-juance-jcmc").width(($(".table-juance").width()) * 0.25 - 15);
            $(".table-wenti-xmmc").width(($(".box-wenti").width()) * 0.25 - 15);
            $(".table-wenti-czwt").width(($(".box-wenti").width()) * 0.25 - 15);
            $(".table-wenti-jjcs").width(($(".box-wenti").width()) * 0.25 - 15);
            $(".table-wenti-bz").width(($(".box-wenti").width()) * 0.1 - 15);
            //$(function () {
            //    $('tr.parent')
            //        .css("cursor", "pointer")
            //        .attr("title", "点击这里展开/关闭")
            //        .click(function () {
            //            $(this).siblings('.child-' + this.id).toggle(); //当前点击某行同胞行，查找制定子元素类，折叠隐藏
            //        });
            //});
        })
        $(window).resize(function () {
            $(".project-title").width($(".project-title-parent").width() - 15);
            $(".table-juance-xmmc").width(($(".table-juance").width()) * 0.25 - 15);
            $(".table-juance-jcmc").width(($(".table-juance").width()) * 0.25 - 15);
            $(".table-wenti-xmmc").width(($(".box-wenti").width()) * 0.25 - 15);
            $(".table-wenti-czwt").width(($(".box-wenti").width()) * 0.25 - 15);
            $(".table-wenti-jjcs").width(($(".box-wenti").width()) * 0.25 - 15);
            $(".table-wenti-bz").width(($(".box-wenti").width()) * 0.1 - 15);
        });
    </script>

    <script type="text/javascript">
        function getContractPie() {
            var contractPieChartCG = echarts.init(document.getElementById('project_echart2'));
            // 指定图表的配置项和数据
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetContractPie", projectPackageID: "<%=ProjectPackageID%>", marketProjectID: "<%=MarketProjectID%>"
                },
                url:'<%=WebAppPath%>' + '/MM/BH/ProjectMuti.aspx',
                success: function (result) {
                    if (result) {
                        var jsonObj = $.parseJSON(result)
                        contractPieChartCG.setOption({
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b}: {c} ({d}%)"
                            },
                            color: ['#e45431', '#cccccc'],
                            series: [{
                                name: '合同额',
                                type: 'pie',
                                radius: ['50%', '70%'],
                                avoidLabelOverlap: false,
                                label: {
                                    normal: {
                                        show: true,
                                        //							position: 'center'
                                        formatter: '{d}%'
                                    },
                                    emphasis: {
                                        show: true,
                                        textStyle: {
                                            fontSize: '12',
                                            fontWeight: 'bold'
                                        }
                                    }
                                },
                                labelLine: {
                                    normal: {
                                        show: true
                                    }
                                },
                                data: jsonObj,
                            }]

                        });
                    }
                },
                error: function (ex) { }
            })
        }
    </script>
    <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->
    <!-- CORE TEMPLATE JS - START -->

    <script src="index-ico-user_files/scripts.js"></script>
    <!-- END CORE TEMPLATE JS - END -->
</body>

</html>
