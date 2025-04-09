<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BHIndex.aspx.cs" Inherits="Zhongsoft.Portal.MM.BH.BHIndex" %>

<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta content="IE=11.0000" http-equiv="X-UA-Compatible">
    <!--
        * @Package: Cryptonia - Bitcoin & Cryptocurrency trading Dashboard
        * @Version: 1.0.0
    -->

    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>经营首页</title>

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

        /*20190117添加*/
        #tooltip001 {
            display: none;
            margin-top: 20px;
        }

        #tooltip002 {
            display: none;
            margin-top: 20px;
        }

        #tooltip003 {
            display: none;
            margin-top: 20px;
        }

        .tooltip001:hover #tooltip001 {
            display: block;
        }

        .tooltip001:hover #tooltip002 {
            display: block;
        }

        .tooltip001:hover #tooltip003 {
            display: block;
        }
    </style>
        <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt ie 9]>
       <script src="js/html5shiv.js"></script>
       <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->

<body class=" ">
    <!-- START TOPBAR -->
    <!-- END TOPBAR -->
    <!-- START CONTAINER -->
    <div class="page-container row-fluid container-fluid">
        <!-- SIDEBAR - START -->
        <!--  SIDEBAR - END -->
        <!-- START CONTENT -->
        <section class=" " id="main-content">
            <div class="wrapper main-wrapper row">
                <%--  经营首页左上方标题开始--%>
                <div class="col-xs-12">
                    <div class="page-title">
                        <div class="pull-left">
                            <!-- PAGE HEADING TAG - START -->
                            <h1 class="title">经营首页</h1>
                            <!-- PAGE HEADING TAG - END -->
                        </div>
                        <div class="pull-right hidden-xs" style="padding-top: 10px;">
                        </div>
                    </div>
                </div>
                <%-- 经营首页左上方标题结束--%>

                <%-- 当年已签，当年已收，内部利润块开始--%>
                <div class="col-lg-12">
                    <section class="box nobox marginBottom0">
                        <div class="content-body">
                            <div class="row">
                                <div class="col-lg-4 col-sm-6 col-xs-12">
                                    <div class="r4_counter1 db_box">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="images/hetong.png" style="width: 48px;" />
                                            </div>
                                            <div class="col-xs-7">
                                                <div class="index_top_left">
                                                    <div class="index_top_left_2" style="white-space: nowrap; font-size: medium !important">
                                                        <label id="lbContractValue" onclick="openToContract('year','sign','all');"></label>
                                                    </div>
                                                    <div class="index_top_left_1">当年已签合同（万元）</div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">
                                                <div class="progress tooltip001" style="margin-bottom: 10px; margin-top: 10px;">
                                                    <div class="tooltip bottom in" role="tooltip" id="tooltip001">
                                                        <div class="tooltip-arrow" style="left: 50%;"></div>
                                                        <div class="tooltip-inner">当年目标已完成<label id="lbContractValueRate1"></label></div>
                                                    </div>
                                                    <div id="divCVRate" class="progress-bar progress-bar-primary1" role="progressbar" aria-valuenow="66.4" aria-valuemin="0" aria-valuemax="100" style="width: 66%;">
                                                        <label id="lbContractValueRate"></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="index_top_right_1">当年目标<span><label id="lbThisTarget"></label></span></div>
                                            </div>
                                            <div class="col-xs-4" onclick="openToContract('quarter','sign','all');">
                                                <div class="index_top_right_2">当季已签<span><label id="lbTQContractValue"></label></span></div>
                                            </div>
                                            <div class="col-xs-4" onclick="openToContract('month','sign','all');">
                                                <div class="index_top_right_3">当月已签<span><label id="lbTMContractValue"></label></span></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-6 col-xs-12">
                                    <div class="r4_counter2 db_box">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="images/yshoukuan.png" style="width: 48px;" />
                                            </div>
                                            <div class="col-xs-7">
                                                <div class="index_top_left">
                                                    <div class="index_top_left_2" style="white-space: nowrap; font-size: medium !important">
                                                        <label id="lbChargedValue" onclick="openToCharged('year')"></label>
                                                        /<label id="lbShouldCharge" onclick="openToCharge('year')"></label>
                                                    </div>
                                                    <div class="index_top_left_1" style="white-space: nowrap">当年已收款（万元）/当年应收款（万元）</div>
                                                </div>

                                            </div>
                                            <div class="col-xs-12">
                                                <div class="progress tooltip001" style="margin-bottom: 10px; margin-top: 10px;">
                                                    <div class="tooltip bottom in" role="tooltip" id="tooltip002">
                                                        <div class="tooltip-arrow" style="left: 50%;"></div>
                                                        <div class="tooltip-inner">当年目标已完成<label id="lbChargedValueTate1"></label></div>
                                                    </div>
                                                    <div id="divChargedRate" class="progress-bar progress-bar-primary2" role="progressbar" aria-valuenow="38.3" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                                        <label id="lbChargedValueTate"></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="index_top_right_1">当年目标<span><label id="lbTYChargedTarget"></label></span></div>
                                            </div>
                                            <div class="col-xs-4" onclick="openToCharged('quarter')">
                                                <div class="index_top_right_2">当季已收<span><label id="lbTQChargedValue"></label></span></div>
                                            </div>
                                            <div class="col-xs-4" onclick="openToCharged('month')">
                                                <div class="index_top_right_3">当月已收<span><label id="lbTMChargedValue"></label></span></div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-lg-4 col-sm-6 col-xs-12">
                                    <div class="r4_counter3 db_box">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="images/shoukuan.png" style="width: 48px;" />
                                            </div>
                                            <div class="col-xs-7">
                                                <div class="index_top_left">
                                                    <div class="index_top_left_2" style="white-space: nowrap; font-size: medium !important">
                                                        <label id="lbInternalProfit"></label>
                                                    </div>
                                                    <div class="index_top_left_1">当年内部利润（万元）</div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">
                                                <div class="progress tooltip001" style="margin-bottom: 10px; margin-top: 10px;">
                                                    <div class="tooltip bottom in" role="tooltip" id="tooltip003">
                                                        <div class="tooltip-arrow" style="left: 50%;"></div>
                                                        <div class="tooltip-inner">当年目标已完成<label id="lbInternalProfitRate1"></label></div>
                                                    </div>
                                                    <div id="divInternalProfitRate" class="progress-bar progress-bar-primary3" role="progressbar" aria-valuenow="38.3" aria-valuemin="0" aria-valuemax="100" style="width: 58%;">
                                                        <label id="lbInternalProfitRate"></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="index_top_right_1">当年目标<span><label id="lbTYInternalProfitTarget"></label></span></div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="index_top_right_2">当季利润<span><label id="lbTQInternalProfit"></label></span></div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="index_top_right_3">当月利润<span><label id="lbTMInternalProfit"></label></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End .row -->
                        </div>
                    </section>
                </div>
                <%-- 当年已签，当年已收，内部利润块结束--%>

                <div class="clearfix"></div>

                <%-- 重点客户，重点合同，重项目开始--%>
                <div class="col-lg-4">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">重点客户</h2>
                            <div class="actions panel_actions pull-right">
                                <a title="更多" target="_blank" href="<%=WebAppPath%>/Custom/List/DispListNew.aspx?secid=C724123D-35D2-481B-8466-F2BC0ADF569A&ImportantLevel=A">更多</a>
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body" style="margin-top: 5px;">
                            <div class="row">
                                <div class="col-xs-12" id="divCustomer">
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-4">
                    <section class="box has-border-left-4">
                        <header class="panel_header">
                            <h2 class="title pull-left">重点合同</h2>
                            <div class="actions panel_actions pull-right">
                                <a title="更多" target="_blank" href="<%=WebAppPath%>/MM/List/MCM/ContractListNew.aspx?ImportantLevel=A">更多</a>
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body" style="margin-top: 8px;">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-responsive" id="divContract">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-4">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">重点项目</h2>
                            <div class="actions panel_actions pull-right">
                                <a title="更多" target="_blank" href="<%=WebAppPath%>/MM/List/MM/FormalProjectList.aspx?ImportantLevel=A">更多</a>
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body" style="margin-top: 8px;">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-responsive" id="divProject">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <%-- 重点客户，重点合同，重项目结束--%>

                <div class="clearfix" style="margin-bottom: 10px;"></div>
                <%--客户、合同、项目统计开始--%>
                <div class="col-lg-4">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">客户统计</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px 25px">
                            <div class="row">
                                <div class="tile-progress bg-accent" style="margin-right: 15px; margin-left: 15px; margin-bottom: 0px;">
                                    <div class="content newxmtj">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <span style="font-size: 1.4em; color: #358dd7; font-family: arialnormal; cursor: pointer">
                                                    <label id="lbHYCustomerNum" onclick="openToCustomer('1','')"></label>
                                                </span>
                                                <h4><i class="fa fa-user"></i>活跃客户</h4>
                                            </div>
                                            <div class="col-xs-6 zengzhang">
                                                <div style="white-space: nowrap">
                                                    当月新增：<label id="lbTMCustomerNum" onclick="openToCustomer('0','month')" style="cursor: pointer"></label>&nbsp;&nbsp;&nbsp;&nbsp;当季新增：<label id="lbTQCustomerNum" onclick="openToCustomer('0','quarter')" style="cursor: pointer"></label>
                                                </div>
                                                <div style="white-space: nowrap">
                                                    当年新增：<label id="lbTYCustomerNum" onclick="openToCustomer('0','year')" style="cursor: pointer"></label>&nbsp;&nbsp;&nbsp;&nbsp;总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：<label id="lbCustomerNum" onclick="openToCustomer('0','')" style="cursor: pointer"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-4">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">合同统计</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px 25px">
                            <div class="row">
                                <div class="tile-progress bg-accent" style="margin-right: 15px; margin-left: 15px; margin-bottom: 0px;">
                                    <div class="content newxmtj">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <span style="font-size: 1.4em; color: #358dd7; font-family: arialnormal; cursor: pointer">
                                                    <label id="lbZXZContractNum" onclick="openToContract('','','执行中');"></label>
                                                </span>
                                                <h4><i class="fa fa-user"></i>执行中合同</h4>
                                            </div>
                                            <div class="col-xs-6 zengzhang">
                                                <div style="white-space: nowrap">
                                                    当月新增：<label id="lbTMContractNum" onclick="openToContract('month','create','all');" style="cursor: pointer"></label>&nbsp;&nbsp;&nbsp;&nbsp;当季新增：<label id="lbTQContractNum" onclick="openToContract('quarter','create','all');" style="cursor: pointer"></label>
                                                </div>
                                                <div style="white-space: nowrap">
                                                    当年新增：<label id="lbTYContractNum" onclick="openToContract('year','create','all');" style="cursor: pointer"></label>&nbsp;&nbsp;&nbsp;&nbsp;总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：<label id="lbContractNum" onclick="openToContract('','','all');" style="cursor: pointer"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-4">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left">项目统计</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px 25px">
                            <div class="row">
                                <div class="tile-progress bg-accent" style="margin-right: 15px; margin-left: 15px; margin-bottom: 0px;">
                                    <div class="content newxmtj">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <span style="font-size: 1.4em; color: #358dd7; font-family: arialnormal; cursor: pointer">
                                                    <label id="lbKZZProjectNum" onclick="openToFormalProject('','进行');"></label>
                                                </span>
                                                <h4><i class="fa fa-user"></i>开展中项目</h4>
                                            </div>
                                            <div class="col-xs-6 zengzhang">
                                                <div style="white-space: nowrap">当月新增：<label id="lbTMProjectNum" onclick="openToFormalProject('month','');" style="cursor: pointer"></label>&nbsp;&nbsp;&nbsp;&nbsp;当季新增：<label id="lbTQProjectNum" onclick="openToFormalProject('quarter','');" style="cursor: pointer"></label></div>
                                                <div style="white-space: nowrap">当年新增：<label id="lbTYProjectNum" onclick="openToFormalProject('year','');" style="cursor: pointer"></label>&nbsp;&nbsp;&nbsp;&nbsp;总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计：<label id="lbProjectNum" onclick="openToFormalProject('','');" style="cursor: pointer"></label></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <%-- 客户、合同、项目统计结束--%>

                <div class="clearfix" style="margin-bottom: 10px;"></div>
                <!-- MAIN CONTENT AREA STARTS -->
                <%-- 到款分析开始--%>
                <div class="col-lg-12">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left"><%=DateTime.Now.Year %>年到款分析</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body" style="padding: 5px 20px;">
                            <div class="row">
                                <div class="col-xs-12">

                                    <div class="chart-container">
                                        <div id="page_views_today_bar" style="height: 240px;"></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <%--到款分析结束--%>
                <div class="clearfix" style="margin-bottom: 10px;"></div>

                <%-- 收费合同、采购合同饼图开始--%>
                <div class="col-lg-6">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left"><%=DateTime.Now.Year %>年收费合同额按板块分析</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-xs-12 mt-20">
                                    <div id="bottom-echart" style="height: 360px;"></div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-6">
                    <section class="box has-border-left-3">
                        <header class="panel_header">
                            <h2 class="title pull-left"><%=DateTime.Now.Year %>年采购合同额按合同类型分析</h2>
                            <div class="actions panel_actions pull-right">
                                <a class="box_toggle fa fa-chevron-down"></a>
                            </div>
                        </header>
                        <div class="content-body">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-xs-12 mt-20">
                                    <div id="bottom-echart-cg" style="height: 360px;"></div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <%-- 收费合同、采购合同饼图结束--%>
                <div class="clearfix" style="margin-bottom: 10px;"></div>
                <!-- MAIN CONTENT AREA ENDS -->
            </div>
        </section>
        <!-- END CONTENT -->
        <div class="chatapi-windows "></div>
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
    <script src="index-ico-user_files/echarts.min.js"></script>
    <script src="index-ico-user_files/create-highcarts.js"></script>
    <script type="text/javascript" src="index-ico-user_files/my_echarts.js"></script>

    <!-- CORE TEMPLATE JS - START -->
    <script src="index-ico-user_files/scripts.js"></script>
    <!-- END CORE TEMPLATE JS - END -->
    <script type="text/javascript">
        var $appCtx = { appPath:"<%=WebAppPath%>", portalUrl:"<%=PortalAddress%>" };

        var $startDate = "";
        var $endDate = "";
        //重点客户
        getCustomer();
        function getCustomer() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/BHIndex.aspx',
                dataType: 'json',
                data: { asyfunc: "GetCustomer" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        var ht = ''
                        for (var i = 0; i < data.length; i++) {
                            ht += '<div class="trader-buy golden"><h6 class="angle-round" > <i class="fa fa-diamond"></i>' +
                                '<a style="cursor:pointer" onclick="viewCustomerDetail(' + '\'' + data[i].customerID + '\'' + ');">' + data[i].customerName + '</a>' +
                                '<span class="number" > <i class="fa fa-address-card-o" style="margin-right: 5px;"></i> <span style="font-size: 0.8em;">负责人：' +
                                data[i].dutyUserName + '</span ></span ></h6 ><table class="table-bordered table"><tr><td><span class="dkfxm"><a style="cursor:pointer"  onclick="openToMarketInfo('
                                + '\'' + data[i].customerID + '\'' + ');"' + '>待开发项目数【'
                                + data[i].projectNum + '】</a></span></td> <td><span class="hts"><a style="cursor:pointer"  onclick="openToCustomerContract('
                                + '\'' + data[i].customerID + '\'' + ');"' + '>合同数【'
                                + data[i].contractNum + '】</a></span ></td ><td><span class="ysk"><a style="cursor:pointer"  onclick="openToCustomerContract('
                                + '\'' + data[i].customerID + '\'' + ');"' + '>应收款【'
                                + data[i].shouldCharge + '万元】</a ></span ></td ></tr > </table ></div >';
                        }
                        $("#divCustomer").html(ht);
                    }

                }
            })
        }

        //重点合同
        getContract();
        function getContract() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/BHIndex.aspx',
                dataType: 'json',
                data: { asyfunc: "GetContract" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        var ht = '<table class="table table-striped" id="tech-companies-1" style="margin-bottom: 10px;"><thead> <tr><th>合同名称</th><th>合同额</th><th  nowrap="nowrap">应收款</th><th>已收款</th></tr></thead><tbody>';
                        for (var i = 0; i < data.length; i++) {
                            ht += '<tr><th class="table-title"><div style="margin: 0px;"><a style="cursor:pointer"  onclick="viewContractDetail('
                                + '\'' + data[i].contractID + '\'' + ');" title="'
                                + data[i].contractName + '">' + data[i].contractName + '</a></div></th> <td>' + '<a style="cursor:pointer"  onclick="viewContractDetail('
                                + '\'' + data[i].contractID + '\'' + ');">' +
                                data[i].contractValue + '万</a></td > <td>' + '<a style="cursor:pointer"  onclick="openToContractShouldCharge('
                                + '\'' + data[i].contractID + '\'' + ');">' + data[i].shouldCharge + '万</a></td><td><span class="status-pending">'
                                + '<a class="status-pending" style="cursor:pointer"  onclick="openToContractCharged('
                                + '\'' + data[i].contractID + '\'' + ');">'
                                + data[i].hadCharge + '万</a></span ></td></tr>';
                        }
                        ht += '</tbody></table>';
                        $("#divContract").html(ht);
                    }

                }
            })
        }

        //重点项目
        getProject();
        function getProject() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/BHIndex.aspx',
                dataType: 'json',
                data: { asyfunc: "GetProject" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        var ht = '<table class="table table-striped" id="tech-companies-1" style="margin-bottom: 10px;"><thead> <tr><th>项目名称</th><th>合同额</th><th>已收款</th></tr></thead><tbody>';
                        for (var i = 0; i < data.length; i++) {
                            ht += '<tr><th class="table-title"><div style="margin: 0px;"><a style="cursor:pointer"  onclick="viewMarketDetail('
                                + '\'' + data[i].marketProjectID + '\'' + ');" title="'
                                + data[i].marketProjectName + '">' + data[i].marketProjectName + '</a></div></th> <td>'
                                + '<a style="cursor:pointer"  onclick="viewMarketDetail('
                                + '\'' + data[i].marketProjectID + '\'' + ');">' +
                                data[i].contractValue + '万</a></td > <td><span class="status-pending">'
                                + '<a class="status-pending" style="cursor:pointer"  onclick="openToMarketCharged('
                                + '\'' + data[i].marketProjectID + '\'' + ');">'
                                + data[i].chargedValue + '万</a></span ></td></tr>';
                        }
                        ht += '</tbody></table>';
                        $("#divProject").html(ht);
                    }

                }
            })
        }

        //获取合同金额信息
        getContractInfo();
        function getContractInfo() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/BHIndex.aspx',
                dataType: 'json',
                data: { asyfunc: "GetContractInfo" },
                success: function (data) {
                    if (data != "") {
                        $("#lbThisTarget").html(data.Target);
                        $("#lbContractValue").html(data.ThisYear);
                        $("#lbTQContractValue").html(data.ThisQuater);
                        $("#lbTMContractValue").html(data.ThisMonth);
                        $("#lbTYChargedTarget").html(data.ChargedTarget);
                        $("#lbChargedValue").html(data.ThisYearCharged);
                        $("#lbTQChargedValue").html(data.ThisQuaterCharged);
                        $("#lbTMChargedValue").html(data.ThisMonthCharged);
                        $("#lbShouldCharge").html(data.ThisYearShouldCharge);
                        $("#lbTYInternalProfitTarget").html(data.ProfitTarget);
                        $("#lbTQInternalProfit").html("30.00");
                        $("#lbTMInternalProfit").html("10.00");
                        $("#lbInternalProfit").html("85.00");
                        var contractTarget = parseFloat(data.Target);
                        if (contractTarget == 0) {
                            contractTarget = 1;
                        }
                        var contractRate = parseFloat(data.ThisYear) / contractTarget * 100;
                        contractRate = contractRate.toFixed("F2");
                        $("#lbContractValueRate").html(contractRate + "%");
                        $("#lbContractValueRate1").html(contractRate + "%");
                        $("#divCVRate").attr("style", "width:" + contractRate + "%");
                        var chargedTarget = parseFloat(data.ChargedTarget);
                        if (chargedTarget == 0) {
                            chargedTarget = 1;
                        }
                        var chargedRate = parseFloat(data.ThisYearCharged) / chargedTarget * 100;
                        chargedRate = chargedRate.toFixed("F2");
                        $("#lbChargedValueTate").html(chargedRate + "%");
                        $("#lbChargedValueTate1").html(chargedRate + "%");
                        $("#divChargedRate").attr("style", "width:" + chargedRate + "%");

                        $("#lbInternalProfitRate").html(85 + "%");
                        $("#lbInternalProfitRate1").html(85 + "%");
                        $("#divInternalProfitRate").attr("style", "width:" + 85 + "%");
                    }
                }
            })

        }

        //获取统计信息
        getStaInfo();
        function getStaInfo() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/BHIndex.aspx',
                dataType: 'json',
                data: { asyfunc: "GetStaInfo" },
                success: function (data) {
                    if (data != "") {
                        $("#lbCustomerNum").html(data.CustomerNum);
                        $("#lbTQCustomerNum").html(data.TQCustomerNum);
                        $("#lbTMCustomerNum").html(data.TMCustomerNum);
                        $("#lbTYCustomerNum").html(data.TYCustomerNum);
                        $("#lbHYCustomerNum").html(data.HYCustomerNum);
                        $("#lbContractNum").html(data.ContractNum);
                        $("#lbTQContractNum").html(data.TQContractNum);
                        $("#lbTMContractNum").html(data.TMContractNum);
                        $("#lbTYContractNum").html(data.TYContractNum);
                        $("#lbZXZContractNum").html(data.ZXZContractNum);
                        $("#lbProjectNum").html(data.ProjectNum);
                        $("#lbTQProjectNum").html(data.TQProjectNum);
                        $("#lbTMProjectNum").html(data.TMProjectNum);
                        $("#lbTYProjectNum").html(data.TYProjectNum);
                        $("#lbKZZProjectNum").html(data.KZZProjectNum);
                    }
                }
            })
        }

        function showCustomer() {
            var url = buildQueryUrl("Custom/List/DispListNew.aspx?secid=C724123D-35D2-481B-8466-F2BC0ADF569A", null);
            showDivDialog(url, null, 850, 550, null);
            return false;
        }

        //打开到收费合同台账
        function openToContract(timeType, field, contractState) {
            var url = "<%=WebAppPath%>" + "/MM/List/MCM/ContractListNew.aspx";
            if (timeType != '') {
                initDateScope(timeType);
                if (field == 'sign') {
                    url += "?signStartDate=" + $startDate + "&signEndDate=" + $endDate;
                }
                else if (field == 'create') {
                    url += "?createStartDate=" + $startDate + "&createEndDate=" + $endDate;
                }
                if (contractState != '') {
                    url += "&contractState=" + contractState;
                }
            }
            else {
                if (contractState != '') {
                    url += "?contractState=" + contractState;
                }
            }
            window.open(url);
            return false;
        }

        //打开到收费合同台账--应收款
        function openToCharge(timeType) {
            var url = "<%=WebAppPath%>" + "/MM/List/MCM/ContractListNew.aspx";
            initDateScope(timeType);
            url += "?chargeStartDate=" + $startDate + "&chargeEndDate=" + $endDate;
            window.open(url);
            return false;
        }

        //打开到收费合同台账--已收款
        function openToCharged(timeType) {
            var url = "<%=WebAppPath%>" + "/MM/List/MCM/ContractChargeDetail.aspx";
            initDateScope(timeType);
            url += "?chargeStartDate=" + $startDate + "&chargeEndDate=" + $endDate;
            window.open(url);
            return false;
        }

        //查看客户详细
        function viewCustomerDetail(bizID) {
            var url = "<%=WebAppPath%>" + "/MM/List/CRM/CustomerEditor.aspx?actionType=1";
            url += "&bizid=" + bizID;
            window.open(url);
            return false;
        }

        //客户待开发项目数
        function openToMarketInfo(customerID) {
            var url = "<%=WebAppPath%>" + "/MM/List/MDM/MarketInfoList.aspx";
            url += "?customerID=" + customerID + "&trackingStates=" +"<%= TrackingState.投标中.ToString()%>" + "," +"<%= TrackingState.跟踪中.ToString()%>";
            window.open(url);
            return false;
        }

        //客户合同,客户应收款
        function openToCustomerContract(customerID) {
            var url = "<%=WebAppPath%>" + "/MM/List/MCM/ContractListNew.aspx";
            url += "?customerID=" + customerID;
            window.open(url);
            return false;
        }

        //查看合同详细
        function viewContractDetail(bizID) {
            var url = "<%=WebAppPath%>" + "/MM/List/MCM/ContractEditorNew.aspx?actionType=1";
            url += "&bizid=" + bizID;
            window.open(url);
            return false;
        }

        //合同应收费
        function openToContractShouldCharge(contractID) {
            var url = "<%=WebAppPath%>" + "/MM/List/MCM/ContractChargePointDetail.aspx?";
            url += "?contractID=" + contractID;
            window.open(url);
            return false;
        }

        //合同已收费
        function openToContractCharged(contractID) {
            var url = "<%=WebAppPath%>" + "/MM/List/MCM/ContractChargeDetail.aspx";
            url += "?contractID=" + contractID;
            window.open(url);
            return false;
        }

        //查看项目详细
        function viewMarketDetail(bizID) {
            var url = "<%=WebAppPath%>" + "/MM/List/MM/AddToFormalProject.aspx?actionType=1";
            url += "&bizid=" + bizID;
            window.open(url);
            return false;
        }

        //项目已收款
        function openToMarketCharged(marketProjectID) {
            var url = "<%=WebAppPath%>" + "/MM/List/MCM/ProjectChargeDetail.aspx";
            url += "?marketProjectID=" + marketProjectID;
            window.open(url);
            return false;
        }

        //打开客户页面
        function openToCustomer(isHY, timeType) {
            var url = "<%=WebAppPath%>/Custom/List/DispListNew.aspx?secid=C724123D-35D2-481B-8466-F2BC0ADF569A"
            if (isHY == "1") {
                url += "&IsActive=1";
            }
            if (timeType != '') {
                initDateScope(timeType);
                url += "&createStartDate=" + $startDate + "&createEndDate=" + $endDate;
            }
            window.open(url);
            return false;
        }

        //打开到正式工程
        function openToFormalProject(timeType, projectState) {
            var url = "<%=WebAppPath%>" + "/MM/List/MM/FormalProjectList.aspx";
            if (timeType != '') {
                initDateScope(timeType);
                url += "?createStartDate=" + $startDate + "&createEndDate=" + $endDate;
                if (projectState != '') {
                    url += "&projectState=" + projectState;
                }
            }
            else {
                if (projectState != '') {
                    url += "?projectState=" + projectState;
                }
            }
            window.open(url);
            return false;
        }

        //初始化当年、当季度、当月开始结束时间
        function initDateScope(timeType) {
            var startDate = new Date();
            var endDate = new Date();
            if (timeType == "year") {
                $startDate = startDate.getFullYear() + "-01-01 00:00:00";;
                $endDate = endDate.getFullYear() + "-12-31 23:23:59";
            }
            else if (timeType == "quarter") {
                var month = startDate.getMonth() + 1;
                var quarter = month % 3 == 0 ? Math.floor(month / 3) : Math.floor(month / 3) + 1;
                $startDate = startDate.getFullYear() + "-" + (3 * (quarter - 1) + 1) + "-01 00:00:00";
                if (quarter <= 3) {
                    endDate = endDate.getFullYear() + "-" + (3 * quarter + 1) + "-01 23:23:59";
                    endDate = new Date(new Date(endDate.replace(/\-/g, '/')).getTime() - (1000 * 60 * 60 * 24));
                    $endDate = timeStamp2String(endDate);
                }
                else if (quarter == 4) {
                    $endDate = endDate.getFullYear() + "-" + (3 * quarter) + "-31 23:23:59";
                }
            }
            else if (timeType == "month") {
                startDate = new Date(startDate.getFullYear(), startDate.getMonth(), 1);
                endDate = new Date(endDate.getFullYear(), endDate.getMonth() + 1, 0);
                $startDate = timeStamp2String(startDate);
                $endDate = endDate.getFullYear() + "-" + (endDate.getMonth() + 1) + "-" + endDate.getDate() + " 23:23:59";
            }
        }

        //将日期转换为字符串型
        function timeStamp2String(time) {
            var datetime = new Date();
            datetime.setTime(time);
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
            var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
            var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
            return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
        }

    </script>
</body>

</html>

