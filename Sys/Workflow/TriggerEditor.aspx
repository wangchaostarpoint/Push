<%@ Page Title="触发器编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="TriggerEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.TriggerEditor" %>

<%@ Import Namespace="Zhongsoft.SOA" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnReuse" CssClass="subtoolbarlink" displaystatus="(3.*)"
            OnClientClick="return showTriggerReuse()" EnableTheming="false"><span>套用</span></asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                当前流程
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiFeatureObjectId" field="FeatureObjectId"
                    tablename="PortalTrigger" />
                <zhongsoft:LightTextBox ReadOnly="true" runat="server" ID="tbSourceName"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                触发功能<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:DropDownList runat="server" ID="ddlFeatureType" req="1" activestatus="(2.*)">
                </asp:DropDownList>
                <input type="hidden" runat="server" id="hiFeatureType" tablename="PortalTrigger"
                    field="FeatureType" />
            </td>
        </tr>
        <tr class="trCreateWF">
            <td class="td-l">
                触发流程<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiPackageName" />
                <input type="hidden" runat="server" id="hiXpdlId" />
                <input type="hidden" runat="server" id="hiFormId" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsForm" PageUrl="/Portal/Sys/Workflow/WfFormSelector.aspx"
                    ShowJsonRowColName="true" activestatus="(2.*)" ResultAttr="name" createwfreq="1"
                    ResultForControls="{'hiFormId':'FormID','hiPackageName':'PackageName','hiXpdlId':'XPDLID'}" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                触发步骤<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsActivity" OnClientClick="return selActivity();"
                    activestatus="(2.*)" />
                <input type="hidden" runat="server" id="hiFeatureParam" tablename="PortalTrigger"
                    field="TriggerParam" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                触发器编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiTriggerCode" field="TriggerCode" tablename="TriggerCode" />
                <table cellpadding="0" cellspacing="0" width="97%">
                    <tr>
                        <td width="100">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbPrefix" readonly="readonly" class="kpms-textbox"
                                style="width: 100%">
                            </zhongsoft:XHtmlInputText>
                        </td>
                        <td>
                            <zhongsoft:LightTextBox req="1" runat="server" ID="tbTriggerCode" MaxLength="35"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                触发器名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox req="1" runat="server" ID="tbTriggerName" tablename="PortalTrigger"
                    field="TriggerName" MaxLength="50"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr class="trCreateWF">
            <td class="td-l">
                触发流程条件
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiConditionRuleId" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsConditionRule" PageUrl="/Portal/Sys/Rule/RuleSelector.aspx"
                    ActiveStatus="(23.*)" Filter="TransitionEvent" ResultForControls="{'hiConditionRuleId':'id'}" />
            </td>
        </tr>
        <tr class="trMessage">
            <td class="td-l">
                消息类型<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:CheckBoxList ID="chblMessageType" runat="server" msgreq="1">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                参与人规则<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiParticipantRuleId" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsParticipantRule" PageUrl="~/Sys/Rule/RuleSelector.aspx"
                    ActiveStatus="(23.*)" PageWidth="500" PageHeight="500" SelectPageMode="Dialog" req="1" Filter="ParticipantEvent" ResultForControls="{'hiParticipantRuleId':'id'}" />
            </td>
        </tr>
        <tr class="trTitle">
            <td class="td-l">
                主题<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsTitle" OnClientClick="buildTitle();return false;" />
            </td>
        </tr>
        <tr class="trCreateWF">
            <td class="td-l">
                新建业务数据
            </td>
            <td class="td-m">
                <asp:CheckBox runat="server" ID="cbNewBussiness" Text="是" />
            </td>
        </tr>
        <tr class="trContent">
            <td class="td-l">
                内容<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsContent" OnClientClick="buildContent();return false;" />
            </td>
        </tr>
    </table>
    <input runat="server" id="hiDataSource" type="hidden" />
    <input runat="server" id="hiExpression" type="hidden" tablename="PortalTrigger" field="Expression" />
    <input runat="server" id="hiTriggerFeatureId" type="hidden" tablename="PortalTrigger"
        field="TriggerFeatureId" />
    <input type="hidden" runat="server" id="hiFlag" tablename="PortalTrigger" field="Flag"
        value="1" />
    <input type="hidden" runat="server" id="hiFeatureObjectType" field="FeatureObjectType"
        tablename="PortalTrigger" value="0" />
    <input runat="server" id="hiUrlParam" type="hidden" />
    <script>
        var $typeCreateWorkflow = "<%=(int)TriggerFeature.SOAFeatureType.CreateWorkflow %>";
        var $typeMsg = "<%=(int)TriggerFeature.SOAFeatureType.Message %>";
        var $typeForward = "<%=(int)TriggerFeature.SOAFeatureType.ForwardForm %>";

        function initCustomerPlugin() {
            checkMaxLength();
            $("#templateTabs").tabs();
            $("#<%=ddlFeatureType.ClientID %>").change(function () { typeChange(); });
            typeChange();
        }
        function typeChange() {
            var trTargetWF = $(".trCreateWF");
            var trMsg = $(".trMessage");
            var trContent = $(".trContent");
            var trTitle = $(".trTitle");
            var ctrlWF = $("[createwfreq]");
            var ctrlMsg = $("[msgreq]");
            var ctrlTitle = $("#<%=lbsTitle.ClientID %>");
            var ctrlContent = $("#<%=lbsTitle.ClientID %>");
            var ctrlPrefix = $("#<%=tbPrefix.ClientID %>");

            switch ($("#<%=ddlFeatureType.ClientID %>").val()) {
                case $typeCreateWorkflow:
                    trTargetWF.show();
                    trMsg.hide();
                    ctrlWF.attr("req", "1");
                    ctrlMsg.removeAttr("req");
                    ctrlContent.removeAttr("req");
                    ctrlTitle.attr("req", "1");
                    trContent.hide();
                    trTitle.show();
                    ctrlPrefix.val("<%=TriggerFeature.PREFIX_WF %>")
                    break;
                case $typeForward:
                    trTargetWF.hide();
                    trMsg.hide();
                    ctrlWF.removeAttr("req");
                    ctrlMsg.removeAttr("req");
                    ctrlContent.removeAttr("req");
                    ctrlTitle.removeAttr("req");
                    trContent.hide();
                    trTitle.hide();
                    ctrlPrefix.val("<%=TriggerFeature.PREFIX_FORWARD %>")
                    break;
                case $typeMsg:
                    trTargetWF.hide();
                    trMsg.show();
                    ctrlContent.attr("req", "1");
                    ctrlTitle.attr("req", "1");
                    ctrlWF.removeAttr("req");
                    ctrlMsg.attr("req", "1");
                    trContent.show();
                    trTitle.show();
                    ctrlPrefix.val("<%=TriggerFeature.PREFIX_MSG %>")
                    break;
                default:
                    trTargetWF.hide();
                    trMsg.hide();
                    ctrlWF.removeAttr("req");
                    ctrlMsg.removeAttr("req")
                    ctrlContent.removeAttr("req");
                    ctrlTitle.removeAttr("req");
                    trContent.hide();
                    trTitle.hide();
                    ctrlPrefix.val("");
                    break;
            }
            $("#<%=hiExpression.ClientID %>").val("");
        }

        function selActivity() {

            var featureType = $("#<%=ddlFeatureType.ClientID %>").val();
            var urlParams = $.parseJSON($("#<%=hiUrlParam.ClientID %>").val());
            if (featureType == "") {
                alert("请选择触发功能！");
                return false;
            }
            else if (featureType == $typeCreateWorkflow) {
                var targetFormid = $("#<%=hiFormId.ClientID %>").val();
                if (targetFormid == "") {
                    alert("请选择流程表单！");
                    return false;
                }
                else {
                    urlParams = $.extend(urlParams, { "TargetFormId": targetFormid });
                }
            }
            urlParams = $.extend(urlParams, { "FeatureType": featureType });
            var hiActId = $("#<%=hiFeatureParam.ClientID %>");
            var lbsAct = $("#<%=lbsActivity.ClientID %>");

            var selectMode = { selectMode: 's' };
            var selectedActs = [];
            if (hiActId.val() != "" && lbsAct.val() != "") {
                var ids = hiActId.val().split(',');
                var names = lbsAct.val().split(',');
                for (var i = 0; i < ids.length; i++) {
                    selectedActs.push({ id: ids[i], name: names[i] });
                }
            }
            var selParams = $.extend(selectMode, { selectedActs: selectedActs });
            var url = buildQueryUrl("Sys/Workflow/ActivitySelector.aspx", urlParams);
            var result = showModal(url, selParams, 600, 500);
            if (checkReturn(result)) {
                var reJson = $.parseJSON(result);
             
                if (result.length > 0) {
                    var ids = [];
                    var names = [];
                    for (var i = 0; i < reJson.length; i++) {
                        ids.push(reJson[i].id);
                        names.push(reJson[i].name + "[" + reJson[i].id + "]");
                    }
                    hiActId.val(ids.join(","));
                    lbsAct.val(names.join(","));      
                }
                else {
                    hiActId.val("");
                    lbsAct.val("");
                }
            }
            return false;
        }

        function showTriggerReuse() {
            var url = buildQueryUrl("Sys/Workflow/TriggerReuse.aspx", { triggerId: $bizId });
            if (showModal(url, "", 600, 500)) {
                if (parent.returnValue == undefined || parent.returnValue == null) {
                    parent.returnValue = "Saved";
                }
            }
            return false;
        }

        function buildTitle() {
            buildExp("<%=lbsTitle.ClientID %>", "<%=lbsTitle.HiddenClientID %>");
            return false;
        }

        function buildContent() {
            buildExp("<%=lbsContent.ClientID %>", "<%=lbsContent.HiddenClientID %>");
            return false;
        }

        function buildExp(ctrlId, hiddenId) {
            var tableCode = $("#<%=hiDataSource.ClientID %>").val()
            if (tableCode == null) {
                alert("表单未配置主数据源!");
                return;
            }

            var url = buildQueryUrl("sys/CommonExpEditor.aspx", { TableCode: tableCode, FieldType: "BDDict" });
            var re = showModal(url, $("#" + hiddenId).val(), 800, 400);
            if (re != null) {
                $("#" + ctrlId).val(re);
                $("#" + hiddenId).val(re);
            }
        }
    </script>
</asp:Content>
