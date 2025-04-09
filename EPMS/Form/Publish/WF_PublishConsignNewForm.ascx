<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishConsignNewForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishConsignNewForm" %>
<%--项目基本信息--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishConsignProjInfoNew.ascx" TagName="PublishConsignProjInfo"
    TagPrefix="uc1" %>
<%-- 出版份数列表--%>
<%--<%@ Register Src="~/EPMS/UI/Publish/PublishNotifyNumInfo.ascx" TagName="PublishNotifyNumInfo"
    TagPrefix="uc2" %>--%>
<%--出版任务列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishConsignWBSInfo.ascx" TagName="PublishConsignWBSInfo"
    TagPrefix="uc3" %>
<%--工种安排列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishWorkInfo.ascx" TagName="PublishWorkInfo"
    TagPrefix="uc4" %>
<%--出版产品列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishProductInfoNew.ascx" TagName="PublishProductInfo"
    TagPrefix="uc5" %>
<uc1:PublishConsignProjInfo ID="PublishConsignProjInfo" runat="server" />
<%--<uc2:PublishNotifyNumInfo ID="PublishNotifyNumInfo" runat="server" />--%>
<table class="tz-table" width="100%" id="tbEnd" runat="server">
    <tr>
        <td class="td-m" colspan="5">
            <asp:Button ID="btnPublishEnd" runat="server" ToolTip="出版终止" OnClientClick="return confirm('确定出版终止?')"
                OnClick="btnPublishEnd_Click" CssClass="btn" Text="出版终止" Style="color: Red; font-weight: bold;
                float: left" />
            <asp:LinkButton runat="server" Visible="false" ID="lbtnPublishNotifyNum" CssClass="subtoolbarlink"
                EnableTheming="false" ToolTip="查看产品发送单" Style="float: right">
                <span>
                    <img runat="server" id="img5" src="~/Themes/Images/look-up.gif" alt="查看产品发送单" width="16"
                        height="16" />产品发送单</span>
            </asp:LinkButton>
        </td>
    </tr>
</table>
<%--<uc4:PublishWorkInfo ID="PublishWorkInfo" runat="server" OnComputeSumCharge="ComputeWorkSumCharge" />--%>
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
<!--主键-->
<input type="hidden" runat="server" id="hiPublishConsignID" field="PublishConsignID"
    tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiCount" value="0" />
<input type="hidden" runat="server" id="hiChargeSum" />
<input type="hidden" runat="server" id="hidPublishWorkInfo"/>
<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName" tablename="EPMS_PublishConsign" />
<script type="text/javascript">
    function checkForm() {
        if ($formAction == 0) {
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
                    alert("该委托单内同时存在【文本】和【图纸】产品，请同时发送【打印员】和【打图员】！");
                    return true;
                }
            }
            else if ($actName == "打印底图或蓝图" || $actName == "重新打印" || $actName == "打印") {
                var state = "true";
                var bizid = $("#<%=hiPublishConsignID.ClientID %>").val();
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/EPMS/List/Publish/PublishWorkEditor.aspx", null),
                    data: { asyfunc: "IsCanSendOnlyCheckModify", publishConsignId: bizid },
                    async: false,
                    dataType: "json",
                    success: function (res) {
                        state = res;
                    },
                    error: function (err) {
                    }
                });

                var isold = '<%=IsOldProj %>';
                if (state == false && isold.toLowerCase() == "false") {
                    alert("任务正在修改，不能发送流程");
                    return false;
                }
            }
            else if ($actName == "核定费用") {
                if (!checkSumPercent()) {
                    return false;
                }
                if (!checkSumAmount()) {
                    return false;
                }
                if (CheckTotalMoney()) {
                    var r = confirm("工种安排费用为0,确定要发送吗？");
                    {
                        return r;
                    }
                }
            }
            else if ($actName == "核对及安排工作") {
                if (!CheckWorkInfoNew()) {
                    var r = confirm("没有工种安排,确定要发送吗？");
                    {
                        return r;
                    }
                }
            }
        }
        return true;
    }
    function initCustomerPlugin() {
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
            var isold = '<%=IsOldProj %>';
            if (state == false && isold.toLowerCase() == "false") {
                //alert("提醒您，当前委托单的任务正在修改或正在校审，请稍候处理！");
            }
            $("#<%=hiCount.ClientID %>").val("1");
        }

        if (typeof (deptSplit_Init) == "function") {
            deptSplit_Init();
        }
    }

    function showPrint() {
        // var urlStr = buildQueryUrl("/EPMS/List/Publish/PublishConsignBillInfoPrint.aspx", { bizId: $currBizId });
        var urlStr = buildQueryUrl("/EPMS/List/Publish/PulishCoverPrint.aspx", null);
        window.open(urlStr, '_blank');
        return false;
    }

    function beforePrint() {
     
            showPrint();
       
        return false;
    }

    //查看产品发送单
    function viewNumInfo(processid, formid) {
        if (processid == "1") {
            alert("该项目没有产品发送单！");
        }
        else {
            var param = { formId: formid, prcInstId: processid };
            var urlStr = buildBizUrl("1", null, "/Sys/Workflow/FormDetail.aspx", param);
            window.open(urlStr);
        }
        return false;
    }

    //获取需要拆分的出版费用总和
    function getSumPublishFee() {
        return $("#<%=hiChargeSum.ClientID %>").val();
    }
</script>