<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePageContent.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProjectPortal.HomePageContent" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>
    <style>
        html
        {
            width: 100%;
        }
    </style>
    <link href="../../../Themes/Styles/projectsite.css" rel="stylesheet" type="text/css" />
</head>
<body style="min-width: 800px; overflow-x: hidden">
    <input type="hidden" id="hiProjectPhaseCode" runat="server" />
    <form id="form1" runat="server">
    <table class="kpms-table100">
        <tr>
            <td class="kpms-rightcleft">
                <div class="kpms-wp-listleft">
                    <div class="kpms-wp-header">
                        <div>
                            <span>基本信息</span><asp:LinkButton ID="btnBaseMore" runat="server" OnClientClick="return BaseMore();"
                                CssClass="a-more" EnableTheming="false">更多</asp:LinkButton>
                        </div>
                    </div>
                    <div class="kpms-wp-main">
                        <div class="kpms-wp-content">
                            <%=GetProjectBaseInfo()%>
                        </div>
                    </div>
                    <div class="kpms-wp-footer">
                        <div>
                        </div>
                    </div>
                </div>
                <div class="kpms-wp-listleft" style="display: none;">
                    <div class="kpms-wp-header">
                        <div>
                            <span>项目经理办公桌</span><asp:LinkButton ID="btnManagerMore" runat="server" OnClientClick="return ManagerMore();"
                                CssClass="a-more" EnableTheming="false">更多</asp:LinkButton>
                        </div>
                    </div>
                    <div class="kpms-wp-main">
                        <div class="kpms-wp-content" style="min-height: 20px">
                            <div class="bg_img1">
                                <ul class="list">
                                    <%=GetSmartOperation()%>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="kpms-wp-footer">
                        <div>
                        </div>
                    </div>
                </div>
                <div class="kpms-wp-listleft" style="min-height: 100px;">
                    <div class="kpms-wp-header">
                        <div>
                            <span>项目进度状态</span>
                        </div>
                    </div>
                    <div class="kpms-wp-main">
                        <div class="kpms-wp-content">
                            <%--<asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return RollMonthPlan()"
                                            ForeColor="Blue" EnableTheming="false" Enabled="false">月度计划</asp:LinkButton>
                                           
                                        <asp:LinkButton ID="btnFilePlan" runat="server" OnClientClick="return ProjectPlan('File')"
                                            ForeColor="Blue" EnableTheming="false" Enabled="false">|资料计划</asp:LinkButton>
                                        <asp:LinkButton ID="btnRollPlan" runat="server" OnClientClick="return ProjectPlan('Roll')"
                                            ForeColor="Blue" EnableTheming="false" Enabled="false">|卷册计划</asp:LinkButton> <a href="../Projectinfo/SpecialtyOfProjectSchedule.aspx?IsPortal=true&OrganizationId=<%=OrganizationID %>"
                                                target="_blank" style="color: Blue">详细</a>--%>
                            <a href="../Plan/ProjOverallPlan.aspx?OrganizationId=<%=OrganizationID %>&HideMasterControl=divToolBtn"
                                target="_blank" style="color: Blue; display: none">项目总体计划</a>
                            <table style="background: url(../../../themes/images/webbg.png) repeat" class="kpms-table100">
                                <tr>
                                    <td style="border-right: 1px dotted #a1cbfd;">
                                    </td>
                                    <td style="border-right: 1px dotted #a1cbfd; border-top: 1px dotted #a1cbfd; border-bottom: 1px dotted #a1cbfd;
                                        padding-right: 10px;">
                                        <table>
                                            <tr>
                                                <td class="kpms-wp-detaillefttd" nowrap>
                                                    设计完成情况<br />
                                                    （完成/总数）
                                                </td>
                                                <td class="kpms-wp-detaillefttd">
                                                    完成比例
                                                </td>
                                                <td style="display: none">
                                                    <div class="kpms-process1">
                                                        <div id="divRollCompleteRate" runat="server" class="kpms-processcolor1" style="width: 35px">
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbRollComplete" runat="server"></asp:Label>/<asp:Label ID="lbRollTotal"
                                                        runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbRollCompleteRate" runat="server" Text=""></asp:Label>%
                                                </td>
                                            </tr>
                                        </table>
                                        <zhongsoft:LightPowerGridView ID="gvProgressList" runat="server" OnRowCreated="gvProgressList_RowCreated"
                                            Width="600px" Visible="false">
                                            <Columns>
                                                <asp:BoundField DataField="TotalRoll" HeaderText="合计" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="CompleteRoll" HeaderText="已完成" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="UncompleteRoll" HeaderText="未完成" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="TOTALOFWORKDAY" HeaderText="项目定额" ItemStyle-HorizontalAlign="Right" />
                                                <asp:BoundField DataField="TOTALFINISHWORKDAY" HeaderText="完成定额" ItemStyle-HorizontalAlign="Right" />
                                                <asp:TemplateField HeaderText="勘测完成(%)" ItemStyle-Width="120px" SortExpression="SurveySchedule">
                                                    <ItemTemplate>
                                                        <span class="kpms-complete"><span class="kpms-completed" style="width: <%#Convert.ToDecimal(DataBinder.Eval(Container.DataItem,"SurveySchedule"))>100?"100":Eval("SurveySchedule") %>px">
                                                            <asp:Label ID="lblSuverySch" runat="server" Text='<%#Convert.ToDecimal(DataBinder.Eval(Container.DataItem,"SurveySchedule")).ToString("F2")+"%" %>'></asp:Label>
                                                        </span></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="设计完成(%)" ItemStyle-Width="120px" SortExpression="FinishRate">
                                                    <ItemTemplate>
                                                        <span class="kpms-complete"><span class="kpms-completed" style="width: <%#Convert.ToDecimal(DataBinder.Eval(Container.DataItem,"SurveySchedule"))>100?"100":Eval("FinishRate") %>px">
                                                            <asp:Label ID="lblDesignSch" runat="server" Text='<%#Convert.ToDecimal(DataBinder.Eval(Container.DataItem,"FinishRate")).ToString("F2")+"%" %>'></asp:Label>
                                                        </span></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </zhongsoft:LightPowerGridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-right: 1px dotted #a1cbfd">
                                    </td>
                                    <td style="border-right: 1px dotted #a1cbfd; border-bottom: 1px dotted #a1cbfd; padding-right: 5px;">
                                        <table>
                                            <tr>
                                                <td nowrap>
                                                    接口完成情况<br />
                                                    （完成/总数）
                                                </td>
                                                <td class="kpms-wp-detaillefttd">
                                                    完成比例
                                                </td>
                                                <td nowrap style="display: none">
                                                    <div class="kpms-process2">
                                                        <div id="divFileCompleteRate" runat="server" class="kpms-processcolor2" style="width: 26px">
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbFileComplete" runat="server"></asp:Label>/<asp:Label ID="lbFileTotal"
                                                        runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbFileCompleteRate" runat="server" Text=""></asp:Label>%
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td style="border-right: 1px dotted #a1cbfd">
                                    </td>
                                    <td style="border-right: 1px dotted #a1cbfd; border-bottom: 1px dotted #a1cbfd; padding-right: 5px;">
                                        <table>
                                            <tr>
                                                <td>
                                                    定额完成情况
                                                </td>
                                                <td nowrap>
                                                    <div class="kpms-process2">
                                                        <div id="divWorkDayCompleteRate" runat="server" class="kpms-processcolor2" style="width: 26px">
                                                        </div>
                                                    </div>
                                                    &nbsp;
                                                    <asp:Label ID="lbWorkDayCompleteRate" runat="server" Text=""></asp:Label>%
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height: 3px;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    总数:<asp:Label ID="lbWorkDayTotal" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    已完成:<asp:Label ID="lbWorkDayComplete" runat="server"></asp:Label>
                                                    &nbsp;&nbsp;未完成:<asp:Label ID="lbWorkDayUnComplete" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td style="border-right: 1px dotted #a1cbfd">
                                    </td>
                                    <td style="border-right: 1px dotted #a1cbfd; border-bottom: 1px dotted #a1cbfd;">
                                        <asp:LinkButton ID="lkbMilepostWBS" runat="server" ForeColor="Blue" OnClientClick="return viewMilepostWBS()"
                                            EnableTheming="false">
                                    项目里程碑进度
                                        </asp:LinkButton>
                                        <%-- <table>
                                            <tr>
                                                <td align="center" style="width: 250px!important;">
                                                    项目里程碑
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="divMileStone">
                                                        <ul id="divMileStone1" style="height: 115px!important; width: 200px; overflow: hidden;">
                                                            <//%//=//GetMileStoneRoll()//%//>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>--%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="kpms-wp-footer">
                        <div>
                        </div>
                    </div>
                </div>
                <div class="kpms-wp-listleft" style="display: none">
                    <div class="kpms-wp-header">
                        <div>
                            <span>相关项目</span>
                        </div>
                    </div>
                    <div class="kpms-wp-main">
                        <div class="kpms-wp-content" style="min-height: 20px">
                            <div class="bg_img1">
                                <ul class="list">
                                    <%=GetRelativeProjectLI()%>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="kpms-wp-footer">
                        <div>
                        </div>
                    </div>
                </div>
            </td>
            <td class="kpms-rightcright">
                <table class="kpms-table100 kpms-wp-note" cellspacing="0">
                    <tr>
                        <td class="kpms-wp-noteleft">
                            项目通知
                        </td>
                        <td class="kpms-wp-notecontent">
                            <div id="media_demo" class="media_demo">
                                <table class="kpms-marqtable" border="0" cellspacing="0" cellpadding="0">
                                    <tr style="height: 27px!important">
                                        <!--------------------demo1--------------------->
                                        <td id="media_demo1" class="kpms-marq">
                                            <%=GetNotifyInfo()%>
                                        </td>
                                        <!-------------------demo2--------------------->
                                        <td id="media_demo2">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td class="kpms-wp-noteright">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                        </td>
                    </tr>
                </table>
                <table class="kpms-table100 kpms-wp-note" cellspacing="0" cellpadding="0" border="0">
                    <iframe name="projectPortal" frameborder="0" id="keyWorkflow" width="100%" height="100%"
                        scrolling="auto" allowtransparency="true" src="../Sys/KeyWorkFlowTemplate.aspx?OrganizationID=<%=OrganizationID %>">
                    </iframe>
                </table>
                <table class="kpms-table100 kpms-wp-note" cellspacing="0" cellpadding="0" border="0"
                    style="display: none;">
                    <tr>
                        <td style="width: 50%; vertical-align: top;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div class="kpms-wp-listright">
                                            <div class="kpms-wp-header">
                                                <div>
                                                    <span>项目动态</span><asp:LinkButton ID="btnDynamicMore" runat="server" OnClientClick="return DynamicMore();"
                                                        CssClass="a-more" EnableTheming="false">更多</asp:LinkButton>
                                                </div>
                                            </div>
                                            <div class="kpms-wp-main">
                                                <div class="kpms-wp-content">
                                                    <ul class="datelist">
                                                        <%=GetProjectDynamicLI("项目动态")%>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="kpms-wp-footer">
                                                <div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="kpms-wp-listright">
                                            <div class="kpms-wp-header">
                                                <div>
                                                    <span>业主动态</span><asp:LinkButton ID="btnOwnerDynamicMore" runat="server" OnClientClick="return OwnerDynamicMore();"
                                                        CssClass="a-more" EnableTheming="false">更多</asp:LinkButton>
                                                </div>
                                            </div>
                                            <div class="kpms-wp-main">
                                                <div class="kpms-wp-content">
                                                    <ul class="datelist">
                                                        <%=GetProjectDynamicLI("业主动态")%>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="kpms-wp-footer">
                                                <div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 50%; vertical-align: top;">
                            <div class="kpms-wp-listright">
                                <div class="kpms-wp-header">
                                    <div>
                                        <span>现场服务</span><asp:LinkButton ID="btnSceneDynamicMore" runat="server" OnClientClick="return SceneDynamicMore();"
                                            CssClass="a-more" EnableTheming="false">更多</asp:LinkButton>
                                    </div>
                                </div>
                                <div class="kpms-wp-main">
                                    <div class="kpms-wp-content">
                                        <table class="kpms-table100">
                                            <tr>
                                                <td width="290px">
                                                    <div class="zs-img">
                                                        <%=GetDyamicPicture() %>
                                                    </div>
                                                </td>
                                                <td valign="top">
                                                    <ul class="datelist">
                                                        <%=GetProjectDynamicLI("现场服务")%>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="kpms-wp-footer">
                                    <div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; vertical-align: top;" colspan="2">
                            <input type="hidden" runat="server" id="hiIndex" value="0" />
                            <div class="tabs-title">
                                <ul id="tabs">
                                    <li><a id='a4' href="javascript:;" onclick="ChangeUrl('/Portal/EPMS/List/ProjectPortal/MyTask.aspx?OrganizationID=<%=OrganizationID %>&IsPortal=true')">
                                        我的任务</a></li>
                                    <li><a id='a0' href="javascript:;" onclick="ChangeUrl('/Portal/EPMS/List/ProjectPortal/ProjectTask.aspx?OrganizationID=<%=OrganizationID %>&IsPortal=true')">
                                        项目任务</a></li>
                                    <li><a id='a1' href="javascript:;" onclick="ChangeUrl('/Portal/Report/EPMS/List/StatSpecialtyOutProductList.aspx?OrganizationID=<%=OrganizationID %>')">
                                        交出成品</a></li>
                                    <li><a id='a2' href="javascript:;" onclick="ChangeUrl('/Portal/Report/EPMS/List/StatSpecialtyVerifyOpinionList.aspx?OrganizationID=<%=OrganizationID %>')">
                                        校审意见</a></li>
                                    <li><a id='a3' href="javascript:;" onclick="ChangeUrl('/Portal/Report/EPMS/List/StatSpecialtyMutualFileList.aspx?OrganizationID=<%=OrganizationID %>')">
                                        提资单</a></li>
                                </ul>
                            </div>
                            <div class="tabs-content">
                                <iframe name="projectPortal" frameborder="0" id="projectPortal" width="100%" style="min-height: 550px"
                                    scrolling="auto" allowtransparency="true" >
                                    <%--src='/Portal/EPMS/List/ProjectPortal/MyTask.aspx?OrganizationID=<%=OrganizationID %>&IsPortal=true'--%>
                                </iframe>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script>
        $(function () {
            $('.kpms-ppwindow1').toggle(function () {
                $('.kpms-ppwindowcontent1').hide(100);
                $('#closerightbtn').attr('src', '../../../themes/images/window_rightbtn1.gif');
            }, function () {
                $('.kpms-ppwindowcontent1').show(100);
                $('#closerightbtn').attr('src', '../../../themes/images/window_rightbtn2.gif');
            })
            window.onscroll = function () {
                $(".kpms-ppwindow1").css("top", (document.documentElement.scrollTop + 100) + "px");
                $(".kpms-ppwindow1").css("right", -(document.documentElement.scrollLeft) + "px");
            };
        })
        var screenWidth = window.screen.width;
        $('#keyWorkflow').height($(window).height() - 150);
        //项目通知
        var w;
        if ($('body').width() < 1230) {
            w = 862;
        }
        else {
            w = $('body').width() - 397;
        }
        $("#media_demo").css("width", w);
    </script>
    <!-- 曝光台-->
    <div class="kpms-ppwindow1" style="display: none">
        <div class="kpms-ppwindowtitle1">
            <img id="closerightbtn" src="../../../themes/images/window_rightbtn1.gif" /></div>
        <div class="kpms-ppwindowcontent1">
            <div id="Exposal">
                <ul id="Exposal1" style="width: 146px; height: 200px; overflow: hidden;">
                    <%=GetExposalInfo()%>
                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function InitCustomerPlugin() {
            $('.kpms-rightnava').click(function () {
                $(this).addClass('kpms-rightnavalink').parent('li').siblings().children('a').removeClass('kpms-rightnavalink');
            })

            $("[appType=mileStoneRoll]").each(function () {
                if ($(this).text() == "已完成") {
                    $(this).css('color', 'green');
                }
                else {
                    $(this).css('color', 'red');
                }
            })



            var media_dir = 5//每步移动像素，大＝快
            var media_speed = 100//循环周期（毫秒）大＝慢
            if ((media_demo1.offsetWidth < media_demo.offsetWidth) || (media_demo1.offsetWidth == media_demo.offsetWidth)) {
            }
            else {
                media_demo2.innerHTML = media_demo1.innerHTML;
                var media_MyMar = setInterval(media_Marquee, media_speed);
            }

            function media_Marquee() {//正常移动

                if (media_dir > 0 && (media_demo2.offsetWidth - media_demo.scrollLeft) <= 0) media_demo.scrollLeft = 0
                if (media_dir < 0 && (media_demo.scrollLeft <= 0)) media_demo.scrollLeft = media_demo2.offsetWidth
                media_demo.scrollLeft += media_dir

                media_demo.onmouseover = function () { clearInterval(media_MyMar) } //暂停移动
                media_demo.onmouseout = function () { media_MyMar = setInterval(media_Marquee, media_speed) } //继续移动
            }

            $(window).resize(function () {
                var w;
                if ($('body').width() < 1230) {
                    w = 862;
                }
                else {
                    w = $('body').width() - 357;
                }
                $("#media_demo").css("width", w);
            })

            //曝光台
            var Exposal_dir = 2//每步移动像素，大＝快
            var Exposal_speed = 1000//循环周期（毫秒）大＝慢
            var top = 0;
            if (($('#Exposal1 li').length * 25 < Exposal.offsetHeight) || ($('#Exposal1 li').length * 25 == $('#Exposal').height())) {
            }
            else {
                var media_MyMar1 = setInterval(Exposal1_Marquee, Exposal_speed);
            }
            function Exposal1_Marquee() {//正常移动
                var flag = Math.abs($('#Exposal1').offset().top) + 114;
                if (flag > ($('#Exposal1 li').length * 25)) {
                    top = $('#Exposal').height();
                    $('#Exposal1').css('top', top);
                } else {
                    top -= Exposal_dir;
                    $('#Exposal1').css('top', top);
                }
                Exposal.onmouseover = function () { clearInterval(media_MyMar1) } //暂停移动
                Exposal.onmouseout = function mouseout() { media_MyMar1 = setInterval(Exposal1_Marquee, Exposal_speed) } //继续移动
            }

            //里程碑卷册
            var divMileStone_dir = 2//每步移动像素，大＝快
            var divMileStone_speed = 1000//循环周期（毫秒）大＝慢
            var top = 0;
            if (($('#divMileStone1 li').length * 25 < divMileStone.offsetHeight) || ($('#divMileStone1 li').length * 25 == $('#divMileStone').height())) {
            }
            else {
                var media_MyMar2 = setInterval(divMileStone1_Marquee, divMileStone_speed);
            }
            function divMileStone1_Marquee() {//正常移动
                var flag = Math.abs($('#divMileStone1').offset().top) + 114;
                if (flag > ($('#divMileStone1 li').length * 25)) {
                    top = $('#divMileStone').height();
                    $('#divMileStone1').css('top', top);
                } else {
                    top -= divMileStone_dir;
                    $('#divMileStone1').css('top', top);
                }
                Exposal.onmouseover = function () { clearInterval(media_MyMar2) } //暂停移动
                Exposal.onmouseout = function mouseout() { media_MyMar2 = setInterval(divMileStone1_Marquee, divMileStone_speed) } //继续移动
            }

            // Tabs
            $('#tabs li a').each(function (i) {
                var index = $("#<%=hiIndex.ClientID %>").val();
                if (i == index) {
                    tabsChange($(this));
                }
                $(this).click(function () {
                    tabsChange($(this));
                    $("#<%=hiIndex.ClientID %>").val(i);
                    return true;
                });
            })
        }


        //查看流程页面
        function ViewItem(formid, processInstanceId) {
            var urlStr = "/Portal/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + formid + "&wfInstId=" + processInstanceId;
            window.open(urlStr);
            return false;
        }
        //查看关联项目网站
        function ViewProjectPortal(OrganizationID) {
            var url = "ProjectHomePage.aspx?projectPhaseID=" + OrganizationID;
            window.open(url);

            return false;
        }

        function ViewDetail(rateType) {
            var organid = "<%=OrganizationID %>";
            var url = "../Projectinfo/SpecialtyOfProjectSchedule.aspx?IsPortal=true&OrganizationId=" + organid + "&rateType=" + rateType;
            window.open(url);

            return false;
        }

        function viewMilepostWBS() {
            var organid = "<%=OrganizationID %>";
            var url = buildQueryUrl("/EPMS/List/WBS/MilepostWBSList.aspx", { OrganizationID: organid, secid: 'C7E20113-E760-4FF1-A17A-EB5F83902987' });
            showDivDialog(url, null, 900, 600, null);
            return false;
        }

        function DetailOfSpecialtyPlan(mid, fid, sid) {
            var url = "../ProjectPlan/ProjectRelationRollList.aspx?IsPortal=true&OrganizationId=<%=OrganizationID %>&ProjectMonthPlanFormID=" + fid + "&MonthPlanProjectID=" + mid + "&SpecialtyOfProjectEntityID" + sid;
            window.open(url);

            return false;
        }


        /*首页广告效果*/
        var t = n = count = 0;
        $(function () {
            count = $("#play_list a").size();
            $('.kpms-imgtext').html($("#play_list a").eq(0).attr('text'));
            $('.kpms-imgtext').attr('href', $("#play_list a").eq(0).attr('href'));
            $("#play_list a:not(:first-child)").hide();
            $("#play_text li:first-child").addClass("zs-imgnumlihover");
            $("#play_text li").click(function () {

                var $this = $(this);
                var i = $(this).text() - 1;
                n = i;
                if (i >= count) return;
                $("#play_list a").filter(":visible").fadeOut(0, function () { $this.addClass("zs-imgnumlihover").siblings().removeClass("zs-imgnumlihover"); });
                $("#play_list a").eq(i).fadeIn();
                $('.kpms-imgtext').html($("#play_list a").eq(i).attr('text'));
                $('.kpms-imgtext').attr('href', $("#play_list a").eq(i).attr('href'));
            });
            t = setInterval("showAuto()", 4000);
            $("#play_list").hover(function () { clearInterval(t) }, function () { t = setInterval("showAuto()", 4000); });
        })

        function showAuto() {
            n = n >= (count - 1) ? 0 : n + 1;
            $("#play_text li").eq(n).trigger('click');
        }

        function ProjectPlan(type) {
            var projectId = "<%=OrganizationID %>";
            var dataConfig = "";
            if (type == "Roll") {
                dataConfig = 'ProjectRollPlan';
            }
            else {
                dataConfig = 'ProjectFilePlan';
            }
            var actiontype = 0;
            var url = "/Portal/EPMS/List/ProjectPlan/WebProjectPlan.aspx?actiontype=" + actiontype + "&projectid=" + projectId + "&projectdataconfig=" + dataConfig;
            var dom = showModal(encodeURI(url), null, "850", "650");
            if (dom != null) {
                return true;
            }
            else {
                return false;
            }
        }

        function RollMonthPlan() {
            var url = "/Portal/EPMS/List/ProjectPlan/RollMonthPlan.aspx?OrganizationID=<%=OrganizationID %>";
            showModal(encodeURI(url), null, 980, 590);
            return false;
        }
    </script>
    <script type="text/javascript">
        function BaseMore() {
            var sFeatures = "dialogHeight: 590px; dialogWidth: 980px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;Minimize=Yes;Maximize=Yes;";
            var url = "../Project/ProjectEditor.aspx?actionType=1&bizId=<%=OrganizationID %>";
            window.showModelessDialog(url, null, sFeatures);
            return false;
        }
        function ManagerMore() {
            var sFeatures = "dialogHeight: 590px; dialogWidth: 1020px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;Minimize=Yes;Maximize=Yes;";
            var url = "../ProjectInfo/ProjectWorkTemplate.aspx?projectId=<%=OrganizationID %>";
            window.showModelessDialog(url, null, sFeatures);
            return false;
        }
        function DynamicMore() {
            var sFeatures = "dialogHeight: 590px; dialogWidth: 980px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;Minimize=Yes;Maximize=Yes;";
            var url = "../ProjectInfo/ProjectDynamicList.aspx?OrganizationID=<%=OrganizationID %>";
            window.showModelessDialog(url, null, sFeatures);
            return false;
        }
        function OwnerDynamicMore() {
            var sFeatures = "dialogHeight: 590px; dialogWidth: 980px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;Minimize=Yes;Maximize=Yes;";
            var url = "../ProjectInfo/OwnerDynamicList.aspx?OrganizationID=<%=OrganizationID %>";
            window.showModelessDialog(url, null, sFeatures);
            return false;
        }
        function SceneDynamicMore() {
            var sFeatures = "dialogHeight: 590px; dialogWidth: 980px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;Minimize=Yes;Maximize=Yes;";
            var url = "../ProjectInfo/SceneDynamicList.aspx?OrganizationID=<%=OrganizationID %>";
            window.showModelessDialog(url, null, sFeatures);
            return false;
        }
        function MMCustomer(bizId) {
            var sFeatures = "dialogHeight: 590px; dialogWidth: 980px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:no; status: no;Minimize=Yes;Maximize=Yes;";
            var url = "/Portal/MM/List/CRM/CustomerEditor.aspx?actionType=1&bizId=" + bizId;
            showDivDialog(url, "", 980, 590, null);
            return false;
        }
    </script>
    <script type="text/javascript">
        function ChangeUrl(Url) {
            var url = encodeURI(Url);
            $("#projectPortal").attr("src", url);
        }

    </script>
    <script type="text/javascript">
/* <![CDATA[ */
function simplescroll(c, config) {
this.config = config ? config : {start_delay:30, speed: 150, delay:30, scrollItemCount:1};
this.container = document.getElementById(c);
this.pause = false;
var _this = this;

this.init = function() {
   _this.scrollTimeId = null;
   setTimeout(_this.start,_this.config.start_delay);
}

this.start = function() {
   var d = _this.container;
   var line_height = d.getElementsByTagName('li')[0].offsetHeight;
   if(d.scrollHeight-d.offsetHeight>=line_height) _this.scrollTimeId = setInterval(_this.scroll,_this.config.speed)
};

this.scroll = function() {
   if(_this.pause)return;
   var d = _this.container;d.scrollTop+=2;
   var line_height = d.getElementsByTagName('li')[0].offsetHeight;
   if(d.scrollTop%(line_height*_this.config.scrollItemCount)<=1){
    d.scrollTop=0;
    for(var i=0;i<_this.config.scrollItemCount;i++){d.appendChild(d.getElementsByTagName('li')[0]);}
    clearInterval(_this.scrollTimeId);
    setTimeout(_this.start,_this.config.delay);
   }
}

this.container.onmouseover=function(){_this.pause = true;}
this.container.onmouseout=function(){_this.pause = false;}
}
var div = new simplescroll('Exposal1', {start_delay:30, speed:150, delay:30, scrollItemCount:2});

div.init();
/* ]]>*/
    </script>
    <script type="text/javascript">
/* <![CDATA[ */
function simplescroll(c, config) {
this.config = config ? config : {start_delay:30, speed: 400, delay:40, scrollItemCount:1};
this.container = document.getElementById(c);
this.pause = false;
var _this = this;

this.init = function() {
   _this.scrollTimeId = null;
   setTimeout(_this.start,_this.config.start_delay);
}

this.start = function() {
   var d = _this.container;
   var line_height = d.getElementsByTagName('li')[0].offsetHeight;
   if(d.scrollHeight-d.offsetHeight>=line_height) _this.scrollTimeId = setInterval(_this.scroll,_this.config.speed)
};

this.scroll = function() {
   if(_this.pause)return;
   var d = _this.container;d.scrollTop+=2;
   var line_height = d.getElementsByTagName('li')[0].offsetHeight;
   if(d.scrollTop%(line_height*_this.config.scrollItemCount)<=1){
    d.scrollTop=0;
    for(var i=0;i<_this.config.scrollItemCount;i++){d.appendChild(d.getElementsByTagName('li')[0]);}
    clearInterval(_this.scrollTimeId);
    setTimeout(_this.start,_this.config.delay);
   }
}

this.container.onmouseover=function(){_this.pause = true;}
this.container.onmouseout=function(){_this.pause = false;}
}

var div = new simplescroll('divMileStone1', {start_delay:30, speed:400, delay:40, scrollItemCount:2});
div.init();
/* ]]>*/
    </script>
    </form>
</body>
</html>
