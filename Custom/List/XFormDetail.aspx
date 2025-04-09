<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XFormDetail.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.XFormDetail" %>

<%@ Register Src="~/Sys/Workflow/Controls/FormToolBar.ascx" TagName="FormToolBar"
    TagPrefix="uc1" %>
<%@ Register Src="~/Sys/Workflow/Controls/FormOpinion.ascx" TagName="FormOpinion"
    TagPrefix="uc2" %>
<%@ Register Src="~/Sys/Workflow/Controls/FormAttachmentView.ascx" TagName="FormAttachmentView"
    TagPrefix="uc3" %>
<%@ Register Src="~/Sys/Workflow/Controls/FormProcessView.ascx" TagName="FormProcessView"
    TagPrefix="uc4" %>
<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI"
    TagPrefix="zhongsoft" %>
<%@ Import Namespace="Zhongsoft.Portal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <title>表单详细信息</title>
    <style type="text/css">
        html
        {
            overflow: auto;
            overflow-y: scroll;
        }
        
        #toTop
        {
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
        ul
        {
            padding: 0px;
            margin: 0px;
        }
        li
        {
            padding: 0px;
            margin: 0px;
            list-style-type: none;
        }
    </style>
    <link rel='stylesheet' type='text/css' href='../../Themes/Styles/zTreeStyle.css' />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/form.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/formsender.css" />
</head>
<body id="formBody" style="background: url(../../themes/images/headerbg.jpg)  right top no-repeat;">
    <form id="form1" runat="server">
    <script type="text/javascript" src="<%=WebAppPath%>/UI/script/portal.cookie.js"></script>
    <script type="text/javascript" src="<%=WebAppPath%>/UI/script/form.fullscr.js"></script>
    <script type="text/javascript" src="<%=WebAppPath%>/UI/script/xpdl.json.js"></script>
    <script type="text/javascript" src="<%=WebAppPath%>/UI/script/form.detail.js"></script>
    <script type="text/javascript" src="<%=WebAppPath%>/UI/script/jquery.bgiframe.js"></script>
    <asp:ScriptManager ID="FormScriptManager" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="FormUpdatePanel" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="form-container" id="formContainer">
                <!-- Form Header -->
                <div class="form-header">
                    <div class="form-title" id="divTitle">
                        <span>
                            <%=FormName %></span>
                    </div>
                    <div class="form-function">
                        <div class="form-tabs-title">
                            <ul id="tabs">
                                <li><a href="#function" class="form-tabs-tlink">功能区</a></li>
                            </ul>
                        </div>
                        <div class="form-tabs-content">
                            <div id="function">
                                <div class="function">
                                    <uc1:FormToolBar ID="FormToolBar" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Form Header End-->
                <div style="background: #EFF3F6 url(../../themes/images/lcbg.jpg) top repeat-x;">
                    <div class="form-main" id="formbody">
                        <div class="form-link">
                            <a hrefaddress="partBaseInfo" opendetailid="formContent">1、基本信息 &nbsp; </a><a hrefaddress="partOpinion"
                                opendetailid="historyOpinion">2、办理意见 &nbsp;</a><a hrefaddress="partAttachment" opendetailid="formAttachment">3、文档
                                    &nbsp; </a><a hrefaddress="partTracking" opendetailid="formTrack">4、工作跟踪 &nbsp;</a>
                            <a href="javascript:void(0)" onclick="javascript:showWfVisual();">5、可视化流程</a>
                        </div>
                        <!-- Form Content-->
                        <div class="form-content">
                            <div class="form-content-t" onclick="openDetail('formContent')" id="partBaseInfo">
                                <span>
                                    <img src="../../themes/images/ico_dangqiangongzuo.gif" />当前工作:<%=CurrentActivityName%></span>
                                <a class="rimg" href="#">
                                    <img src="../../themes/images/lright.jpg" /></a>
                            </div>
                            <div class="form-content-b" id="formContent" width="100%">
                                <asp:PlaceHolder ID="FormPlace" runat="server"></asp:PlaceHolder>
                            </div>
                            <!-- Form Content End-->
                            <!-- Doc -->
                            <% if (ActionType != Zhongsoft.Portal.ACL.AccessLevel.Create
                                       && WFFormControl.UseDocumentContainer)
                               { %>
                            <script type="text/javascript" src="../../UI/script/form.dsoframer.js"></script>
                            <%} %>
                            <!-- Doc End -->
                            <!--Form Opinion -->
                        </div>
                        <div class="form-content" id="partOpinion">
                            <div class="form-content-t" style="align: right" onclick="openDetail('historyOpinion')">
                                <span>
                                    <img src="../../themes/images/ico_banliyijian.gif" />办理意见</span> <a class="rimg">
                                        <img src="../../themes/images/lright.jpg" /></a>
                            </div>
                            <div class="form-content-b" id="historyOpinion" width="100%">
                                <div class="form-ys-main">
                                    <div class="form-ys-maint" onclick="openDetail('formOpinion')">
                                        <span>填写意见</span></div>
                                    <div class="form-ys-mainb" id="formOpinion" width="100%">
                                        <uc2:FormOpinion ID="FormOpinion" runat="server" OpinionSign="ImageSign" />
                                    </div>
                                </div>
                                <%=FormOpinion.SignRender%>
                            </div>
                        </div>
                        <!--Form Opinion End-->
                        <!--Attachment -->
                        <div class="form-content" id="partAttachment">
                            <div class="form-content-t" style="align: right" onclick="openDetail('formAttachment')">
                                <span>
                                    <img src="../../themes/images/ico_fujian.gif" />文档</span> <a class="rimg">
                                        <img src="../../themes/images/lright.jpg" /></a>
                            </div>
                            <div class="form-content-b" id="formAttachment" width="100%">
                                <uc3:FormAttachmentView ID="FormAttachmentView" runat="server" />
                            </div>
                        </div>
                        <!--Attachement End-->
                        <!--Track -->
                        <div class="form-content" id="partTracking">
                            <div class="form-content-t" onclick="getWorkTracking();openDetail('formTrack')">
                                <span>
                                    <img src="../../themes/images/ico_gongzuogenzong.gif" />工作跟踪</span> <a class="rimg">
                                        <img src="../../themes/images/lright.jpg" /></a>
                            </div>
                            <div class="form-content-b" id="formTrack" style="display: none">
                                <table width="100%">
                                    <tr>
                                        <td id="AsyncTracking">
                                        </td>
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
                        <div class="form-content" id="Div1">
                            <div class="form-content-t" style="align: right" onclick="showFormWorkflow();">
                                <span>
                                    <img src="../../themes/images/flow_l.png" />流程图</span><a class="rimg">
                                        <img src="../../themes/images/lright.jpg" /></a>
                            </div>
                            <div class="form-content-b" id="formWorkflow" width="100%" style="display: none">
                                <iframe id="frameWorkflow" width="100%" height="500" frameborder="0"></iframe>
                            </div>
                        </div>
                        <!--Workflow End-->
                    </div>
                </div>
            </div>
            <div runat="server" id="xpdlWrapper" enableviewstate="false" visible="false">
                <div class="xpdl-sendwindow" id="xpdlSender">
                    <div class="xpdl-sendtitle">
                        工作处理</div>
                    <table class="xpdl-sendcontent">
                        <tr>
                            <td>
                                选择后续工作步骤
                            </td>
                            <td style="height: 30px">
                                <a class="subtoolbarlink" href="#" id="btnSelAllParts" style="display: none" onclick="selAllParts()">
                                    <img src="../../Themes/Images/selectall.gif" /><span>全选</span></a> <a class="subtoolbarlink"
                                        id="btnMoreParts" style="display: none" href="#">
                                        <img src="../../Themes/Images/selectmore.gif" /><span>更多人员</span></a>
                                <%--   <a class="xpdl-selectparta"
                                        id="btnMoreParts" onclick="getMoreParts();" style="display: none" href="#">
                                        <img src="../../Themes/Images/selectmore.gif" />更多人员</a> --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="actWidget" class="ui-widget-content xpdl-widget-acts">
                                </div>
                            </td>
                            <td>
                                <div id="partWidget" class="ui-widget-content xpdl-widget-parts">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="xpdl-actseltitle" colspan="2">
                                选定步骤&nbsp;&nbsp;&nbsp;&nbsp;<%--<a href="javascript:void(0)" onclick="javascript:ShowVisualForm();">[可视化流程]</a>--%>
                                <span id="spNoPart" style="color: Red; display: none">该步骤的处理角色没有配置人员，请确认处理人员，并联系管理员配置！</span>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="selectedWidget" class="ui-widget-content xpdl-widget-sels">
                                </div>
                            </td>
                        </tr>
                        <tr onclick="javascript:$('#formSelectp').hide();">
                            <td colspan="2" class="xpdl-sendbtntd">
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
                <td>
                    接收人
                </td>
                <td>
                    <input readonly="readonly" id="tbDeliverUser" style="width: 120px" class="kpms-textbox"
                        type="text" name="tbDeliverUser" />
                    <input type="hidden" id="hiDeliverUser" name="hiDeliverUser" />
                    <img src="../../Themes/Images/btn_select.gif" id="btnSelDeliverUser" />
                </td>
            </tr>
            <tr>
                <td>
                    备注
                </td>
                <td>
                    <input id="tbDeliverRemark" class="kpms-textbox" type="text" name="tbDeliverRemark" />
                </td>
            </tr>
        </table>
    </div>
    <asp:Button ID="btnDeliver" Visible="false" runat="server" Text="转交" OnClick="btnDeliver_Click" />
    <script language="javascript">  

     //点击链接，定位到具体的模块位置
      $(function(){
       $(".form-link a").each(function(){
         $(this).click(function(){
            $(this).attr("href","#"+$(this).attr("hrefAddress"));
            var openDetailID=$(this).attr("openDetailID");
            if($("#"+openDetailID).css("display")=="none")
            {
               if(openDetailID=="formTrack") {
                 getWorkTracking();
               }
                openDetail(openDetailID);
            }
          })
       });
     });

     $(function() {
            var scrollDiv = document.createElement('div');
            $(scrollDiv).attr('id', 'toTop').html('').appendTo('body');
            $(window).scroll(function() {
                if ($(this).scrollTop() != 0) {
                    $('#toTop').fadeIn();
                } else {
                    $('#toTop').fadeOut();
                }
            });


            $('#toTop').click(function() {
                $('body,html').animate({ scrollTop: 0 }, 300);
            })
        });
        function uploadFile() {
            showUploadForm( $prcInstId,  "<%=AttachmentSourceFlag%>");
            return true;
        }
        function ExpTBSend() {
            if(!sendForm()) return false;
            <%
                PostBackOptions optionSend = new PostBackOptions(this.FormToolBar.SendButton);
                optionSend.PerformValidation = true;
             %>
            <%=this.ClientScript.GetPostBackEventReference(optionSend) %>;    
        }
        function ExpTBSave() {
            if(!saveForm()) return false;
              <%
                PostBackOptions optionSave = new PostBackOptions(this.FormToolBar.SaveButton);
                optionSave.PerformValidation = true;
             %>
            <%=ClientScript.GetPostBackEventReference(optionSave)%>;
        }
        function btnDeliverClick(){
              <%=ClientScript.GetPostBackEventReference(btnDeliver,null)%>;
        }
        var $prcInstId = "<%=ProcessInstanceId %>";
        var $actInstId = "<%=ActivityInstanceId%>";
        var $actName = "<%=CurrentActivityName %>";
        var $formId = "<%=FormId %>";
        var $formObjId = "<%=FormObjectId %>";
        var $packageName = "<%=PackageName %>";
        var $xpdlId = "<%= XPDLId%>";
        var $bizCtx.action = "<%=((int)ActionType).ToString() %>";
        var $formTitle = '<%=this.Title.Replace("\"", "\\\"").Replace("\r\n", " ")%>';
        var $sendBtnId = "<%=btnSend.ClientID %>";
        var $currUserName = "<%=KPMSUser.UserName %>";
       
        var $currBizId = "<%=BusinessObjectId %>";
        var $formUri = "<%= FormURI%>";

        var $showFormTracking="<%=UserConfigCache.GetCache(KPMSUser.UserId).ShowFormTracking %>"
    </script>
    <input type="hidden" id="hiXpdlXml" name="hiXpdlXml" />
    <input type="hidden" id="hiPartsXml" name="hiPartsXml" />
    <div class="form-selectpeople" runat="server" id="formSelectp" style="display: none">
        <div class="selectp-header">
            <span style="float: left;">选择人员</span><span id='closePartMore' class="closethis ui-icon ui-icon-close"></span></div>
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
                        <%-- <img src="../../Themes/Images/btn_prei.gif" /><img src="../../Themes/Images/btn_next.gif" />--%></div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
