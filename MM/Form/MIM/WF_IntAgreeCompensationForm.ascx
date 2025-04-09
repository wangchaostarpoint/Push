<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_IntAgreeCompensationForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MIM.WF_IntAgreeCompensationForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            内部协议编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlIntAgreementCode" Field="INTERNALAGREEMENTCODE"
                tableName="MIM_INTAGREECOMPENSATIONFORM" req="1" activestatus="(23.填写补偿信息)(23.修改补偿信息)"
                runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlIntAgreementCode_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiIntAgreementCode" field="INTERNALAGREEMENTCODE"
                tablename="MIM_INTAGREECOMPENSATIONFORM" />
        </td>
        <td class="td-l">
            补偿协议编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtIntAgreeCompensationCode" Field="INTAGREECOMPENSATIONCODE"
                tableName="MIM_INTAGREECOMPENSATIONFORM" readonly="readonly" activestatus="(23.填写补偿信息)(23.修改补偿信息)"
                runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托单位（甲方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustDeptName" Field="ENTRUSTDEPTNAME" tableName="MIM_INTAGREECOMPENSATIONFORM"
                readonly="readonly" activestatus="(23.填写补偿信息)(23.修改补偿信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiEntrustDeptId" field="ENTRUSTDEPTID" tablename="MIM_INTAGREECOMPENSATIONFORM" />
        </td>
        <td class="td-l">
            受托单位（乙方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustedDeptName" Field="ENTRUSTEDDEPTNAME" tableName="MIM_INTAGREECOMPENSATIONFORM"
                activestatus="(23.填写补偿信息)(23.修改补偿信息)" runat="server" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiEntrustedDeptId" runat="server" field="ENTRUSTEDDEPTID"
                tablename="MIM_INTAGREECOMPENSATIONFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" Field="CONTRACTCODE" tableName="MIM_INTAGREECOMPENSATIONFORM"
                activestatus="(23.填写补偿信息)(23.修改补偿信息)" runat="server" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiContractID" field="CONTRACTID" tablename="MIM_INTAGREECOMPENSATIONFORM" />
            <input type="hidden" runat="server" id="hiContractName" field="CONTRACTNAME" tablename="MIM_INTAGREECOMPENSATIONFORM" />
        </td>
        <td class="td-l">
            委托书编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProxyCode" Field="PROXYCODE" tableName="MIM_INTAGREECOMPENSATIONFORM"
                activestatus="(23.填写补偿信息)(23.修改补偿信息)" runat="server" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiTaskId" field="TASKINFOID" tablename="MIM_INTAGREECOMPENSATIONFORM" />
            <input type="hidden" runat="server" id="hiProxyName" field="PROXYNAME" tablename="MIM_INTAGREECOMPENSATIONFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" Field="PROJECTCODE" tableName="MIM_INTAGREECOMPENSATIONFORM"
                readonly="readonly" activestatus="(23.填写补偿信息)(23.修改补偿信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiMarketProjectId" field="MARKETPROJECTID"
                tablename="MIM_INTAGREECOMPENSATIONFORM" />
        </td>
        <td class="td-l">
            工程名称
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectName" Field="PROJECTNAME" tableName="MIM_INTAGREECOMPENSATIONFORM"
                readonly="readonly" activestatus="(23.填写补偿信息)(23.修改补偿信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                ShowFooter="True" PageSize="15" AutoGenerateColumns="false" PermissionStatus="true"
                DataKeyNames="INTAGREECOMPROMAPID" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="PROJECTCODENEW" HeaderText="阶段工程编号" HeaderStyle-Width="40%">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="阶段项目补偿总额（万元）" ItemStyle-HorizontalAlign="right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbCompensationVal" runat="server" CssClass="kpms-textbox-money"
                                req="1" activestatus="(23.填写补偿信息)(23.修改补偿信息)" Style="width: 80px; text-align: right"
                                Regex="^([1-9]\d{0,8}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多8位整数，2位小数" Text='<%#Eval("COMPENSATIONVAL") %>' />
                            <input type="hidden" id="hiProjPhaseId" value='<%#Eval("ORGANIZATIONID") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            特别说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtSpecialMemo" Field="SPECIALMEMO" tableName="MIM_INTAGREECOMPENSATIONFORM"
                activestatus="(23.填写补偿信息)(23.修改补偿信息)" runat="server" maxtext="256" class="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="5">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr id="entrustd">
        <td class="td-l">
            委托方总经理意见
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblEntrustd" runat="server" RepeatDirection="Horizontal"
                req="1" field="ENTRUSTDMANAGEROPINION" tablename="MIM_INTAGREECOMPENSATIONFORM"
                activestatus="(23.（甲方）总经理审批)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr id="entrusted">
        <td class="td-l">
            受托方总经理意见
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblEntrusted" runat="server" RepeatDirection="Horizontal"
                req="1" field="ENTRUSTDEDMANAGEROPINION" tablename="MIM_INTAGREECOMPENSATIONFORM"
                activestatus="(23.（乙方）总经理审批)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr id="manage">
        <td class="td-l">
            经营管理部部长意见
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblManage" runat="server" RepeatDirection="Horizontal" req="1"
                field="MANAGEMENTOPINION" tablename="MIM_INTAGREECOMPENSATIONFORM" activestatus="(23.部门负责人审批)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<%--流程主键ID--%>
<input type="hidden" id="hiIntAgreeCompensationId" runat="server" field="INTAGREECOMPENSATIONID"
    tablename="MIM_PERSONBORROWORBGFORM" />
<%--内部协议信息主键 --%>
<input type="hidden" id="hiIntAgreementId" runat="server" field="INTERNALAGREEMENTID"
    tablename="MIM_PERSONBORROWORBGFORM" />
<%--角色名称--%>
<input type="hidden" id="hiRoleNameZ" runat="server" value="总经理" />
<input type="hidden" id="hiRoleNameF" runat="server" value="副总经理" />
<input type="hidden" id="hiManage" runat="server" value="经营经理" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();
    }
</script>
