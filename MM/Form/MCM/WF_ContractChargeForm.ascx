<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractChargeForm.ascx.cs" Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_ContractChargeForm" %>

<table class="tz-table">
    <tr>
        <td class="td-l">到款通知单名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbReceiveNoticeName" runat="server" MaxLength="256" req="1"
                field="ReceiveNoticeName" tablename="MM_ContractCharge" activestatus="(23.提供到款通知单)" CssClass="kpms-textbox"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="flexible">
            <span>到款列表</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span id="Span1" runat="server" style="float: right" displaystatus="(3.提供到款通知单)">
                <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                    regex="^[1-9]{0,2}$" Text="1" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行
            </span>
            <label id="lbtip" runat="server"
                displaystatus="(2.*)" style="color: Red; float: right">
                请先保存再添加到款信息</label>
            <zhongsoft:LightPowerGridView ID="gvReceiveMoney" runat="server" AllowPaging="false" PageSize="10"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="ReceiveMoneyInfoID"
                BindGridViewMethod="BindReceiveMoney" permissionStatus="true"
                OnRowCommand="gvReceiveMoney_RowCommand">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="付款日期" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText type="text" runat="server" EnableTheming="false" ID="txtReceiveDate"
                                activestatus="(23.提供到款通知单)" readonly="readonly" value='<%#string.Format("{0:yyyy-MM-dd}",Eval("ReceiveDate")) %>'
                                class="kpms-textbox-date" />
                            <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ReceiveMoneyInfoID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="到款单位<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="txtReceiveUnitName" IsMutiple="false"
                                SelectPageMode="Dialog" activestatus="(23.提供到款通知单)" SourceMode="SelectorPage"
                                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ResultForControls="{'hiReceiveUnitID':'id'}"
                                Value='<%#Eval("ReceiveUnitName") %>' PageWidth="850" req="1"
                                PageUrl="../../Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiReceiveUnitID" value='<%#Eval("ReceiveUnitID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="到款金额（万元）<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbReceiveAmount" CssClass="kpms-textbox-money" activestatus="(23.提供到款通知单)" flag="receiveAmount"
                                req="1" EnableTheming="false" Text='<%# Eval("ReceiveAmount")==null?"":(Convert.ToDecimal(Eval("ReceiveAmount"))/10000).ToString() %>' DataType="Decimal2" Width="90%">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="到款描述" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbDescription" CssClass="kpms-textarea" activestatus="(23.提供到款通知单)"
                                EnableTheming="false" Text='<%#Eval("Description") %>' TextMode="MultiLine" MaxLength="1024">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" activestatus="(23.提供到款通知单)"
                                EnableTheming="false" Text='<%#Eval("Memo") %>' TextMode="MultiLine" MaxLength="1024">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                OnClientClick="return confirm('确定要删除吗？')" CommandArgument='<%#Eval("ReceiveMoneyInfoID") %>'>
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>收费拆分到合同列表</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span3" runat="server" displaystatus="(3.提供到款通知单)">
                <asp:LinkButton runat="server" ID="lbtnSelContract" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="选择合同" width="16"
                            height="16" />选择合同</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvContractDetail" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="ChargeContractDetailID" OnRowCommand="gvContractDetail_RowCommand">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ContractCode" HeaderText="合同编号" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractName" HeaderText="合同名称" ItemStyle-Width="100px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractValue" HeaderText="合同额（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="HadCharge" HeaderText="已收费（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="本次收费额（万元）<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSplitValue" flag="contractValue"
                                Text='<%# Eval("SplitValue")==DBNull.Value?"": (Convert.ToDecimal(Eval("SplitValue") )/10000).ToString("F2") %>' req="1"
                                CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.提供到款通知单)"></zhongsoft:LightTextBox>
                            <input type="hidden" runat="server" id="hiChargeContractDetailID" value='<%#Eval("ChargeContractDetailID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="添加拆分工程" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnAddMarket" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../Themes/Images/btn_dg_add.gif" 
                                    onclick="selReleMarket('<%# Eval("ChargeContractDetailID") %>');"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("ChargeContractDetailID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr flag="project">
        <td class="flexible" colspan="6">
            <span>收费拆分到工程列表</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr flag="project">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvChargeMProjectDetail" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="ChargeMProjectDetailID,ContractID" OnRowCommand="gvChargeMProjectDetail_RowCommand" >
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ContractCode" HeaderText="合同编号" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractName" HeaderText="合同名称" ItemStyle-Width="100px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MarketProjectCode" HeaderText="工程编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MarketProjectName" HeaderText="工程名称" ItemStyle-Width="100px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractValue" HeaderText="工程合同额" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ChargedValue" HeaderText="已收费（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="本次收费额（万元）<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSplitValue" flag="marketValue"
                                Text='<%# Eval("SplitValue")==DBNull.Value?"": (Convert.ToDecimal(Eval("SplitValue") )/10000).ToString("F2") %>' req="1"
                                CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.工程费用拆分)"></zhongsoft:LightTextBox>
                            <input type="hidden" runat="server" id="hiChargeMProjectDetailID" value='<%#Eval("ChargeMProjectDetailID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="说明" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" activestatus="(23.工程费用拆分)"
                                EnableTheming="false" Text='<%#Eval("Memo") %>' TextMode="MultiLine" MaxLength="1024">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="添加拆分部门" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnAddDept" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../Themes/Images/btn_dg_add.gif" 
                                    onclick="selChargeDept('<%# Eval("ChargeMProjectDetailID") %>');"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("ChargeMProjectDetailID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr flag="dept">
        <td class="flexible" colspan="6">
            <span>收费拆分到部门列表</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr flag="dept">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvChargeDeptDetail" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="ChargeDeptDetailID" OnRowCommand="gvChargeDeptDetail_RowCommand">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="MarketProjectCode" HeaderText="工程编号" Visible="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MarketProjectName" HeaderText="工程名称" ItemStyle-Width="100px" Visible="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="OrgUnitCode" HeaderText="部门编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="OrgUnitName" HeaderText="部门名称" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="本次收费额（万元）<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSplitValue" flag="deptValue"
                                Text='<%# Eval("SplitValue")==DBNull.Value?"": (Convert.ToDecimal(Eval("SplitValue") )/10000).ToString("F2") %>' req="1"
                                CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.部门费用拆分)"></zhongsoft:LightTextBox>
                            <input type="hidden" runat="server" id="hiChargeDeptDetailID" value='<%#Eval("ChargeDeptDetailID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("ChargeDeptDetailID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiContractChargeID" field="ContractChargeID" tablename="MM_ContractCharge" />
<%--选择拆分合同--%>
<input type="hidden" runat="server" id="hiContractDetail" />
<asp:Button runat="server" ID="btnBindContractDetail" OnClick="btnBindContractDetail_Click" Style="display: none" />
<%--选择拆分项目--%>
<input type="hidden" runat="server" id="hiMarketDetail" />
<asp:Button runat="server" ID="btnBindMarketDetail" OnClick="btnBindMarketDetail_Click" Style="display: none" />
<%--用于合同列表中选择市场项目功能标记当前合同明细ID--%>
<input type="hidden" runat="server" id="hiSelContractDetailID" />
<%--选择拆分部门--%>
<input type="hidden" runat="server" id="hiDeptDetail" />
<asp:Button runat="server" ID="btnBindDeptDetail" OnClick="btnBindDeptDetail_Click" Style="display: none" />
<%--用于项目列表中选择部门功能标记当前项目明细ID--%>
<input type="hidden" runat="server" id="hiSelMarketDetailID" />
<script type="text/javascript">

    function initCustomerPlugin() {
        if ($actName == "提供到款通知单") {
            $('[flag="project"]').hide();
            $('[flag="dept"]').hide();
        }
        else if ($actName == "工程费用拆分") {
            $('[flag="dept"]').hide();
        }
    }

    function checkForm() {
        if ($formAction == 0) {
            var totalAmount = 0;
            $('[flag="receiveAmount"]').each(function () {
                var value = $(this).val();
                if (value != '' && value != undefined) {
                    value = parseFloat(value);
                    totalAmount += value;
                }
            });
            totalAmount = totalAmount.toFixed(4);
            if ($actName == "提供到款通知单") {
                if ($('#<%=gvContractDetail.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                    alert('请先选择拆分合同！');
                    return false;
                }
                var contractValue = 0;
                $('[flag="contractValue"]').each(function () {
                    var value = $(this).val();
                    if (value != '' && value != undefined) {
                        value = parseFloat(value);
                        contractValue += value;
                    }
                });
                contractValue = contractValue.toFixed(4);
                if (parseFloat(totalAmount) != parseFloat(contractValue)) {
                    alert("拆分合同金额总和需等于到款金额总和");
                    return false;
                }
            }
            else if ($actName == "工程费用拆分") {
                if ($('#<%=gvChargeMProjectDetail.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                    alert('请先选择拆分工程！');
                    return false;
                }
                var marketValue = 0;
                $('[flag="marketValue"]').each(function () {
                    var value = $(this).val();
                    if (value != '' && value != undefined) {
                        value = parseFloat(value);
                        marketValue += value;
                    }
                });
                marketValue = marketValue.toFixed(4);
                if (parseFloat(totalAmount) != parseFloat(marketValue)) {
                    alert("拆分工程金额总和需等于到款金额总和");
                    return false;
                }
            }
            else if ($actName == "部门费用拆分") {
                if ($('#<%=gvChargeDeptDetail.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                    alert('请先选择拆分部门！');
                    return false;
                }
                var deptValue = 0;
                $('[flag="deptValue"]').each(function () {
                    var value = $(this).val();
                    if (value != '' && value != undefined) {
                        value = parseFloat(value);
                        deptValue += value;
                    }
                });
                deptValue = deptValue.toFixed(4);
                if (parseFloat(totalAmount) != parseFloat(deptValue)) {
                    alert("拆分部门金额总和需等于到款金额总和");
                    return false;
                }
            }
        }
        return true;
    }

    $('#<%=lbtnSelContract.ClientID %>').live('click', function () {
        selContract();
    });

    //选择合同
    function selContract() {
        var param = new InputParamObject("m");
        var json = { BaseType: "0" };
        getDivContract('<%=hiContractDetail.ClientID %>', param, json, bindContract);
        return false;
    }

    function bindContract() {
        $("#<%=btnBindContractDetail.ClientID %>").click();
    }

    //选择拆分项目
    function selReleMarket(id) {
        var param = new InputParamObject("m");
        var json = { IsFormalProject: "1" };
        $('#<%=hiSelContractDetailID.ClientID %>').val(id);
        getMarketDivProjects('<%=hiMarketDetail.ClientID %>', param, json, bindMarketDetail);
        return false;
    }

    function bindMarketDetail() {
        $("#<%=btnBindMarketDetail.ClientID %>").click();
    }

    //选择拆分部门
    function selChargeDept(id) {
        var param = new InputParamObject("m");
        $('#<%=hiSelMarketDetailID.ClientID %>').val(id);
        getTreeOrgs('<%=hiDeptDetail.ClientID %>', param, null, bindDeptDetail);
        return false;
    }

    function bindDeptDetail() {
        $("#<%=btnBindDeptDetail.ClientID %>").click();
    }
</script>
