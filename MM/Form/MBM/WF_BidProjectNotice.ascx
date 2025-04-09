<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BidProjectNotice.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_BidProjectNotice" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" field="MARKETPROJECTNAME"
                tablename="MBM_TenderEntity" SourceMode="SelectorPage" ShowJsonRowColName="true"
                SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)"
                PageWidth="800px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                AfterSelect="formateDate()" ResultForControls="{'hiTenderEntityID':'id','hiNoticeTenderEntityID':'id','txtCustomerName':'BIDCUSTOMERNAME','txtInviteUnitName':'INVITEUNITNAME','txtStartBidDay':'STARTBIDDATE','txtOpenAddress':'BidOpenAddress','tbInviteContent':'INVITECONTENT',txtProjectAddress:'ProjectAddress'}"
                PageUrl="~/MM/Obsolete/TenderEntitySelector.aspx" req="1"></zhongsoft:LightObjectSelector>
        </td>
        <td class="td-l">
            工程地点
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectAddress" field="ProjectAddress"
                class="kpms-textbox" readonly="readonly" tablename="MBM_TenderEntity" MaxLength="128"
                activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标单位
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCustomerName" field="BIDCUSTOMERNAME"
                class="kpms-textbox" readonly="readonly" tablename="MBM_TenderEntity" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            招标代理单位
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtInviteUnitName" field="INVITEUNITNAME"
                class="kpms-textbox" readonly="readonly" tablename="MBM_TenderEntity" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            开标地点
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtOpenAddress" field="BidOpenAddress"
                class="kpms-textbox" readonly="readonly" tablename="MBM_TenderEntity" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            开标日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDay" tablename="MBM_TenderEntity"
                readonly="readonly" class="kpms-textbox-date" field="STARTBIDDATE" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投标承办部门
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlBelongDept" Field="BIDORGDEPTID" tableName="MBM_TENDERENTITY"
                activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)" runat="server">
            </zhongsoft:LightDropDownList>
            <input id="hiBelongDeptName" type="hidden" field="BIDORGDEPTNAME" runat="server"
                tablename="MBM_TENDERENTITY" />
        </td>
        <td class="td-l">
            市场部联系人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbosUMarketContactName" field="MarketContactName"
                SelectPageMode="Dialog" tablename="MBM_BidProjectInitNotice" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px"
                PageWidth="800px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiMarketContactID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input id="hiMarketContactID" runat="server" type="hidden" tablename="MBM_BidProjectInitNotice"
                field="MarketContactID" />
        </td>
        <td class="td-l">
            委托授权人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsConsignerName" field="ConsignerName"
                SelectPageMode="Dialog" tablename="MBM_BidProjectInitNotice" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)"
                PageWidth="800px" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiConsignerID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input id="hiConsignerID" runat="server" type="hidden" tablename="MBM_BidProjectInitNotice"
                field="ConsignerID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            商务标牵头承办部门
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlUndertakeDept" Field="UNDERTAKEDEPTID" tableName="MBM_TENDERENTITY"
                activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)" runat="server">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiUndertakeDeptName" field="UNDERTAKEDEPTNAME"
                tablename="MBM_TENDERENTITY" />
        </td>
        <td class="td-l">
            编标日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtBidCompilationDate" tablename="MBM_TenderEntity"
                readonly="readonly" class="kpms-textbox-date" field="BidCompilationDate" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)" />
        </td>
        <td class="td-l">
            拟聘项目负责人<br />
            （或项目经理）
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsBusinessDirector" field="ProjectLeaderName"
                SelectPageMode="Dialog" tablename="MBM_BidProjectInitNotice" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)"
                PageWidth="800px" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiProjectLeaderID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input id="hiProjectLeaderID" runat="server" type="hidden" tablename="MBM_BidProjectInitNotice"
                field="ProjectLeaderID" />
        </td>
    </tr>
    <tr>
     <td class="td-l">
            技术标牵头承办部门
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlTechDept" Field="TECHDEPTID" tableName="MBM_TENDERENTITY"
                activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)" runat="server">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiTechDeptName" field="TECHDEPTNAME"
                tablename="MBM_TENDERENTITY" />
        </td>
        <td colspan="4"></td>
    </tr>
    <tr>
        <td class="td-l">
            投标项目内容概况
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbInviteContent" CssClass="kpms-textarea" runat="server"
                activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)" TextMode="MultiLine" EnableTheming="false"
                maxtext="512" tablename="MBM_TENDERENTITY" field="INVITECONTENT" editFirst="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            市场部意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="txtMarketOpinion" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" activestatus="(23.填写《投标立项通知单》)(3.修改《投标立项通知单》)" EnableTheming="false"
                maxtext="512" tablename="MBM_BidProjectInitNotice" field="MarketOpinion" editFirst="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!----投标工程扩展表主键ID---->
<input type="hidden" runat="server" id="hiTenderEntityID" tablename="MBM_TENDERENTITY"
    field="TENDERENTITYID" />
<!----投标工程扩展表主键ID---->
<input type="hidden" runat="server" id="hiNoticeTenderEntityID" tablename="MBM_BidProjectInitNotice"
    field="TENDERENTITYID" />
<!--主键ID-->
<input type="hidden" runat="server" id="hiBidProjectInitNoticeID" field="BidProjectInitNoticeID"
    tablename="MBM_BidProjectInitNotice" />
<script>
    //格式化开标日期
    function formateDate() {
        var startBidDay = $("#<%=txtStartBidDay.ClientID %>").val();
        if (startBidDay != "") {
            $("#<%=txtStartBidDay.ClientID %>").val(parseDate(startBidDay));
        }
        return false;
    }
</script>
