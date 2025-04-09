<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WorkContactForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_WorkContactForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectGrid.ascx" TagName="ProjectGrid" TagPrefix="uc1" %>
<script type="text/javascript">
    function initCustomerPlugin() {
        if (typeof (initProjectGrid) == 'function') {
            initProjectGrid();
        }
    }

    function checkForm() {
        if ($formAction == 0) {//0 表示发送
            //必须选定一个主项目
            //            if ($actName == "填写工作联系单" || $actName == "重新填写工作联系单" || "编写问题请决单" || "编制预案") {
            //                var json = { "bizid": "<%=BusinessObjectId %>" };
            //                var count = formCallback("MajorProjectNum", json);
            //                if (count > 0) {
            //                    return true;
            //                } else {
            //                    alert("请添加项目并指定一个主项目");
            //                    return false;
            //                }
            //            }

        }
        return true;
    }
</script>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="td-m flexible">
            联系单信息
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)"
                TableName="EPMS_WorkContactForm" field="ProjectName" OnClick="lbsSelectProject_Click" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)" maxlength="16"
                class="kpms-textbox" TableName="EPMS_WorkContactForm" field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_WorkContactForm"
                field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工作主题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbWorkTheme" req="1" MaxLength="256" tablename="EPMS_WorkContactForm"
                field="WorkTheme" activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            重大事项
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsImportant" runat="server" RepeatDirection="Horizontal"
                field="WorkContactType" tablename="EPMS_WorkContactForm" activestatus="(23.设计总工程师审核)">
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            提出人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" ResultForControls="{'hiPutUserID':'id','txtPutDeptName':'OrgUnitName','hiPutUserID':'OrganizationId'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="EPMS_WorkContactForm"
                field="PutUserName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPutUserID" tablename="EPMS_WorkContactForm"
                field="PutUserID" />
        </td>
        <td class="td-l">
            提出部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPutDeptName" readonly="readonly"
                class="kpms-textbox" tablename="EPMS_WorkContactForm" field="PutDeptName" activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiPutDeptID" tablename="EPMS_WorkContactForm"
                field="PutDeptID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提出专业
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlPutSpecialty" activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)"
                OnSelectedIndexChanged="ddlPutSpecialty_SelectedIndexChanged" AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiPutSpecialtyID" tablename="EPMS_WorkContactForm"
                field="PutSpecialtyID" />
            <input type="hidden" runat="server" id="hiPutSpecialtyName" tablename="EPMS_WorkContactForm"
                field="PutSpecialtyName" />
        </td>
       <%-- <td class="td-l">
            提出专业代字
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPutSpecialtyCode" readonly="readonly"
                class="kpms-textbox" tablename="EPMS_WorkContactForm" field="PutSpecialtyCode"
                activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)">
            </zhongsoft:XHtmlInputText>
        </td>--%>
        <td class="td-l">
            提出时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtExpireDate" runat="server" type="text" class="kpms-textbox-date"
                tablename="EPMS_WorkContactForm" field="PutDate" readonly="readonly" activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)" />
        </td>
        <td class="td-r" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">
            联系工作内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbWorkContent" req="1" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="2048" tablename="EPMS_WorkContactForm"
                field="WorkContent" activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <uc1:ProjectGrid runat="server" ID="ucProjectGrid" Visible="false" />
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="1024" tablename="EPMS_WorkContactForm" field="Memo"
                activestatus="(23.填写工作联系单)(23.重新填写工作联系单)(23.编写问题请决单)(23.编制预案)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiWorkContactFormID" tablename="EPMS_WorkContactForm"
    field="WorkContactFormID" />
