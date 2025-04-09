<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_InternalAgreementBGForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MIM.WF_InternalAgreementBGForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            协议书编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlInternalAgreementCode" Field="INTERNALAGREEMENTCODE"
                tableName="MIM_INTERNALAGREEMENTMAGFORM" req="1" activestatus="(23.提出协议变更申请)(23.修改协议变更申请)"
                runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlInternalAgreementCode_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiInternalAgreementCode" field="INTERNALAGREEMENTCODE"
                tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
        <td class="td-l">
            变更协议编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtChangeCode" Field="CHANGEAGREEMENTCODE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托单位（甲方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustDeptName" Field="ENTRUSTDEPTNAME" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiEntrustDeptId" field="ENTRUSTDEPTID" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
        <td class="td-l">
            受托单位（乙方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustedDeptName" Field="ENTRUSTEDDEPTNAME" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiEntrustedDeptId" runat="server" field="ENTRUSTEDDEPTID"
                tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" Field="CONTRACTCODE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiContractID" field="CONTRACTTID" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
        <td class="td-l">
            委托书编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProxyCode" Field="PROXYCODE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiTaskId" field="TASKINFOID" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程名称
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtProjectName" Field="PROJECTNAME" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiMarketProjectId" field="MARKETPROJECTID"
                tablename="MIM_INTERNALAGREEMENTMAGFORM" />
            <input type="hidden" runat="server" id="hiProjectCode" field="PROJECTCODE" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            建设规模
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBuildSize" Field="BUILDSIZE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            建设性质
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBuildType" Field="BUILDTYPE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                ShowFooter="True" PageSize="10" DataKeyNames="INTAGREEPROMAGMAPID" AutoGenerateColumns="false"
                PermissionStatus="true" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="阶段工程编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PROCONT" HeaderText="阶段项目<br/>合同额（万元）" HtmlEncode="false">
                        <ItemStyle HorizontalAlign="right" />
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="DIVISIONPROCONT" HeaderText="分割阶段项目<br/>合同额（万元）"
                        HtmlEncode="false">
                        <ItemStyle HorizontalAlign="right" />
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="变更后">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbDivisionProcontval" runat="server" CssClass="kpms-textbox-money"
                                content="procontVal" rollowner="procontVal" Style="width: 80px; text-align: right"
                                Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多8位整数，2位小数" Text='<%#Eval("DIVISIONPROCONTVAL") %>' />
                            <a id="open">显示比例</a>
                            <asp:Label runat="server" ID="lbDivision" rollowner="procontValView"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="ESTIMATEPROCONT" HeaderText="预估阶段项目<br/>合同额（万元）"
                        HtmlEncode="false">
                        <ItemStyle HorizontalAlign="right" />
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="DIVISIONESTIMATEPROCONT" HeaderText="分割预估阶段项目<br/>合同额（万元）"
                        HtmlEncode="false">
                        <ItemStyle HorizontalAlign="right" />
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="变更后">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbDivision" runat="server" CssClass="kpms-textbox-money"
                                content="divison" rollowner="divison" Style="width: 80px; text-align: right"
                                Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多8位整数，2位小数" Text='<%#Eval("DIVISIONESTIMATEPROCONTVAL") %>' />
                            <a id="view">显示比例</a>
                            <asp:Label runat="server" ID="lbDstimate" rollowner="divisonView"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="DESIGNNAME" HeaderText="项目经理">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="NAME" HeaderText="变更后">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="REQUIREDATE" HeaderText="要求乙方<br/>完成日期" HtmlEncode="false"
                        DataFormatString="{0:yyyy-MM-dd}">
                        <ItemStyle HorizontalAlign="center" />
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="变更后">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtRequireFinishTime" value='<%#Eval("REQUIREFINISHDATE" ,"{0:yyyy-MM-dd}") %>'
                                activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" req="1" class="kpms-textbox-date" runat="server"
                                readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                            <input type="hidden" id="hiTypeId" value='<%#Eval("PROJECTTYPEID") %>' runat="server"
                                content="typeId" />
                            <input type="hidden" id="hiTypeName" value='<%#Eval("PROJECTTYPENAME") %>' runat="server"
                                content="typeName" />
                            <input type="hidden" id="hiProjectPhaseId" value='<%#Eval("ORGANIZATIONID") %>' runat="server" />
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
            变更委托内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtEntrustedFile" Field="ENTRUSTEDFILE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server" maxtext="256" class="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="5">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变更后受托方需完成工作及责任
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtEntrustedWork" Field="ENTRUSTEDWORK" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server" maxtext="256" class="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="5">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            特别说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtSpecialMemo" Field="SPECIALMEMO" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                activestatus="(23.提出协议变更申请)(23.修改协议变更申请)" runat="server" maxtext="256" class="kpms-textarea"
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
                req="1" field="ENTRUSTDMANAGEROPINION" tablename="MIM_INTERNALAGREEMENTMAGFORM"
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
                req="1" field="ENTRUSTDEDMANAGEROPINION" tablename="MIM_INTERNALAGREEMENTMAGFORM"
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
            <asp:RadioButtonList ID="rblManage" runat="server" RepeatDirection="Horizontal" field="MANAGEMENTOPINION"
                req="1" tablename="MIM_INTERNALAGREEMENTMAGFORM" activestatus="(23.部门负责人审批)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<%--流程主键ID--%>
<input type="hidden" id="hiInternalAgreementId" runat="server" field="INTERNALAGREEMENTMAGID"
    tablename="MIM_INTERNALAGREEMENTMAGFORM" />
<input type="hidden" id="hiSign" runat="server" field="SIGNORCHANGE" tablename="MIM_INTERNALAGREEMENTMAGFORM"
    value="1" />
<%--拆分方式--%>
<input type="hidden" id="hiSplitType" runat="server" field="SPLITTYPE" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
<%--内部协议信息主键--%>
<input type="hidden" id="hiInternalAgreeId" runat="server" field="INTERNALAGREEMENTID"
    tablename="MIM_INTERNALAGREEMENTMAGFORM" />
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

        $('input[content^="procontVal"]').live("change", function () {
            isOver($(this));
        });

        $('input[content^="divison"]').live("change", function () {
            isOver($(this));
        });
    }

    $("#open").live("mouseover", function () {
        var divisionVal = 0;
        var bb = 0;
        var contractVal = $(this).parent('td').prev().prev().html();

        var $divisionVal = $(this).parent('td').parent('tr').find('input[content="procontVal"]');
        var $aaVal = $(this).parent('td').parent('tr').find('[rollowner="procontValView"]');
        var $mm = $(this).parent('td').parent('tr').find('[rollowner="value"]');
        var mm = $mm.html();
        if ($divisionVal != null) {
            divisionVal = $divisionVal.val();
        }
        if (contractVal != "" & contractVal != "0" && divisionVal != "") {
            bb = parseFloat(divisionVal) / parseFloat(contractVal);
            //保留2位小数，防止出现好多小数位的情况 
            bb = parseFloat(bb).toFixed(2);
        }
        $aaVal.html(bb);
        $aaVal.show();
    });

    $("#open").live("mouseout", function () {
        var $aaVal = $(this).parent('td').parent('tr').find('[rollowner="procontValView"]');
        $aaVal.hide();
    });

    $("#view").live("mouseover", function () {
        var estimateVal = 0;
        var bb = 0;
        var contractVal = $(this).parent('td').prev().prev().html();

        var $estimateVal = $(this).parent('td').parent('tr').find('input[content="divison"]');
        var $aaVal = $(this).parent('td').parent('tr').find('[rollowner="divisonView"]');
        var $mm = $(this).parent('td').parent('tr').find('[rollowner="viewValue"]');
        var mm = $mm.html();
        if ($estimateVal != null) {
            estimateVal = $estimateVal.val();
        }
        if (contractVal != "" & contractVal != "0" && estimateVal != "") {
            bb = parseFloat(estimateVal) / parseFloat(contractVal);
            //保留2位小数，防止出现好多小数位的情况 
            bb = parseFloat(bb).toFixed(2);
        }
        $aaVal.html(bb);
        $aaVal.show();
    });

    $("#view").live("mouseout", function () {
        var $aaVal = $(this).parent('td').parent('tr').find('[rollowner="divisonView"]');
        $aaVal.hide();
    });

    //判断分割额是否超过比例
    function isOver(obj) {
        var procontVal = 0;
        var divison = 0;
        var contractVal = obj.parent('td').prev().prev().html();
        var proMax = 0;
        //拆分方式
        var splitWay = $("#<%=hiSplitType.ClientID %>").val();
        var $procontVal = obj.parent('td').parent('tr').find('input[content^="procontVal"]');
        var $divison = obj.parent('td').parent('tr').find('input[content="divison"]');
        //工程类别
        var $typeName = obj.parent('td').parent('tr').find('input[content^="typeName"]');
        if ($typeName != null) {
            typeName = $typeName.val();
        }
        if ($procontVal != null) {
            procontVal = $procontVal.val();
        }
        if ($divison != null) {
            divison = $divison.val();
        }
        if (procontVal != "" && contractVal != "") {
            if (splitWay == "设计") {
                if (typeName == "发电工程") {
                    proMax = parseFloat(contractVal) * 0.875;
                }
                else if (typeName == "变电工程" || typeName == "新能源发电工程") {
                    proMax = parseFloat(contractVal) * 0.80;
                }
                else if (typeName == "送电工程" || typeName == "输变电工程可研") {
                    proMax = parseFloat(contractVal) * 0.75;
                }
                else if (typeName == "新能源风电工程") {
                    proMax = parseFloat(contractVal) * 0.67;
                }
                else {
                    proMax = parseFloat(contractVal) * 0.50;
                }
                if (parseFloat(contractVal).toFixed(4) < parseFloat(procontVal).toFixed(4)) {
                    alert("分割阶段项目合同额不能大于阶段项目合同额！");
                    $procontVal.val(0);
                }
            }
            else if (splitWay == "勘测") {
                if (typeName == "发电工程") {
                    proMax = parseFloat(contractVal) * 0.125;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(procontVal).toFixed(4)) {
                        alert("分割阶段项目合同额不能大于阶段项目合同额的12.5%！");
                        $procontVal.val(0);
                    }
                }
                else if (typeName == "变电工程" || typeName == "新能源发电工程") {
                    proMax = parseFloat(contractVal) * 0.20;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(procontVal).toFixed(4)) {
                        alert("分割阶段项目合同额不能大于阶段项目合同额的20%！");
                        $procontVal.val(0);
                    }
                }
                else if (typeName == "送电工程" || typeName == "输变电工程可研") {
                    proMax = parseFloat(contractVal) * 0.25;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(procontVal).toFixed(4)) {
                        alert("分割阶段项目合同额不能大于阶段项目合同额的25%！");
                        $procontVal.val(0);
                    }
                }
                else if (typeName == "新能源风电工程") {
                    proMax = parseFloat(contractVal) * 0.33;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(procontVal).toFixed(4)) {
                        alert("分割阶段项目合同额不能大于阶段项目合同额的33%！");
                        $procontVal.val(0);
                    }
                }
                else {
                    proMax = parseFloat(contractVal) * 0.50;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(procontVal).toFixed(4)) {
                        alert("分割阶段项目合同额不能大于阶段项目合同额的50%！");
                        $procontVal.val(0);
                    }
                }
            }
        }
        if (divison != "" && contractVal != "") {
            if (splitWay == "设计") {
                if (typeName == "发电工程") {
                    proMax = parseFloat(contractVal) * 0.875;
                }
                else if (typeName == "变电工程" || typeName == "新能源发电工程") {
                    proMax = parseFloat(contractVal) * 0.80;
                }
                else if (typeName == "送电工程" || typeName == "输变电工程可研") {
                    proMax = parseFloat(contractVal) * 0.75;
                }
                else if (typeName == "新能源风电工程") {
                    proMax = parseFloat(contractVal) * 0.67;
                }
                else {
                    proMax = parseFloat(contractVal) * 0.50;
                }
                if (parseFloat(contractVal).toFixed(4) < parseFloat(divison).toFixed(4)) {
                    alert("分割预估阶段项目合同额不能大于预估阶段项目合同额！");
                    $procontVal.val(0);
                }
            }
            else if (splitWay == "勘测") {
                if (typeName == "发电工程") {
                    proMax = parseFloat(contractVal) * 0.125;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(divison).toFixed(4)) {
                        alert("分割预估阶段项目合同额不能大于预估阶段项目合同额的12.5%！");
                        $procontVal.val(0);
                    }
                }
                else if (typeName == "变电工程" || typeName == "新能源发电工程") {
                    proMax = parseFloat(contractVal) * 0.20;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(divison).toFixed(4)) {
                        alert("分割预估阶段项目合同额不能大于预估阶段项目合同额的20%！");
                        $procontVal.val(0);
                    }
                }
                else if (typeName == "送电工程" || typeName == "输变电工程可研") {
                    proMax = parseFloat(contractVal) * 0.25;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(divison).toFixed(4)) {
                        alert("分割预估阶段项目合同额不能大于预估阶段项目合同额的25%！");
                        $procontVal.val(0);
                    }
                }
                else if (typeName == "新能源风电工程") {
                    proMax = parseFloat(contractVal) * 0.33;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(divison).toFixed(4)) {
                        alert("分割预估阶段项目合同额不能大于预估阶段项目合同额的33%！");
                        $procontVal.val(0);
                    }
                }
                else {
                    proMax = parseFloat(contractVal) * 0.50;
                    if (parseFloat(proMax).toFixed(4) < parseFloat(divison).toFixed(4)) {
                        alert("分割预估阶段项目合同额不能大于预估阶段项目合同额的50%！");
                        $procontVal.val(0);
                    }
                }
            }
        }
    }
</script>
