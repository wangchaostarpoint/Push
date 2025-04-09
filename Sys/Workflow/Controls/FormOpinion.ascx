<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormOpinion.ascx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.FormOpinion" %>
<input id="hiESignCheck" runat="server" type="hidden" />
<table class="tz-table" runat="server" id="SignTable">
    <tr runat="server" id="ApprovePanel" visible="false">
        <td>处理结果
        </td>
        <td colspan="2">
            <asp:RadioButtonList RepeatDirection="Horizontal" ID="optApproveList" runat="server">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr runat="server" id="ApprovePanelNew">
        <td class="td-l">
            <asp:Label ID="lbCurrentActivityName" runat="server"></asp:Label>
        </td>
        <td runat="server" id="tdOpinion" class="td-m">
            <asp:TextBox ID="tbCurrOpinion" TextMode="MultiLine" runat="server" CssClass="kpms-textarea"
                Height="80px" EnableTheming="false" Enabled="true" ToolTip="双击显示常用语,最多填写500个字符" MaxText="500"></asp:TextBox>
            <input id="btnAddOpinion" type="button" style="margin-top: 6px;" class="btn" value="维护常用语" />
        </td>
        <td runat="server" id="ESignRow" visible="false" class="td-m">
            <object id="CurrentSignShow" classid="CLSID:416BCFE8-67BB-417C-832A-D6B2958A6481"
                codebase="/Kpms/Download/UtcWhiteInk.CAB#version=2,0,0,2" width="72" height="36">
                <param name="_ExtentX" value="7805">
                <param name="_ExtentY" value="5054">
                <param name="InkProtectnum" value="0">
                <param name="LineSpace" value="0">
                <param name="BackColor" value="16777215">
                <param name="BorderStyle" value="0">
                <param name="InkWidth" value="2">
                <param name="UTCLicServer" value>
                <param name="Zoom" value="1">
                <param name="PenPressure" value="0">
                <param name="Enabled" value="-1">
                <param name="InkColor" value="-2147483640">
                <param name="TheWidth" value="4425">
                <param name="TheHeight" value="2865">
                <param name="LicServer" value>
                <param name="TextBoxTransparent" value="1">
            </object>
            <input type="button" value="签字" id="eBtnSign" onclick="signExe()" class="btn" />
        </td>
        <%--<td runat="server" id="EImageRow" visible="false" valign="top" style="width: 180px">
            <img src="../Sys/Handler/ESignHandler.ashx?userSign=&signexe=sign" runat="server"
                id="EImageCurrentShow" style="display: none" />
            <input type="button" id="imgBtnSign" value="签名" onclick="signImageExe()" class="lc-btn"
                style="display: none" />
        </td>--%>
        <td runat="server" id="EImageRow" visible="false" valign="top" style="width: 180px">
            <img src="../../../Sys/UserSign/empty.jpg" runat="server" id="EImageCurrentShow" onerror="notFind()"
                style="height: 47px; width: 97px" />
            <input type="button" id="imgBtnSign" value="电子签名" onclick="return showInputSignPwdForm(event);"
                class="btn" runat="server" style="display: none" />
            <div style="line-height: 30px; height: 30px; width: 152px; padding: 0px; display: none; top: 40px; position: relative !important"
                id="ExpToolBar" class="ui-dialog ui-widget ui-widget-header  ui-corner-all  ui-draggable ui-resizable">
                <div style="height: 28px; width: 150px;" class=" ui-corner-all ui-helper-clearfix ui-state-default">
                    <span style="cursor: pointer;"
                        onclick="ExpTBSave()">
                        <img src="../../Themes/Images/btn_save.gif" alt="保存" />保存</span><span style="cursor: pointer;" onclick="ExpTBSend()" id="ExpSend">
                            <img src="../../Themes/Images/btn_send.gif" alt="发送" />发送</span><span style="cursor: pointer;" onclick="ExpTBBack()" id="ExpBack">
                                <img src="../../Themes/Images/btn_back.gif" alt="需修改" />需修改</span> <%--<span class="ui-dialog-titlebar-close ui-corner-all"
                                onclick="$('#ExpToolBar').hide('slide');"><span class="ui-icon ui-icon-closethick"></span></span>--%>
                </div>
            </div>
        </td>
    </tr>
</table>
<div id="formInputPwd" title="请输入电子签名密码" style="display: none; z-index: 9999 !important">
    <table width="100%">
        <tr>
            <td>电子签名密码：
            </td>
            <td>
                <input id="tbPwd" style="width: 120px" class="kpms-textbox" type="password" name="tbPwd"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="cbRemeberPwd" Text="是否记住密码" runat="server" />
            </td>
        </tr>
    </table>
</div>
<table class="tz-table" runat="server" id="ExtendTable" visible="false">
    <tr>
        <td class="td-l">
            <asp:Label ID="lbCurStepName" runat="server"></asp:Label>
        </td>
        <td class="td-m" runat="server" id="tdExtend" align="right">
            <asp:TextBox ID="tbExtendOption" TextMode="MultiLine" runat="server" CssClass="kpms-textarea"
                Height="80px" EnableTheming="false" Enabled="true" ToolTip="双击显示常用语" option='option'
                maxtext="500"></asp:TextBox>
        </td>
        <td runat="server" id="tdSaveExtend" class="td-m">
            <table id="SaveTable" class="kpms-buttonsend">
                <tr>
                    <td>
                        <asp:LinkButton runat="server" ID="lbtnSaveExtend" OnClientClick="return saveExtend();"><span>保存</span></asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" ID="lbtnForward" OnClientClick="return showExtendForwardForm()"> 
                            <span>传阅</span></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

</table>
<table class='lc-table' id="optFilterBar" runat="server">
    <tr>
        <td>
            <select id="ddlOrderUserOp" runat="server" style="width: 120px" onchange="changeOptFilter()">
            </select>
            <select id="ddlOrderActOp" runat="server" style="width: 120px" onchange="changeOptFilter()">
            </select><a id='btnShowAllOp' onclick='clearOpFilter()' style="color: Blue">[全部意见]</a>
        </td>
    </tr>
</table>
<%--<%=SignRender%>--%>
<%--<input id="hiESignStr" runat="server" type="hidden" />--%>
<input id="hiEImageStr" value="" type="hidden" runat="server" />
<input id="hiIsSign" runat="server" type="hidden" value="false" />
<input id="hiESignStr" value="" type="hidden" runat="server" />
<!--是否记住密码了-->
<input id="hiShowSign" runat="server" type="hidden" value="false" />
<!-- 扩展意见，用于把手填意见和自动组合意见进行拼接-->
<input type="hidden" runat="server" id="hiExtendOpinion" />
<script language="javascript" type="text/javascript">
    //设置自动组合意见，以便与手填意见拼接
    function setExtendOpinion(opt) {
        $('#<%=hiExtendOpinion.ClientID%>').val(opt);
    }

    var $opiObjId = "<%=tbCurrOpinion.ClientID %>";
    function initOpinion() {
        $("#<%=this.tbCurrOpinion.ClientID %>").autocomplete({
            source: function (request, response) {
                $.getJSON($appCtx.appPath + "/Sys/Handler/JsonSelectorHandler.ashx", {
                    term: request.term + '|<%=KPMSUser.Id %>,opinion,' + Math.random()
                }, response);
            },
            minLength: 0
        }).dblclick(function () {
            $(this).autocomplete("search");
        });
        $("#btnAddOpinion").click(function () {
            var fea = "dialogHeight: 500px; dialogWidth:600 px;resizable: yes;scroll:yes;";
            var url = $appCtx.appPath + "/Sys/Workflow/FormOpinionEditor.aspx?actionType=<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Update %>";
            window.showModalDialog(url, null, fea);
        });
        //如果没有签名，则手动签名并展示发送按钮
        var imgSrc = $("#<%=hiEImageStr.ClientID %>").val();
        if (imgSrc != "") {
            showSendAndSaveToolBar();
        }
        //有签名就不用手动签了
        else {
            setESignSrc("<%=KPMSUser.LoginId%>");
        }
    }
    //
    var doESign = $("#<%=hiIsSign.ClientID %>").val();
    //判断是否需要回退签名:SysConfig选中中相应复选框则取消签名控制
    if (parseBool("<%=NoDoESignControl %>".toLowerCase())) {
        doESign = "true";
    }

       //   <% if (OpinionSign == Zhongsoft.Portal.Sys.Workflow.SignType.ImageSign)
    { %>  
    //    var initSign = $appCtx.appPath+"/Sys/Handler/ESignHandler.ashx?userSign=<%=KPMSUser.LoginId %>&signexe=sign&ticket=<%=Server.UrlEncode(Zhongsoft.Portal.Sys.Handler.ESignHandler.CreateTicket(Context.User.Identity)) %>";
    //    $get("<%=hiEImageStr.ClientID%>").value = initSign;
    //    $("#<%=EImageCurrentShow.ClientID %>").attr("src",initSign);
    //     function signImageExe() {
    //        var esignCache = $get("<%=hiEImageStr.ClientID%>").value;
    //        if (esignCache == "") { 
    //            $.ajax({
    //                type: "POST",
    //                url: $appCtx.appPath+"/Sys/Handler/ESignHandler.ashx",
    //                async: false,
    //                data: "SignExe=ticket",
    //                success: function(msg) {
    //                    esignCache = $appCtx.appPath+'/Sys/Handler/ESignHandler.ashx?userSign=<%=KPMSUser.LoginId %>&signexe=sign&ticket=' + escape(msg);
    //                    $get("<%=hiEImageStr.ClientID%>").value = esignCache;
    //                }
    //            });
    //        }
    //        $get("<%=EImageCurrentShow.ClientID %>").src = esignCache;
    //        $("#<%=hiIsSign.ClientID%>").val("true");
    //        doESign = $("#<%=hiIsSign.ClientID%>").val();
    //        var offsetTop=$("#imgBtnSign").offset().top;
    //        var offsetLeft=$("#imgBtnSign").offset().left;
    //        var btnWidth=$("#imgBtnSign").width()+offsetLeft+50;
    //        $("#ExpToolBar").css("top",offsetTop);
    //        $("#ExpToolBar").css("left",btnWidth);
    //        if("<%=ActionType %>" == 2 )
    //            $("#ExpSend").hide();
    //        $("#ExpToolBar").show('slide');
    //    }
    //    function setImageSignCache() {
    //        var esignCache = $("#<%=hiEImageStr.ClientID%>").val();
    //        if (esignCache != "") {
    //            //$get("<%=EImageCurrentShow.ClientID %>").src = esignCache;
    //            $("#<%=EImageCurrentShow.ClientID %>").attr("src",esignCache);
    //        }
    //    }  
    //   <%}
    else if (OpinionSign == Zhongsoft.Portal.Sys.Workflow.SignType.ESign)
    {%> 
    //    function signExe() {  
    //        $get("CurrentSignShow").DoSignEx("http://www.utcsoft.cn/utcgetinfo.aspx", "", false, true, false)
    //        var signStr = $get("CurrentSignShow").inkstr;
    //        $get("<%=hiESignStr.ClientID%>").value = signStr;
    //        //快捷Toolbar
    //        var offsetTop=$("#eBtnSign").offset().top;
    //        var offsetLeft=$("#eBtnSign").offset().left;
    //        var btnWidth=$("#eBtnSign").width()+offsetLeft+50;
    //        $("#ExpToolBar").css("top",offsetTop);
    //        $("#ExpToolBar").css("left",btnWidth);
    //        if("<%=ActionType %>" == 2 )
    //            $("#ExpSend").hide();
    //        $("#ExpToolBar").show('slide');
    //        $("#<%=hiIsSign.ClientID%>").val("true");
    //        doESign =  $("#<%=hiIsSign.ClientID%>").val();
    //    }  
    //    function setESignProtect() {
    //        $('#CurrentSignShow').attr("CustomSealSize", true);
    //        $('#CurrentSignShow').attr("SealWidth", 72);
    //        $('#CurrentSignShow').attr("SealHeight", 36);
    //        $('OBJECT').attr("ReadOnly", true);
    //       <%=ESignBatchExe.ToString() %>
    //        if ($get("<%=hiESignStr.ClientID%>").value != "") {
    //             $('#CurrentSignShow').attr("inkstr", $get("<%=hiESignStr.ClientID%>").value);      
    //        }
    //    } 
    //    <%}
    else
    { %> doESign = "true";<%} %>
    //    
    $("#opRenderTable a[ctrlStatus]").click(function () {
        if (!window.confirm("提示：您确定更改状态吗？")) return;
        $.post("FormDetail.aspx",
            { asyfunc: "DeleteProcessedItem", itemId: $(this).attr("aid"), status: $(this).attr("ctrlStatus") },
            function (res) {
                if (res == "True") window.location = window.location;
            });
    });

    function changeOptFilter() {
        var ufilter = $("#<%=ddlOrderUserOp.ClientID %>").val();
        var afilter = $("#<%=ddlOrderActOp.ClientID %>").val();
        $("#opRenderTable tr").each(function () {
            var chkU = true; var chkA = true;
            var u = $(this).attr("uid");
            var a = $(this).attr("aid");
            if (ufilter != "") {
                if (u != ufilter) chkU = false;
            }
            if (afilter != "") {
                if (a != afilter) chkA = false;
            }
            if (chkA && chkU) $(this).show();
            else $(this).hide();
        });
    }
    function clearOpFilter() {
        $("#opRenderTable tr").show();
        $("#<%=ddlOrderUserOp.ClientID %>").val("");
        $("#<%=ddlOrderActOp.ClientID %>").val("");
    }

    function mousePosition(ev) {
        if (ev.pageX || ev.pageY) {
            return { x: ev.pageX, y: ev.pageY };
        }
        return {
            x: ev.clientX + document.body.scrollLeft - document.body.clientLeft, y: ev.clientY + document.body.scrollTop - document.body.clientTop
        };
    }

    function showInputSignPwdForm(ev) {
<%--        //TODO先判定用户字段是否是记住密码
        if ($("#<%=hiShowSign.ClientID %>").val() == "false") {
            var objPosition = mousePosition(ev);
            var dialogOffsetTop = objPosition.x;
            var dialogOffsetLeft = objPosition.y;
            $("#formInputPwd:ui-dialog").dialog("destroy");
            $("#formInputPwd").dialog({
                resizable: false,
                draggable: false,
                autoOpen: false,
                minHeight: 100,
                minWidth: 200,
                position: [dialogOffsetTop, dialogOffsetLeft],
                modal: true,
                buttons: {
                    "确定": function () {
                        if ($("input[type=password]").val() == "") {
                            $("input[type=password]").addClass("kpms-textboxred");
                            addAlert("tbPwd");
                            return false;
                        }
                        //if (!window.confirm("您确定密码正确吗?")) return false;
                        btnEimgSignClick();

                    },
                    "取消": function () {
                        $(this).dialog("close");
                    }
                },
                show: {
                    effect: "slide"
                },
                hide: {
                    effect: "slide"
                }
            });
            $('#formInputPwd').dialog('open');
            // $("#formInputPwd").parent().appendTo("form");
            return false;
        }
        else {
            setESignSrc("<%=KPMSUser.LoginId%>");
        }--%>
        setESignSrc("<%=KPMSUser.LoginId%>");
    }

    //判断电子签名密码并显示签名图片
    function btnEimgSignClick() {
        $.post("FormDetail.aspx?CertPwd=" + $("input[type=password]").val(),
            { asyfunc: "VerifyCertPwd" },
            function (res) {
                if (res == "true") {
                    checkStatus(); //设置记住密码
                    //弹出保存发送按钮，并关闭密码输入窗口
                    setESignSrc("<%=KPMSUser.UserCode%>");

                    $("#formInputPwd").dialog("close");
                }
                else  //密码验证出问题，提示
                {
                    doESign = "false";
                    if (res != "证书密码错误") {
                        alert(res + "!请联系信息化业务部管理员");
                        $("#formInputPwd").dialog("close");
                    }
                    else {
                        alert(res + "!请重新输入密码");
                    }
                    $get("<%=EImageCurrentShow.ClientID %>").src = "<%=WebAppPath%>" + "/Sys/UserSign/" + "empty.jpg";
                }
            }
        );
    }

    function checkStatus() {   //通过单选按钮设置是否记住密码
        if ($("#<%=cbRemeberPwd.ClientID%>").attr("checked") == "checked") {
            // $("#<%=cbRemeberPwd.ClientID%>").attr("disabled","disabled");
            $.post("FormDetail.aspx",
                { asyfunc: "SetRemESginPwd" }
            );
        }
    }
    function showSendAndSaveToolBar() {
      <%--  var offsetTop = $("#<%=EImageCurrentShow.ClientID %>").offset().top;
        var offsetLeft = $("#<%=EImageCurrentShow.ClientID %>").offset().left;
        var btnWidth = $("#<%=EImageCurrentShow.ClientID %>").width() + offsetLeft - 80;
        $("#ExpToolBar").css("top", offsetTop + 50);
        $("#ExpToolBar").css("left", btnWidth);--%>
        if ("<%=ActionType %>" == 2) {
            $("#ExpSend").hide();
            $("#ExpBack").hide();
        }
        $("#ExpToolBar").show('slide');
    }

    function setESignSrc(userName) {
        var basePath = '<%= ResolveUrl(string.IsNullOrEmpty(EDPortal.BLL.Sys.SysConfig.Instance.EsignDisplayPath)?string.Empty:EDPortal.BLL.Sys.SysConfig.Instance.EsignDisplayPath) %>';
        if (basePath.charAt(basePath.length - 1) != "/") {
            basePath += "/";
        }
        if ($get("<%=EImageCurrentShow.ClientID %>") != null) {
            $get("<%=EImageCurrentShow.ClientID %>").src = basePath + userName + ".jpg";
        }
        $("#<%=hiEImageStr.ClientID%>").val(userName);
        doESign = "true";
        showSendAndSaveToolBar();
        $("#<%=imgBtnSign.ClientID %>").hide();
    }


    function saveExtend() {
        if ($('#<% =tbExtendOption.ClientID%>').val() == '') {
            alert('请先填写补签意见，再进行保存！');
            return false;
        }
        var url = buildQueryUrl("/sys/Handler/ExtendOpinionHander.ashx",
            {
                extendId: "<%=ExtendId %>",
                prcId: "<%=ProcessInstanceId %>",
                actId: "<%=ActivityInstanceId %>",
                opinion: $('#<% =tbExtendOption.ClientID%>').val(),
                opinionSign: "<%=OpinionSign.ToString() %>",
                image: "<%=ImageSignString%>",
                digital: "<%=DigitalSignString%>"
            });
        $.ajax({
            type: "POST",
            url: encodeURI(url),
            async: false,
            success: function (msg) {
                alert(msg);
            }
        });
        return false;
    }

    //签名图片不存在，展示为empty.jpg
    function notFind() {
        var img = event.srcElement;
        img.src = "<%=WebAppPath%>/Sys/UserSign/empty.jpg";
        img.onerror = null;//控制不要一直跳动
    }
</script>
