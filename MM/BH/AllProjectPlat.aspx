<%@ Page Title="全院项目看板" Language="C#" AutoEventWireup="true" CodeBehind="AllProjectPlat.aspx.cs" Inherits="Zhongsoft.Portal.MM.BH.AllProjectPlat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="IE=11.0000" http-equiv="X-UA-Compatible">
    <!--
        * @Package: Cryptonia - Bitcoin & Cryptocurrency trading Dashboard
        * @Version: 1.0.0
    -->

    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>

    <meta name="description" content="">
    <meta name="author" content="">
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
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
    <link href="index-ico-user_files/cryptocoins.css" rel="stylesheet" type="text/css">
    <link href="index-ico-user_files/animate.min.css" rel="stylesheet" type="text/css">
    <link href="index-ico-user_files/perfect-scrollbar.css" rel="stylesheet" type="text/css">
    <!-- CORE CSS FRAMEWORK - END -->
    <!-- HEADER SCRIPTS INCLUDED ON THIS PAGE - START -->
    <!-- HEADER SCRIPTS INCLUDED ON THIS PAGE - END -->
    <!-- CORE CSS TEMPLATE - START -->
    <link href="index-ico-user_files/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css">
    <!-- CORE CSS TEMPLATE - END -->
    <meta name="GENERATOR" content="MSHTML 11.00.9600.16428">
    <style type="text/css">
        .table > thead > tr > th {
            border-color: rgb(234, 234, 234);
            padding: 8px;
        }

        .table > tbody > tr > th {
            border-color: rgb(234, 234, 234);
            padding: 8px 0 8px 8px;
            font-weight: normal;
        }

        .table > tfoot > tr > th {
            border-color: rgb(234, 234, 234);
            padding: 8px;
        }

        .table > thead > tr > td {
            border-color: rgb(234, 234, 234);
            padding: 8px;
        }

        .table > tbody > tr > td {
            border-color: rgb(234, 234, 234);
            padding: 7px;
        }

        .table > tfoot > tr > td {
            border-color: rgb(234, 234, 234);
            padding: 8px;
        }
    </style>
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt ie 9]>
       <script src="js/html5shiv.js"></script>
       <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <%--<form id="form1" runat="server">--%>
    <!-- START CONTAINER -->
    <div class="page-container row-fluid container-fluid">
        <!-- START CONTENT -->
        <section class=" " id="main-content">
            <div class="wrapper main-wrapper row">
                <div class="clearfix"></div>

                <div class="col-lg-6">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">项目部门分布统计</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                <a class="box_close fa fa-times"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px;">
                            <div class="row">
                                <div class="col-xs-12">

                                    <div class="chart-container">
                                        <div id="project_dept_chart" style="height: 300px;"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="col-lg-6">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">项目类型分布统计</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                <a class="box_close fa fa-times"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px;">
                            <div class="row">
                                <div class="col-xs-12">

                                    <div class="chart-container">
                                        <div id="project_type_chart" style="height: 300px;"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="clearfix" style="margin-bottom: 10px;"></div>

                <div class="col-lg-6">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">任务下达对比分析</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                <a class="box_close fa fa-times"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px;">
                            <div class="row">
                                <div class="col-xs-12">

                                    <div class="chart-container">
                                        <div id="task_year_chart" style="height: 300px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="col-lg-6">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">项目状态分布统计</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                <a class="box_close fa fa-times"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px;">
                            <div class="row">
                                <div class="col-xs-12">

                                    <div class="chart-container">
                                        <div id="project_state_chart" style="height: 300px;"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="clearfix" style="margin-bottom: 10px;"></div>
                <!-- MAIN CONTENT AREA STARTS -->

                <div class="col-lg-12 col-md-12 col-xs-12" style="margin-top: 15px; margin-bottom: 20px;">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left" style="padding-left: 30px;">项目进度情况</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                <a class="box_close fa fa-times"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 30px 15px;">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-responsive" data-pattern="priority-columns">
                                        <table class="table table-small-font no-mb table-bordered table-striped" id="tech-companies-1">
                                            <thead>
                                                <tr>
                                                    <th>项目编号</th>
                                                    <th>项目名称</th>
                                                    <th data-priority="1">设总</th>
                                                    <th data-priority="2">启动</th>
                                                    <th data-priority="3">策划</th>
                                                    <th data-priority="3">接口</th>
                                                    <th data-priority="3">验证</th>
                                                    <th data-priority="3">出版</th>
                                                    <th data-priority="3">交付</th>
                                                </tr>
                                            </thead>
                                            <tbody id="prjContent">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="clearfix" style="margin-bottom: 10px;"></div>

                <div class="col-lg-6">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">设计变更按级别统计</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                <a class="box_close fa fa-times"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px;">
                            <div class="row">
                                <div class="col-xs-12">

                                    <div class="chart-container">
                                        <div id="designchange_level_chart" style="height: 300px;"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="col-lg-6">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">设计变更按原因统计</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                <a class="box_close fa fa-times"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px;">
                            <div class="row">
                                <div class="col-xs-12">

                                    <div class="chart-container">
                                        <div id="designchange_reason_chart" style="height: 300px;"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="clearfix" style="margin-bottom: 10px;"></div>
                <!-- MAIN CONTENT AREA ENDS -->
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

    <script>
        window.jQuery || document.write('<script src="assets/js/jquery-1.11.2.min.js"><\/script>');
    </script>
    <!-- CORE JS FRAMEWORK - END -->
    <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START -->
    <!--<SCRIPT src="index-ico-user_files/echarts-all.js"></SCRIPT>

    <SCRIPT src="index-ico-user_files/chart-echarts.js"></SCRIPT>

    <SCRIPT src="index-ico-user_files/highcharts.js"></SCRIPT>-->
    <script src="index-ico-user_files/echarts.min.js"></script>
    <script src="index-ico-user_files/create-highcarts.js"></script>
    <%--<script type="text/javascript" src="index-ico-user_files/my_echarts.js"></script>--%>
    <!-- CORE TEMPLATE JS - START -->
    <script src="index-ico-user_files/scripts.js"></script>
    <!-- END CORE TEMPLATE JS - END -->
    <%--</form>--%>

    <script type="text/javascript">
        var project_dept_chart = document.getElementById('project_dept_chart');
        //项目部门分布统计
        if (project_dept_chart != undefined) {
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetProjectDept"
                },
                url: 'AllProjectPlat.aspx',
                success: function (result) {
                    if (result) {
                        var data = $.parseJSON(result);

                        var project_dept_option = {
                            title: {
                                text: '',
                                subtext: ''
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'shadow'
                                }
                            },
                            legend: {
                                data: ['', '']
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                top: '3%',
                                containLabel: true
                            },
                            yAxis: {
                                type: 'value',
                                boundaryGap: [0, 0.1]
                            },
                            xAxis: {
                                type: 'category',
                                data: data[0],
                                axisLabel: {
                                    rotate: 30
                                }
                            },
                            series: [
                                {
                                    name: '项目数量',
                                    type: 'bar',
                                    data: data[1],
                                    label: {
                                        show: true,
                                        position: 'top'
                                    },
                                    itemStyle: {
                                        color: '#4c97ce'
                                    }
                                }
                            ]
                        };
                        echarts.init(project_dept_chart).setOption(project_dept_option);

                    }
                },
                error: function (ex) { }
            });
        }

        var project_type_chart = document.getElementById('project_type_chart');
        //项目类型分布统计
        if (project_type_chart != undefined) {
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetProjectType"
                },
                url: 'AllProjectPlat.aspx',
                success: function (result) {
                    if (result) {
                        var data = $.parseJSON(result);
                        echarts.init(project_type_chart).setOption({
                            title: {
                                text: '',
                                subtext: ''
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            series: {
                                name: '项目数量',
                                type: 'pie',
                                radius: '80%',
                                center: ['50%', '50%'],
                                label: {
                                    normal: {
                                        show: true,
                                        formatter: "{b} : {c} ({d}%)"
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
                                data: data,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        });
                    }
                },
                error: function (ex) { }
            });
        }

        var task_year_chart = document.getElementById('task_year_chart');
        // 任务下达年度对比分析
        if (task_year_chart != undefined) {
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetTaskYear"
                },
                url: 'AllProjectPlat.aspx',
                success: function (result) {
                    if (result) {
                        var data = $.parseJSON(result);
                        var task_year_option = {
                            title: {
                                //      text: '公司近一年到款分析',
                                subtext: ''
                            },
                            tooltip: {
                                trigger: 'axis'
                            },
                            legend: {
                                data: ['<%=DateTime.Now.Year-1%>年', '<%=DateTime.Now.Year%>年']
                            },
                            calculable: true,
                            xAxis: [{
                                type: 'category',
                                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                            }],
                            yAxis: [{
                                type: 'value'
                            }],
                            series: [
                                {
                                    name: '<%=DateTime.Now.Year-1%>年',
                                    type: 'line',
                                    data: data[0],
                                    markLine: {
                                        data: [{
                                            type: 'average',
                                            name: '平均值'
                                        }]
                                    },
                                    itemStyle: {
                                        color: '#4c97ce'
                                    }

                                },
                                {
                                    name: '<%=DateTime.Now.Year%>年',
                                    type: 'line',
                                    data: data[1],
                                    markLine: {
                                        data: [{
                                            type: 'average',
                                            name: '平均值'
                                        }]
                                    },
                                    itemStyle: {
                                        color: '#a0c7e6'
                                    }
                                }
                            ]
                        };
                        echarts.init(task_year_chart).setOption(task_year_option);
                    }
                },
                error: function (ex) { }
            });
        }

        var project_state_chart = document.getElementById('project_state_chart');
        //项目状态分布统计
        if (project_state_chart != undefined) {
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetProjectState"
                },
                url: 'AllProjectPlat.aspx',
                success: function (result) {
                    if (result) {
                        var data = $.parseJSON(result);

                        var project_state_option = {
                            title: {
                                text: '',
                                subtext: ''
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            series: {
                                name: '项目数量',
                                type: 'pie',
                                radius: '80%',
                                center: ['50%', '50%'],
                                label: {
                                    normal: {
                                        show: true,
                                        formatter: "{b} : {c} ({d}%)"
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
                                data: data,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        };
                        echarts.init(project_state_chart).setOption(project_state_option);
                    }
                },
                error: function (ex) { }
            });
        }

        //项目进度信息
        $.ajax({
            method: 'POST',
            data: {
                asyfunc: "GetProjectPlan"
            },
            url: 'AllProjectPlat.aspx',
            success: function (result) {
                if (result) {
                    var data = $.parseJSON(result);
                    var len = data.length;
                    var html = '';
                    for (var i = 0; i < len; i++) {
                        html += '<tr>';
                        html += '<td>' + data[i].ProjectCode + '</td>';
                        html += '<td>' + data[i].ProjectName + '</td>';
                        html += '<td>' + data[i].ManagerUserName + '</td>';
                        if (data[i].Start == 1) {
                            html += '<td>\
                                        <div class="progress" style="margin-bottom: 1px; margin-top: 1px;">\
                                           <span>\
                                                <i class="fa fa-check-square"></i>\
                                           </span>\
                                       </div>\
                                    </td>';
                        }
                        else {
                            html += '<td></td>';
                        }

                        if (data[i].Plan == 1) {
                            html += '<td>\
                                        <div class="progress" style="margin-bottom: 1px; margin-top: 1px;">\
                                           <span>\
                                                <i class="fa fa-check-square"></i>\
                                           </span>\
                                       </div>\
                                    </td>';
                        }
                        else {
                            html += '<td></td>';
                        }

                        var interfaceRate = data[i].Interface;
                        html += '<td>\
                                <div class="progress" style="margin-bottom: 1px; margin-top: 1px;">\
                                    <div class="progress-bar progress-bar-primary4" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="10" style="width: '+ interfaceRate + '%;">'
                            + interfaceRate + '%\
                                    </div>\
                                </div>\
                            </td> ';

                        var verifyRate = data[i].Verify;
                        html += '<td>\
                                <div class="progress" style="margin-bottom: 1px; margin-top: 1px;">\
                                    <div class="progress-bar progress-bar-primary4" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="10" style="width: '+ verifyRate + '%;">'
                            + verifyRate + '%\
                                    </div>\
                                </div>\
                            </td> ';

                        var publishRate = data[i].Publish;
                        html += '<td>\
                                <div class="progress" style="margin-bottom: 1px; margin-top: 1px;">\
                                    <div class="progress-bar progress-bar-primary4" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="10" style="width: '+ publishRate + '%;">'
                            + publishRate + '%\
                                    </div>\
                                </div>\
                            </td> ';

                        var deliverRate = data[i].Deliver;
                        html += '<td>\
                                <div class="progress" style="margin-bottom: 1px; margin-top: 1px;">\
                                    <div class="progress-bar progress-bar-primary4" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="10" style="width: '+ deliverRate + '%;">'
                            + deliverRate + '%\
                                    </div>\
                                </div>\
                            </td> ';

                    }

                    $('#prjContent').append(html);
                }
            },
            error: function (ex) { }
        });

        var designchange_level_chart = document.getElementById('designchange_level_chart');
        //设计变更按级别统计
        if (designchange_level_chart != undefined) {
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetDesignChangeLevel"
                },
                url: 'AllProjectPlat.aspx',
                success: function (result) {
                    if (result) {
                        var data = $.parseJSON(result);

                        echarts.init(designchange_level_chart).setOption({
                            title: {
                                text: '',
                                subtext: ''
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'shadow'
                                }
                            },
                            legend: {
                                data: ['']
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                top: '10%',
                                containLabel: true
                            },
                            yAxis: [{
                                type: 'value',
                                boundaryGap: [0, 0.1]
                            }
                            ],
                            xAxis: {
                                type: 'category',
                                data: data[0],
                                axisLabel: {
                                    rotate: 0
                                },
                            },
                            series: [
                                {
                                    name: '',
                                    type: 'bar',
                                    barWidth: 35,
                                    data: data[1],
                                    label: {
                                        show: true,
                                        position: 'top'
                                    },
                                },
                            ]
                        });
                    }
                },
                error: function (ex) { }
            });
        }

        var designchange_reason_chart = document.getElementById('designchange_reason_chart');
        //设计变更按原因统计
        if (designchange_reason_chart != undefined) {
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetDesignChangeReason"
                },
                url: 'AllProjectPlat.aspx',
                success: function (result) {
                    if (result) {
                        var data = $.parseJSON(result);
                        echarts.init(designchange_reason_chart).setOption({
                            title: {
                                text: '',
                                subtext: ''
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'shadow'
                                }
                            },
                            legend: {
                                data: ['']
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                top: '10%',
                                containLabel: true
                            },
                            yAxis: [{
                                type: 'value',
                                boundaryGap: [0, 0.1]
                            }
                            ],
                            xAxis: {
                                type: 'category',
                                data: data[0],
                                axisLabel: {//坐标轴刻度标签的相关设置。
                                    formatter: function (params) {
                                        var newParamsName = "";// 最终拼接成的字符串
                                        var paramsNameNumber = params.length;// 实际标签的个数
                                        var provideNumber = 5;// 每行能显示的字的个数
                                        var rowNumber = Math.ceil(paramsNameNumber / provideNumber);// 换行的话，需要显示几行，向上取整

                                        /**
                                         * 判断标签的个数是否大于规定的个数， 如果大于，则进行换行处理 如果不大于，即等于或小于，就返回原标签
                                         */

                                        // 条件等同于rowNumber>1
                                        if (paramsNameNumber > provideNumber) {

                                            /** 循环每一行,p表示行 */
                                            for (var p = 0; p < rowNumber; p++) {
                                                var tempStr = "";// 表示每一次截取的字符串
                                                var start = p * provideNumber;// 开始截取的位置
                                                var end = start + provideNumber;// 结束截取的位置
                                                // 此处特殊处理最后一行的索引值
                                                if (p == rowNumber - 1) {

                                                    // 最后一次不换行
                                                    tempStr = params.substring(start, paramsNameNumber);

                                                } else {

                                                    // 每一次拼接字符串并换行
                                                    tempStr = params.substring(start, end) + "\n";
                                                }

                                                newParamsName += tempStr;// 最终拼成的字符串
                                            }
                                        }
                                        else {
                                            // 将旧标签的值赋给新标签
                                            newParamsName = params;
                                        }

                                        //将最终的字符串返回
                                        return newParamsName;
                                    }
                                }
                            },
                            series: [
                                {
                                    name: '',
                                    type: 'bar',
                                    barWidth: 35,
                                    data: data[1],
                                    label: {
                                        show: true,
                                        position: 'top'
                                    },
                                },
                            ]
                        });
                    }
                },
                error: function (ex) { }
            });
        }
    </script>
</body>
</html>
