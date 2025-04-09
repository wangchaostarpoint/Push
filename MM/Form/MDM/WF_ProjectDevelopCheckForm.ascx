<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectDevelopCheckForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MDM.WF_ProjectDevelopCheckForm" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProject" field="PROJECTNAME"
                tablename="MDM_PROJECTDEVELOPFORM" activestatus="(23.提出评审需求)(3.修改评审需求)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true"
                ResultForControls="{'hiMarketInfoID':'id'}" PageUrl="~/MM/Obsolete/MarketInfoSelector.aspx"
                EnableTheming="false" PageWidth="850" Writeable="false"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiMarketInfoID" value="MarketInfoID" tablename="MDM_PROJECTDEVELOPFORM" />
        </td>
        <td class="td-l">
            流水号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtDevelopNum" runat="server" type="text" class="kpms-textbox"
                tablename="MDM_PROJECTDEVELOPFORM" field="DEVELOPNUM" readonly="readonly" activestatus="(23.提出评审需求)(3.修改评审需求)" />
        </td>
    </tr>
    <tr>
    <td class="td-l">
            工程类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" tablename="MDM_PROJECTDEVELOPFORM"
                AutoPostBack="true" OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged"
                field="PROJECTTYPEID" req="1" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            建设性质<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlBuildType" runat="server" tablename="MDM_PROJECTDEVELOPFORM"
                field="BUILDTYPE" req="1" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            承办人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtUndertakeUserName" readonly="readonly"
                class="kpms-textbox" activestatus="(23.提出评审需求)(3.修改评审需求)" field="UNDERTAKEUSERNAME"
                tablename="MDM_PROJECTDEVELOPFORM">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiUndertakeUserID" field="UNDERTAKEUSERID"
                tablename="MDM_PROJECTDEVELOPFORM" />
        </td>
    </tr>    
    <tr>
        <td class="td-l">
            是否境内工程<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="ISCHURCHYARD" tablename="MDM_PROJECTDEVELOPFORM"
                controlType="radioButtonList" RepeatDirection="Horizontal" req="1"
                activestatus="(23.提出评审需求)(3.修改评审需求)" AutoPostBack="true" OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            省份(洲)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" tablename="MDM_PROJECTDEVELOPFORM"
                controlType="dropDownList" field="PROVINCE" req="1"
                activestatus="(23.提出评审需求)(3.修改评审需求)" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiProvince" field="PROVINCE" tablename="MDM_PROJECTDEVELOPFORM" />
        </td>
        <td class="td-l">
            地区(国家)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlArea" runat="server" tablename="MDM_PROJECTDEVELOPFORM"
                controlType="dropDownList" field="AREA" req="1"
                activestatus="(23.提出评审需求)(3.修改评审需求)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiArea" field="AREA" tablename="MDM_PROJECTDEVELOPFORM" />
        </td>
    </tr>
    
    <tr>
        <td class="td-l">
            建设单位
        </td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" field="CUSTOMERNAME"
                tablename="MDM_PROJECTDEVELOPFORM" activestatus="(23.提出评审需求)(3.修改评审需求)"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="false"
                ResultAttr="name" Writeable="false" ShowAttrs="name" ResultForControls="{'hiCustomerID':'id'}"
                PageUrl="~/MM/Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiCustomerID" type="hidden" field="CUSTOMERID" runat="server" tablename="MDM_PROJECTDEVELOPFORM" />
        </td>
        <td class="td-l">
            联系人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContactName" field="CONTACTNAME"
                tablename="MDM_PROJECTDEVELOPFORM" activestatus="(23.提出评审需求)(3.修改评审需求)"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="false"
                ResultAttr="name" Writeable="false" ShowAttrs="name" ResultForControls="{'hiContactID':'id','txtContactPhone':'PHONE'}"
                PageUrl="~/MM/Obsolete/CustomerContactSelector.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiContactID" type="hidden" field="CONTACTID" runat="server" tablename="MDM_PROJECTDEVELOPFORM" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContactPhone" field="CONTACTTELEPHONE"
                class="kpms-textbox" tablename="MDM_PROJECTDEVELOPFORM"
                readonly="readonly" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr >
    </tr>    
    <tr>
        <td class="td-l">
            评审部门
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectDept" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiReviewDeptIDs':'id'}" EnableTheming="false"
                Text="选择评审部门" Filter="{OrganizationLevel:'2'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.提出评审需求)(3.修改评审需求)"
                TableName="MDM_PROJECTDEVELOPFORM" field="REVIEWDEPTNAMES" />
            <input type="hidden" runat="server" id="hiReviewDeptIDs" tablename="MDM_PROJECTDEVELOPFORM"
                field="REVIEWDEPTIDS" />
        </td>
        <td class="td-l">
            评审方式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlCheckMode" runat="server" tablename="MDM_PROJECTDEVELOPFORM"
                req="1" field="CHECKMODE" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlEntrustType" field="ENTRUSTTYPE"
                AutoPostBack="true" OnSelectedIndexChanged="ddlEntrustType_SelectedIndexChanged"
                req="1" tablename="MDM_PROJECTDEVELOPFORM" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </zhongsoft:LightDropDownList>
        </td>
        
        <td class="td-l">
            工程阶段
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cbConsignPhases" activestatus="(23.提出评审需求)(3.修改评审需求)"
                RepeatDirection="Horizontal">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr showtype="bidInfo">
        <td class="td-l">
            招标编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbTenderNumber" field="TENDERNUMBER" tablename="MDM_PROJECTDEVELOPFORM"
                clearEmpty="bidInfo" showtypeReq="bidInfo" MaxLength="32" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </zhongsoft:LightTextBox>
        </td>    
        <td class="td-l">
            投标类别<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <asp:RadioButtonList ID="rbBidType" runat="server" showtypeReq="bidInfo" field="BIDTYPE" RepeatDirection="Horizontal"
                controlType="radioButtonList" clearEmpty="bidInfo" tablename="MDM_PROJECTDEVELOPFORM"
                activestatus="(23.提出评审需求)(3.修改评审需求)">
            </asp:RadioButtonList>
        </td>     
    </tr>
    <tr>
    </tr>
    <tr showtype="project">
        <td class="td-l">
            进度要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProgressRequire" CssClass="kpms-textarea" runat="server"
                clearEmpty="project" TextMode="MultiLine" EnableTheming="false" maxtext="512"
                tablename="MDM_PROJECTDEVELOPFORM" showtypeReq="project" field="PROGRESSREQUIRE"
                activestatus="(23.提出评审需求)(3.修改评审需求)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr showtype="project">
        <td class="td-l">
            主要工作范围<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbWorkRange" CssClass="kpms-textarea" runat="server"
                clearEmpty="project" showtypeReq="project" TextMode="MultiLine" EnableTheming="false"
                maxtext="512" tablename="MDM_PROJECTDEVELOPFORM" field="WORKRANGE" activestatus="(23.提出评审需求)(3.修改评审需求)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr showtype="project">
        <td class="td-m" colspan="2">
            项目规模及要求在我院资质范围之内
        </td>
        <td class="td-m" colspan="4">
            <asp:RadioButtonList runat="server" ID="rbIsWithQuality" field="ISWITHINQUALIFY"
                controlType="radioButtonList" clearEmpty="project" tablename="MDM_PROJECTDEVELOPFORM"
                RepeatDirection="Horizontal" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr showtype="project">
        <td class="td-m" colspan="2">
            项目内容符合国家政策法律等规定
        </td>
        <td class="td-m" colspan="4">
            <asp:RadioButtonList runat="server" ID="rbIsMeetLawRegulation" field="ISMEETLAWREGULATION"
                controlType="radioButtonList" clearEmpty="project" RepeatDirection="Horizontal"
                tablename="MDM_PROJECTDEVELOPFORM" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr showtype="project">
        <td class="td-m" colspan="2">
            项目符合本院的项目发展策略
        </td>
        <td class="td-m" colspan="4">
            <asp:RadioButtonList runat="server" ID="rbIsMeetDevelop" field="ISMEETDEVELOP" tablename="MDM_PROJECTDEVELOPFORM"
                controlType="radioButtonList" clearEmpty="project" RepeatDirection="Horizontal"
                activestatus="(23.提出评审需求)(3.修改评审需求)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr showtype="project">
        <td class="td-m" colspan="2">
            项目是否在我院的能力和资源范围之内
        </td>
        <td class="td-m" colspan="4">
            <asp:RadioButtonList runat="server" ID="rbIsWithinAbility" field="ISWITHINABILITY"
                clearEmpty="project" controlType="radioButtonList" RepeatDirection="Horizontal"
                tablename="MDM_PROJECTDEVELOPFORM" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr showtype="project">
        <td class="td-l">
            其他
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbOtherDescription" CssClass="kpms-textarea" runat="server"
                clearEmpty="project" TextMode="MultiLine" EnableTheming="false" maxtext="512"
                tablename="MDM_PROJECTDEVELOPFORM" field="OTHERDESCRIPTION" activestatus="(23.提出评审需求)(3.修改评审需求)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr showtype="project">
        <td class="td-l">
            是否承接项目<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rbIsUndertake" field="ISUNDERTAKE" tablename="MDM_PROJECTDEVELOPFORM"
                controlType="radioButtonList" RepeatDirection="Horizontal" showtypeReq="project"
                activestatus="(3.审批)(3.批准)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr showtype="bidInfo">       
    </tr>
    <tr showtype="bidInfo">
        <td class="td-l">
            投标性质<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblTenderCharacter" runat="server" RepeatDirection="Horizontal"
                controlType="radioButtonList" clearEmpty="bidInfo" showtypeReq="bidInfo" field="TENDERCHARACTER"
                tablename="MDM_PROJECTDEVELOPFORM" activestatus="(23.提出评审需求)(3.修改评审需求)">
                <asp:ListItem Value="公开">公开</asp:ListItem>
                <asp:ListItem Value="邀请">邀请</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            开标日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDay" tablename="MBM_BIDPLANFIXORCHANGE"
                clearEmpty="bidInfo" readonly="readonly" class="kpms-textbox-date" field="STARTDATE"
                activestatus="(23.提出评审需求)(3.修改评审需求)" />
        </td>        
        <td class="td-l">
            项目规模
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlBuildSize" runat="server" tablename="MDM_PROJECTDEVELOPFORM"
                controlType="dropDownList" clearEmpty="bidInfo" field="BUILDSIZE" activestatus="(23.提出评审需求)(3.修改评审需求)">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr showtype="bidInfo">
        <td class="td-l">
            投标报价（万元）
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBidQuote" runat="server" CssClass="kpms-textbox-money"
                clearEmpty="bidInfo" EnableTheming="false" activestatus="(23.提出评审需求)(3.修改评审需求)"
                field="BIDQUOTE" tablename="MDM_PROJECTDEVELOPFORM" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                errmsg="投标报价请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l" nowrap>
            投标保证金（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBidSecurityAmount" runat="server" CssClass="kpms-textbox-money"
                EnableTheming="false" showtypeReq="bidInfo" activestatus="(23.提出评审需求)(3.修改评审需求)"
                clearEmpty="bidInfo" field="BIDSECURITYAMOUNT" tablename="MDM_PROJECTDEVELOPFORM"
                Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="投标保证金请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            是否已归还
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsReturn" activestatus="(23.提出评审需求)(3.修改评审需求)"
                RepeatDirection="Horizontal" controlType="radioButtonList" clearEmpty="bidInfo"
                field="ISRETURN" tablename="MDM_PROJECTDEVELOPFORM">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr showtype="bidInfo">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            招标机构信息
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.提出评审需求)(3.修改评审需求)" showtype="bidInfo">
        <td class="td-m" colspan="6" style="text-align: right">
            <asp:Button ID="btnSelTripUsers" runat="server" Text="选择招标机构" OnClientClick="return selTenderCorp();"
                Width="106px" CausesValidation="true" DisplayStatus="(23.提出评审需求)(3.修改评审需求)" OnClick="btnSelTenderCorp_Click" />
        </td>
    </tr>
    <tr showtype="bidInfo">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvTenderList" runat="server" UseDefaultDataSource="true"
                DataKeyNames="TENDERCORPDETAILID" OnRowCommand="gvTenderList_RowCommand">
                <Columns>
                    <zhongsoft:LightBoundField DataField="CUSTOMERNAME" HeaderText="招标机构">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CUSTOMERTYPE" HeaderText="类别">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ARTIFICIAL" HeaderText="联系人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ARTIFICIALCONTACT" HeaderText="联系人电话">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该招标机构{0}吗？"
                        DeleteTipField="CUSTOMERNAME">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr showtype="bidInfo">
        <td class="td-l">
            招标内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTenderContent" CssClass="kpms-textarea" runat="server"
                clearEmpty="bidInfo" showtypeReq="bidInfo" TextMode="MultiLine" EnableTheming="false"
                maxtext="512" tablename="MDM_PROJECTDEVELOPFORM" field="TENDERCONTENT" activestatus="(23.提出评审需求)(3.修改评审需求)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="MDM_PROJECTDEVELOPFORM" field="MEMO"
                activestatus="(23.提出评审需求)(3.修改评审需求)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!---市场项目开发流程主键ID--->
<input type="hidden" runat="server" id="hiPorjectDevelopFormID" field="PROJECTDEVELOPFORMID"
    tablename="MDM_PROJECTDEVELOPFORM" />
<!---招标阶段信息-->
<input type="hidden" runat="server" id="hiTenderPhase" field="TENDERPHASE" tablename="MDM_PROJECTDEVELOPFORM" />
<!---招标单位信息-->
<input type="hidden" runat="server" id="hiTenderCorp" />
<input type="hidden" runat="server" id="hiDeptRoleName" value="部门负责人" />
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        accessOfBidInfoDisplay();
        $("#<%=ddlEntrustType.ClientID %>").live("change", function () { accessOfBidInfoDisplay(); });
        //如果工程类型是其他，可以不填写工程性质信息
        $("#<%=ddlProjectType.ClientID %>").live("change", function () {
            var projType = $("#<%=ddlEntrustType.ClientID %> option:selected").text();
            if (projType == "其他") {
            }
        });
         var enTrustType = $("#<%=ddlEntrustType.ClientID %>").val();
        if(($actName=="审批"||$actName=="批准")&&enTrustType == "<%=(int)MDMEnum.EntrustType.Project %>"){
           $("#<%=rbIsUndertake.ClientID %>").attr("req","1");
        }
    }

    //当委托类型不同时，显示不同的信息
    function accessOfBidInfoDisplay() {
        var enTrustType = $("#<%=ddlEntrustType.ClientID %>").val();

        //评审 委托项目
        if (enTrustType == "<%=(int)MDMEnum.EntrustType.Project %>") {
            //显示委托项目信息  
            $("[showtype=project]").show();
            //隐藏招标信息
            $("[showtype=bidInfo]").hide();
            //委托项目必填项控制
            $("[showtypeReq=project]").attr("req", "1");
            $("[showtypeReq=bidInfo]").removeAttr("req");

            var $bidInfoArray = $("[clearEmpty=bidInfo]");
            clearControlInfo($bidInfoArray);
            //清空招标阶段
            $("#<%=tbTenderContent.ClientID %>").val("");
            $("#<%=hiCustomerID.ClientID %>").val("");
            $("#<%=hiContactID.ClientID %>").val("");
            $("#<%=txtCustomerName.ClientID %>").next().val("");
            $("#<%=txtCustomerName.ClientID %>").val("");
            $("#<%=txtContactName.ClientID %>").next().val("");
            $("#<%=txtContactName.ClientID %>").val("");
            $("#<%=txtContactPhone.ClientID %>").val("");
        }
        else {
            //隐藏委托项目信息
            $("[showtype=project]").hide();
            //显示招标信息
            $("[showtype=bidInfo]").show();
            $("[showtypeReq=project]").removeAttr("req");
            $("[showtypeReq=bidInfo]").attr("req", "1");
            $("[clearEmpty=project]").val("");
            var $projetArray = $("[clearEmpty=project]");
            $("#<%=cbConsignPhases.ClientID %> input:checked").removeAttr("checked");
            clearControlInfo($projetArray);
        }
    }

    //选择招标机构信息
    function selTenderCorp() {
        var param = new InputParamObject("m");
        getDivCustomer('<%=hiTenderCorp.ClientID %>', param, null, refreshTenderCorp);
        return false;
    }

    function refreshTenderCorp(){
       <%=Page.ClientScript.GetPostBackEventReference(this.btnSelTripUsers,"")%>;
    }

    //清空信息
    function clearControlInfo(array) {
        for (i = 0; i < array.length; i++) {
            var type = $(array[i]).attr("type");
            if (type == "text") {
                $(array[i]).val("");
            }
            else {
                var controlType = $(array[i]).attr("controlType");
                if (controlType != undefined && controlType == "radioButtonList") {
                    setRadlNoSelectItem($(array[i]).attr("id"));
                }
                else if (controlType != undefined && controlType == "dropDownList") {
                    $(array[i]).val("");
                }
            }
        }
    }
</script>
