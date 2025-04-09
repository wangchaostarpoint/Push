<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractSplitForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_ContractSplitForm" %>
<%@ Register TagPrefix="uc2" TagName="UCMainBody" Src="../../UI/Controls/UCMainBody.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UCContractRelProjectInfo" Src="../../UI/Controls/UCContractRelProjectInfo.ascx" %>
<%@ Register TagPrefix="uc4" TagName="UCContractRelFile" Src="../../UI/Controls/UCContractRelFile.ascx" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<script type="text/javascript" src="<%=WebAppPath %>/FM/UI/Script/FMGeneralScript.js"></script>
<table class="tz-table">
    <tr>
        <td class="td-l">
            重新拆分合同额<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rbIsSplit" field="ISRELSPLIT" tablename="MCM_CONTRACTSPLITFORM"
                req="1" RepeatDirection="Horizontal" activestatus="(2.拆分合同额)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                style="width: 120px" tablename="MCM_CONTRACTSPLITFORM" field="CONTRACTCODE" readonly="readonly"
                activestatus="(23.拆分合同额)(3.修改拆分金额)" />
        </td>
        <td class="td-l">
            合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="CONTRACTNAME"
                tablename="MCM_CONTRACTSPLITFORM" activestatus="(2.拆分合同额)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE','txtContractType':'TYPENAME','txtUndertakeDeptName':'UNDERTAKEDEPTNAME','hiNotBuild':'NOTBUILD','txtContractAmount':'CONTRACTVALUE','hiParamContractTypeID':'PARAMCONTRACTTYPEID'}"
                PageWidth="750" FilterFunction="filterContract();" PageUrl="~/MM/Obsolete/ContractSelector.aspx"
                req="1" OnClick="btnSelectContract_OnClick"></zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="CONTRACTID" runat="server" tablename="MCM_CONTRACTSPLITFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同类型
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContractType" field="CONTRACTTYPENAME"
                tablename="MCM_CONTRACTSPLITFORM" class="kpms-textbox" readonly="readonly" activestatus="(23.拆分合同额)(3.修改拆分金额)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiParamContractTypeID" />
        </td>
        <td class="td-l">
            承办部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtUndertakeDeptName" tablename="MCM_CONTRACTSPLITFORM"
                readonly="readonly" class="kpms-textbox" field="UNDERTAKEDEPTNAME" activestatus="(23.拆分合同额)(3.修改拆分金额)" />
        </td>
        <td class="td-l">
            合同总额(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtContractAmount" tablename="MCM_CONTRACTSPLITFORM"
                readonly="readonly" class="kpms-textbox-money" field="CONTRACTVALUE" activestatus="(23.拆分合同额)(3.修改拆分金额)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            已拆分合同额(万元)
        </td>
        <td class="td-r" id="tdSplitValue">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtSplitContractValue" tablename="MCM_CONTRACTSPLITFORM"
                readonly="readonly" class="kpms-textbox-money" field="SPLITCONTRACTVALUE" activestatus="(23.拆分合同额)(3.修改拆分金额)" />
        </td>
        <td class="td-l" special="true">
            工作专业内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3" special="true">
            <zhongsoft:LightDropDownList runat="server" ID="ddlWorkSpeciaty" field="WORKSPECIALTY"
                tablename="MCM_CONTRACTSPLITFORM" activestatus="(23.确认备案)">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr id="trNeedChange">
        <td class="td-l">
            是否需要变更生产任务单状态<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rbNeedChangeState" field="ISNEEDCHANGESTATE"
                tablename="MCM_CONTRACTSPLITFORM" req="1" RepeatDirection="Horizontal" activestatus="(3.确认备案)">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiHasSendCreate" field="HASSENDCREATE" tablename="MCM_CONTRACTSPLITFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            合同相对方
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc2:UCMainBody ID="ucMainBody" runat="server"></uc2:UCMainBody>
        </td>
    </tr>
    <tr class="trProject">
        <td colspan="6" height="25" style="font-weight: bold; text-align: center">
            合同关联项目
        </td>
    </tr>
    <tr id="Tr2" runat="server" class="trProject">
        <td colspan="6">
            <uc3:UCContractRelProjectInfo ID="ucRelProjectInfo" runat="server" OnProjectChange="ucRelProjectInfo_ProjectChange">
            </uc3:UCContractRelProjectInfo>
        </td>
    </tr>
    <tr>
        <td colspan="6" align="right" style="font-weight: bold;">
            <span class="req-star">请点击按钮上传文档</span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc4:UCContractRelFile ID="ucContractRelFile" runat="server"></uc4:UCContractRelFile>
        </td>
    </tr>
</table>
<!----流程主键ID---->
<input type="hidden" runat="server" id="hiContractSplitFormID" field="CONTRACTSPLITFORMID"
    tablename="MCM_CONTRACTSPLITFORM" />
<!----记录要中止的合同是否 生产不立项----->
<input type="hidden" runat="server" id="hiNotBuild" field="NOTBUILD" tablename="MCM_CONTRACTSPLITFORM" />
<!----记录是否不需要拆分----->
<input type="hidden" runat="server" id="hiIsNotNeedSplit" value="false" />
<asp:LinkButton ID="lbRefresh" runat="server" OnClick="lbRefresh_Click" Style="display: none">
</asp:LinkButton>
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        accessOfProjectDisplay();
        accessOfAddProDisplay();
        accessOfFileAddDisplay();
        accessOfMainSureDisplay(true);
        if (typeof (ucContractRelProject_Init) == "function") {
            ucContractRelProject_Init();
        }
        //如果是重新拆分，则不需要重新生成合同编号，不显示工作专业信息
        displayOfSpecial(false);
        $('#<%=rbIsSplit.ClientID %>').live("change", function () { displayOfSpecial(true); });
    }

    function checkForm() {
        if (($actName == "拆分合同额" || $actName == "修改拆分金额" || $actName == "重新拆分合同额")) {
            var contractType = $("#<%=txtContractType.ClientID %>").val();
            if (contractType == "") {
                alert("请先确定合同类型");
                return false;
            }
            if ($formAction == 0) {
                //必须添加合同关联项目信息
                if (!checkIsNotBuild()) {
                    var projectLength = getRelProjectNum();
                    if (projectLength < 1) {
                        if (!confirm("合同额未拆分！继续发送？")) {
                            return false;
                        }
                    }
                    if (!checkSpiltIsRight()) {
                        if (!confirm("拆分额与合同额不相等！继续发送？")) {
                            return false;
                        }
                    }
                }
                //提醒上传附件信息
                if (getAttachFileNum() < 1) {
                    if (!confirm("没有添加附件信息！继续发送？")) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    //当合同只是 生产不立项时，不需要将合同额拆分到项目
    function accessOfProjectDisplay() {
        if (checkIsNotBuild()) {
            $('.trProject').hide();
        }
    }

    //判断是否 不立项或是否不需要拆分
    function checkIsNotBuild() {
        var isBuild = $("#<%=hiNotBuild.ClientID %>").val();
        var notNeedSplitID = $("#<%=hiIsNotNeedSplit.ClientID %>").val() == "true";

        if (isBuild == "<%=(int)BoolType.是 %>" || notNeedSplitID) {
            return true;
        }

        return false;
    }
    //判断拆分额是否等于合同额
    function checkSpiltIsRight() {
        var contractValue = $("#<%=txtContractAmount.ClientID %>");
        var splitContractValue = $("#<%=txtSplitContractValue.ClientID %>");
        if (floatParse(contractValue.val()) * 10000 - floatParse(splitContractValue.val()) * 10000 != 0) {
            return false;
        }
        return true;
    }
    //如果是重新拆分，则不需要重新生成合同编号，不显示工作专业信息
    function displayOfSpecial(isChange) {
        if (isChange) {
            //重新拆分，不显示工作专业信息
            var contractName = $("#<%=txtContractName.ClientID %>").val();
            if (contractName != "") {
                alert("修改拆分类型，会清空已选合同信息");
                $("#<%=txtContractCode.ClientID %>").val("");
                $("#<%=txtContractName.ClientID %>").val("");
                $("#<%=txtContractName.ClientID %>").next().val("");
                $("#<%=hiContractID.ClientID %>").val("");
                $("#<%=txtUndertakeDeptName.ClientID %>").val("");
                $("#<%=hiNotBuild.ClientID %>").val("");
                $("#<%=txtContractAmount.ClientID %>").val("");
                $("#<%=txtContractType.ClientID %>").val("");
                document.getElementById('<%=lbRefresh.ClientID %>').click();
            }
        }
        if (checkIsRelSplit()) {
            $("#<%=ddlWorkSpeciaty.ClientID %>").removeAttr("req");
            $("[special]").hide();

            $("#tdSplitValue").attr("colspan", "5");
        }
        else {
            if ($actName == "确认备案") {
                $("#<%=ddlWorkSpeciaty.ClientID %>").attr("req", "1");
            }
            $("[special]").show();
            $("#tdSplitValue").removeAttr("colspan");
        }
    }

    //判断是否重新拆分
    function checkIsRelSplit() {
        var isRelSplit = $("#<%=rbIsSplit.ClientID %> input[type='radio']:checked").val();
        if (isRelSplit == "<%=(int)BoolType.是 %>") { return true; }
        return false;
    }

    //如果是重新拆分，则选择已返回的合同，若不是重新拆分，则选择未返回的合同
    function filterContract() {
        var isRelSplit = $("#<%=rbIsSplit.ClientID %> input[type='radio']:checked").val();
        if (isRelSplit == undefined)
        { alert("请选择是否重新拆分"); return false; }
        var isReturn = checkIsRelSplit() ? "1" : "0";
        return "{IsReturn:'" + isReturn + "'}";
    }
     
</script>
