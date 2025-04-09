<%@ Page Title="工种安排页面" Language="C#" AutoEventWireup="true" CodeBehind="PublishWorkEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishWorkEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%--费用项目列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishCostInfo.ascx" TagName="PublishCostInfo"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr style="display: none">
            <td class="td-l">
                卷册名称
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlRoll" AutoPostBack="true" OnSelectedIndexChanged="ddlRoll_Change"
                    runat="server" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                卷册编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRollCode" activestatus="(23.*)" EnableTheming="false"
                    class="kpms-textbox" ReadOnly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工种类型名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rblWorkTypeName" runat="server" RepeatDirection="Horizontal"
                    RepeatColumns="8" req="1" activestatus="(2.*)">
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hiWorkTypeName" field="WorkTypeName" tablename="EPMS_PublishWork" />
                <input type="hidden" runat="server" id="hiWorkTypeID" field="WorkTypeID" tablename="EPMS_PublishWork" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                负责人<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <asp:RadioButtonList ID="rblChargeUserName" runat="server" RepeatDirection="Horizontal"
                    activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbChargeUserName" activestatus="(23.*)"
                    maxtext="8" Width="80px">
                </zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiChargeUserName" field="ChargeUserName"
                    tablename="EPMS_PublishWork" />
                <input type="hidden" runat="server" id="hiChargeUserID" field="ChargeUserID" tablename="EPMS_PublishWork" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                分配日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtReceiveDate" activestatus="(23.*)"
                    EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="ReceiveDate"
                    tablename="EPMS_PublishWork" />
            </td>
            <td class="td-l">
                完成日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCompleteDate" activestatus="(23.*)"
                    EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="CompleteDate"
                    tablename="EPMS_PublishWork" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工作内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkContent" CssClass="kpms-textarea"
                    req="1" EnableTheming="false" activestatus="(23.*)" TextMode="MultiLine" maxtext="512"
                    Rows="4" field="WorkContent" tablename="EPMS_PublishWork">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <uc1:PublishCostInfo ID="PublishCostInfo" runat="server" />
    <table class="tz-table" width="100%" runat="server" id="CostItem1">
        <tr>
            <td class="td-l">
                其他费用（元）
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbOtherSum" runat="server" MaxLength="8" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$"
                    errmsg="费用必须填写数字，最多8位整数，2位小数" CssClass="kpms-textbox-money" EnableTheming="false"
                    field="OtherSum" tablename="EPMS_PublishWork" activestatus="(23.*)(23.核定费用)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                费用说明
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbChargeMemo" CssClass="kpms-textarea"
                    EnableTheming="false" activestatus="(23.*)(23.核定费用)" TextMode="MultiLine" maxtext="512"
                    Rows="4" field="ChargeMemo" tablename="EPMS_PublishWork">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hiChargeSum" type="hidden" tablename="EPMS_PublishWork" field="ChargeSum"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_PublishWork" field="Flag" value="1"
        runat="server" />
    <input id="hiPublishConsignWBSID" type="hidden" tablename="EPMS_PublishWork" field="PublishConsignWBSID"
        runat="server" />
    <input id="hiAmount" type="hidden" tablename="EPMS_PublishWork" field="Amount" runat="server" />
    <%-- 主键--%>
    <input id="hiPublishWorkID" type="hidden" tablename="EPMS_PublishWork" field="PublishWorkID"
        runat="server" />
    <%-- 负责人角色部门兴源印务--%>
    <%--<input id="hiRoleDeptId" type="hidden" runat="server" value="734FAA8F-FFA4-417D-86E1-CDF9090945FE" />--%>
    <%-- 正式出版流程负责人角色--%>
    <%-- <input id="hiRoleA" type="hidden" runat="server" value="正式负责人" />--%>
    <%-- 零散出版负责人角色--%>
    <%-- <input id="hiRoleB" type="hidden" runat="server" value="零散负责人" />--%>
    <script type="text/javascript">
        function initCustomerPlugin() {            
            controlReq();
            $('#<%=rblChargeUserName.ClientID %>').live("change", function () {
                controlCharger("1");
            });

            $('#<%=tbChargeUserName.ClientID %>').live("change", function () {
                controlCharger("2");
            });

            if ('<%=IsFlowPage %>' == true || '<%=IsFlowPage %>' == "True") {
                if (typeof (initCostPlugin) == 'function') {
                    initCostPlugin();
                }
            }
        }

        function controlCharger(type) {
            if (type == "1") {
                //选择radiobuttonlist
                $("#<%=hiChargeUserName.ClientID %>").val("");
                $("#<%=hiChargeUserID.ClientID %>").val("");
                $('#<%=rblChargeUserName.ClientID %>').removeAttr('req');
                $('#<%=rblChargeUserName.ClientID %>').attr('req', '1');
                $('#<%=tbChargeUserName.ClientID %>').removeAttr('req');
                $("#<%=tbChargeUserName.ClientID %>").val($('#<%=rblChargeUserName.ClientID%> :checked').next().text());
            }
            //输入负责人信息
            else if (type == "2") {
                $('#<%=rblChargeUserName.ClientID%> :checked').removeAttr("checked");
                $("#<%=hiChargeUserName.ClientID %>").val("");
                $("#<%=hiChargeUserID.ClientID %>").val("");
                $('#<%=tbChargeUserName.ClientID %>').attr('req', '1');
                $('#<%=rblChargeUserName.ClientID %>').removeAttr('req');
            }
            return false;
        }

        function controlReq() {
            if ($("#<%=tbChargeUserName.ClientID %>").val() == "") {
                $('#<%=rblChargeUserName.ClientID %>').attr('req', '1');
                $('#<%=tbChargeUserName.ClientID %>').removeAttr('req');
            }
            else {
                $('#<%=tbChargeUserName.ClientID %>').attr('req', '1');
                $('#<%=rblChargeUserName.ClientID %>').removeAttr('req');
            }
        }

    </script>
</asp:Content>
