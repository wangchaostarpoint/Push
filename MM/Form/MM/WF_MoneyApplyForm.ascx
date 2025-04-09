<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MoneyApplyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MM.WF_MoneyApplyForm" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            发送部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input id="hiApplyDeptID" type="hidden" runat="server" field="APPLYDEPTID" tablename="FM_MONEYAPPLY" />
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" runat="server" readonly="readonly"
                req="1" Field="APPLYDEPTNAME" TableName="FM_MONEYAPPLY" class="kpms-textbox"
                Activestatus="(23.提出申请)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            申请人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input id="hiApplyUserID" type="hidden" runat="server" field="APPLYUSERID" tablename="FM_MONEYAPPLY" />
            <input id="hiApplyUserCode" type="hidden" runat="server" field="APPLYUSERCODE" tablename="FM_MONEYAPPLY" />
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" class="kpms-textbox"
                req="1" Field="APPLYUSERNAME" TableName="FM_MONEYAPPLY" readonly="readonly" Activestatus="(23.提出申请)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            发送时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                req="1" Field="APPLYDATE" TableName="FM_MONEYAPPLY" Activestatus="(23.提出申请)(3.修改申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            单据号
        </td>
        <td class="td-m" colspan="6">
            <zhongsoft:XHtmlInputText ID="txtDocumentCode" runat="server" class="kpms-textbox"
                Field="DOCUMENTCODE" TableName="FM_MONEYAPPLY" readonly="readonly" activestatus="(23.提出申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            接受部门<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5" nowrap>
            <asp:CheckBox ID="cbAllCheck" runat="server" activestatus="(23.提出申请)" />全选<br />
            <asp:CheckBoxList ID="cblDept" runat="server" activestatus="(23.提出申请)" RepeatColumns="7"
                req="1" RepeatDirection="Horizontal">
            </asp:CheckBoxList>
            <input type="hidden" id="hiDept" runat="server" field="DEPTCODE" tablename="FM_MONEYAPPLY" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            审批类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="6">
            <asp:RadioButtonList ID="rdlListClass" runat="server" field="WORKTRUCKTYPEID" tableName="FM_MONEYAPPLY"
                activestatus="(23.提出申请)(3.修改申请)" RepeatColumns="7" req="1" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            完成时间<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="6">
            <input type="hidden" runat="server" id="hiFinishDate" field="FINISHDATE" tablename="FM_MONEYAPPLY" />
            <zhongsoft:XHtmlInputText ID="txtFinishDate" runat="server" class="kpms-textbox-wholedate"
                readonly="readonly" req="1" field="FINISHDATE" tablename="FM_MONEYAPPLY" Activestatus="(23.提出申请)(3.修改申请)">
            </zhongsoft:XHtmlInputText>
            <%--<input type="hidden" runat="server" id="hiFinishDate" field="FINISHDATE" tablename="FM_MONEYAPPLY" />--%>
            <%-- <zhongsoft:XHtmlInputText ID="txtFinishDatehh" runat="server" class="kpms-textbox-date" Width="25px" Activestatus="(23.接受反馈)">
            </zhongsoft:XHtmlInputText>:
            <zhongsoft:XHtmlInputText ID="txtFinishDatemm" runat="server" class="kpms-textbox-date" Width="25px" Activestatus="(23.接受反馈)">
            </zhongsoft:XHtmlInputText>--%>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            标题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="6">
            <zhongsoft:LightTextBox ID="tbTitle" runat="server" req="1" Field="TITLE" TableName="FM_MONEYAPPLY"
                Width="97%" CssClass="kpms-textbox" Activestatus="(23.提出申请)(3.修改申请)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请事由<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="6">
            <zhongsoft:LightTextBox ID="tbApplyCourse" req="1" Field="APPLYCOURSE" TableName="FM_MONEYAPPLY"
                runat="server" EnableTheming="false" activestatus="(23.提出申请)(3.修改申请)" CssClass="kpms-textarea"
                Width="97%" TextMode="MultiLine" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            币种<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="6">
            <zhongsoft:LightDropDownList ID="ddlMoneyTypeName" runat="server" Activestatus="(23.提出申请)"
                req="1" Field="MONEYTYPEID" TableName="FM_MONEYAPPLY" RepeatDirection="Horizontal">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            上期资金余额(元)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbLastLeaveMoney" runat="server" Regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                ErrMsg="用户输入必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="14" Style="text-align: right"
                CssClass="kpms-textbox-money" Field="LASTLEAVEMONEY" TableName="FM_MONEYAPPLY"
                req="1" Activestatus="(23.提出申请)(23.修改申请)(23.申请部门意见)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l" nowrap>
            本次申请金额(元)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplyMoney" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                errmsg="用户输入必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="14" Style="text-align: right"
                CssClass="kpms-textbox-money" req="1" Field="APPLYMONEY" TableName="FM_MONEYAPPLY"
                Activestatus="(23.提出申请)(23.修改申请)(23.申请部门意见)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l" nowrap>
            核定金额(元)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbConfirmMoney" runat="server" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                errmsg="用户输入必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="14" Style="text-align: right"
                CssClass="kpms-textbox-money"  Field="CONFIRMMONEY" TableName="FM_MONEYAPPLY"
                Activestatus="(23.部门经办人意见)(23.财务报销)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="isNotRMB" runat="server" nodisplaystatus="(23.提出申请)(23.修改申请)(23.申请部门意见)">
        <td class="td-l">
            汇率(<asp:Label runat="server" ID="lbDescription"></asp:Label>-人民币)
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbRate" runat="server" tablename="FM_MONEYAPPLY" shouldEmpty="true"
                Style="text-align: right" regex="^([1-9]\d{0,2}|[0])(\.\d{1,4})?$" errmsg="请输入正数，最多4位整数4位小数"
                field="RATE" activestatus="(23.部门经办人意见)(23.财务报销)" />
        </td>
        <td class="td-l">
            核定金额折合成人民币（元）
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtConfirmRMBAmount" type="text" runat="server" shouldEmpty="true"
                style="text-align: right" class="kpms-textbox" activestatus="(23.部门经办人意见)(23.财务报销)"
                readonly="true" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox ID="txtMemo" runat="server" Field="MEMO" TableName="FM_MONEYAPPLY"
                EnableTheming="false" activestatus="(23.提出申请)(3.修改申请)" CssClass="kpms-textarea"
                Width="97%" TextMode="MultiLine" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!---流程主键ID--->
<input type="hidden" runat="server" id="hiMoneyApplyId" field="MONEYAPPLYID" tablename="FM_MONEYAPPLY" />
<input type="hidden" runat="server" id="hiCurrencyName" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        displayOfRateInfo();
        autoComputeAmount();
        setConfirmMoney();
        var currencyName = $('#<%=hiCurrencyName.ClientID %>').val();
        $("#<%=lbDescription.ClientID %>").text(currencyName);
        //全选和反选
        $("#<%=cbAllCheck.ClientID %>").live("change", function () {
            var $deptList = $("#<%=cblDept.ClientID %> input[type=checkbox]");

            if ($(this).attr("checked")) {
                for (i = 0; i < $deptList.length; i++) {
                    $($deptList[i]).attr("checked", "checked");
                }
            }
            else {
                for (i = 0; i < $deptList.length; i++) {
                    $($deptList[i]).removeAttr("checked");
                }
            }
        });

        if ($actName == "部门经办人意见" || $actName == "财务报销") {
            //汇率改变，计算折合人民币信息
            $("#<%=tbRate.ClientID %>").live("change", function () {
                autoComputeAmount();
            });
        }
    }

    //控制汇率行是否显示
    function displayOfRateInfo() {
        var confimMoney = $("#<%=tbConfirmMoney.ClientID %>").val();
        //币种
        var currency = $("#<%=ddlMoneyTypeName.ClientID %>").val();
        var isRMB = currency == "1";
        if ($bizCtx.action == "<%=(int)AccessLevel.Read %>") {
            if (isRMB || confimMoney == "") {
                $("#<%=isNotRMB.ClientID %>").hide();
            }
        }
        else {
            if ($actName == "相关部门处理") {
                if (isRMB || confimMoney == "") {
                    $("#<%=isNotRMB.ClientID %>").hide();
                }
            }
            else {
                if (isRMB) {
                    $("#<%=isNotRMB.ClientID %>").hide();
                }
            }
        }
    }

    function autoComputeAmount() {
        var rate = $("#<%=tbRate.ClientID %>").val();
        var confimMoney = $("#<%=tbConfirmMoney.ClientID %>").val();
        $("#<%=txtConfirmRMBAmount.ClientID %>").val(accMul(floatParse(rate), floatParse(confimMoney)));
    }

     function showPrint() {
         var urlStr = buildQueryUrl("/MM/List/MM/MoneyApplyPrint.aspx", { processInstanceId: $prcInstId, bizId: $currBizId });
        window.open(urlStr, '_blank');
        return false;
    }

    function beforePrint() {
        if ($actName == '接受反馈' || $actName == '财务报销') {
            showPrint();
        }
        else {
            alert('请在“接受反馈”或“财务报销”步骤打印借款单！')
        }
        return false;
    }
    //设置核定金额
    function setConfirmMoney() { 
        if($actName == '部门经办人意见')
        {   //如果是财务部的人，则核定金额必输
            if ('<%=KPMSUser.OrganizationCode%>' == '<%=EDPortal.BLL.MM.MMConfig.Instance.FinancialOrgCode%>')
            {
                $("#<%=tbConfirmMoney.ClientID %>").attr("req","1");
            }
            else
            {
                $("#<%=tbConfirmMoney.ClientID %>").removeAttr("req");
                $("#<%=tbConfirmMoney.ClientID %>").attr("disabled", "disabled");
                $("#<%=tbRate.ClientID %>").attr("disabled", "disabled");
            }
        }
    }
</script>
