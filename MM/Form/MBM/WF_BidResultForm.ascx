<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BidResultForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_BidResultForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<script type="text/javascript" src="<%=WebAppPath %>/EM/UI/Script/EMGeneralScript.js"></script>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            投标计划安排流程任务名称：<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtTaskName" field="TASKNAME" tablename="MBM_BIDRESULTENTITY"
                activestatus="(2.填写投标结果信息)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" req="1" EnableTheming="false" Writeable="false"
                PageWidth="850" OnClick="txtTaskName_Click" ShowAttrs="name,UserCode" ResultForControls="{'hiOldBidPlanFixChangeId':'id','txtBuildDeptName':'CUSTOMERNAME','txtBidNumber':'BIDNUMBER','txtBidNum':'BIDNUM','txtPackageNumber':'PACKAGENUMBER','txtProjectTypeId':'PROJECTTYPENAME','txtTenderCharacter':'TENDERCHARACTER'}"
                PageUrl="~/MM/Obsolete/BidPlanSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOldBidPlanFixChangeId" field="OLDBIDPLANFIXCHANGEID"
                tablename="MBM_BIDRESULTENTITY" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标单位
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBuildDeptName" field="CUSTOMERNAME"
                readonly="readonly" tablename="MBM_BIDRESULTENTITY" class="kpms-textbox" activestatus="(23.填写投标结果信息)(3.修改投标结果信息)"
                MaxLength="128">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBidNumber" field="BIDNUMBER" MaxLength="32"
                readonly="readonly" tablename="MBM_BIDRESULTENTITY" class="kpms-textbox" activestatus="(23.填写投标结果信息)(3.修改投标结果信息)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            标段号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBidNum" field="BIDNUM" MaxLength="32"
                readonly="readonly" tablename="MBM_BIDRESULTENTITY" class="kpms-textbox" activestatus="(23.填写投标结果信息)(3.修改投标结果信息)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            包号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPackageNumber" field="PACKAGENUMBER"
                readonly="readonly" tablename="MBM_BIDRESULTENTITY" class="kpms-textbox" activestatus="(23.填写投标结果信息)(3.修改投标结果信息)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程类型
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectTypeId" field="PROJECTTYPENAME"
                readonly="readonly" tablename="MBM_BIDRESULTENTITY" class="kpms-textbox" activestatus="(23.填写投标结果信息)(3.修改投标结果信息)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            投标性质
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTenderCharacter" field="TENDERCHARACTER"
                readonly="readonly" tablename="MBM_BIDRESULTENTITY" class="kpms-textbox" activestatus="(23.填写投标结果信息)(3.修改投标结果信息)">
            </zhongsoft:XHtmlInputText>
        </td>
        <%-- <td class="td-l">
            是否中标<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsGain" runat="server" RepeatDirection="Horizontal" req="1"
                field="ISGAIN" tablename="MBM_BIDRESULTENTITY" activestatus="(23.填写投标结果信息)(3.修改投标结果信息)">
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0">否</asp:ListItem>
            </asp:RadioButtonList>
        </td>--%>
    </tr>
    <tr>
        <td class="td-l">
            中止原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbCancelReason" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" activestatus="(23.填写投标结果信息)(23.修改投标结果信息)" tablename="MBM_BIDRESULTENTITY"
                field="CANCELREASON" TextMode="MultiLine" maxtext="512" Rows="3" Width="96%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            上传中标通知书
        </td>
    </tr>
    <tr>
        <td colspan="6" align="right">
            <span id="Span1" class="req-star" runat="server" displaystatus="(2.填写投标结果信息)">请先保存再上传附件</span>&nbsp;
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:Button ID="btnUploadCG" runat="server" Text="上传中标通知书" activestatus="(23.填写投标结果信息)(3.修改投标结果信息)"
                OnClientClick="return upLoadFiles()" OnClick="btnUploadCG_Click" />
        </td>
        <td class="td-m" colspan="5">
            <uc1:AttachmentView ID="attNotice" runat="server"></uc1:AttachmentView>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            工程列表
        </td>
    </tr>
    <tr>
        <td colspan="6" align="right" id="tdMsg">
            <span id="Span2" class="req-star" runat="server" displaystatus="(2.填写投标结果信息)">请先保存再带出工程</span>&nbsp;
            <zhongsoft:LightObjectSelector runat="server" ID="txtPackageName" activestatus="(3.填写投标结果信息)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                OnlyShowButton="true" Text="选择包信息" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                FilterFunction="filterPackage()" PageWidth="750" PageUrl="~/MM/Obsolete/BidPackageSelector.aspx"
                OnClick="btnSelectPackage_OnClick"></zhongsoft:LightObjectSelector>
        </td>
    </tr>
    <tr>
        <td colspan="6" style="">
            <asp:Label runat="server" ID="lbTip" ForeColor="Red">如已中标，请填写中标价和预估合同额。如未中标，请填写中标单位</asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvProject" runat="server" ShowExport="true" UseDefaultDataSource="true"
                DataKeyNames="BIDPLANPROJECTID" AllowPaging="true" OnExport="gvProject_Export"
                OnRowDataBound="gvProject_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="MARKETPROJECTNAME" HeaderText="工程名称/包名称" MaxLength="20"
                        Width="200" />
                    <zhongsoft:LightBoundField DataField="MARKETPROJECTCODE" HeaderText="工程编号/包号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightTemplateField HeaderText="投标结果<span class='req-star'>*</span>" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlTenderResult" req="1">
                            </zhongsoft:LightDropDownList>
                            <input type="hidden" runat="server" id="hiTenderResult" value='<%#Eval("TENDERRESULT") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="中标单位名称" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbGainCustomerName" value='<%#Eval("GAINCUSTOMERNAME") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="中标价（万元）" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbGainSum" runat="server" CssClass="kpms-textbox-money"
                                req="1" MaxLength="13" Style="text-align: right; width: 100px" Text='<%#Eval("GAINSUM") %>'
                                regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="中标价请输入正数，最多8位整数，6位小数">
                            </zhongsoft:LightTextBox>
                            <input id="hiBidPlanProjectId" runat="server" type="hidden" value='<%# Eval("BIDPLANPROJECTID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="预估合同额（万元）" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbContractSum" runat="server" CssClass="kpms-textbox-money"
                                req="1" MaxLength="13" Style="text-align: right; width: 100px" Text='<%#Eval("CONTRACTSUM") %>'
                                regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="预估合同额请输入正数，最多8位整数，6位小数">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiBidResultEntityId" field="BIDRESULTENTITYID"
    tablename="MBM_BIDRESULTENTITY" />
<input type="hidden" runat="server" id="hiIsGridPlan" field="ISGRIDPLAN" tablename="MBM_BIDRESULTENTITY" />
<input type="hidden" runat="server" id="hiIsAutoExe" field="ISAUTOEXE" tablename="MBM_BIDRESULTENTITY" />
<script type="text/javascript">

    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();
        displayOfSelPackage();
        $("#<%=gvProject.ClientID %> [id$=ddlTenderResult]").each(function () { changeResult($(this)) });

        $("#<%=gvProject.ClientID %> [id$=ddlTenderResult]").live("change", function () { changeResult($(this)) });
    }

    //上传文件
    function upLoadFiles() {
        showUploadForm($currBizId, "Form");
        return true;
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "填写投标结果信息") {
                if ($("#<%=hiIsGridPlan.ClientID %>").val() == "1") {
                    if ($("#<%=gvProject.ClientID %> [id$=ddlTenderResult]").length < 1) {
                        alert("请选择包信息");
                        return false;
                    }
                }
            }
        }
        return true;
    }


    //是否显示选择包信息
    function displayOfSelPackage() {
        var isAutoExe = $("#<%=hiIsAutoExe.ClientID %>").val();
        if ($("#<%=hiIsGridPlan.ClientID %>").val() == "1" && isAutoExe != "1") {
            $("#tdMsg").show();
        }
        else {
            $("#tdMsg").hide();
        }
    }

    //对工程列表文本框的控制
    function changeResult(obj) {
        var ddlTenderResult = obj.parent('td').find("[id$=ddlTenderResult]").val();
        var customerName = obj.parent('td').parent('tr').find("[id$=tbGainCustomerName]");
        var gainSum = obj.parent('td').parent('tr').find("[id$=tbGainSum]");
        var contractSum = obj.parent('td').parent('tr').find("[id$=tbContractSum]");

        if (ddlTenderResult == "<%=(int)MBMEnum.BidResult.已中标 %>") {
            gainSum.attr("req", "1");
            contractSum.attr("req", "1");
            customerName.removeAttr("req", "1");
            customerName.val("");
        }
        else if (ddlTenderResult == "<%=(int)MBMEnum.BidResult.未中标 %>") {
            customerName.attr("req", "1");
            gainSum.removeAttr("req");
            contractSum.removeAttr("req");
            gainSum.val("");
            contractSum.val("");
        }
        else {
            customerName.removeAttr("req");
            gainSum.removeAttr("req");
            contractSum.removeAttr("req");
            customerName.val("");
            gainSum.val("");
            contractSum.val("");
        }
    }

    //选择包信息
    function filterPackage() {
        var bidPlanID = $("#<%=hiOldBidPlanFixChangeId.ClientID %>").val();
        return "{BidPlanFixChangeID:'" + bidPlanID + "'}";
    }

</script>
