<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_IntAgreeJudgeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MIM.WF_IntAgreeJudgeForm" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            原协议书编号/变更协议编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlAgreementCode" Field="INTERNALAGREEMENTCODE"
                tableName="MIM_INTAGREEJUDGEFORM" req="1" activestatus="(23.填写协议信息)(23.修改协议信息)"
                runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFormerProxyCode_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiAgreementCode" field="INTERNALAGREEMENTCODE"
                tablename="MIM_INTAGREEJUDGEFORM" />
        </td>
        <td class="td-l">
            评价协议编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRelateProjectId" Field="RELATEPROJECTID" tableName="MIM_INTAGREEJUDGEFORM"
                readonly="readonly" activestatus="(23.填写协议信息)(23.修改协议信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托单位（甲方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustDeptName" Field="ENTRUSTDEPTNAME" tableName="MIM_INTAGREEJUDGEFORM"
                readonly="readonly" activestatus="(23.填写协议信息)(23.修改协议信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiEntrustDeptId" field="ENTRUSTDEPTID" tablename="MIM_INTAGREEJUDGEFORM" />
        </td>
        <td class="td-l">
            受托单位（乙方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustedDeptName" Field="ENTRUSTEDDEPTNAME" tableName="MIM_INTAGREEJUDGEFORM"
                activestatus="(23.填写协议信息)(23.修改协议信息)" runat="server" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiEntrustedDeptId" runat="server" field="ENTRUSTEDDEPTID"
                tablename="MIM_INTAGREEJUDGEFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程名称
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtProjectName" Field="PROJECTNAME" tableName="MIM_INTAGREEJUDGEFORM"
                readonly="readonly" activestatus="(23.填写协议信息)(23.修改协议信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiMarketProjectId" field="MARKETPROJECTID"
                tablename="MIM_INTAGREEJUDGEFORM" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                ShowFooter="True" PageSize="10" DataKeyNames="INTAGREEPROMAPID" AutoGenerateColumns="false"
                PermissionStatus="true" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PROJECTCODENEW" HeaderText="阶段工程编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PROCONTVALNEW" HeaderText="阶段合同额（万元）" HtmlEncode="false">
                        <ItemStyle HorizontalAlign="right" />
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="DIVISIONPROCONTVALNEW" HeaderText="分割到乙方阶段合同额（万元）"
                        HtmlEncode="false">
                        <ItemStyle HorizontalAlign="right" />
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="建议奖罚比例(±%)" ItemStyle-HorizontalAlign="left">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSanctionProportion" runat="server" CssClass="kpms-textbox-money"
                                activestatus="(23.填写协议信息)(23.修改协议信息)" Style="width: 80px; text-align: right"
                                content="proportion" Regex="^[-+]?(\d|[1-9]\d|100)(\.\d{1,2})?$" errmsg="请填写小于100的数字，最多保留两位小数！"
                                Text='<%#Eval("SUGGESTSANCTIONPROPORTION") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="建议奖罚金额（万元）" ItemStyle-HorizontalAlign="left">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSanctionMoney" runat="server" CssClass="kpms-textbox-money"
                                activestatus="(23.填写协议信息)(23.修改协议信息)" Style="width: 80px; text-align: right"
                                content="sanction" Regex="^([1-9]\d{0,8}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多8位整数，2位小数"
                                Text='<%#Eval("SUGGESTSANCTIONVAL") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="评价后结算额（万元）" ItemStyle-HorizontalAlign="left" ItemStyle-Width="26%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="tbJudgeMoney" runat="server" value='<%#Eval("JUDGEACCOUNTVAL") %>'
                                class="kpms-textbox-money" content="judgeMoney" readonly="readonly" Style="text-align: right;
                                width: 80px;">
                            </zhongsoft:XHtmlInputText>
                            <a id="v">显示比例</a>
                            <asp:Label runat="server" ID="lbContaint" rollowner="containt"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="lbFooter" rollowner="value"></asp:Label>
                            <a id="v">显示比例</a>
                            <asp:Label runat="server" ID="lbContaint" rollowner="containt"></asp:Label>
                        </FooterTemplate>
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
            <zhongsoft:XHtmlInputText ID="txtSpecialMemo" Field="SPECIALMEMO" tableName="MIM_INTAGREEJUDGEFORM"
                activestatus="(23.填写协议信息)(23.修改协议信息)" runat="server" maxtext="256" class="kpms-textarea"
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
                req="1" field="ENTRUSTDJUDGEOPINION" tablename="MIM_INTAGREEJUDGEFORM" activestatus="(23.（甲方）总经理审批)">
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
                req="1" field="ENTRUSTDEDJUDGEOPINION" tablename="MIM_INTAGREEJUDGEFORM" activestatus="(23.（乙方）总经理审批)">
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
            <asp:RadioButtonList ID="rblManage" runat="server" RepeatDirection="Horizontal" field="MANAGEMENTOPINION"
                req="1" tablename="MIM_INTAGREEJUDGEFORM" activestatus="(23.部门负责人审批)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<%--流程主键ID--%>
<input type="hidden" id="hiIntAgreeJudgeId" runat="server" field="INTAGREEJUDGEID"
    tablename="MIM_INTAGREEJUDGEFORM" />
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

        $("#v").live("mouseover", function () {
            var judgeVal = 0;
            var bb = 0;
            var contractVal = $(this).parent('td').prev().prev().prev().prev().html();
            var b = "总合同额（万元）";
            if (contractVal.indexOf(b) >= 0) {
                contractVal = contractVal.replace("总合同额（万元）", "");
            }
            var $judgeVal = $(this).parent('td').parent('tr').find('input[content="judgeMoney"]');
            var $aaVal = $(this).parent('td').parent('tr').find('[rollowner="containt"]');
            var $mm = $(this).parent('td').parent('tr').find('[rollowner="value"]');
            var mm = $mm.html();
            if ($judgeVal != null) {
                judgeVal = $judgeVal.val();
            }
            var c = "评价后结算总额（万元）";
            if (mm != null && mm.indexOf(c) >= 0) {
                mm = mm.replace("评价后结算总额（万元）", "");
                judgeVal = mm;
            }
            if (contractVal != "" & contractVal != "0" && judgeVal != "") {
                bb = parseFloat(judgeVal) / parseFloat(contractVal);
                //保留2位小数，防止出现好多小数位的情况 
                bb = parseFloat(bb).toFixed(2);
            }
            $aaVal.html(bb);
            $aaVal.show();
        });

        $("#v").live("mouseout", function () {
            var $aaVal = $(this).parent('td').parent('tr').find('[rollowner="containt"]');
            $aaVal.hide();
        });

        $('input[content^="proportion"]').live("change", function () {
            total($(this));
        });

        $('input[content^="sanction"]').live("change", function () {
            total($(this));
        });
    }

    //计算合计
    function total(obj) {
        var proportion = 0;
        var sanction = 0;
        var contractVal = obj.parent('td').prev().html();
        var judgeVal = 0;
        var $proportion = $(obj).parent('td').parent('tr').find('input[content^="proportion"]');
        var $sanction = $(obj).parent('td').parent('tr').find('input[content="sanction"]');
        var $judgeVal = $(obj).parent('td').parent('tr').find('input[content="judgeMoney"]');
        if ($proportion != null) {
            proportion = $proportion.val();
        }
        if ($sanction != null) {
            sanction = $sanction.val();
        }
        if (proportion == "") {
            $sanction.removeAttr("disabled");
        }
        else if (proportion != "" && contractVal != "") {
            $sanction.attr("disabled", "disabled");
            sanction = parseFloat(proportion / 100) * parseFloat(contractVal);
            //保留四位小数，防止出现好多小数位的情况 
            sanction = parseFloat(sanction).toFixed(4);
            $sanction.val(sanction);
        }
        if (sanction != "" && contractVal != "") {
            judgeVal = parseFloat(contractVal) + parseFloat(sanction);
            //保留四位小数，防止出现好多小数位的情况 
            judgeVal = parseFloat(judgeVal).toFixed(4);
            $judgeVal.val(judgeVal);
        }
    }
</script>
