<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BidProjectReview.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_BidProjectReview" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            录入方式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbFillType" field="FillType" tablename="MBM_TenderEntity"
                req="1" activestatus="(2.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(2.台帐新建)" RepeatDirection="Horizontal">
                <asp:ListItem Text="手动录入" Value="0"></asp:ListItem>
                <asp:ListItem Text="从库中选择" Value="1"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <table class="choose-table" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <zhongsoft:XHtmlInputText runat="server" ID="txtMarketProjectName" field="MARKETPROJECTNAME"
                            clearEmpty="true" tablename="MBM_TenderEntity" class="kpms-textbox" req="1" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                            MaxLength="256" style="width: 100%">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td id="noProjectShow" valign="middle" style="width: 20px">
                        <asp:LinkButton runat="server" ID="lbtnSelTask" CssClass="btn-look-up" EnableTheming="false"
                            OnClientClick="return selMarketProject();" displaystatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.*)">
                          <img title="选择任务" src="<%=WebAppPath %>/Themes/Images/look-up.gif">
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
            <input type="hidden" runat="server" id="hiMarketProjectCode" field="MarketProjectCode"
                tablename="MBM_TenderEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程地点<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectAddress" field="ProjectAddress" req="1"
                tablename="MBM_TenderEntity" MaxLength="128" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="losCustomerName" field="BIDCUSTOMERNAME"
                tablename="MBM_TenderEntity" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                req="1" clearEmpty="true" SourceMode="SelectorPage" ShowJsonRowColName="true"
                SelectPageMode="Dialog" DoCancel="true" ResultAttr="name" EnableTheming="false"
                Writeable="false" ShowAttrs="name" ResultForControls="{'hiCustomerID':'id','tbCustomerAddress':'ADDRESS'}"
                PageUrl="~/MM/Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiCustomerID" field="BIDCUSTOMERID" clearempty="true"
                tablename="MBM_TenderEntity" />
        </td>
        <td class="td-l">
            招标单位联系人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContactName" field="BIDCONTACTMANNAME"
                clearEmpty="true" tablename="MBM_TenderEntity" SelectPageMode="Dialog" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                BeforeSelect="beforeSelContact()" Writeable="false" ShowAttrs="name" PageUrl="~/MM/Obsolete/CustomerContactSelector.aspx"
                FilterFunction="contactFilter()" ResultForControls="{'hiContactID':'id','txtContactPhone':'PHONE'}"
                req="1"></zhongsoft:LightObjectSelector>
            <input id="hiContactID" type="hidden" field="BIDCONTACTMANID" runat="server" clearempty="true"
                tablename="MBM_TenderEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContactPhone" field="BIDCONTACTMANPHONE"
                clearEmpty="true" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                class="kpms-textbox" tablename="MBM_TenderEntity" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            招标代理单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbInviteUnitName" field="INVITEUNITNAME" req="1"
                tablename="MBM_TenderEntity" MaxLength="128" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标代理单位联系人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbInviteUnitContactName" field="InviteUnitContactName" req="1"
                tablename="MBM_TenderEntity" MaxLength="16" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            招标代理单位联系电话<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbInviteUnitPhone" field="InviteUnitPhone" req="1"
                tablename="MBM_TenderEntity" MaxLength="16" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            工程类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" tablename="MBM_TenderEntity"
                clearEmpty="true" field="PROJECTTYPEID" req="1" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiOldProjectType" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程总投资（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbStaticInvestAmount" runat="server" class="kpms-textbox-money" req="1"
                activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)" EnableTheming="false"
                Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" field="STATICINVESTAMOUNT" tablename="MBM_TenderEntity"
                Style="text-align: right; width: 120px" errmsg="工程总投资请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            资金来源及到位情况<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox runat="server" ID="tb" field="FundsInfo" tablename="MBM_TenderEntity" req="1"
                MaxLength="128" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            开标日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDay" req="1"
                tablename="MBM_TenderEntity" readonly="readonly" class="kpms-textbox-date" field="STARTBIDDATE"
                activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            开标地点
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox runat="server" ID="tbBidOpenAddress" field="BidOpenAddress"
                tablename="MBM_TenderEntity" MaxLength="128" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            预计标底（万元）<span class="req-star">*</span>
        </td>
        <td>
            <zhongsoft:LightTextBox ID="tbBidSucurityAmount" runat="server" class="kpms-textbox-money" req="1"
                EnableTheming="false" field="ExpectedPrice" tablename="MBM_TenderEntity" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" Style="text-align: right; width: 120px"
                errmsg="预计标底请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            工期（日历天）<span class="req-star">*</span>
        </td>
        <td>
            <zhongsoft:LightTextBox ID="tbWorkTerm" runat="server" class="kpms-textbox" EnableTheming="false" req="1"
                activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)" field="WorkTerm"
                tablename="MBM_TenderEntity" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,1})?$" Style="text-align: right;
                width: 120px" errmsg="工期请输入正数，最多8位整数，1位小数"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投标信息主要内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbInviteContent" CssClass="kpms-textarea" runat="server" req="1"
                activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="MBM_TENDERENTITY" field="INVITECONTENT"
                editFirst="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            其他说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)" EnableTheming="false"
                maxtext="512" tablename="MBM_TENDERENTITY" field="Memo" editFirst="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请部门
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbApplyDeptName" field="ApplyDeptName"
                tablename="MBM_TENDERENTITY" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" Filter="{OrganizationLevel:'2'}" Writeable="false"
                ShowAttrs="name,UserCode" ResultForControls="{'hiApplyDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyDeptID" field="ApplyDeptID" tablename="MBM_TENDERENTITY" />
        </td>
        <td class="td-l">
            承办人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbosUserName" field="UNDERTAKEUSERNAME"
                tablename="MBM_TENDERENTITY" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                PageWidth="800px" SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false"
                ShowAttrs="name,UserCode" ResultForControls="{'hiUndertabkeUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                req="1"></zhongsoft:LightObjectSelector>
            <input id="hiUndertabkeUserID" runat="server" type="hidden" tablename="MBM_TENDERENTITY"
                field="UNDERTAKEUSERID" />
        </td>
        <td class="td-l">
            电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtUndertakerPhone" readonly="readonly"
                class="kpms-textbox" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投标商务负责人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsBusinessDirector" field="BusinessDirectorName"
                tablename="MBM_TENDERENTITY" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                PageWidth="800px" SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false"
                ShowAttrs="name,UserCode" ResultForControls="{'hiBusinessDirectorID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input id="hiBusinessDirectorID" runat="server" type="hidden" tablename="MBM_TENDERENTITY"
                field="BusinessDirectorID" />
        </td>
        <td class="td-l">
            投标技术负责人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsTechnologyDirector" field="TechnologyDirectorName"
                tablename="MBM_TENDERENTITY" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                PageWidth="800px" SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false"
                ShowAttrs="name,UserCode" ResultForControls="{'hiTechnologyDirectorID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiTechnologyDirectorID" runat="server" type="hidden" tablename="MBM_TENDERENTITY"
                field="TechnologyDirectorID" />
        </td>
        <td class="td-l">
            投标总负责人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsDirectorHeader" field="DirectorHeaderName" req="1"
                PageWidth="800px" tablename="MBM_TENDERENTITY" activestatus="(23.填写《投标立项会签评审表》)(3.修改《投标立项会签评审表》)(23.台帐新建)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px"
                SelectPageMode="Dialog" ResultAttr="name" EnableTheming="false" Writeable="false"
                ShowAttrs="name,UserCode" ResultForControls="{'hiDirectorHeaderID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input id="hiDirectorHeaderID" runat="server" type="hidden" tablename="MBM_TENDERENTITY"
                field="DirectorHeaderID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            评审结果
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbtlResult" field="REVIEWRESULT" tablename="MBM_TenderEntity"
                req="1" activestatus="(3.审核)(3.审批)" RepeatDirection="Horizontal">
                <asp:ListItem Text="同意" Value="同意"></asp:ListItem>
                <asp:ListItem Text="不同意" Value="不同意"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td colspan="4">
        </td>
    </tr>
</table>
<!----投标工程扩展表主键ID---->
<input type="hidden" runat="server" id="hiTenderEntityID" tablename="MBM_TENDERENTITY"
    field="TENDERENTITYID" />
<!--工程实体表信息-->
<input type="hidden" runat="server" id="hiMarketProjectID" field="MARKETPROJECTID"
    clearempty="true" tablename="MBM_TENDERENTITY" />
<!--传阅的步骤-->
<input type="hidden" runat="server" id="hiForwardStep" value="审核" />
<input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="MBM_TENDERENTITY" />
<script>
    function initCustomerPlugin() {
        $("#noProjectShow").hide();
        var actName = "<%= CurActName %>";
        if ((actName == "填写《投标立项会签评审表》" || actName == "修改《投标立项会签评审表》" || actName == "台帐新建")) {
            controlOfFillType();
        }
        if ("<%=NewActionType %>" == "<%=AccessLevel.Read %>") {
            $("#<%=txtMarketProjectName.ClientID %>").css("background-color", "#ffffff");
        }
    }

    function controlOfFillType() {
        fillTypeChange(false);
        $("#<%=rbFillType.ClientID %> ").live("change", function () { fillTypeChange(true); });
    }

    function fillTypeChange(isChange) {
        //项目录入方式改变后将已经填写的部分信息清空
        var fillType = $("#<%=rbFillType.ClientID %> input[type=radio]:checked").val();
        if (isChange)
            $("[clearEmpty=true]").val("");
        //手动录入时，选择按钮隐藏
        if (fillType == "0") {
            $("#noProjectShow").hide();
            $("#<%=txtMarketProjectName.ClientID %>").removeAttr("readonly");
            $("#<%=txtMarketProjectName.ClientID %>").css("background-color", "#f2f5a9");
        }
        else {
            $("#noProjectShow").show();
            $("#<%=txtMarketProjectName.ClientID %>").attr("readonly", "readonly");
            $("#<%=txtMarketProjectName.ClientID %>").css("background-color", "#EEF8FC");
        }
    }

    //选择招标机构信息
    function selMarketProject() {
        var param = new InputParamObject("s");
        getMarketDivProjects(null, param, null, afterSelMarketProject);
        return false;
    }

    function afterSelMarketProject(reObj) {
        //{'hiMarketProjectID':'id','ddlProjectType':'PROJECTTYPEID'}
        if (reObj != null) {
            $("#<%=txtMarketProjectName.ClientID %>").val(reObj.getName());
            $("#<%=hiMarketProjectID.ClientID %>").val(reObj.getId());
            $("#<%=losCustomerName.ClientID %>").val(reObj.buildAttrJson("o", "CUSTOMERNAME"));
            $("#<%=losCustomerName.ClientID %>").next().val(reObj.buildAttrJson("o", "CUSTOMERNAME"));
            $("#<%=hiCustomerID.ClientID %>").val(reObj.buildAttrJson("o", "CUSTOMERID"));
            $("#<%=txtContactName.ClientID %>").val(reObj.buildAttrJson("o", "CONTACTNAME"));
            $("#<%=txtContactName.ClientID %>").next().val(reObj.buildAttrJson("o", "CONTACTNAME"));
            $("#<%=hiContactID.ClientID %>").val(reObj.buildAttrJson("o", "CONTACTID"));
            $("#<%=ddlProjectType.ClientID %>").val(reObj.buildAttrJson("o", "PROJECTTYPEID"));
            $("#<%=txtContactPhone.ClientID %>").val(reObj.buildAttrJson("o", "CONTACTTELEPHONE"));
            $("#<%=hiMarketProjectCode.ClientID %>").val(reObj.buildAttrJson("o", "MARKETPROJECTCODE"));
        }
        return false;
    }

    //选择任务之前的逻辑判断
    function beforeSelContact() {
        var customerID = $("#<%=hiCustomerID.ClientID %>").val();
        if (customerID == "") {
            alert("请选择招标单位");
            return false;
        }
        return true;
    }
    //招标单位联系人筛选条件
    function contactFilter() {
        var customerID = $("#<%=hiCustomerID.ClientID %>").val();
        return { CustomerID: customerID }
    }
 
</script>
