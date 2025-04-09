<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BidProductForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_BidProductForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l" nowrap>工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtTaskName" field="TASKNAME" tablename="MM_BIDPRODUCTENTITY"
                activestatus="(23.编写投标文件)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                SelectPageMode="Dialog" DoCancel="true" ResultAttr="name" req="1" EnableTheming="false"
                Writeable="false" PageWidth="850" ShowAttrs="name,UserCode" ResultForControls="{'hiTenderEntityID':'id','txtCustomerName':'BidUnitName','hiParamProjectTypeID':'ParamProjectTypeID','txtBidOrgDeptName':'DutyDeptName'}"
                OnClick="txtTaskName_Click" PageUrl="~/MM/Obsolete/TenderEntitySelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiTenderEntityID" field="TenderEntityID"
                tablename="MM_BIDPRODUCTENTITY" />
            <input type="hidden" runat="server" id="hiParamProjectTypeID" field="ParamProjectTypeID"
                tablename="MM_BIDPRODUCTENTITY" />
        </td>
        <td class="td-l" style="display: none">投标阶段
        </td>
        <td class="td-r" style="display: none">
            <zhongsoft:LightDropDownList ID="ddlPhaseID" Field="ParamPhaseID" tableName="MM_BIDPRODUCTENTITY"
                Width="200px" activestatus="(23.编写投标文件)" runat="server">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiParamPhaseID" field="ParamPhaseID" tablename="MM_BIDPRODUCTENTITY" />
        </td>
    </tr>
    <tr>
        <td class="td-l">投标承办部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBidOrgDeptName" field="DutyDeptName"
                readonly="readonly" tablename="MM_BIDPRODUCTENTITY" class="kpms-textbox" activestatus="(23.编写投标文件)"
                MaxLength="128">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">招标单位
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCustomerName" field="BidUnitName"
                readonly="readonly" tablename="MM_BIDPRODUCTENTITY" class="kpms-textbox" activestatus="(23.编写投标文件)"
                MaxLength="128">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">评审类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:CheckBoxList runat="server" ID="cbReviewType" activestatus="(23.编写投标文件)" req="1"
                RepeatDirection="Horizontal">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiReviewType" field="ReviewType" tablename="MM_BIDPRODUCTENTITY" />
        </td>
        <td class="td-l">评审时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtReviewDate" tablename="MM_BIDPRODUCTENTITY"
                readonly="readonly" class="kpms-textbox-date" field="ReviewDate" activestatus="(23.编写投标文件)" req="1"/>
        </td>
        <td class="td-l">评审地点<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbReviewAddress" field="ReviewAddress"
                tablename="MM_BIDPRODUCTENTITY" MaxLength="128" activestatus="(23.编写投标文件)" req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">评审方式 <span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlJUDGETYPE" runat="server" field="JUDGETYPE" req="1"
                tablename="MM_BIDPRODUCTENTITY" activestatus="(23.编写投标文件)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">是否需要澄清<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList ID="rblISCLARIFY" runat="server" RepeatDirection="Horizontal"
                activestatus="(23.编写投标文件)" field="ISCLARIFY" tablename="MM_BIDPRODUCTENTITY"
                req="1">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">主持人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbosHostName" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiHostUserID':'id'}" EnableTheming="false"
                PageWidth="800px" Width="100px" Text="选择评审人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.编写投标文件)"
                TableName="MM_BIDPRODUCTENTITY" field="HostUserName" />
            <input type="hidden" runat="server" id="hiHostUserID" tablename="MM_BIDPRODUCTENTITY"
                field="HostUserID" />
        </td>
        <td class="td-l">评审人员
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectUsers" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiReviewUserIDs':'id'}" EnableTheming="false"
                PageWidth="800px" Text="选择评审人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.编写投标文件)"
                TableName="MM_BIDPRODUCTENTITY" field="ReviewUserNames" />
            <input type="hidden" runat="server" id="hiReviewUserIDs" tablename="MM_BIDPRODUCTENTITY"
                field="ReviewUserIDs" />
        </td>
    </tr>
    <tr>
        <td class="td-l">评审意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbReviewOpinion" CssClass="kpms-textarea" runat="server"
                activestatus="(23.编写投标文件)" TextMode="MultiLine" EnableTheming="false"
                maxtext="512" tablename="MM_BIDPRODUCTENTITY" field="ReviewOpinion" editFirst="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">评审结论
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="txtReviewConclusion" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" activestatus="(23.编写投标文件)" EnableTheming="false"
                maxtext="512" tablename="MM_BIDPRODUCTENTITY" field="ReviewConclusion" editFirst="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">相关附件
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                DisplayStatus="(3.编写投标文件)" OnClick="lbtnUpload_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                    id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
            <uc1:AttachmentView ID="attNotice" runat="server"></uc1:AttachmentView>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否需要其他部门评审
        </td>
        <td class="td-r">
            <asp:CheckBox runat="server" ID="ckbIsNeedOtherAppDept" activestatus="(23.编写投标文件)" tablename="MM_BIDPRODUCTENTITY"
                          field="IsNeedOtherAppDept" onclick="isShowOtherAppDept();" />
        </td>
        <td class="td-l" name="OtherAppDeptTd" style="display: none">评审部门<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3" name="OtherAppDeptTd" style="display: none">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsOtherAppDeptNames" ResultAttr="name" Writeable="False" SelectPageMode="Dialog"
                                           PageUrl="../../../Sys/OrgUsers/OrgSelector.aspx" activestatus="(23.编写投标文件)" field="OtherAppDeptNames"
                                           ResultForControls="{'hiOtherAppDeptIDs':'id'}" IsMutiple="True"
                                           tablename="MM_BIDPRODUCTENTITY" ShowJsonRowColName="True" />
            <input type="hidden" runat="server" id="hiOtherAppDeptIDs" tablename="MM_BIDPRODUCTENTITY" field="OtherAppDeptIDs" />
        </td>
        <td class="td-m" colspan="4" name="noOtherAppDeptTd"></td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiBidProductEntityId" field="BIDPRODUCTENTITYID"
    tablename="MM_BIDPRODUCTENTITY" />
<script type="text/javascript">

    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();
        isShowOtherAppDept();
    }

    //上传文件
    function upLoadFiles() {
        showUploadForm($currBizId, "Form");
        return true;
    }

    function afterSelProject() {

    }
    function checkForm() {
        if ($formAction == 2) {
            <%--if ($actName == "编写投标文件") {
                var grid = $("#<%=hiTenderEntityID.ClientID%>").val();
                if (grid == "" || grid == undefined) {
                    alert("请先选择工程！");
                    return false;
                } else {
                    return true;
                }
            }--%>
        }
        return true;
    }

    //是否显示评审部门
    function isShowOtherAppDept() {
        if ($("#<%=ckbIsNeedOtherAppDept.ClientID%>").is(':checked')) {
            $("[name$='OtherAppDeptTd']").show();
            $("#<%=lbsOtherAppDeptNames.ClientID%>").attr("req", "1");
            $("[name$='noOtherAppDeptTd']").hide();
        } else {
            $("[name$='OtherAppDeptTd']").hide();
            $("#<%=lbsOtherAppDeptNames.ClientID%>").removeAttr("req");
            $("[name$='noOtherAppDeptTd']").show();
        }
    }
</script>
