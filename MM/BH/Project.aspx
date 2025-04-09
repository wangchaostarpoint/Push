<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="Zhongsoft.Portal.MM.BH.Project" %>


<%@ Register Src="~/MM/BH/WBSDelayInfo.ascx" TagName="WBSDelayInfo" TagPrefix="uc1" %>
<%@ Register Src="~/MM/BH/ProjExistsProblems.ascx" TagName="ProjExistsProblems" TagPrefix="uc2" %>
<%@ Import Namespace="EDPortal.BLL.MM" %>
<!-- saved from url=(0079)/preview/1160620/2018-04-25/cryptonia/index-ico-user.html -->
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

    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>

    <style>
        .navbar-header {
            padding: 0px 10px;
        }

        .navbar-brand {
            padding: 15px 15px 0px;
            height: auto;
        }

        .table-xmgy td span {
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            display: inline-block
        }
    </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->

<body class=" ">
    <%
        // 隐藏合同后的样式
        string divClass = "class='col-lg-4 col-md-4 col-sm-4'";
        // 是否隐藏合同模块
        string showContract = string.Empty;
        // 根据登录的部门控制是否显示合同信息
        //if (MMConfig.Instance.ContractAccesDept != null && MMConfig.Instance.ContractAccesDept.Contains(KPMSUser.DeptName))
        //由于目前缺少合同与阶段项目的关联，所以阶段合同金额无法展现，故隐藏合同金额内容 tianhl 20211011
        if (false)
        {
            divClass = "class='col-lg-4 col-md-4 col-sm-4'";
        }
        else
        {
            divClass = "class='col-lg-6 col-md-6 col-sm-6'";
            showContract = "style='display:none;'";
        }
    %>
    <!-- START CONTAINER -->
    <div class="page-container row-fluid container-fluid">
        <!-- START CONTENT -->
        <section class=" " id="main-content">
            <div class="navbar-header">
                <div class="navbar-brand" style="font-size: 1em; color: #000000; font-weight: bold;">
                    当前项目 > 
                        <asp:Label runat="server" ID="lbProjectName"></asp:Label>
                </div>
            </div>
            <div class="wrapper main-wrapper row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <section class="box nobox marginBottom0">
                        <div class="content-body">
                            <div class="row">
                                <!--根据登录的部门控制是否显示合同信息-->
                                <div <%=divClass %>>
                                    <!--根据登录的部门控制是否显示合同信息 END-->
                                    <section class="box" style="height: 420px">
                                        <header class="panel_header">
                                            <h2 class="title pull-left" style="margin-left: 30px;">项目概要</h2>
                                            <div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                                <a class="box_close fa fa-times"></a>
                                            </div>
                                        </header>
                                        <div class="content-body" style="padding: 5px 30px;">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div class="table-responsive table-xmgy" data-pattern="priority-columns">
                                                        <table class="table table-small-font " id="tech-companies-1">
                                                            <tbody>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">项目名称</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbProjectNameDetail"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">项目编号</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbProjectCode"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">项目通知单</th>
                                                                    <td>
                                                                        <a style="color: blue;" id="lbProductionTaskID" href="javascript:viewForm();">查看</a>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">项目设总</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbManagerUserName"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">项目阶段</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbPhaseName"></asp:Label></td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <th style="background-color: rgb(249, 249, 249)">设计规模</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbProjectScale"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">建设性质</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbBuildType"></asp:Label></td>
                                                                </tr>
                                                                <tr style="display: none">
                                                                    <th style="background-color: rgb(249, 249, 249)">任务来源</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbTaskSource"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">建设地点</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbBuildPlace"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">业主单位</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbCustomerName"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">项目状态</th>
                                                                    <td><span class="status-pending">
                                                                        <asp:Label runat="server" ID="lbProjectState"></asp:Label></span></td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <th style="background-color: rgb(249, 249, 249)">参加专业</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbProjectSpes"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">牵头分院</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbHostDeptName"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <th style="background-color: rgb(249, 249, 249)">配合分院</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbDeputyDeptName"></asp:Label></td>
                                                                </tr>
                                                                <tr style="display: none">
                                                                    <th style="background-color: rgb(249, 249, 249)">项目概况</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbProjectContent"></asp:Label></td>
                                                                </tr>
                                                                <tr style="display: none">
                                                                    <th style="background-color: rgb(249, 249, 249)">其他</th>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lbMemo"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <!--根据登录的部门控制是否显示合同信息-->
                                <div <%=divClass %>>
                                    <!--根据登录的部门控制是否显示合同信息 END-->
                                    <section class="box">
                                        <header class="panel_header">
                                            <h2 class="title pull-left" style="margin-left: 30px;">项目进度状态</h2>
                                            <div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                <a class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></a>
                                                <a class="box_close fa fa-times"></a>
                                            </div>
                                        </header>
                                        <div class="content-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div id="project_echart1" style="height: 300px;"></div>
                                                </div>
                                                <div class="col-xs-12">
                                                    <div class="statistics-wraper">
                                                        <div class="statistics-info" style="text-align: center;">
                                                            <h5>任务数：<label id="lbTotalRoll"></label>&nbsp;&nbsp;<i class="fa fa-caret-left" style="font-size: 1.3em;"></i><i class="fa fa-caret-right" style="color: #e45431; font-size: 1.3em;"></i>&nbsp;&nbsp;<span style="color: #e45431;">已完成：<label id="lbFinishRoll"></label></span></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <!--根据登录的部门控制是否显示合同信息-->
                                <div class="col-lg-4 col-md-4 col-sm-4" <%=showContract %>>
                                    <!--根据登录的部门控制是否显示合同信息 END-->
                                    <section class="box ">
                                        <header class="panel_header">
                                            <h2 class="title pull-left" style="margin-left: 30px;">合同额（万元）</h2>
                                            <div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                <a class="box_setting fa fa-cog" data-toggle="modal" href="#section-settings"></a>
                                                <a class="box_close fa fa-times"></a>
                                            </div>
                                        </header>
                                        <div class="content-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div id="project_echart2" style="height: 300px;"></div>
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
                            <div class="row" style="margin-top: 15px; margin-bottom: 15px;">
                                <div class="col-lg-12 col-md-12 col-xs-12">
                                    <section class="box has-border-left-3">
                                        <header class="panel_header">
                                            <h2 class="title pull-left" style="margin-left: 30px;">项目计划及执行情况</h2>
                                            <div class="actions panel_actions pull-right">
                                                <a class="box_toggle fa fa-chevron-down"></a>
                                                <a class="box_setting fa fa-cog" href="/preview/1160620/2018-04-25/cryptonia/index-ico-user.html#section-settings" data-toggle="modal"></a>
                                                <a class="box_close fa fa-times"></a>
                                            </div>
                                        </header>
                                        <div class="content-body" style="padding: 5px 30px 15px;">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <section class="box" style="margin-bottom: 20px;">
                                                        <table class="table table-small-font table-bordered table-striped no-mb" id="tech-companies-1">
                                                            <tbody>
                                                                <tr>
                                                                    <th class="active" style="color: #e45431;"><i class="fa fa-clock-o" style="margin-right: 5px;"></i>要求开始日期</th>
                                                                    <td style="color: #e45431;">
                                                                        <label id="lbPlanStartDate"></label>
                                                                    </td>
                                                                    <th class="active" style="color: #e45431;"><i class="fa fa-clock-o" style="margin-right: 5px;"></i>要求完成时间</th>
                                                                    <td style="color: #e45431;">
                                                                        <label id="lbPlanCompleteDate"></label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="active"><i class="fa fa-clock-o" style="margin-right: 5px;"></i>任务下达日期</th>
                                                                    <td>
                                                                        <label id="lbTaskDate"></label>
                                                                    </td>
                                                                    <th class="active"><i class="fa fa-clock-o" style="margin-right: 5px;"></i>实际完工日期</th>
                                                                    <td>
                                                                        <label id="lbFactCompleteDate"></label>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </section>
                                                    <div class="table-responsive" data-pattern="priority-columns">

                                                        <iframe id="ifProjectPlan" name="ifProjectPlan" frameborder="0" allowtransparency="true"
                                                            scrolling="no" style="width: 100%; min-height: 350px;"></iframe>

                                                        <!--<hr style="margin-bottom: 0px;margin-top: 0px;">-->
                                                        <%--不显示里程碑--%>
                                                        <table class="table table-small-font no-mb table-bordered table-striped" id="tech-companies-1" style="margin-top: 1px; display: none;">
                                                            <thead>
                                                                <tr>
                                                                    <th>里程碑名称</th>
                                                                    <th data-priority="1">计划完成时间</th>
                                                                    <th data-priority="2">实际完成时间</th>
                                                                    <th data-priority="3">状态</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tbodyMiles">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>

                                <div class="col-lg-12 col-md-12 col-xs-12" style="margin-top: 15px; margin-bottom: 20px; display: none">
                                    <section class="box has-border-left-3">
                                        <header class="panel_header">
                                            <h2 class="title pull-left" style="padding-left: 30px;">互提资料/外部资料</h2>
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
                                                                    <th>资料编号</th>
                                                                    <th data-priority="1">资料名称</th>
                                                                    <th data-priority="2">提资专业</th>
                                                                    <th data-priority="3">提资人</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tbodyWbs">
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>

                            </div>
                        </div>
                    </section>
                </div>
                <uc1:WBSDelayInfo ID="wBSDelayInfo" runat="server" />
                <uc2:ProjExistsProblems ID="projExistsProblems" runat="server" Visible="false" />
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

        var $appCtx = { appPath: "<%=WebAppPath%>", portalUrl: "<%=PortalAddress%>" };

        function getRollPie() {
            var rollPieChart = echarts.init(document.getElementById('project_echart1'));
            // 指定图表的配置项和数据
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetRollPie", organizationID: "<%=OrganizationID%>"
                },
                url:'<%=WebAppPath%>' + '/MM/BH/Project.aspx',
                success: function (result) {
                    if (result) {
                        var jsonObj = $.parseJSON(result)
                        rollPieChart.setOption({
                            color: ['#e45431', '#cccccc'],
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b}: {c} ({d}%)"
                            },

                            series: [{
                                name: '任务数',
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

        //项目信息
        function getProject() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/Project.aspx',
                dataType: 'json',
                data: { asyfunc: "GetProject", organizationID: "<%=OrganizationID%>" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        $('#lbProjectName').html(data[0].ProjectName);
                        $('#lbProjectNameDetail').html(data[0].ProjectName);
                        $('#lbProjectCode').html(data[0].ProjectCode);
                        $('#lbManagerUserName').html(data[0].ManagerUserName);
                        $('#lbPhaseName').html(data[0].PhaseName);
                        $('#lbProjectScale').html(data[0].ProjectScale);
                        $('#lbBuildType').html(data[0].BuildType);
                        $('#lbTaskSource').html(data[0].TaskSource);
                        $('#lbBuildPlace').html(data[0].BuildPlace);
                        $('#lbCustomerName').html(data[0].CustomerName);
                        $('#lbHostDeptName').html(data[0].HostDeptName);
                        $('#lbProductionTaskID').attr("href", 'javascript:viewForm("' + data[0].ProductionTaskID + '");');
                        var deputyDeptName = data[0].DeputyDeptName;
                        var maxLen = 20;
                        if (deputyDeptName.length > maxLen) {
                            $('#lbDeputyDeptName').attr('title', deputyDeptName);
                            deputyDeptName = deputyDeptName.substring(0, maxLen - 2) + '…';
                        }
                        $('#lbDeputyDeptName').text(deputyDeptName);

                        $('#lbProjectContent').html(data[0].ProjectContent);
                        $('#lbMemo').html(data[0].Memo);
                        $('#lbProjectState').html(data[0].ProjectState);
                        $('#lbProjectSpes').html(data[0].ProjectSpes);

                        $('#lbPlanStartDate').html(data[0].PlanStartDate);
                        $('#lbPlanCompleteDate').html(data[0].PlanCompleteDate);
                        $('#lbTaskDate').html(data[0].TaskDate);
                        $('#lbFactCompleteDate').html(data[0].FactCompleteDate);
                    }
                }
            })
        }

        //项目进度状态（卷册信息）
        function getRollInfo() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/Project.aspx',
                dataType: 'json',
                data: { asyfunc: "GetRollInfo", organizationID: "<%=OrganizationID%>" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        $('#lbTotalRoll').html(data[0].TotalRoll);
                        $('#lbFinishRoll').html(data[0].FinishCount);
                    }
                }
            })
        }

<%--        //提资外资信息
        function getWbsInfo() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/Project.aspx',
                dataType: 'json',
                data: { asyfunc: "GetWBSInfo", organizationID: "<%=OrganizationID%>" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        var ht = '';
                        for (var i = 0; i < data.length; i++) {
                            ht += '<tr><th><i class="' + data[i].FileClass + '"></i>' + data[i].WBSCode + '</th><td>' + data[i].WBSName + '</td><td>' + data[i].ExecSpecialtyName + '</td><td>' + data[i].WBSOwnerName + '</td>'
                                + '</tr>';
                        }
                        $("#tbodyWbs").html(ht);
                    }
                }
            })
        }--%>

        function initProjectPlan() {
            var actionType = 0;
            var userId = '<%=KPMSUser.UserId%>';
            var organizationId = '<%=OrganizationID %>';
            var type = 'OverallProjectPlan';
            var url = '/EPMS/List/Plan/WebProjectPlan.aspx';
            var json = { ActionType: actionType, UserId: userId, OrganizationID: organizationId, ProjectDataConfig: type };
            url = buildQueryUrl(url, json);
            $('#ifProjectPlan').attr('src', url);
        }


        //里程碑信息
        function getMilestone() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/Project.aspx',
                dataType: 'json',
                data: { asyfunc: "GetMilestone", organizationID: "<%=OrganizationID%>" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        var ht = '';
                        for (var i = 0; i < data.length; i++) {
                            ht += '<tr><th><i class="fa fa-dot-circle-o ' + data[i].FileClass + '"></i>' + data[i].MilestoneTopic + '</th><td>' + data[i].PlanEndTime + '</td>'
                                + '<td>' + data[i].ActualEndTime + '</td>'
                                + '<td><span class="status-' + data[i].FileClass + '">' + data[i].Status + '</span></td>'
                                + '</tr>';
                        }
                        $("#tbodyMiles").html(ht);
                    }
                }
            })
        }

        //合同信息
        function getContract() {
            //该模块由于数据问题，暂不执行
            return;

            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>' + '/MM/BH/Project.aspx',
                dataType: 'json',
                data: { asyfunc: "GetContractInfo", organizationID: "<%=OrganizationID%>" },
                success: function (data) {
                    if (data != null && data.length > 0) {
                        $('#lbContractValue').html(data[0].ContractValue);
                        $('#lbChargeContractValue').html(data[0].ChargeContrctValue);
                    }
                }
            })
        }



        function getContractPie() {
            //该模块由于数据问题，暂不执行
            return;

            var contractPieChartCG = echarts.init(document.getElementById('project_echart2'));
            // 指定图表的配置项和数据
            $.ajax({
                method: 'POST',
                data: {
                    asyfunc: "GetContractPie", organizationID: "<%=OrganizationID%>"
                },
                url:'<%=WebAppPath%>' + '/MM/BH/Project.aspx',
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

        $(document).ready(function () {
            getProject();
            getContractPie();
            getContract();
            getRollPie();
            getRollInfo();
            getWbsInfo();

            if (typeof (getProblemInfo) == "function") {
                getProblemInfo();
            }
            
            //getMilestone();
            initProjectPlan();

            $(".table-xmgy td span").width($(".table-xmgy").width() - 100);
        })

        $(window).resize(function () {
            $(".table-xmgy td span").width($(".table-xmgy").width() - 100);
        });

        function buildQueryUrl(path, j) {
            var url = null;
            if (path.indexOf($appCtx.appPath + "/") == 0 || path.indexOf($appCtx.portalUrl) == 0) { url = path; }
            else if (path.toLowerCase().indexOf("/dicp/") > 0) {
                //链接到旧平台系统页面，对于url不需要处理
                url = path;
            }
            else {
                if (path.indexOf("/") == 0) url = $appCtx.appPath + path;
                else url = $appCtx.appPath + "/" + path;
            }
            if (j != null) {
                if (url.indexOf('?') == -1) {
                    url += "?";
                }
                else {
                    url += "&";
                }
                for (var k in j) {
                    url += k + "=" + j[k] + "&";
                }
                url = url.substr(0, url.length - 1);
            }
            return url;
        }
        //查看流程
        function viewForm(bizId) {
            if (bizId == "" || bizId == undefined) {
                alert("该项目没有项目通知单");
                return;
            }
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 0 };
            url = buildQueryUrl(url, json);
            window.open(url);
        }
    </script>
    <!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->
    <!-- CORE TEMPLATE JS - START -->

    <script src="index-ico-user_files/scripts.js"></script>
    <!-- END CORE TEMPLATE JS - END -->
</body>

</html>
