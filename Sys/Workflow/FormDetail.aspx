<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDetail.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormDetail" %>

<%@ Register Src="Controls/FormToolBar.ascx" TagName="FormToolBar" TagPrefix="uc1" %>
<%@ Register Src="Controls/FormOpinion.ascx" TagName="FormOpinion" TagPrefix="uc2" %>
<%@ Register Src="Controls/FormAttachmentView.ascx" TagName="FormAttachmentView"
    TagPrefix="uc3" %>
<%@ Register Src="Controls/FormProcessView.ascx" TagName="FormProcessView" TagPrefix="uc4" %>
<%@ Register Src="Controls/FormWorkflowMapping.ascx" TagName="FormWorkflowMapping"
    TagPrefix="uc5" %>
<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI"
    TagPrefix="zhongsoft" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <title>表单详细信息</title>
    <style type="text/css">
        #toTop {
            width: 85px;
            z-index: 10;
            background: #121212;
            background-image: url(../../Themes/Images/backtop.png);
            text-align: center;
            padding: 5px;
            position: fixed;
            bottom: 0px;
            right: 0px;
            cursor: pointer;
            display: none;
            color: #fff;
            text-transform: lowercase;
            font-size: 14px;
            font-weight: bold;
            height: 20px;
        }

        ul {
            padding: 0px;
            margin: 0px;
        }

        li {
            padding: 0px;
            margin: 0px;
            list-style-type: none;
        }

        .tz-table {
            border: #cbccce 1px solid !important;
        }

            .tz-table td {
                padding: 3px;
            }

        .td-l {
            height: 28px !important;
            border: #cbccce 1px solid !important;
            background: #f3f4f4 /*fbfbfb*/;
            line-height: 18px;
        }

        .td-r {
            height: 28px !important;
            border: #cbccce 1px solid !important;
            background: #fefefe;
        }

        .td-m {
            height: 28px !important;
            border: #cbccce 1px solid !important;
            background: #fefefe;
        }

        .ui-autocomplete {
            z-index: 11111 !important;
        }

        #aMore {
            position: relative;
            left: 20px;
        }

        #divMore {
            position: relative !important;
            left: 50px !important;
            top: 10px !important;
        }

        .showTime {
            display: inline-block;
            width: 120px;
            border: none !important;
        }

        .showUser {
            display: inline-block;
            width: 80px;
            border: none !important;
        }

        .showUserImg {
            display: inline-block;
            width: 120px;
            vertical-align: middle;
            border: none !important;
        }

        .showOpinion {
            display: inline-block;
            width: 640px;
            border: none !important;
        }
    </style>
    <link rel='stylesheet' type='text/css' href='../../Themes/Styles/zTreeStyle.css' />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/form.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/formsender.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/common2.css" />
    <script type="text/javascript" src="../../UI/script/jquery-1.7.2.min.js"></script>
</head>
<body id="formBody" style="background: url(../../themes/images/headerbg1.jpg)  right top no-repeat;">
    <form id="form1" runat="server">
        <script type="text/javascript" src="<%=WebAppPath%>/UI/script/portal.cookie.js"></script>
        <script type="text/javascript" src="<%=WebAppPath%>/UI/script/form.fullscr.js"></script>
        <script type="text/javascript" src="<%=WebAppPath%>/UI/script/xpdl.json.js"></script>
        <script type="text/javascript" src="<%=WebAppPath%>/UI/script/form.detail.js"></script>
        <script type="text/javascript" src="<%=WebAppPath%>/UI/script/modernizr.custom.js"></script>
        <asp:ScriptManager ID="FormScriptManager" runat="server">
        </asp:ScriptManager>
        <input type="password" style="display: none" runat="server" />
        <asp:UpdatePanel runat="server" ID="FormUpdatePanel" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="form-container" id="formContainer">
                    <!-- Form Header -->
                    <div class="form-header">
                        <div class="form-title" id="divTitle">
                            <%=FormName %>：<span><%=CurrentActivityName%></span>
                        </div>
                        <div class="form-function">
                            <div style="width: 1020px; margin: 0 auto;" class="gongneng">
                                <div class="form-tabs-title">
                                    <ul id="tabs">
                                        <li><a href="#function" class="form-tabs-tlink">功能区</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-tabs" style="width: 100%; background: url(../../themes/images/toplj.jpg) bottom repeat-x; border-bottom: #B2B9BF 1px solid;">
                                <div style="width: 1040px; margin: 0 auto;" class="toolbar">
                                    <div class="form-tabs-content">
                                        <div id="function">
                                            <div class="function">
                                                <uc1:FormToolBar ID="FormToolBar" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Form Header End-->
                    <div style="background: #EFF3F6 url(../../themes/custom/images/lcbg.jpg) top repeat-x;">
                        <div class="form-main" style="padding-top: 4px;" id="formbody">
                            <!-- <div class="form-link">
                            <a hrefaddress="partBaseInfo" opendetailid="formContent">1、基本信息 &nbsp; </a><a hrefaddress="partOpinion"
                                opendetailid="historyOpinion">2、办理意见 &nbsp;</a><a hrefaddress="partAttachment" opendetailid="formAttachment">3、文档
                                    &nbsp; </a><a hrefaddress="partTracking" opendetailid="formTrack">4、工作跟踪 &nbsp;</a>
                            <a href="javascript:void(0)" onclick="javascript:showWfVisual();">5、可视化流程</a>
                        </div>-->
                            <!-- Form Content-->
                            <div class="form-content" style="margin-top: 0px;">
                                <div class="form-content-t" onclick="openDetail('formContent')" id="partBaseInfo"
                                    style="margin-top: -71px; padding-top: 71px; background-position: -0px 71px; cursor: pointer;">
                                    <span>
                                        <img src="../../themes/images/ico_dangqiangongzuo.gif" />基本信息</span> <a class="rimg"
                                            href="#">
                                            <img src="../../themes/images/lright.png" /></a>
                                </div>
                                <div class="form-content-b" id="formContent" width="100%">
                                    <asp:PlaceHolder ID="FormPlace" runat="server"></asp:PlaceHolder>
                                </div>
                                <div class="form-tabcontent" id="formRelate" width="100%" style="margin-top: -20px;">
                                    <uc5:FormWorkflowMapping ID="formWorkflowMapping" runat="server" />
                                </div>
                                <!-- Form Content End-->
                                <!-- Doc -->
                                <% if (ActionType != Zhongsoft.Portal.ACL.AccessLevel.Create
                                                 && WFFormControl.UseDocumentContainer)
                                    { %>
                                <script type="text/javascript" src="../../UI/script/form.dsoframer.js"></script>
                                <%} %>
                                <!-- Doc End -->
                            </div>
                            <!--Attachment -->
                            <div class="form-content" id="partAttachment">
                                <div class="form-content-t" style="align: right; cursor: pointer;" onclick="openDetail('formAttachment')">
                                    <span style="float: left;">
                                        <img src="../../themes/images/ico_fujian.gif" alt="" />附件</span>
                                    <div id="btnDownloadAll" style="float: left; margin-left: 10px;">
                                        <img src="../../themes/images/down.png" img-lock="1" alt="" />全部下载
                                    </div>
                                    <a class="aStyle" href="javascript:attachmentBatchDown();" style="display: none"
                                        style="font-weight: normal;">[批量下载]</a><a class="rimg">
                                            <img src="../../themes/images/lright.png" /></a> <span runat="server" id="delAllFile"
                                                visible="false">
                                                <asp:CheckBox ID="cbChackAllFile" Text="全选" runat="server" AutoPostBack="True" OnCheckedChanged="cbChackAllFile_CheckedChanged" Visible="false" />
                                                <asp:LinkButton runat="server" ID="lkbBatchDel" EnableTheming="false" OnClick="lkbBatchDel_Click"
                                                    ForeColor="Blue" OnClientClick="return window.confirm('您确定删除吗？');" Font-Bold="false" Visible="false"
                                                    Font-Underline="true">[批量删除]
                                                </asp:LinkButton>
                                            </span>
                                </div>
                                <div class="form-content-b" id="formAttachment" width="100%">
                                    <uc3:FormAttachmentView ID="FormAttachmentView" runat="server" />
                                </div>
                            </div>
                            <!--Attachement End-->
                            <!--Form Opinion -->
                            <div class="form-content" id="partOpinion">
                                <div class="form-content-t" style="align: right; cursor: pointer;" onclick="openDetail('historyOpinion')">
                                    <span>
                                        <img src="../../themes/images/ico_banliyijian.gif" />办理过程</span> <a class="rimg">
                                            <img src="../../themes/images/lright.png" /></a>
                                </div>
                                <div class="form-content-b" id="historyOpinion" width="100%">
                                    <table class="tz-table">
                                        <tr>
                                            <td style="width: 30%">
                                                <asp:RadioButtonList runat="server" ID="rbPriority" RepeatDirection="Horizontal"
                                                    Visible="false" OnSelectedIndexChanged="rbPriority_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:RadioButtonList>
                                            </td>
                                            <td style="width: 7%">
                                                <asp:Label runat="server" ID="lblTitle" Text="常用意见:" Visible="False" />
                                            </td>
                                            <td>
                                                <asp:RadioButtonList runat="server" ID="rblCommonOpinion" RepeatDirection="Horizontal" Visible="False">
                                                    <asp:ListItem Value="同意">同意</asp:ListItem>
                                                    <asp:ListItem Value="不同意">不同意</asp:ListItem>
                                                    <asp:ListItem Value="已阅">已阅</asp:ListItem>
                                                    <asp:ListItem Value="批准">批准</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>



                                    <%--<div class="form-ys-main">
                                    <div class="form-ys-maint">
                                        <span>填写意见</span></div>
                                    <div class="form-ys-mainb" id="formOpinion" width="100%">
                                        
                                    </div>
                                </div>--%>
                                    <!-- 用于设置填写意见时候需要选择的人员信息等-->
                                    <div id="userSelect"></div>
                                    <%=FormOpinion.SignRender%>
                                    <uc2:FormOpinion ID="FormOpinion" runat="server" OpinionSign="ImageSign" />

                                </div>
                            </div>
                            <!--Form Opinion End-->
                            <!--Track -->
                            <div class="form-content" id="partTracking">
                                <div class="form-content-t" onclick="getWorkTracking();openDetail('formTrack')">
                                    <span>
                                        <img src="../../themes/images/ico_gongzuogenzong.gif" />工作跟踪</span> <a class="rimg">
                                            <img src="../../themes/images/lright.png" /></a>
                                </div>
                                <div class="form-content-b" id="formTrack" style="display: none">
                                    <table width="100%">
                                        <tr>
                                            <td id="AsyncTracking"></td>
                                        </tr>
                                        <tr id="trVisualForm" runat="server" visible="false">
                                            <td align="left">
                                                <a href="javascript:void(0)" onclick="javascript:showWfVisual();">[可视化流程]</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!--Track End-->
                            <!--Workflow -->
                            <div class="form-content" id="Div1" style="display: none;">
                                <div class="form-content-t" style="align: right; cursor: pointer;" onclick="showFormWorkflow();">
                                    <span>
                                        <img src="../../themes/images/flow_l.png" />流程图</span><a class="rimg">
                                            <img src="../../themes/images/lright.png" /></a>
                                </div>
                                <div class="form-content-b" id="formWorkflow" width="100%" style="display: none">
                                    <iframe id="frameWorkflow" width="100%" height="500" frameborder="0"></iframe>
                                </div>
                            </div>
                            <!--Workflow End-->
                        </div>
                    </div>
                </div>
                <div runat="server" id="xpdlWrapper" visible="false">
                    <div class="xpdl-sendwindow" id="xpdlSender">
                        <div class="xpdl-sendtitle">
                            工作处理
                        </div>
                        <table class="xpdl-sendcontent">
                            <tr>
                                <td>选择后续工作步骤&nbsp;&nbsp;&nbsp;<a class="subtoolbarlink" id="viewformTrack" onclick="javascript:openWorkTracking();">
                                    <img src="../../Themes/Images/btn_chakan.gif" /><span>流程跟踪</span></a>
                                </td>
                                <td style="height: 30px">
                                    <a class="subtoolbarlink" id="btnSelAllParts" style="display: none" onclick="selAllParts()">
                                        <img src="../../Themes/Images/selectall.gif" /><span>全选</span></a> <a class="subtoolbarlink"
                                            id="btnMoreParts" title="在全院人员中搜索" style="display: none">
                                            <img src="../../Themes/Images/selectmore.gif" /><span>更多人员</span></a>&nbsp;&nbsp;
                                <span title="在下方人员列表中搜索">搜索
                                    <input id="txtActPartFilter" type="text" value="请输入关键字" style="color: #ccc; width: 100px; height: 18px; border: #bcc7d8 1px solid;" /></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="actWidget" style="height: 210px" class="ui-widget-content xpdl-widget-acts">
                                    </div>
                                </td>
                                <td>
                                    <div id="partWidget" style="height: 210px" class="ui-widget-content xpdl-widget-parts">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="xpdl-actseltitle" colspan="2">选定步骤&nbsp;&nbsp;&nbsp;&nbsp;<%--<a href="javascript:void(0)" onclick="javascript:ShowVisualForm();">[可视化流程]</a>--%><span
                                    id="spNoPart" style="color: Red; display: none">该步骤的处理角色没有配置人员，请确认处理人员，并联系管理员配置！</span>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="selectedWidget" class="ui-widget-content xpdl-widget-sels">
                                    </div>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td class="xpdl-actseltitle" colspan="2" valign="middle">
                                    <div style="float: left; line-height: 20px">
                                        处理意见&nbsp;&nbsp;
                                    </div>
                                    <div style="float: left;">
                                        <asp:RadioButtonList runat="server" ID="rbFromPriority" RepeatDirection="Horizontal"
                                            Visible="false">
                                        </asp:RadioButtonList>
                                    </div>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td colspan="2">
                                    <asp:TextBox runat="server" ID="tbOpinion" TextMode="MultiLine" EnableTheming="false"
                                        Style="height: 60px" CssClass="kpms-textarea"></asp:TextBox>
                                </td>
                            </tr>
                            <tr onclick="javascript:$('#formSelectp').hide();">
                                <td colspan="2" class="xpdl-sendbtntd" style="padding-right: 2px!important">
                                    <asp:Button ID="btnSend" runat="server" Width="100px" OnClientClick="return checkXpdlSel()"
                                        Text="确定" OnClick="btnSend_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Width="100px" Text="取消" OnClick="btnCancel_Click" />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form-alphaBox" id="backActivity" style="z-index: 0">
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="form-loading" style="display: none">
            <span><strong>数据处理中</strong></span>
            <br />
            <span style="text-align: center;">
                <img src="/portal/themes/Images/loading.gif" alt="数据处理中" /></span>
            <br />
            <span>技术支持：北京众城比泰科技有限责任公司</span>
            <br />
        </div>
        <div id="formMessage" title="系统提示" style="display: none" class="ui-state-highlight ui-corner-all">
        </div>
        <div id="formDeliver" title="工作转交" style="display: none; z-index: 9999 !important">
            <table width="100%">
                <tr>
                    <td>接收人
                    </td>
                    <td>
                        <input readonly="readonly" id="tbDeliverUser" style="width: 120px; display: none" class="kpms-textbox"
                            type="text" name="tbDeliverUser" />
                        <img src="../../Themes/Images/btn_select.gif" id="btnSelDeliverUser" style="display: none" />
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsDeliverUser" IsMutiple="false" SelectPageMode="Dialog"
                            ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                            ShowAttrs="name,UserCode" ResultForControls="{'hiDeliverUser':'id','hiOrgID':'OrgUnitId','hiOrgName':'OrgUnitName'}"
                            PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" />
                        <input type="hidden" runat="server" id="hiDeliverUser" name="hiDeliverUser" />
                        <input type="hidden" runat="server" id="hiOrgID" />
                        <input type="hidden" runat="server" id="hiOrgName" />
                    </td>
                </tr>
                <tr>
                    <td>备注
                    </td>
                    <td>
                        <input id="tbDeliverRemark" runat="server" class="kpms-textbox" type="text" name="tbDeliverRemark" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="btnDeliver" Visible="false" runat="server" Text="转交" OnClick="btnDeliver_Click" />
        <asp:Button ID="btnRelationCallBack" Visible="false" runat="server" Text="关联" OnClick="btnRelationCallBack_OnClick" />
        <input type="hidden" id="hiCanSingDept" runat="server" value="01017033" />
        <script language="javascript">
            //设置流程可以自动发送，不弹出发送框
            function setAutoSend() {
                $('#hiAutoSend').val('1');
            }

            $(function () {

            });

            //点击链接，定位到具体的模块位置
            function initFormToolbarHref() {
                $(".kpms-ppwindowcontent a").each(function () {
                    $(this).click(function () {
                        $(this).attr("href", "#" + $(this).attr("hrefAddress"));
                        var openDetailID = $(this).attr("openDetailID");
                        if ($("#" + openDetailID).css("display") == "none") {
                            if (openDetailID == "formTrack") {
                                getWorkTracking();
                            }
                            openDetail(openDetailID);
                        }
                    })
                });

                if (parseBool($showFormTracking)) {
                    getWorkTracking();
                    openDetail("formTrack");
                }
            }

            $(function () {
                var scrollDiv = document.createElement('div');
                $(scrollDiv).attr('id', 'toTop').html('').appendTo('body');
                $(window).scroll(function () {
                    if ($(this).scrollTop() != 0) {
                        $('#toTop').fadeIn();
                    } else {
                        $('#toTop').fadeOut();
                    }
                });


                $('#toTop').click(function () {
                    $('body,html').animate({ scrollTop: 0 }, 300);
                })

                $('#<%=rblCommonOpinion.ClientID %>').each(function () {
                    $(this).unbind();
                });
                $("#<%=rblCommonOpinion.ClientID %> input[type=radio]").each(function () {
                    $(this).bind('click', function () {
                        var commonOpinion = $("#<%=rblCommonOpinion.ClientID %> input[type=radio]:checked").val();
                        $("#FormOpinion_tbCurrOpinion").val(commonOpinion);
                    });
                });
            });
            function uploadFile() {
                showUploadForm($prcInstId,  "<%=AttachmentSourceFlag%>");
                return true;
            }
            function ExpTBSend() {
                if (!sendForm()) return false;
            <%
            PostBackOptions optionSend = new PostBackOptions(this.FormToolBar.SendButton);
            optionSend.PerformValidation = true;
             %>
            <%=this.ClientScript.GetPostBackEventReference(optionSend) %>;
            }
            function ExpTBSave() {
                if (!saveForm()) return false;
              <%
            PostBackOptions optionSave = new PostBackOptions(this.FormToolBar.SaveButton);
            optionSave.PerformValidation = true;
             %>
            <%=ClientScript.GetPostBackEventReference(optionSave)%>;
            }
            function ExpTBBack() {
                if (!backForm()) return false;
              <%
            PostBackOptions optionBack = new PostBackOptions(this.FormToolBar.BackButton);
            optionSave.PerformValidation = true;
             %>
            <%=ClientScript.GetPostBackEventReference(optionBack)%>;
            }
            function btnDeliverClick() {
              <%=ClientScript.GetPostBackEventReference(btnDeliver,null)%>;
            }

            function relationCallBack() {
            <%=ClientScript.GetPostBackEventReference(btnRelationCallBack,null)%>;
            }

            //表单上下文，后续调整为$formCtx.prcInstId、$formCtx.prcInstId.actName等 tianhl 20141128
            var $formCtx =<%=FormContext%>;

            var $prcInstId = "<%=ProcessInstanceId %>";
            var $actInstId = "<%=ActivityInstanceId%>";
            var $actName = "<%=CurrentActivityName %>";
            var $actCurrId = "<%=CurrentActivityId %>";
            var $formId = "<%=FormId %>";
            var $formObjId = "<%=FormObjectId %>";
            var $packageName = "<%=PackageName %>";
            var $xpdlId = "<%= XPDLId%>";
            var $action = "<%=((int)ActionType).ToString() %>";
            var $sendBtnId = "<%=btnSend.ClientID %>";
            var $currUserName = "<%=KPMSUser.UserName %>";
            var $currUserId = "<%=KPMSUser.UserId %>";
            var $currBizId = "<%=BusinessObjectId %>";
            var $formUri = "<%= FormURI%>";
            var $showFormTracking ="<%=UserConfig.ShowFormTracking %>"
            var $StandardizedForm ="<%=WebAppPath %>/WHHelper/SOA/";
            var $extendId = "<%= ExtendId%>";
            $opiAlert = parseBool("<%=IsAllowNoBackOpinionForm%>");
        </script>
        <input type="hidden" id="hiXpdlXml" name="hiXpdlXml" />
        <input type="hidden" id="hiPartsXml" name="hiPartsXml" />
        <!-- 流程是否自动发送（不弹出发送框）-->
        <input type="hidden" id="hiAutoSend" name="hiAutoSend" value="0" />
        <%--发起步骤同意按钮文字显示为提交--%>
        <input type="hidden" id="hiSumbitText" runat="server" value="提交" />

        <!-- 非正常同意结束流程用到 结束id-->
        <input type="hidden" id="hiRefuseId" name="hiRefuseId" runat="server" value="act_55203" />
        <!-- 非正常同意结束流程用到 结束意见-->
        <input type="hidden" id="hiRefuseText" name="hiRefuseText" runat="server" value="取消培训" />
        <div class="form-selectpeople" runat="server" id="formSelectp" style="display: none">
            <div class="selectp-header">
                <span style="float: left;">选择人员</span><span id='closePartMore' class="closethis ui-icon ui-icon-close"></span>
            </div>
            <table class="selectp-content">
                <tr>
                    <td id="part" style="width: 196px;">
                        <ul id="selectp-part" class="ztree selectp-part">
                        </ul>
                    </td>
                    <td id="close-part" class="close-part">
                        <span>
                            <img src="../../Themes/Images/close-part.gif" /></span>
                    </td>
                    <td class="selectp-list">
                        <input class="selectp-key" id="txtPartFilter" type="text" value="请输入关键字" />
                        <div class="person-list" style="height: 223px" id="morePartsList">
                        </div>
                        <div class="person-list-page">
                            <%-- <img src="../../Themes/Images/btn_prei.gif" /><img src="../../Themes/Images/btn_next.gif" />--%>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <%--<div class="kpms-ppwindow">
   <div class="kpms-ppwindowtitle">快捷菜单</div>
   <div class="kpms-ppwindowcontent">

        <ul>
          <li> <a  hrefaddress="partBaseInfo" opendetailid="formContent"><img src="../../Themes/Images/zd.gif" / >基本信息</a></li>
          <li><a hrefaddress="partOpinion" opendetailid="historyOpinion"><img src="../../Themes/Images/zd.gif" />办理意见</a></li>
          <li><a hrefaddress="partAttachment" opendetailid="formAttachment"><img src="../../Themes/Images/zd.gif" />文档</a></li>
          <li><a hrefaddress="partTracking" opendetailid="formTrack"><img src="../../Themes/Images/zd.gif" />工作跟踪</a></li>
          <li style=" border-bottom:none;"> <a href="javascript:void(0)" onclick="javascript:showWfVisual();"><img src="../../Themes/Images/zd.gif" />可视化流程</a></li>
        </ul>

     </div>
   </div>--%>
</body>
</html>
<script type="text/javascript">
    var screenWidth = window.screen.width;
    if (screenWidth < 1100) {
        $('.gongneng').css('width', '978px');
        $('.toolbar').css('width', '998px');
    }
    else {
        $('.gongneng').css('width', '1020px');
        $('.toolbar').css('width', '1040px');
    }

    //批量下载附件
    function attachmentBatchDown() {
        var url = "sys/FileDocument/BatchFileDownload.aspx?fileSourceId=" + $prcInstId;
        showDivDialog(url, null, 700, 530);
    }


    function initFormOpinion() {
        $("#<%=this.tbOpinion.ClientID %>").autocomplete({
            source: function (request, response) {
                $.getJSON($appCtx.appPath + "/Sys/Handler/JsonSelectorHandler.ashx", {
                    term: request.term + '|<%=KPMSUser.Id %>,opinion,' + Math.random()
                }, response);
            },
            minLength: 0
        }).dblclick(function () {
            $(this).autocomplete("search");
        });

        $("#btnDownloadAll").on('click', function (e) {
            downLoadFilesZip();
            e.stopPropagation();
        });
    }


</script>
