<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishConsignForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishConsignForm" %>
<%--项目基本信息--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishConsignProjInfo.ascx" TagName="PublishConsignProjInfo"
    TagPrefix="uc1" %>
<%-- 出版份数列表--%>
<%--<%@ Register Src="~/EPMS/UI/Publish/PublishNotifyNumInfo.ascx" TagName="PublishNotifyNumInfo"
    TagPrefix="uc2" %>--%>
<%--出版卷册列表--%>
<%--<%@ Register Src="~/EPMS/UI/Publish/PublishConsignWBSInfo.ascx" TagName="PublishConsignWBSInfo"
    TagPrefix="uc3" %>--%>
<%--工种安排列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishWorkInfo.ascx" TagName="PublishWorkInfo"
    TagPrefix="uc4" %>
<%--出版成品列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishProductInfo.ascx" TagName="PublishProductInfo"
    TagPrefix="uc5" %>
<uc1:PublishConsignProjInfo ID="PublishConsignProjInfo" runat="server" />
<%--<uc2:PublishNotifyNumInfo ID="PublishNotifyNumInfo" runat="server" />--%>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-m" colspan="5">
            <asp:Button ID="btnCope" runat="server" ToolTip="拒绝出版" OnClientClick="return showCopeInfo('divModifyReason')"
                CssClass="btn" Text="拒绝出版" Style="color: Red; font-weight: bold; float: left" />&nbsp;&nbsp;
            <asp:Button ID="btnPublishEndApply" runat="server" ToolTip="出版终止申请" OnClientClick="return showStopInfo('divReasonInfo');"
                Visible="false" CssClass="btn" Text="出版终止申请" Style="color: Red; font-weight: bold;
                float: left" />&nbsp;&nbsp;
            <asp:Button ID="btnPublishEnd" runat="server" ToolTip="出版终止" OnClientClick="return confirm('确定出版终止?')"
                Visible="false" OnClick="btnPublishEnd_Click" CssClass="btn" Text="出版终止" Style="color: Red;
                font-weight: bold; float: left" />&nbsp;&nbsp;
            <asp:Button ID="btnPLTDown" runat="server" ToolTip="PLT下载" CssClass="btn" Text="PLT下载"
                Style="font-weight: bold; float: left; display: none" />&nbsp;&nbsp;
            <asp:Button ID="btnProductDown" runat="server" ToolTip="相关图纸下载" CssClass="btn" Text="相关图纸下载"
                Style="font-weight: bold; float: left; display: none" OnClientClick="return downloadProduct();" />
             <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="下载成品" OnClientClick="return batchDownloadProductNew();" Style="float: right">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="下载成品" width="16"
                            height="16" />下载成品</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="lbtnPublishNotifyNum" CssClass="subtoolbarlink"
                EnableTheming="false" ToolTip="查看成品发送单" Style="float: right">
                <span runat="server">
                    <img runat="server" id="img5" src="~/Themes/Images/look-up.gif" alt="查看成品发送单" width="16"
                        height="16" />成品发送单</span>
            </asp:LinkButton>
        </td>
    </tr>
</table>
<%--<uc3:PublishConsignWBSInfo ID="PublishConsignWBSInfo" runat="server" />--%>
<uc4:PublishWorkInfo ID="PublishWorkInfo" runat="server" />
<uc5:PublishProductInfo ID="PublishProductInfo" runat="server" />
<table class="tz-table" width="100%">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('projUnitInfo')">
            业主信息&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="projUnitInfo">
    <tr>
        <td class="td-l">
            业主单位
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCustomer" activestatus="(23.出版委托)"
                class="kpms-textbox" readonly="readonly" />
        </td>
        <td class="td-l">
            联系人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContactPerson" activestatus="(23.出版委托)"
                class="kpms-textbox" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            联系地址
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtAddress" activestatus="(23.出版委托)"
                class="kpms-textbox" readonly="readonly" />
        </td>
        <td class="td-l">
            E-Mail地址
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMail" activestatus="(23.出版委托)" class="kpms-textbox"
                readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            邮政编码
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPostCode" activestatus="(23.出版委托)"
                class="kpms-textbox" readonly="readonly" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhone" activestatus="(23.出版委托)" class="kpms-textbox"
                readonly="readonly" />
        </td>
    </tr>
</table>
<div id="divReasonInfo" style="display: none" title="填写终止原因">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                请输入终止原因:
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbReason" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" Rows="4" />
            </td>
        </tr>
    </table>
</div>
<div id="divModifyReason" style="display: none" title="填写拒绝出版原因">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                请输入拒绝出版原因:
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbModifyReason" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="512" Rows="4" />
            </td>
        </tr>
    </table>
</div>
<!--主键-->
<input type="hidden" runat="server" id="hiPublishConsignID" field="PublishConsignID"
    tablename="EPMS_PublishConsign" />
<input id="hiPublishConsignWBSID" type="hidden" tablename="EPMS_PublishConsignWBS"
    field="PublishConsignWBSID" runat="server" />
<input id="hiPublishConsignID2" type="hidden" tablename="EPMS_PublishConsignWBS"
    field="PublishConsignID" runat="server" />
<input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiCount" value="0" />
<asp:LinkButton runat="server" ID="lbtnOK" OnClick="btnPublishEndApply_Click" Style="display: none"></asp:LinkButton>
<asp:LinkButton runat="server" ID="lbtCope" OnClick="btnCope_Click" Style="display: none"></asp:LinkButton>
<!-- 是否都发送到了核对及安排工作步骤-->
<input type="hidden" runat="server" id="hiIsAllSent" />
<input runat="server" type="hidden" id="hiTempFolderPath" />
<asp:Button ID="btnDelTempFolder" runat="server" Style="display: none;" OnClick="btnDelTempFolder_Click" />
<script type="text/javascript">
    function checkForm() {
        if ($formAction == 0) {
            
            //else if ($actName == "打印底图或蓝图" || $actName == "重新打印" || $actName == "打印") {
                var state = "true";
                var bizid = $("#<%=hiPublishConsignID.ClientID %>").val();
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/EPMS/List/Publish/PublishWorkEditor.aspx", null),
                    data: { asyfunc: "IsCanSend", publishConsignId: bizid },
                    async: false,
                    dataType: "json",
                    success: function (res) {
                        state = res;
                    },
                    error: function (err) {
                    }
                });

                if (state == false) {
                    alert("卷册正在修改或校审，不能发送流程");
                    return false;
                }

                var stopState = "true";
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/EPMS/List/Publish/PublishWorkEditor.aspx", null),
                    data: { asyfunc: "IsCanContinueSendPublish", bizid: bizid },
                    async: false,
                    dataType: "json",
                    success: function (res) {
                        stopState = res;
                    },
                    error: function (err) {
                    }
                });

                if (stopState == false) {
                    alert("当前委托单正在进行出版终止申请，不能发送流程");
                    return false;
                }

                if ($actName == "打印底图或蓝图" || $actName == "重新打印") {
                    //卷册下载状态
                    //PublishDoneState！=2，不允许发送待办
                    var isCan = "true";
                    $.ajax({
                        type: 'POST',
                        url: buildQueryUrl("/EPMS/List/Publish/PublishWorkEditor.aspx", null),
                        data: { asyfunc: "IsCanSendByState", publishConsignId: bizid },
                        async: false,
                        dataType: "json",
                        success: function (res) {
                            isCan = res;
                        },
                        error: function (err) {
                        }
                    });

                    if (isCan == false) {
                        alert("请在【出版下载工具】中确认已出版该卷册，再发送流程！");
                        //return false;
                    }
                }
                if ($actName == "安排出版") {
                var state = "true";
                var bizid = $("#<%=hiPublishConsignID.ClientID %>").val();
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/EPMS/List/Publish/PublishWorkEditor.aspx", null),
                    data: { asyfunc: "IsHaveTZAndWB", publishConsignId: bizid },
                    async: false,
                    dataType: "json",
                    success: function (res) {
                        state = res;
                    },
                    error: function (err) {
                    }
                });
                if (state == true) {
                    alert("该委托单内同时存在【文本】和【图纸】成品，请同时发送【打印员】和【打图员】！");
                    return true;
                }
            }
            //}
        }
        return true;
    }
    function initCustomerPlugin() {
        initPublishProjInfo();
        if ($("#<%=hiCount.ClientID %>").val() == "0") {
            var state = "true";
            var bizid = '<%=BusinessObjectId %>';
            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/EPMS/List/Publish/PublishWorkEditor.aspx", null),
                data: { asyfunc: "IsCanSend", publishConsignId: bizid },
                async: false,
                dataType: "json",
                success: function (res) {
                    state = res;
                },
                error: function (err) {
                }
            });

            if (state == false) {
                alert("提醒您，当前委托单的卷册正在修改或正在校审，请稍候处理！");
            }

            var stopState = "true";
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/EPMS/List/Publish/PublishWorkEditor.aspx", null),
                    data: { asyfunc: "IsCanContinueSendPublish", bizid: bizid },
                    async: false,
                    dataType: "json",
                    success: function (res) {
                        stopState = res;
                    },
                    error: function (err) {
                    }
                });

                if (stopState == false) {
                    alert("提醒您，当前委托单正在进行出版终止申请，请稍候处理！");
                }

            $("#<%=hiCount.ClientID %>").val("1");
        }
    }

    function showPrint() {
        var urlStr = buildQueryUrl("/EPMS/List/Publish/PublishConsignBillInfoPrint.aspx", { bizId: $currBizId });
        window.open(urlStr, '_blank');
        return false;
    }

    function beforePrint() {
        if ($actName == '核对及安排工作' || $actName == '安排出版') {
            showPrint();
        }
        return false;
    }

    //查看成品发送单
    function viewNumInfo(bizId, extendedAttribute) {
        if (bizId == "1") {
            alert("该项目没有成品发送单！");
        }
        else {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
        }
        return false;


    }

      ///批量下载成品（注意不要多个方法重名，导致调用方法异常）
    function batchDownloadProductNew() {
        var wbsIds = '<%=WBSIds %>';
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=sign&wbsIds=" + wbsIds;
        showDivDialog(urlStr, null, 750, 550, afterDownloadProduct);
        return false;
    }

       //删除临时文件
    function afterDownloadProduct(re) {
        $("#<%=hiTempFolderPath.ClientID %>").val(re);
        $("#<%=btnDelTempFolder.ClientID %>").click();
    }


    ///下载成品---此方法不用
    function downloadProduct() {
        var wbsIds = '<%=WBSIds %>';
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=product&wbsIds=" + wbsIds;
        showDivDialog(urlStr, null, 750, 550, afterDownloadProduct);
        return false;
    }

    //弹出对应层
    function showStopInfo(div) {
        if (confirm("确定发起出版终止申请?")) {
            initStopEvent(div);
            $("#" + div).dialog('open');
            $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        }
        return false;
    }

    //弹出拒绝出版原因层
    function showCopeInfo(div) {
        if (confirm("确定发起拒绝出版?")) {
            initCopeEvent(div);
            $("#" + div).dialog({ height: 240 });
            $("#" + div).dialog('open');
            $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        }
        return false;
    }

    function initCopeEvent(div) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 150,
            minWidth: 300,
            modal: true,
            buttons: {
                "确定": function () {
                    var reason = $("#<%=tbModifyReason.ClientID %>").val();
                    if (reason == "") {
                        alert("请输入拒绝出版原因");
                    }
                    else {
                        <%=Page.ClientScript.GetPostBackEventReference(this.lbtCope,"")%>;

                        $(this).dialog("close");
                    }
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    //加载div默认事件
    function initStopEvent(div, productId) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 150,
            minWidth: 300,
            modal: true,
            buttons: {
                "确定": function () {
                    var reason = $("#<%=tbReason.ClientID %>").val();
                    if (reason == "") {
                        alert("请输入终止申请原因");
                    }
                    else {
                        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnOK,"")%>;

                        $(this).dialog("close");
                    }
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

</script>
