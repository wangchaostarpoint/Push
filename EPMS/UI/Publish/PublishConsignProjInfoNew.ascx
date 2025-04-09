<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishConsignProjInfoNew.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishConsignProjInfoNew" %>
<table class="tz-table" width="100%" id="Table1">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('projDetail')">
            <span id="projInfo2">出版委托信息</span>&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="projDetail">
    <tr>
        <td class="td-l">项目名称<span id="red" class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" IsMutiple="false"
                field="ProjectName" tablename="EPMS_PublishConsign" SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtManagerUserName':'ManagerUserName'}"
                EnableTheming="false" Text="选择项目名称" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)(23.出版委托)" OnClick="lbsProjectName_Click" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)(23.出版委托)"
                class="kpms-textbox" readonly="readonly" field="ProjectCode" tablename="EPMS_PublishConsign" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出版任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPublishConsignName" activestatus="(23.*)(23.出版委托)"
                class="kpms-textbox" TableName="EPMS_PublishConsign" Field="PublishConsignName" req="1" />
        </td>
        <td class="td-l">设计人员<span class="req-star">*</span></td>
        <td><zhongsoft:LightObjectSelector runat="server" ID="lboDesignerName" TableName="EPMS_PublishConsign"
                Field="DesignerName" activestatus="(23.出版委托)" SelectPageMode="Dialog" 
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hidDesignerID':'id','hidDesignerCode':'UserCode'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input id="hidDesignerID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                field="DesignerID" />
            <input id="hidDesignerCode" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                field="DesignerCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出版编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRecordNumber" runat="server" activestatus="(23.*)(23.出版委托)"
                TableName="EPMS_PublishConsign" Field="RecordNumber" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">缓急程度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlImportantLevel" runat="server" TableName="EPMS_PublishConsign"
                Field="ImportantLevel" activestatus="(23.出版委托)(23.安排出版)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">委托人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lboConsignUserName" TableName="EPMS_PublishConsign"
                Field="ConsignUserName" activestatus="(23.出版委托)(23.修改采购申请单)" SelectPageMode="Dialog" 
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'ConsignUserID':'id','txtConsignDeptName':'OrgUnitName','hiConsignDeptID':'OrgUnitId'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiConsignUserID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                field="ConsignUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">委托人电话<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.*)(23.出版委托)"
                class="kpms-textbox" readonly="readonly" Visible="false" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignUserTel" activestatus="(23.*)(23.出版委托)"
                class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConsignUserTel" req="1" />
        </td>
        <td class="td-l">委托部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConsignDeptName" runat="server" TableName="EPMS_PublishConsign"
                Field="ConsignDeptName" activestatus="(23.*)(23.出版委托)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiConsignDeptID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                field="ConsignDeptID" />
        </td>
        <td class="td-l">委托出版日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConsignTime" runat="server" TableName="EPMS_PublishConsign"
                Field="ConsignTime" activestatus="(23.出版委托)(23.安排出版)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">要求出版日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRequireCompleteTime" runat="server" TableName="EPMS_PublishConsign"
                Field="RequireCompleteTime" activestatus="(23.出版委托)(23.安排出版)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">所属部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlDept" TableName="EPMS_PublishConsign"
                Field="BelongDeptID" activestatus="(23.出版委托)" req="1"
                OnSelectedIndexChanged="ddlDept_SelectedIndexChanged" AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiDeptName" tablename="EPMS_PublishConsign" field="BelongDeptName" />
        </td>
        <td class="td-l">所属专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" req="1" activestatus="(23.出版委托)"
                OnSelectedIndexChanged="ibtnSelectSpe_Click" AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiBelongSpecialtyID" tablename="EPMS_PublishConsign"
                field="BelongSpecialtyID" />
            <input type="hidden" runat="server" id="hiBelongSpecialtyCode" tablename="EPMS_PublishConsign"
                field="BelongSpecialtyCode" />
            <input type="hidden" runat="server" id="hiBelongSpecialtyName" tablename="EPMS_PublishConsign"
                field="BelongSpecialtyName" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出版要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.出版委托)(23.安排出版)" field="Memo" tablename="EPMS_PublishConsign"
                TextMode="MultiLine" maxtext="512" Rows="4">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<%--出版状态 --%>
<input type="hidden" runat="server" id="hiPublishState" field="PublishState" tablename="EPMS_PublishConsign" />
<%--计费状态--%>
<input type="hidden" runat="server" id="hiChargeState" field="ChargeState" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiPublishConsignID" tablename="EPMS_PublishConsign"
    field="PublishConsignID" />
<%--当前出版单的卷册任务ID--%>
<input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_PublishConsign"
    field="WBSID" />
<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName"
    tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiFlag" tablename="EPMS_PublishConsign" field="Flag" />
<%--缓急程度默认值--%>
<input type="hidden" runat="server" id="hiImportantLevel" value="平件" />

<script type="text/javascript">


</script>