<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_InternalAgreementForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MIM.MIM_InternalAgreementForm" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            协议书编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtInternalAgreementCode" Field="INTERNALAGREEMENTCODE"
                class="kpms-textbox" tableName="MIM_INTERNALAGREEMENTMAGFORM" readonly="readonly"
                activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托单位（甲方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustDeptName" Field="ENTRUSTDEPTNAME" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiEntrustDeptId" field="ENTRUSTDEPTID" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
        <td class="td-l">
            受托单位（乙方）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlEntrustedDeptId" Field="ENTRUSTEDDEPTID" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                req="1" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server" class="kpms-textbox">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiEntrustedDeptName" runat="server" field="ENTRUSTEDDEPTNAME"
                tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同名称
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsContractName" PageUrl="~/MM/Obsolete/ContractSelector.aspx"
                ShowJsonRowColName="True" ResultForControls="{'hiContractID':'id','txtContractCode':'ContractCode','hiContractName':'name'}"
                ResultAttr="name" ActiveStatus="(23.填写内部协议信息)(23.修改内部协议信息)" OnClick="lbtnContractCode_Click" />
            <input type="hidden" runat="server" id="hiContractID" field="CONTRACTTID" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
            <input type="hidden" runat="server" id="hiContractName" field="CONTRACTNAME" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" Field="CONTRACTCODE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托书编号
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProxyCode" PageUrl="~/MM/Obsolete/TaskSelector.aspx"
                ShowJsonRowColName="True" ResultForControls="{'hiTaskId':'id','txtProxyName':'name','hiProxyCode':'TaskCode'}"
                ResultAttr="TaskCode" ActiveStatus="(23.填写内部协议信息)(23.修改内部协议信息)" OnClick="lbtnTaskCode_Click" />
            <input type="hidden" runat="server" id="hiTaskId" field="TASKINFOID" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
            <input type="hidden" runat="server" id="hiProxyCode" field="PROXYCODE" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
        <td class="td-l">
            委托书名称
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProxyName" Field="PROXYNAME" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                class="kpms-textbox" readonly="readonly" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)"
                runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程名称
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectName" Field="PROJECTNAME" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiMarketProjectId" field="MARKETPROJECTID"
                tablename="MIM_INTERNALAGREEMENTMAGFORM" />
            <input type="hidden" runat="server" id="hiProjectCode" field="PROJECTCODE" tablename="MIM_INTERNALAGREEMENTMAGFORM" />
        </td>
        <td class="td-l">
            建设性质
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBuildType" Field="BUILDTYPE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                readonly="readonly" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            建设规模
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBuildSize" Field="BUILDSIZE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            拆分方式
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblSplitType" runat="server" RepeatDirection="Horizontal"
                req="1" field="SPLITTYPE" tablename="MIM_INTERNALAGREEMENTMAGFORM" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)">
                <asp:ListItem Value="设计" Selected="True">设计</asp:ListItem>
                <asp:ListItem Value="勘测">勘测</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                ShowFooter="True" PageSize="10" DataKeyNames="INTAGREEPROMAGMAPID" AutoGenerateColumns="false"
                PermissionStatus="true" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="ProjectPhaseCode" HeaderText="合同涵盖阶段<br/>工程项目编号"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="TotalValue1" HeaderText="阶段项目<br/>合同额（万元）"
                        HtmlEncode="false">
                        <ItemStyle HorizontalAlign="right" />
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="TotalValue2" HeaderText="预估阶段项目<br/>合同额（万元）"
                        HtmlEncode="false">
                        <ItemStyle HorizontalAlign="right" />
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="分割阶段<br/>项目合同额（万元）" ItemStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbDivisionProcontval" runat="server" CssClass="kpms-textbox-money"
                                content="procontVal" rollowner="procontVal" Style="width: 100px; text-align: right"
                                req="1" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多8位整数，2位小数" Text='<%#Eval("DIVISIONPROCONTVAL") %>' />
                            <a id="open">显示比例</a>
                            <asp:Label runat="server" ID="lbDivision" rollowner="procontValView"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="lbFooter" rollowner="value"></asp:Label>
                            <a id="open">显示比例</a>
                            <asp:Label runat="server" ID="lbdivision" rollowner="procontValView"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="分割预估阶段<br/>项目合同额（万元）" ItemStyle-Width="27%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbDivision" runat="server" CssClass="kpms-textbox-money"
                                content="divison" rollowner="divison" Style="width: 100px; text-align: right"
                                req="1" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多8位整数，2位小数" Text='<%#Eval("DIVISIONESTIMATEPROCONTVAL") %>' />
                            <a id="view">显示比例</a>
                            <asp:Label runat="server" ID="lbDstimate" rollowner="divisonView"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="lbFooterView" rollowner="viewValue"></asp:Label>
                            <a id="view">显示比例</a>
                            <asp:Label runat="server" ID="lbdstimate" rollowner="divisonView"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="DesignName" HeaderText="项目经理">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="要求乙方完成日期">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtRequireFinishTime" value='<%#Eval("REQUIREFINISHDATE" ,"{0:yyyy-MM-dd}")%>'
                                rollowner="time" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" class="kpms-textbox-date"
                                runat="server" req="1" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                            <input type="hidden" id="hiTypeId" value='<%#Eval("TypeID") %>' runat="server" content="typeId" />
                            <input type="hidden" id="hiTypeName" value='<%#Eval("TNAME") %>' runat="server" content="typeName" />
                            <input type="hidden" id="hiProjectPhaseId" value='<%#Eval("ProjectPhaseId") %>' runat="server" />
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
            委托方提供资料及责任<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtEntrustedFile" Field="ENTRUSTEDFILE" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                req="1" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server" maxtext="256"
                class="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="5">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            受托方需完成工作及责任<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtEntrustedWork" Field="ENTRUSTEDWORK" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                req="1" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server" maxtext="256"
                class="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="5">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            特别说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtSpecialMemo" Field="SPECIALMEMO" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server" maxtext="256" class="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="5">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托方权利及义务
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbEntrustdRight" Field="ENTRUSTDRIGHTANDOBLIGATION" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                ReadOnly="true" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server" maxtext="256"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="12">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            受托方权利及义务
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbEntrustdedRight" Field="ENTRUSTDEDRIGHTANDOBLIGATION"
                tableName="MIM_INTERNALAGREEMENTMAGFORM" ReadOnly="true" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)"
                runat="server" maxtext="256" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Rows="12">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" Field="MEMO" tableName="MIM_INTERNALAGREEMENTMAGFORM"
                ReadOnly="true" activestatus="(23.填写内部协议信息)(23.修改内部协议信息)" runat="server" maxtext="256"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="12">
            </zhongsoft:LightTextBox>
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
            <asp:RadioButtonList ID="rblManage" runat="server" RepeatDirection="Horizontal" req="1"
                field="MANAGEMENTOPINION" tablename="MIM_INTERNALAGREEMENTMAGFORM" activestatus="(23.部门负责人审批)">
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
    value="0" />
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
        //权利义务赋值 
        if ($actName == "填写内部协议信息" && $bizCtx.action == "<%=(int)AccessLevel.Create %>") {
            var entrustdRight = "权利：1、委托方可遵照协议书规定的进度要求对受托方进行工作监督和考核。\n2、受托方因自身原因造成进度延误或提交资料不能达到协议书规定要求时，委托方可提出合同拆分调整建议。\n义务：1、委托方应按照协议书要求向受托方提供详尽的原始资料。\n2、受托方在对委托方提供的资料存在疑问时，委托方应积极提供技术解答或相应支持。";
            var entrustdedRight = "权利：1、受托方可按照协议书要求及时向委托方索取工程开展所需资料。\n2、因委托方原因造成工期延长时，受托方可提出延时申请。\n义务：1、受托方应严格按照协议书要求向委托方提供完整的成果资料。\n2、受托方应按照协议书要求在规定时间内提交成果资料。\n3、受托方在工作开展时应主动与委托方进行沟通，接受监督。";
            var memo = "1、合同未签订时，采用预估合同额，待合同签订后根据预估合同额确定比例调整合同额拆分值。\n2、协议由经营管理部审核备案方可有效。\n3、当甲乙双方产生异议需对协议内容进行修改时，应及时向经营管理部提出协议修改申请，甲乙双方不得擅自修改协议内容。";
            $('#<%=tbEntrustdRight.ClientID %>').val(entrustdRight);
            $('#<%=tbEntrustdedRight.ClientID %>').val(entrustdedRight);
            $('#<%=tbMemo.ClientID %>').val(memo);
        }

        $("#open").live("mouseover", function () {
            var divisionVal = 0;
            var bb = 0;
            var contractVal = $(this).parent('td').prev().prev().html();
            var b = "合同总额（万元）";
            if (contractVal.indexOf(b) >= 0) {
                contractVal = contractVal.replace("合同总额（万元）", "");
            }
            var $divisionVal = $(this).parent('td').parent('tr').find('input[content="procontVal"]');
            var $aaVal = $(this).parent('td').parent('tr').find('[rollowner="procontValView"]');
            var $mm = $(this).parent('td').parent('tr').find('[rollowner="value"]');
            var mm = $mm.html();
            if ($divisionVal != null) {
                divisionVal = $divisionVal.val();
            }
            var c = "分割合同总额（万元）";
            if (mm != null && mm.indexOf(c) >= 0) {
                mm = mm.replace("分割合同总额（万元）", "");
                divisionVal = mm;
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
            var b = "预估合同总额（万元）";
            if (contractVal.indexOf(b) >= 0) {
                contractVal = contractVal.replace("预估合同总额（万元）", "");
            }
            var $estimateVal = $(this).parent('td').parent('tr').find('input[content="divison"]');
            var $aaVal = $(this).parent('td').parent('tr').find('[rollowner="divisonView"]');
            var $mm = $(this).parent('td').parent('tr').find('[rollowner="viewValue"]');
            var mm = $mm.html();
            if ($estimateVal != null) {
                estimateVal = $estimateVal.val();
            }
            var c = "分割预估合同总额（万元）";
            if (mm != null && mm.indexOf(c) >= 0) {
                mm = mm.replace("分割预估合同总额（万元）", "");
                estimateVal = mm;
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

        $('input[content^="procontVal"]').live("change", function () {
            isOver($(this));
        });

        $('input[content^="divison"]').live("change", function () {
            isOver($(this));
        });

        //当拆分方式发生变化时，将数据清空
        $('#<%=rblSplitType.ClientID %>').click(function () {
            var count = $('#<%=gvList.ClientID %>')[0].rows.length;
            var $procontVal = $("[rollowner='procontVal']");
            var $divison = $("[rollowner='divison']");
            var $time = $("[rollowner='time']");
            for (var i = 0; i < count; i++) {
                $procontVal.eq(i).val("");
                $divison.eq(i).val("");
                $time.eq(i).val("");
            }
        })
    }

    //判断分割额是否超过比例
    function isOver(obj) {
        var procontVal = 0;
        var divison = 0;
        var typeName = 0;
        var contractVal = obj.parent('td').prev().prev().html();
        var proMax = 0;
        //拆分方式
        var splitWay = $("#<%=rblSplitType.ClientID %> input[type='radio']:checked").val();

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
