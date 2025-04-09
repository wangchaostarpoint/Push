<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketProjectAwardList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.MarketProjectAwardList"
    Title="工程奖金发放占工程分配金核算比例汇总表" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">结算月份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>年
         <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="150px">
         </zhongsoft:LightDropDownList>月
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程名称/工程编号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程类别</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectPhase" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="lbtnRefresh" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return false;">
            <span>
                <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="刷新成本与进度信息" height="16" />刷新成本与进度信息</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnAddToSettle" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return false;">
            <span>
                <img runat="server" id="img2" src="~/Themes/Images/btn_editor.gif" alt="加入项目奖结算表" height="16" />加入项目奖结算表</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnOpenSettle" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return false;">
            <span>
                <img runat="server" id="img3" src="~/Themes/Images/btn_dg_detail.gif" alt="进入项目奖结算表" height="16" />进入项目奖结算表</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" AllowFrozing="true" FrozenColNum="3"
        DataKeyNames="MarketProjectAwardID" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="MarketProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程编号" DataField="MarketProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ProjectManagerDept")))?"":Eval("ProjectManagerDept")+"：" )+Eval("ProjectManagerName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程类别" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="建设性质" DataField="BuildType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="ProjectPhaseNames">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下达项目组分配金（元）" DataField="GroupAward" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下达项目经理奖金（元）" DataField="MgrAward" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下达二级项目经理奖（元）" DataField="MgrSecAward" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下达主专业主设人津贴（元）" DataField="MajorSpeAward" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下达项目金合计（元）" DataField="TotalAward" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="预估成本（元）">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbEstimatedCost" field="EstimatedCost" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("EstimatedCost")==DBNull.Value?"": (Convert.ToDecimal(Eval("EstimatedCost") )).ToString("F2") %>'
                        CssClass="kpms-textbox-money" EnableTheming="false" DataType="Decimal2"></zhongsoft:LightTextBox>
                    <input type="hidden" runat="server" id="hiMarketProjectAwardID" value='<%#Eval("MarketProjectAwardID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="已产生成本（元）" DataField="CostIncurred" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="成本差值（元）" DataField="DiffCost" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="成本取值">
                <ItemTemplate>
                    <zhongsoft:LightDropDownList ID="ddlCostDepends" Width="100px" runat="server"
                        field="CostDepends" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'>
                        <asp:ListItem Value="已产生成本">已产生成本</asp:ListItem>
                        <asp:ListItem Value="预估成本">预估成本</asp:ListItem>
                    </zhongsoft:LightDropDownList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已发项目组奖金（元）">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbIssuedGroupAward" field="IssuedGroupAward" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("IssuedGroupAward")==DBNull.Value?"": (Convert.ToDecimal(Eval("IssuedGroupAward") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已发经理奖（元）">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbIssuedMrgAward" field="IssuedMrgAward" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("IssuedMrgAward")==DBNull.Value?"": (Convert.ToDecimal(Eval("IssuedMrgAward") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已发二级项目经理奖（元）">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbIssuedMgrSecAward" field="IssuedMgrSecAward" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("IssuedMgrSecAward")==DBNull.Value?"": (Convert.ToDecimal(Eval("IssuedMgrSecAward") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="已发主专业主设人津贴（元）" DataField="IssuedMajorSpeAward" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="发放合计（元）" DataField="TotalIssued" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="已发生费用（元）" DataField="ExpenseIncurred" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="产生成本占项目分配金的比例">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbPerCostAward" field="PerCostAward" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("PerCostAward")==DBNull.Value?"": (Convert.ToDecimal(Eval("PerCostAward") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="发放奖金占项目分配金的比例">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbPerIssuedAward" field="PerIssuedAward" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("PerIssuedAward")==DBNull.Value?"": (Convert.ToDecimal(Eval("PerIssuedAward") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="产生成本占预估成本的比例">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbPerCostEstimated" field="PerCostEstimated" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("PerCostEstimated")==DBNull.Value?"": (Convert.ToDecimal(Eval("PerCostEstimated") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已发生费用占项目分配金的比例">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbPerExpenseAward" field="PerExpenseAward" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("PerExpenseAward")==DBNull.Value?"": (Convert.ToDecimal(Eval("PerExpenseAward") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同产值">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbContractValue" field="ContractValue" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("ContractValue")==DBNull.Value?"": (Convert.ToDecimal(Eval("ContractValue") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目分配金占合同产值的比例">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbPerAwardContract" field="PerAwardContract" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("PerAwardContract")==DBNull.Value?"": (Convert.ToDecimal(Eval("PerAwardContract") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计产值">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbProjectValue" field="ProjectValue" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("ProjectValue")==DBNull.Value?"": (Convert.ToDecimal(Eval("ProjectValue") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目分配金占设计产值的比例">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbPerAwardProject" field="PerAwardProject" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("PerAwardProject")==DBNull.Value?"": (Convert.ToDecimal(Eval("PerAwardProject") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目金结余金额（元）" DataField="SurplusAward" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目金结算情况（元）">
                <ItemTemplate>
                    <zhongsoft:LightDropDownList ID="ddlSettleState" runat="server"
                        field="SettleState" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'>
                    </zhongsoft:LightDropDownList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="截至目前项目进度" DataField="SurplusAward" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目组考核扣款（元）">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbGroupDeduction" field="GroupDeduction" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("GroupDeduction")==DBNull.Value?"": (Convert.ToDecimal(Eval("GroupDeduction") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目经理考核扣款">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbMgrDecuction" field="MgrDecuction" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("MgrDecuction")==DBNull.Value?"": (Convert.ToDecimal(Eval("MgrDecuction") )).ToString("F2") %>'
                        DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="奖金结算">
                <ItemTemplate>
                    <asp:Label ID="lbIsAwardSettle" runat="server" Text='<%# Eval("IsAwardSettle") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="备注">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbMemo" field="Memo" flag="changeField" keyID='<%#Eval("MarketProjectAwardID") %>'
                        Text='<%# Eval("Memo")==DBNull.Value?"": (Convert.ToDecimal(Eval("Memo") )).ToString("F2") %>'
                        CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Style="display: none" />
    <input type="hidden" runat="server" id="hiKeyID" />
    <input type="hidden" runat="server" id="hiChangeValue" />
    <input type="hidden" runat="server" id="hiChangeField" />
    <script type="text/javascript">
        $thisMonth = null;
        $thisYear = null;
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            $('[flag="changeField"]').each(function () {
                $(this).live('change', function () {
                    var changeValue = $(this).val();
                    var keyID = $(this).attr("keyID");
                    var changeField = $(this).attr("field");
                    $('#<%=hiKeyID.ClientID %>').val(keyID);
                    $('#<%=hiChangeValue.ClientID %>').val(changeValue);
                    $('#<%=hiChangeField.ClientID %>').val(changeField);
                    $('#<%=btnSave.ClientID %>').click();
                });
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
