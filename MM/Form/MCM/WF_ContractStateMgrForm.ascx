<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractStateMgrForm.ascx.cs" Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_ContractStateMgrForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<table class="tz-table">
    <tr>
        <td class="td-l">合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsContractName" Writeable="False" SelectPageMode="Dialog" IsMutiple="False"
                tablename="MM_ContractStateMgr" field="ContractName" PageUrl="../../Obsolete/ContractSelector.aspx" PageWidth="800" PageHeight="600" 
                activestatus="(23.填写相关信息)(3.修改相关信息)" ResultAttr="name" ShowJsonRowColName="True" req="1" Filter="{BaseType: '0'}"
                ResultForControls="{'txtContractCode':'ContractCode','hiContractID':'id','txtCurrentState':'ContractState','txtHadCharge':'HadCharge','txtContractValue':'ContractValue'}" OnClick="lbsContractName_OnClick" />
            <input type="hidden" runat="server" id="hiContractID" tablename="MM_ContractStateMgr" field="ContractID" />
        </td>
        <td class="td-l">合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContractCode" class="kpms-textbox" readonly="readonly" tablename="MM_ContractStateMgr" field="ContractCode"
                activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">当前合同状态
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCurrentState" class="kpms-textbox" readonly="readonly" tablename="MM_ContractStateMgr" field="CurrentState"
                activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
        <td class="td-l">调整合同状态<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblAdjustState" RepeatDirection="Horizontal" tablename="MM_ContractStateMgr" field="AdjustState"
                activestatus="(23.填写相关信息)(3.修改相关信息)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">合同金额（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContractValue" class="kpms-textbox-money" readonly="readonly" tablename="MM_ContractStateMgr" field="ContractValue"
                activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
        <td class="td-l">已收费（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtHadCharge" class="kpms-textbox-money" readonly="readonly" tablename="MM_ContractStateMgr" field="HadCharge"
                activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
        <td class="td-l">已完成合同产值（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtFinishValue" class="kpms-textbox-money" readonly="readonly" tablename="MM_ContractStateMgr" field="FinishValue"
                activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">是否需分管领导
        </td>
        <td class="td-r">
            <%--<asp:RadioButtonList runat="server" ID="rblIsNeedLeader" RepeatDirection="Horizontal" tablename="MM_ContractStateMgr" field="IsNeedLeader"
                                 activestatus="(23.填写相关信息)(3.修改相关信息)(3.审核)" req="1" />--%>
            <asp:CheckBox runat="server" ID="ckbIsNeedLeader" tablename="MM_ContractStateMgr" field="IsNeedLeader"
                          activestatus="(23.填写相关信息)(3.修改相关信息)(3.审核)"/>
        </td>
        <td class="td-l">是否需其他部门
        </td>
        <td class="td-r">
            <%--<asp:RadioButtonList runat="server" ID="rblIsNeedOtherDept" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)(3.修改相关信息)" tablename="MM_ContractStateMgr"
                field="IsNeedOtherDept" onclick="isShowOtherDept();" req="1" />--%>
            <asp:CheckBox runat="server" ID="ckbIsNeedOtherDept" activestatus="(23.填写相关信息)(3.修改相关信息)" tablename="MM_ContractStateMgr"
                          field="IsNeedOtherDept" onclick="isShowOtherDept();"/>
        </td>
        <td class="td-l" name="otherDeptSpan" style="display: none">其他部门<span class="req-star">*</span>
        </td>
        <td class="td-r" name="otherDeptSpan" style="display: none">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsOtherDepts" ResultAttr="name" Writeable="False" SelectPageMode="Dialog"
                PageUrl="../../../Sys/OrgUsers/OrgSelector.aspx" activestatus="(23.填写相关信息)(3.修改相关信息)" field="OtherDeptNames"
                ResultForControls="{'hiOtherDeptIDs':'id'}" IsMutiple="True"
                tablename="MM_ContractStateMgr" ShowJsonRowColName="True" />
        </td>
        <td class="td-m" colspan="2" name="noOtherDeptSpan"></td>
    </tr>
    <tr>
        <td class="td-l">是否调整状态<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblIsAdjust" RepeatDirection="Horizontal" tablename="MM_ContractStateMgr" field="IsAdjust"
                activestatus="(3.审核)(3.批准)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>关联工程信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvContractReleMProj" runat="server" UseDefaultDataSource="true"
                DataKeyNames="ContractReleMProjID" BindGridViewMethod="BindData">
                <Columns>
                    <zhongsoft:LightBoundField DataField="ProjectPackage" HeaderText="所属工程包" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MarketProjectName" HeaderText="工程名称" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MarketProjectCode" HeaderText="工程编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ChargeOfficerName" HeaderText="收费负责人" />
                    <zhongsoft:LightBoundField DataField="EstimateContractValNew" HeaderText="估算产值（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractValueNew" HeaderText="合同产值（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightBoundField DataField="ChargedValueNew" HeaderText="已收费（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightBoundField HeaderText="已完成合同产值（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">调整原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbAdjustReason" TextMode="MultiLine" Rows="5" EnableTheming="False" CssClass="kpms-textarea"
                tablename="MM_ContractStateMgr" field="AdjustReason" MaxLength="1024" req="1" activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" Rows="5" EnableTheming="False" CssClass="kpms-textarea"
                tablename="MM_ContractStateMgr" field="Memo" MaxLength="1024" activestatus="(23.填写相关信息)(3.修改相关信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">相关附件
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(3.填写相关信息)(3.修改相关信息)" OnClick="lbtnUpload_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                    id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
            <uc3:UpLoadFile ID="uploadFile" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiContractStateMgrID" tablename="MM_ContractStateMgr" field="ContractStateMgrID" />
<input type="hidden" runat="server" id="hiAdjustDate" tablename="MM_ContractStateMgr" field="AdjustDate" />
<input type="hidden" runat="server" id="hiOtherDeptIDs" tablename="MM_ContractStateMgr" field="OtherDeptIDs" />
<input type="hidden" runat="server" id="hiFormType" tablename="MM_ContractStateMgr" field="FormType"/>
<script type="text/javascript">

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        isShowOtherDept();
    }

    function checkForm() {
        if ($formAction == 0) {

        }
        return true;
    }

    //根据是否需要其他部门 控制其他部门的必填
    function isShowOtherDept() {
        if ($("#<%=ckbIsNeedOtherDept.ClientID%>").is(':checked')) {
            $("[name$='otherDeptSpan']").show();
            $("#<%=lbsOtherDepts.ClientID%>").attr("req","1");
            $("[name$='noOtherDeptSpan']").hide();
        } else {
            $("[name$='otherDeptSpan']").hide();
            $("#<%=lbsOtherDepts.ClientID%>").removeAttr("req");
            $("[name$='noOtherDeptSpan']").show();
        }
    }
</script>
