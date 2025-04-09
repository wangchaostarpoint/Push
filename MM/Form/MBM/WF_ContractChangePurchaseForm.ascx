<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractChangePurchaseForm.ascx.cs" Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_ContractChangePurchaseForm" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<table class="tz-table">
    <tr>
        <td class="td-l">合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsOriginalContractName" ResultAttr="name" Writeable="False" SelectPageMode="Dialog"
                PageUrl="../../Obsolete/ContractSelector.aspx" activestatus="(23.提交合同)" field="OriginalContractName" Filter="{BaseType: '1'}"
                ResultForControls="{'hiContractID':'id','txtOrgContractValue':'ContractValue','txtContractCode':'ContractCode','hiBaseType':'BaseType'}"
                tablename="MM_ContractChange" ShowJsonRowColName="True" req="1" OnClick="lbsOriginalContractName_OnClick" PageWidth="800" PageHeight="600" />
        </td>
        <td class="td-l">合同编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContractCode" readonly="readonly" class="kpms-textbox" activestatus="(23.提交合同)"
                tablename="MM_ContractChange" field="ContractCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblApplyType" field="ApplyType" tablename="MM_ContractChange" onclick="rblApplyTypeChange();"
                req="1" RepeatDirection="Horizontal" activestatus="(23.提交合同)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">变更日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtChangeDate" activestatus="(23.提交合同)" tablename="MM_ContractChange"
                field="ChangeDate" readonly="readonly" class="kpms-textbox-date" req="1" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr runat="server" id="trContractChangeName" name="changeShow" style="display: none">
        <td class="td-l">变更后合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbContractChangeName" activestatus="(23.提交合同)" req="1" MaxLength="256" />
        </td>
    </tr>
    <tr>
        <td class="td-l">原合同金额（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" class="kpms-textbox-money" ID="txtOrgContractValue" EnableTheming="False" DataType="Decimal6"
                activestatus="(23.提交合同)" tablename="MM_ContractChange" field="OrgContractValue" readonly="readonly" />
        </td>
        <td class="td-l" runat="server" id="tdTitle" style="display: none" name="supplement">追加合同金额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r" runat="server" id="tdContent" style="display: none" name="supplement">
            <zhongsoft:LightTextBox runat="server" req="1" DataType="Decimal6" CssClass="kpms-textbox-money" EnableTheming="False"
                ID="tbAddContractValue" activestatus="(23.提交合同)" onblur="calcContractChangeValue();" />
        </td>
        <td class="td-l">变更后合同金额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContractChangeValue" DataType="Decimal6" class="kpms-textbox-money" EnableTheming="False"
                activestatus="(23.提交合同)" tablename="MM_ContractChange" field="ContractChangeValue" req="1" readonly="readonly" />
        </td>
        <td class="td-m" colspan="2" runat="server" id="tdAssist" name="changeShow"></td>
    </tr>
    <tr>
        <td class="td-l">主要变更内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbChangeContent" activestatus="(23.提交合同)" tablename="MM_ContractChange" field="ChangeContent"
                EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Rows="3" MaxLength="1024" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">变更理由<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbChangeReason" activestatus="(23.提交合同)" tablename="MM_ContractChange" field="ChangeReason"
                EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Rows="3" MaxLength="1024" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" activestatus="(23.提交合同)" tablename="MM_ContractChange" field="Memo"
                EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Rows="3" MaxLength="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">相关附件
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(3.提交合同)" OnClick="lbtnUpload_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                        <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                            id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
            <uc3:UpLoadFile ID="uploadFile" runat="server" />
        </td>
    </tr>
</table>
<div id="hide" style="display: none">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">是否需要协办部门
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="ckbIsNeedCoDept" activestatus="(23.提交合同)" tablename="MM_ContractChange"
                    field="IsNeedCoDept" />
                <input type="hidden" runat="server" id="hiIsNeedCoDept" tablename="MM_ContractChange" field="IsNeedCoDept" />
            </td>
            <td class="td-l" name="coDeptSpan" style="display: none">协办部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" name="coDeptSpan" style="display: none">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsCoDeptNames" ResultAttr="name" Writeable="False"
                    PageUrl="../../../Sys/OrgUsers/OrgSelectorJson.aspx" SelectPageMode="Dialog" Filter="{showTree:'1'}" activestatus="(23.提交合同)" field="CoDeptNames"
                    ResultForControls="{'hiCoDeptIDs':'id'}" IsMutiple="True"
                    tablename="MM_ContractChange" ShowJsonRowColName="True" />
            </td>
            <td class="td-m" colspan="4" name="noCoDeptSpan"></td>
        </tr>
        <tr>
            <td class="td-l">是否需副总师批
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="ckbIsNeedMaster" activestatus="(23.提交合同)" tablename="MM_ContractChange" field="IsNeedMaster" />
                <input type="hidden" runat="server" id="hiIsNeedMaster" tablename="MM_ContractChange" field="IsNeedMaster" />
            </td>
            <td class="td-l" name="masterSpan" style="display: none">副总师<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" name="masterSpan" style="display: none">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsMasterName" ResultAttr="name" Writeable="False" SelectPageMode="Dialog"
                    PageUrl="../../../Sys/OrgUsers/UserSelectorJson.aspx" activestatus="(23.提交合同)" field="MasterName"
                    ResultForControls="{'hiMasterID':'id'}"
                    tablename="MM_ContractChange" ShowJsonRowColName="True" />
            </td>
            <td class="td-m" colspan="4" name="noMasterSpan"></td>
        </tr>
        <tr>
            <td class="td-l">主管领导<span class="req-star">*</span></td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="tbMianLeaderName" req="1" IsMutiple="false" SelectPageMode="Dialog"
                    ResultForControls="{'hiMianLeaderID':'id'}" EnableTheming="false"
                    Text="选择主管领导" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    Filter="{'OrganizationId':'F9A24FD1-3C1F-4FFE-AB5E-11509D8827EE','IsOnlyFilterDept':'1'}"
                    ResultAttr="name" activestatus="(23.提交合同)" TableName="MM_ContractChange" Field="MianLeaderName" />
                <input type="hidden" id="hiMianLeaderID" runat="server" tablename="MM_ContractChange" field="MianLeaderID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否需董事长批
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBox runat="server" ID="ckbIsNeedChief" activestatus="(23.提交合同)" tablename="MM_ContractChange"
                    field="IsNeedChief" />
                <input type="hidden" runat="server" id="hiIsNeedChief" tablename="MM_ContractChange" field="IsNeedChief" />
            </td>
        </tr>
    </table>
</div>
<input type="hidden" runat="server" id="hiContractChangeID" tablename="MM_ContractChange" field="ContractChangeID" />
<input type="hidden" runat="server" id="hiContractID" tablename="MM_ContractChange" field="ContractID" />
<input type="hidden" runat="server" id="hiBaseType" tablename="MM_ContractChange" field="BaseType" />
<input type="hidden" runat="server" id="hiCoDeptIDs" tablename="MM_ContractChange" field="CoDeptIDs" />
<input type="hidden" runat="server" id="hiMasterID" tablename="MM_ContractChange" field="MasterID" />
<input type="hidden" runat="server" id="hiAddContractValue" tablename="MM_ContractChange" field="AddContractValue" />
<input type="hidden" runat="server" id="hiReleMarket" />
<input type="hidden" runat="server" id="hiContractChangeName" tablename="MM_ContractChange" field="ContractChangeName" />
<input type="hidden" runat="server" id="hiFormType" tablename="MM_ContractChange" field="FormType" />
<input type="hidden" runat="server" id="hiCreateDeptLevel" tablename="MM_ContractCheck" field="CreateDeptLevel" />
<script type="text/javascript">

    function initCustomerPlugin() {
        //将是否需要xx审批，整合到通用意见处
        $('#userSelect').append($('#hide').html());
        $('#hide').empty();

        checkRegex();
        checkMaxLength();
        isShowCoDept(true);
        $('#<%=ckbIsNeedCoDept.ClientID %>').live('change', function () {
            isShowCoDept(false);
        });
        isShowMaster(true);
        $('#<%=ckbIsNeedMaster.ClientID %>').live('change', function () {
            isShowMaster(false);
        });

        //是否需董事长批
        setChiefInfo(true);
        $('#<%=ckbIsNeedChief.ClientID %>').live('change', function () {
            setChiefInfo(false);
        });
        rblApplyTypeChange();
    }

    function calcContractChangeValue() {
        var orgContractValue = $("#<%= txtOrgContractValue.ClientID%>").val();
        var addContractValue = $("#<%=tbAddContractValue.ClientID %>").val();
        var contractChangeValue = parseFloat(orgContractValue) + parseFloat(addContractValue);
        $("#<%=txtContractChangeValue.ClientID %>").val(contractChangeValue);
    }

    function checkForm() {
        if ($formAction == 0) {

        }
        return true;
    }

    //是否显示副总
    function isShowMaster(isLoad) {
        if (isLoad) {
            var isNeedMaster = $('#<%=hiIsNeedMaster.ClientID%>').val();
            if (isNeedMaster == '1')
                $("#<%=ckbIsNeedMaster.ClientID%>").attr('checked', true);
        }

        if ($("#<%=ckbIsNeedMaster.ClientID%>").is(':checked')) {
            $("[name$='masterSpan']").show();
            $("#<%=lbsMasterName.ClientID%>").attr("req", "1");
            $("#[name$='noMasterSpan']").hide();
            $('#<%=hiIsNeedMaster.ClientID%>').val('1');
        } else {
            $("[name$='masterSpan']").hide();
            $("#<%=lbsMasterName.ClientID%>").removeAttr("req");
            $("#[name$='noMasterSpan']").show();
            $('#<%=hiIsNeedMaster.ClientID%>').val('0');

            //清空选择的主管副总信息
            $('#<%=lbsMasterName.ClientID%>').val('');
            $('#<%=lbsMasterName.ClientID%>_hivalue').val('');
            $('#<%=hiMasterID.ClientID%>').val('');
        }
    }

    //是否显示协办部门
    function isShowCoDept(isLoad) {
        if (isLoad) {
            var isNeedCoDept = $('#<%=hiIsNeedCoDept.ClientID%>').val();
            if (isNeedCoDept == '1')
                $("#<%=ckbIsNeedCoDept.ClientID%>").attr('checked', true);
        }

        if ($("#<%=ckbIsNeedCoDept.ClientID%>").is(':checked')) {
            $("[name$='coDeptSpan']").show();
            $("#<%=lbsCoDeptNames.ClientID%>").attr("req", "1");
            $("[name$='noCoDeptSpan']").hide();
            $('#<%=hiIsNeedCoDept.ClientID%>').val('1');
        } else {
            $("[name$='coDeptSpan']").hide();
            $("#<%=lbsCoDeptNames.ClientID%>").removeAttr("req");
            $("[name$='noCoDeptSpan']").show();

            $('#<%=hiIsNeedCoDept.ClientID%>').val('0');
            //清空选择的协办部门信息
            $('#<%=lbsCoDeptNames.ClientID%>').val('');
            $('#<%=lbsCoDeptNames.ClientID%>_hivalue').val('');
            $('#<%=hiCoDeptIDs.ClientID%>').val('');
        }
    }

    //是否需董事长批
    function setChiefInfo(isLoad) {
        if (isLoad) {
            var isNeedChief = $('#<%=hiIsNeedChief.ClientID%>').val();
            if (isNeedChief == '1') {
                $("#<%=ckbIsNeedChief.ClientID%>").attr('checked', true);
            }
        }

        if ($("#<%=ckbIsNeedChief.ClientID%>").is(':checked')) {
            $('#<%=hiIsNeedChief.ClientID%>').val('1');
        }
        else {
            $('#<%=hiIsNeedChief.ClientID%>').val('0');
        }
    }

    //申请类型变更时,控件显隐
    function rblApplyTypeChange() {
        var selectVal = $("#<%=rblApplyType.ClientID%>").find("input:checked").val();
        if (selectVal == "<%=ContractChangeType.变更.ToString()%>") {
            $("#<%=txtContractChangeValue.ClientID%>").removeAttr("readonly");
            if ($action == 2 || ($action == 3 && $actName == "提交合同")) {
                $("#<%=txtContractChangeValue.ClientID%>").css("BACKGROUND", "#F2F5A9");
            }
            $("[name$='changeShow']").show();
            $("[name$='supplement']").hide();
            $("#<%=tbAddContractValue.ClientID%>").removeAttr("req");
            if ($("#<%=tbContractChangeName.ClientID%>").val() == "") {
                $("#<%=tbContractChangeName.ClientID%>").val($("#<%=lbsOriginalContractName.ClientID%>").val());
            }
        }
        else if (selectVal == "<%=ContractChangeType.补充.ToString()%>") {
            $("#<%=txtContractChangeValue.ClientID%>").attr("readonly", "readonly");
            if ($action == 2 || ($action == 3 && $actName == "提交合同")) {
                $("#<%=txtContractChangeValue.ClientID%>").css("BACKGROUND", "#eef8fc");
            }
            $("[name$='changeShow']").hide();
            $("[name$='supplement']").show();
            $("#<%=tbAddContractValue.ClientID%>").attr("req", "1");
            $("#<%=tbContractChangeName.ClientID%>").val("");
        }
    }
</script>
