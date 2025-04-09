<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketProjectEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.MarketProjectEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="工程详细页面" %>

<%@ Register TagPrefix="uc1" TagName="UCProjectAttribute" Src="../../UI/Controls/UCProjectAttribute.ascx" %>
<%@ Register TagPrefix="uc2" TagName="UCEstimateValueSplit" Src="../../UI/Controls/UCEstimateValueSplit.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="<%=WebAppPath %>/FM/UI/Script/FMGeneralScript.js"></script>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工程名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMarketProjectName" runat="server" MaxLength="256" field="MARKETPROJECTNAME"
                    req="1" editFirst="true" tablename="MDM_MIDMARKETPROJECT" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工程编号<span spantype="issued" class="req-star">*</span>
            </td>
            <td class="td-r">
                <table class="choose-table" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <zhongsoft:XHtmlInputText type="text" ID="tbMarketProjectCode" runat="server" readonly="readonly"
                                editFirst="true" field="MarketProjectCode" tablename="MDM_MIDMARKETPROJECT" class="kpms-textbox" />
                        </td>
                        <td valign="middle" style="width: 20px">
                            <asp:LinkButton runat="server" ID="lbtnInitProjectCode" DisplayStatus="(23.*)" CssClass="btn-look-up"
                                EnableTheming="false" OnClientClick="return initProjectCode();">
                    <img title="选择任务" src="../../../Themes/Images/look-up.gif">
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="td-m" colspan="4">
            </td>
        </tr>
        <tr runat="server" id="trDesignPhase">
            <td class="td-l">
                设计阶段<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBoxList ID="cblPhases" editFirst="true" RepeatDirection="Horizontal" runat="server"
                    RepeatColumns="4">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                进度要求
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbProgressRequire" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_MIDMARKETPROJECT"
                    field="PROGRESSREQUIRE" editFirst="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                质量要求
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbQualityRequire" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_MIDMARKETPROJECT"
                    field="QUALITYREQUIRE" editFirst="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                其他要求
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbOtherRequire" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_MIDMARKETPROJECT"
                    field="OTHERREQUIRE" editFirst="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr id="trBidInfo">
            <td class="td-l">
                投标保证金（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractAmount" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" field="BIDSECURITYAMOUNT" tablename="MDM_MIDMARKETPROJECT"
                    Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" activeStatus="(23.*)" errmsg="投标保证金请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                投标保证金是否已归还
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rbIsReturn" field="ISRETURN" tablename="MDM_MIDMARKETPROJECT"
                    RepeatDirection="Horizontal" activestatus="(23.?)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="trEstimate">
            <td class="td-l">
                预估总合同额（万元）
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:XHtmlInputText runat="server" class="kpms-textbox-money" blename="MDM_MIDMARKETPROJECT"
                    readonly="readonly" ID="txtContractValue" field="CONTRACTVALUE" ActiveStatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr valign="top">
            <td class="td-m" colspan="3" valign="top" id="tdAttribute">
                <uc1:UCProjectAttribute ID="ucProejctAtt" runat="server"></uc1:UCProjectAttribute>
            </td>
            <td colspan="3" valign="top" id="tdEstimate">
                <uc2:UCEstimateValueSplit ID="ucEstimateValue" runat="server"></uc2:UCEstimateValueSplit>
            </td>
        </tr>
    </table>
    <!----工程主键ID---->
    <input type="hidden" runat="server" id="hiMidMarketProjectID" tablename="MDM_MIDMARKETPROJECT"
        field="MIDMARKETPROJECTID" />
    <!----要调整的工程主键ID---->
    <input type="hidden" runat="server" id="hiMarketProjectID" tablename="MDM_MIDMARKETPROJECT"
        field="MARKETPROJECTID" />
    <!----工程审批流程ID---->
    <input type="hidden" runat="server" id="hiProjectInfoID" tablename="MDM_MIDMARKETPROJECT"
        field="PROJECTINFOID" />
    <input type="hidden" runat="server" id="hiGeneralProjectName" value="总承包" />
    <!-----是否新任务中新建工程----->
    <input type="hidden" runat="server" id="hiIsNewProject" field="ISNEWPROJECT" tablename="MDM_MIDMARKETPROJECT" />
    <input type="hidden" runat="server" id="hiProjectTypeID" field="PROJECTTYPEID" tablename="MDM_MIDMARKETPROJECT" />
    <script>

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            estimateValue_Init();
            $("#trBidInfo").hide();
            if (!(("<%=CurrActName %>" == "接收处理" || "<%=CurrActName %>" == "编写计划书" || "<%=CurrActName %>" == "修改计划书") && "<%=ActionType %>" != "Read")) {
                $("#<%=lbtnInitProjectCode.ClientID %>").hide();
            }
            if ("<%=CurrActName %>" == "编写计划书" || "<%=CurrActName %>" == "修改计划书") {
                $("[issued]").show();
                $("#<%=tbMarketProjectCode.ClientID %>").attr("req", "1");
            }
            else {
                $("[issued]").hide();
            }
            //如果是投标计划计划/变更流程，不显示预估合同额信息
            if ("<%=CurrActName %>" == "发起投标计划安排/变更流程" || "<%=CurrActName %>" == "修改投标计划安排/变更流程") {
                $("#tdEstimate").hide();
                $("#trBidInfo").show();
                $("#trEstimate").hide();
            }
        }

        function checkForm() {
            //设计阶段必填
            if ("<%=ActionType %>" != "Read") {
                if (!("<%=CurrActName %>" == "编写计划书" || "<%=CurrActName %>" == "修改计划书")) {
                    if (!checkSelPhase()) {
                        alert("请选择设计阶段");
                        return false;
                    }
                }
            }
            return true;
        }

        //获取选择的设计阶段数量
        function checkSelPhase() {
            var isSelect = false;
            $("#<%=cblPhases.ClientID %> input").each(function () {
                if ($(this)[0].checked) {
                    isSelect = true;
                }
            });
            return isSelect;
        }

        //生成工程编号
        function initProjectCode() {
            var paramProjectTypeID = "<%=ProjectTypeID %>";
            var isGeneralProject = "<%=IsGeneralProject %>";
            var projectCode = $("#<%=tbMarketProjectCode.ClientID %>").val();
            var json = { paramProjectTypeID: paramProjectTypeID, isGeneralProject: isGeneralProject, projectCode: projectCode };
            var projectCodeNew = showModal(buildQueryUrl("/MM/List/MDM/CreateProjectCode.aspx", json), null, 700, 800);

            if (projectCodeNew != "") {
                $("#<%=tbMarketProjectCode.ClientID %>").val(projectCodeNew);
            }
            return false;
        }
       
    </script>
</asp:Content>
