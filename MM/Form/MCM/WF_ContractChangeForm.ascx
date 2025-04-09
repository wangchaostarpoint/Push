<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_ContractChangeForm" %>
<%@ Register TagPrefix="uc1" TagName="UCCurrency" Src="../../UI/Controls/UCCurrency.ascx" %>
<%@ Register TagPrefix="uc2" TagName="UCMainBody" Src="../../UI/Controls/UCMainBody.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UCContractRelProjectInfo" Src="../../UI/Controls/UCContractRelProjectInfo.ascx" %>
<%@ Register TagPrefix="uc4" TagName="UCContractRelFile" Src="../../UI/Controls/UCContractRelFile.ascx" %>
<script type="text/javascript" src="<%=WebAppPath %>/FM/UI/Script/FMGeneralScript.js"></script>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="ORGCONTRACTNAME"
                tablename="MCM_CONTRACTCHANGEFORM" activestatus="(2.拟定合同草稿)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE','hiNotBuild':'NOTBUILD','txtContractChangeValue':'CONTRACTVALUE','hiOrgContractValue':'CONTRACTVALUE','tbContractName':'name','txtCONTRACTPROJTYPE':'CONTRACTPROJTYPE'}"
                PageWidth="850" PageUrl="~/MM/Obsolete/ContractSelector.aspx" req="1" OnClick="btnSelectContract_OnClick">
            </zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="CONTRACTID" runat="server" tablename="MCM_CONTRACTSPLITFORM" />
        </td>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                style="width: 120px" tablename="MCM_CONTRACTCHANGEFORM" field="CONTRACTCODE"
                readonly="readonly" activestatus="(23.拟定合同草稿)(3.修改合同草稿)(3.修改相关信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变更后合同名称<span class="req-star">*</span>
        </td>
        <td colspan="6" class="td-m">
            <zhongsoft:LightTextBox type="text" ID="tbContractName" runat="server" field="CONTRACTCHANGENAME"
                req="1" tablename="MCM_CONTRACTCHANGEFORM" activestatus="(23.拟定合同草稿)" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同总额(万元)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" field="ORGCONTRACTVALUE" ID="txtContractChangeValue"
                readonly="readonly" tablename="MCM_CONTRACTCHANGEFORM" class="kpms-textbox-money"
                activestatus="(23.拟定合同草稿)(3.修改合同草稿)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            合同类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlContractType" runat="server" field="PARAMCONTRACTTYPEID"
                req="1" tablename="MCM_CONTRACTCHANGEFORM" activestatus="(23.拟定合同草稿)(3.修改合同草稿)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiContractTypeName" field="CONTRACTTYPENAME"
                tablename="MCM_CONTRACTCHANGEFORM" />
            <input type="hidden" runat="server" id="hiParamContractTypeID" field="PARAMCONTRACTTYPEID"
                tablename="MCM_CONTRACTCHANGEFORM" />
        </td>
        <td class="td-l" nowrap>
            变更/结算后合同额（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" field="CHANGEORSETTLEVALUE"
                ID="txtChangeOrsettleValue" readonly="readonly" tablename="MCM_CONTRACTCHANGEFORM"
                class="kpms-textbox-money" activestatus="(23.拟定合同草稿)(3.修改合同草稿)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <%-- <td class="td-l">
            申请类型<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <asp:RadioButtonList runat="server" ID="rbApplyType" field="APPLYTYPE" tablename="MCM_CONTRACTCHANGEFORM"
                req="1" activestatus="(2.拟定合同草稿)" AutoPostBack="true" RepeatDirection="Horizontal"
                OnSelectedIndexChanged="rbApplyType_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>--%>
        <td class="td-l">
            评审方式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlCheckMode" runat="server" field="CHECKMODE" tablename="MCM_CONTRACTCHANGEFORM"
                req="1" activestatus="(3.审核)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            评审时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCheckDate" tablename="MCM_CONTRACTCHANGEFORM"
                readonly="readonly" class="kpms-textbox-date" field="CHECKDATE" compare="1" activestatus="(3.审核)" />
        </td>
        <td class="td-l">
            合同项目类型
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" field="CONTRACTPROJTYPE" ID="txtCONTRACTPROJTYPE"
                readonly="readonly" tablename="MCM_CONTRACTCHANGEFORM" class="kpms-textbox"
                activestatus="(23.拟定合同草稿)(3.修改合同草稿)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr class="trNotShowCreate">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            合同相对方
        </td>
    </tr>
    <tr class="trNotShowCreate">
        <td colspan="6" class="td-m">
            <uc2:UCMainBody ID="ucMainBody" runat="server"></uc2:UCMainBody>
        </td>
    </tr>
    <tr class="trNotShowCreate">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            合同金额<span class="req-star">*</span>
        </td>
    </tr>
    <tr class="trNotShowCreate">
        <td colspan="6" class="td-m">
            <uc1:UCCurrency ID="ucCurrency" runat="server"></uc1:UCCurrency>
        </td>
    </tr>
    <tr class="trProject" notdisplaystatus="(2.拟定合同草稿)">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            合同关联项目
        </td>
    </tr>
    <tr id="Tr1" runat="server" class="trProject">
        <td colspan="6">
            <uc3:UCContractRelProjectInfo ID="ucRelProjectInfo" runat="server" OnProjectChange="ucRelProjectInfo_ProjectChange">
            </uc3:UCContractRelProjectInfo>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            主要变更内容<span class="req-star" id="spanContent">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeContent" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTCHANGEFORM"
                field="CHANGECONTENT" ActiveStatus="(23.拟定合同草稿)(3.修改合同草稿)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTCHANGEFORM" field="MEMO"
                ActiveStatus="(23.拟定合同草稿)(3.修改合同草稿)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="Tr2">
        <td colspan="6">
            <uc4:UCContractRelFile ID="ucContractRelFile" runat="server"></uc4:UCContractRelFile>
        </td>
    </tr>
</table>
<!--合同变更流程主键-->
<input type="hidden" runat="server" id="hiContractChangeFormID" field="CONTRACTCHANGEFORMID"
    tablename="MCM_CONTRACTCHANGEFORM" />
<!----记录要中止的合同是否 生产不立项----->
<input type="hidden" runat="server" id="hiNotBuild" field="NOTBUILD" tablename="MCM_CONTRACTSPLITFORM" />
<input type="hidden" runat="server" id="hiSplitValue" />
<input type="hidden" runat="server" id="hiApplyType" field="APPLYTYPE" tablename="MCM_CONTRACTCHANGEFORM" />
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        accessOfAddProDisplay();
        accessOfMainSureDisplay(true);
        accessOfFileAddDisplay();
        if (typeof (ucContractRelProject_Init) == "function") {
            ucContractRelProject_Init();
        }
        if (typeof (ucCurrency_Init) == "function") {
            ucCurrency_Init();
        }
        if (typeof (ucMainBody_Init) == "function") {
            ucMainBody_Init();
        }
        if (($actName == "拟定合同草稿" || $actName == "修改合同草稿" || $actName == "修改相关信息") && $bizCtx.action != "<%=(int)AccessLevel.Read %>") {
            computeAllValue();
            if ($("#<%=txtContractName.ClientID %>").val() != "" || $("#<%=txtContractName.ClientID %>").text() != "") {
                accessOfSureDisplay(false);
                $(".trNotShowCreate").show();
            }
            else {
                accessOfSureDisplay(true);
                accessOfMainSureDisplay(true);
                $(".trNotShowCreate").hide();
                $('.trProject').hide();
            }
        }
        else {
            accessOfSureDisplay(true);
            accessOfMainSureDisplay(true);
        }
    }

    function checkForm() {
        //合同相对方和合同金额必须填写
        if (($actName == "拟定合同草稿" || $actName == "修改合同草稿")) {
            if ($("#<%=hiContractID.ClientID %>").val() == "") {
                alert("请选择合同信息");
                return false;
            }
            if ($formAction == 0) {
                if (getMainBodyNum() < 1) {
                    alert("请填写合同相对方信息");
                    return false;
                }
                if (getCurrencyNum() < 1) {
                    alert("请填写合同金额信息");
                    return false;
                }

                var projectLength = getRelProjectNum();
                if (projectLength < 1) {
                    alert("请添加合同关联项目信息");
                    return false;
                }
            }
        }

        return true;
    }

    //判断拆分额是否等于合同额
    function checkSpiltIsRight() {
        var contractValue = $("#<%=txtContractChangeValue.ClientID %>");
        var splitContractValue = $("#<%=hiSplitValue.ClientID %>");
        if (floatParse(contractValue.val()) * 10000 - floatParse(splitContractValue.val()) * 10000 != 0) {
            return false;
        }
        return true;
    }

</script>
