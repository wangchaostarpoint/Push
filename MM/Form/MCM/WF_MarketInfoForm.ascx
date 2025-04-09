<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MarketInfoForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_MarketInfoForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            信息名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtInfoName" runat="server" class="kpms-textbox" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)"
                MaxLength="64" req="1" field="INFONAME" tablename="MDM_MARKETINFO" />
        </td>
        <td class="td-l">
            信息编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtInfoSerialId" runat="server" class="kpms-textbox"
                readonly="readonly" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)" MaxLength="32"
                field="INFOSERIALLD" tablename="MDM_MARKETINFO" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提供者<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsOfferManName" SourceMode="SelectorPage"
                SelectPageMode="Dialog" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ResultAttr="name"
                PageWidth="800" ActiveStatus="(23.*)(23.录入市场信息)(3.修改市场信息)" req="1" ResultForControls="{'hidOfferManID':'id','hidOfferManCode':'UserCode','txtOfferManDeptName':'DEPTNAME','hiOfferManDeptID':'DEPTID'}"
                field="OFFERMANNAME" tablename="MDM_MARKETINFO" />
            <input id="hidOfferManCode" type="hidden" runat="server" tablename="MDM_MARKETINFO"
                field="OFFERMANCODE" />
            <input id="hidOfferManID" type="hidden" runat="server" tablename="MDM_MARKETINFO"
                field="OFFERMANID" />
        </td>
        <td class="td-l">
            提供者部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtOfferManDeptName" runat="server" class="kpms-textbox"
                ActiveStatus="(23.*)(23.录入市场信息)(3.修改市场信息)" field="OFFERMANDEPTNAME" tablename="MDM_MARKETINFO"
                readonly="readonly" />
            <input id="hiOfferManDeptID" type="hidden" runat="server" tablename="MDM_MARKETINFO"
                field="OFFERMANDEPTID" />
        </td>
        <td class="td-l">
            提供时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbOfferDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" field="OFFERDATE" tablename="MDM_MARKETINFO" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投资单位<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsInvestDept" ResultForControls="{'hiInvestDept':'id'}"
                SelectPageMode="Dialog" SourceMode="SelectorPage" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"
                ResultAttr="name" ActiveStatus="(23.*)(23.录入市场信息)(3.修改市场信息)" req="1" field="INVESTDEPT"
                tablename="MDM_MARKETINFO" />
            <input id="hiInvestDept" type="hidden" runat="server" tablename="MDM_MARKETINFO"
                field="INVESTDEPTID" />
        </td>
        <td class="td-l">
            信息跟踪负责人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsInfoFollowManName" ResultForControls="{'hidInfoFollowManID':'id'}"
                PageWidth="800" SourceMode="SelectorPage" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                ResultAttr="name" SelectPageMode="Dialog" ActiveStatus="(23.*)(23.录入市场信息)(3.修改市场信息)"
                req="1" field="INFOFOLLOWMANNAME" tablename="MDM_MARKETINFO" Width="100px" />
            <input id="hidInfoFollowManID" type="hidden" runat="server" tablename="MDM_MARKETINFO"
                field="INFOFOLLOWMANID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            信息来源<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtInfoSource" runat="server" class="kpms-textbox"
                activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)" MaxLength="32" req="1" field="INFOSOURCE"
                tablename="MDM_MARKETINFO" />
        </td>
        <td class="td-l">
            信息类型 <span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlMarketType" runat="server" field="INFOTYPE" req="1"
                tablename="MDM_MARKETINFO" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            是否被采用<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <asp:RadioButtonList ID="rblIsUse" runat="server" RepeatDirection="Horizontal" activestatus="(23.*)(23.处理结果反馈确认)"
                field="ISUSE" tablename="MDM_MARKETINFO" req="1">
            </asp:RadioButtonList>
        </td>
    </tr>
     <tr>
        <td class="td-l">
            当前状态<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightDropDownList ID="ddlINFOTSTATE" runat="server" field="INFOTSTATE" req="1"
                tablename="MDM_MARKETINFO" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            信息主要内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMarketInfoContent" runat="server" maxtext="512" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" req="1" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)"
                Field="INFOCONTENT" TableName="MDM_MARKETINFO" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectContent" runat="server" maxtext="512" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)"
                Field="PROJECTCONTENT" TableName="MDM_MARKETINFO" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目建设计划
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectPlan" runat="server" maxtext="512" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)"
                Field="PROJECTPLAN" TableName="MDM_MARKETINFO" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投资进展情况
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbInvestFareState" runat="server" maxtext="512" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)"
                Field="INVESTFARESTATE" TableName="MDM_MARKETINFO" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" maxtext="1024" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" activestatus="(23.*)(23.录入市场信息)(3.修改市场信息)"
                Field="MEMO" TableName="MDM_MARKETINFO" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            信息处理意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbInfoOpinion" runat="server" maxtext="512" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" activestatus="(23.*)(23.组织跟踪处理)" Field="INFOOPINION"
                TableName="MDM_MARKETINFO" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            信息跟踪情况及处理意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="LightTextBox1" runat="server" maxtext="1024" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" activestatus="(23.*)(23.填写跟踪处理结果)"
                Field="INFOFOLLOWOPINION" TableName="MDM_MARKETINFO" />
        </td>
    </tr>
</table>
<input id="hiFormID" type="hidden" runat="server" tablename="MDM_MARKETINFO" field="MARKERINFOID" />
<input type="hidden" runat="server" id="hiFlag" tablename="MDM_MARKETINFO" field="Flag" />
<script type="text/javascript">
</script>
