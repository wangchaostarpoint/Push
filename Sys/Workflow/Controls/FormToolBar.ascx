<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormToolBar.ascx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.FormToolBar" %>
<table id="FormTopToolBar">
    <tr>
        <td style="padding-right: 10px; vertical-align: top;" nowrap="nowrap">
            <div>
                <asp:LinkButton runat="server" key="Save" ID="LinkSave" CssClass="btn-function2"
                    EnableTheming="false">
            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_save.png"  title="请先保存，再上传附件" /><br/><span>保存</span></asp:LinkButton>
                <asp:LinkButton runat="server" key="Send" ID="LinkSend" CssClass="btn-function2" spanText="同意"
                    EnableTheming="false">
            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_send.png"  border="0" /><br /><span>同意</span></asp:LinkButton>
                <asp:LinkButton runat="server" key="Read" ID="LinkRead" CssClass="btn-function2"
                    EnableTheming="false">
            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_send.png"  border="0" /><br /><span>已阅</span></asp:LinkButton>
                <asp:LinkButton runat="server" key="Back" ID="LinkBack" OnClientClick="return backForm()"
                    EnableTheming="false" CssClass="btn-function2">
            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_back.png" border="0" /><br /><span>需修改</span></asp:LinkButton>
                <asp:LinkButton runat="server" OnClientClick="return showDeliverForm();" EnableTheming="false"
                    key="Deliver" ID="LinkDeliver" CssClass="btn-function2">
            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_turn.png" title="将本步骤的权力转给指定的人，由指定人代为办理." border="0" /><br /><span>转交</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="LinkForward" OnClientClick="return selUserToForward()"
                    EnableTheming="false" ActiveStatus="(*.*)" key="PassDoc" CssClass="btn-function2"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_notified.png" title="传阅" /><br /><span>传阅</span></asp:LinkButton>
                <asp:LinkButton OnClientClick="return window.confirm('您确定删除吗？')" runat="server" Visible="false"
                    EnableTheming="false" key="Delete" ID="LinkDelete" CssClass="btn-function2"> 
            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_delete.png" title="删除" /><br /><span>删除</span></asp:LinkButton>
            </div>
        </td>
        <td style="padding-right: 10px; padding-bottom: 0px; vertical-align: top;" nowrap="nowrap">
            <div style="border-left: #e1dcdc 1px solid;">
                <zhongsoft:LightFileUploader runat="server" ID="LinkAddText" EnableTheming="false"
                    key="AddText" CssClass="btn-function2" Visible="false" Multiselect="false" BeforeUpload="beforeUploadText">
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_addtext.png" title="上载正文" id="imgAddText"/><br /><span>上载正文</span></zhongsoft:LightFileUploader>
                <asp:LinkButton runat="server" CssClass="btn-function2" ID="LinkSignText" OnClientClick="return openTextBody('text','sign')"
                    key="SignText" EnableTheming="false" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_sign.png" title="盖章" /><br /><span>编辑盖章</span></asp:LinkButton>
                <%--针对正文进行套打--%>
                <asp:LinkButton runat="server" CssClass="btn-function2" ID="LinkClearPrintText" OnClientClick="return openTextBody('text','edit')"
                    key="ClearPrintText" EnableTheming="false" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_viewtext.png" title="编辑正文" /><br /><span>编辑正文</span></asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn-function2" ID="LinkRedHead" OnClientClick="return beforeRedhead('text','redhead')"
                    key="RedHead" EnableTheming="false" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_redhead.png" title="套红" /><br /><span>编辑套红</span></asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn-function2" ID="LinkViewText" OnClientClick="return openTextBody('text','view')"
                    key="ViewText" EnableTheming="false" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_viewtext.png" title="查看正文" /><br /><span>查看正文</span></asp:LinkButton>
                <zhongsoft:LightFileUploader runat="server" ID="LinkAttachment" EnableTheming="false"
                    key="Attachment" CssClass="btn-function2">
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_fujian.png" title="附件" /><br /><span>附件</span></zhongsoft:LightFileUploader>
                <asp:LinkButton runat="server" key="Press" ID="LinkAlert" CssClass="btn-function2"
                    EnableTheming="false">
            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_cuiban.png"/><br /><span>催办</span></asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn-function2" ID="LinkRelateFlow" OnClientClick="return RelateFlow(relationCallBack)"
                    key="RelateFlow" EnableTheming="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_connect.png" title="关联流程" /><br /><span>关联</span></asp:LinkButton>
                <asp:LinkButton Visible="false" runat="server" OnClientClick="return window.confirm('您确定办毕此流程吗？')"
                    CssClass="btn-function2" key="Finish" ID="LinkFinish" EnableTheming="false">
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_finish.png" title="办毕"  /><br /><span>办毕</span></asp:LinkButton>
                <asp:LinkButton runat="server" OnClientClick="return window.confirm('您确定撤回吗？')" key="Rollback"
                    EnableTheming="false" CssClass="btn-function2" ID="LinkRollback">
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_callback.png" title="撤回"  /><br /><span>撤回</span></asp:LinkButton>
                <%--     <asp:LinkButton runat="server" OnClientClick="return uploadFile()" ID="LinkAttachment"
                EnableTheming="false" key="Attachment" CssClass="btn-function2">
               <span> <img src="../../Themes/Images/btn_f_fujian.gif" title="附件" /><br />文档</span></asp:LinkButton>--%>
                <%--<asp:LinkButton runat="server" ID="LinkPrint" key="Print" OnClientClick="return printForm()"
                    EnableTheming="false" CssClass="btn-function2"><span><img src="../../Themes/Images/btn/btn3/btn_f_print.png" title="打印" /><br />打印</span></asp:LinkButton>--%>
                <asp:LinkButton runat="server" ID="LinkStandardFormPrint" key="StandardFormPrint"
                    EnableTheming="false" CssClass="btn-function2" Visible="false" OnClientClick="return StandardFormPrint()">
                <img src="../../Themes/Images/btn_f_print.gif" alt="标准表单打印" /><br /><span>标准表单打印</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="LinkHelp" key="Help" OnClientClick="return getHelp()"
                    EnableTheming="false" CssClass="btn-function2" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/btn3/btn_f_help.png" title="帮助" /><br /><span>帮助</span></asp:LinkButton>
            </div>
        </td>
        <%-- <td style="border-left: #E8EBEC 1px solid; padding-left: 7px; padding-right: 7px; vertical-align: top;" nowrap>
            <div class="tabs tabs-style-iconbox">
                
            </div>
        </td>--%>
        <td style="border-left: #e1dcdc 1px solid; padding-bottom: 0px;" valign="top" nowrap="nowrap">
            <div>
                <div class="kpms-ppwindowcontent">
                    <%--<a class="btn-function2"  hrefaddress="partBaseInfo" opendetailid="formContent"> <span><img src="../../Themes/Images/btn/btn3/btn_dangqian.png" / ><br />当前工作</span></a>--%>
                    <%--<a class="btn-function2" hrefaddress="partAttachment" opendetailid="formAttachment"> <span><img src="../../Themes/Images/btn/btn3/btn_wend.png" /><br />文档</span></a>--%>
                    <a class="btn-function2" hrefaddress="partOpinion" opendetailid="historyOpinion" id="viewOption">
                        <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_banli.png" /><br />
                        <span>签署意见</span></a> <a class="btn-function2" href="javascript:void(0)" onclick="javascript:openWorkTracking();"
                            hrefaddress="partTracking" opendetailid="formTrack">
                            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_genzh.png" /><br />
                            <span>流程跟踪</span></a>
                    <%--<a class="btn-function2" href="javascript:void(0)" onclick="javascript:showWfVisual();"> <span><img src="../../Themes/custom/Images/btn/btn3/btn_keshihua.png" /><br />可视化流程</span></a>--%>
                </div>
            </div>
        </td>
        <%--<td valign="top">
            <a id="aMore">更多…</a>
            <div id="divMore">
            </div>
        </td>--%>
        <td valign="top" class="fixed" style="border-left: #e1dcdc 1px solid; right: 13%; position: absolute;">
            <a href="#" class="btn-function2" id="fScrFlag" style="float: left; margin-right: 70px;">

                <img src="../../themes/custom/images/btn/toolbar_pic/btn_f_full.png" /><br />
                <span>
                    <label>全屏</label></span></a>
            <div id="MT_nav" style="float: left; margin-left: 40px;">
                <div class="MT-item">
                    <a id="aMore" class="btn-function2">
                        <img src="../../Themes/custom/Images/btn/toolbar_pic/icon_more.png" title="更多" />
                        <br />
                        <span>更多</span></a>
                    <div id="divMore">
                        <span class="MT-arrow"></span><a onclick="return printForm()">打印</a> <a id="attention"></a><a onclick="return getHelp()">帮助</a>
                    </div>
                </div>
            </div>
            <asp:LinkButton runat="server" CausesValidation="false" OnClientClick="if(window.confirm('您确定关闭吗？')) {window.opener=null;;window.open('','_self');window.close();window.parent.goSelectNode();} else return false;"
                key="Close" ID="LinkClose" CssClass="btn-function2" EnableTheming="false" Style="float: left;">
            <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_close.png" title="关闭" /><br /><span>关闭</span></asp:LinkButton>
        </td>
    </tr>
</table>
<script>
    //控制发送按钮 隐藏此效果显示，xiedx 1021 （xiayq意见）    
    //    $("#FormTopToolBar").hide();
    //    $(function () {

    //        $("#FormTopToolBar").show('slide');
    //    }
    //    ); 
</script>
<script>
    var screenWidth = window.screen.width;
    if (screenWidth < 1100) {
        //$('#MT_nav').css('right', '65px');
        $('.fixed').css('right', '4%');
        $('.btn-function2 span').css('padding-right', '10px');
        $('.btn-function2 span').css('padding-left', '10px');
    }
    else {
        //$('#MT_nav').css('right', '145px');
        $('.fixed').css('right', '13%');
        $('.btn-function2 span').css('padding-right', '13px');
        $('.btn-function2 span').css('padding-left', '13px');
    }
    //add by xuning 2015-04-29 记录Read按钮的ID
    var $readBtnId = "<%=LinkRead.ClientID %>";


    function beforeUploadText() { //上传前看下是否有正文，如果有则提示
        //判断是否有正文
        var haveText = true;
        $.ajax({
            type: "POST",
            url: buildQueryUrl("KOA/SOA/KOAHandler.ashx", null),
            data: { BizId: $bizCtx.bizId, OperateType: "HaveText" },
            async: false,
            success: function (result) {
                if (result == "false") {
                    haveText = false;
                }
            }
        });
        if (haveText) {
            if (!window.confirm("正文已存在，是否重新上传？（执行此操作原正文将被清除）")) {
                return false;
            }
        }
        return true;
    }
    function beforeRedhead() {
        var canRedHead = true;
        $.ajax({
            type: "POST",
            url: buildQueryUrl("KOA/SOA/KOAHandler.ashx", null),
            data: { BizId: $bizCtx.bizId, OperateType: "CanRedHead" },
            async: false,
            success: function (result) {
                if (result == "false") {
                    canRedHead = false;
                }
            }
        });
        if (!canRedHead) {
            alert("请您先清稿，然后再套红！");
        }
        else {
            openTextBody('text', 'redhead');
        }
    }

    function beforeClear() {
        if (window.confirm("清稿后无法撤回，您确定要清稿吗？")) {
            openTextBody('Revised', 'viewclear');
        }
    }


    var formAttachReadOnly = 0;
    var formAttachEditable = 0;
    function openFormAttachmentView() {
        var url = buildBizUrl($bizCtx.action, $bizCtx.bizId, "/Sys/Workflow/FormAttachment.aspx", { "formid": $formCtx.formId, "prcinstid": $formCtx.prcInstId, "readonly": formAttachReadOnly, "editable": formAttachEditable });
        //showModal(url,"",800,450);      
        showDivDialog(url, "", 800, 550, rebindFormAttachmentView);
        return false;
    }

    function rebindFormAttachmentView(re) {
       <%=Page.GetPostBackEventReference(this.LinkAttachment,"") %>;
    }
    OptionHide();
    //查看状态时隐藏填写签署意见
    function OptionHide() {
         
        var act = '<%=ActionType%>';
        if (act == 'Read') {
            $("#viewOption").hide();
        }
    }

</script>
