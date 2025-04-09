<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SRPMProjectBudgetDetailEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.TSM.List.TSM.SRPMProjectBudgetDetailEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td>
                年度
                <asp:DropDownList ID="ddlYear" runat="server" req="1"  Width="50px" 
                    Enabled="false"  Visible="false" >
                </asp:DropDownList>
                <asp:Label ID="lblYear" runat="server" Text="Label"></asp:Label>
                <%--<span class="kpms-star">注：切换其他年度前，请先保存当前数据，以免造成输入数据的丢失。</span>--%>
            </td>
        </tr>
        <tr>
            <td>
                <zhongsoft:TreeGridView ID="tgvBudgetDetailList" runat="server" AutoGenerateColumns="false"
                    SelfIdColumn="BudgetStatisticsID" ParentIdColumn="ParentID" PageSize="100" UseDefaultDataSource="true"
                    DataKeyNames="BudgetStatisticsID" IndentSize="10" OnRowDataBound="tgvBudgetDetailList_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%#tgvBudgetDetailList.CreateHeader(Container.DataItem) %>
                                <input type="hidden" runat="server" id="hiParamId" value='<%#Eval("SciTechFundsCategoryDetailID") %>' />
                                <input type="hidden" runat="server" id="hiParamName" value='<%#Eval("SmallCostName") %>' />
                                <input type="hidden" runat="server" id="hiParentId" value='<%#Eval("ParentID") %>' />
                                <input type="hidden" runat="server" id="hiHasChild" value='<%#Eval("IsHaschild") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Year" HeaderText="年度" ItemStyle-Width="40px" />
                        <asp:BoundField DataField="SmallCostName" HeaderText="预算科目" />
                        <asp:TemplateField HeaderText="总预算(元)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbBudgetMoney" runat="server" CssClass="kpms-textbox-money"
                                    selfid='<%#Eval("BudgetStatisticsID") %>' parentid='<%#Eval("ParentID") %>' Text='<%#Eval("BudgetMoney")%>'
                                    EnableTheming="false" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-金额必须是数字，最多保留2位小数！"
                                    maxtext="12" content="budgetSum"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="计算根据和理由" Visible="false">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbCalculateReason" runat="server" CssClass="kpms-textarea"
                                    EnableTheming="false" Text='<%#Eval("CalculateReason")%>' TextMode="MultiLine"
                                    maxtext="60"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="原因">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbReason" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                                    Text='<%#Eval("Reason")%>' TextMode="MultiLine" maxtext="60"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="科技经费">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbBudgetTech" runat="server" CssClass="kpms-textbox-money"
                                    selfid='<%#Eval("BudgetStatisticsID") %>' parentid='<%#Eval("ParentID") %>' Text='<%#Eval("BudgetTechnology")%>'
                                    EnableTheming="false" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-金额必须是数字，最多保留2位小数！"
                                    maxtext="12" onchange="getSumBudTech(this)" onkeyup="getSumBudTech(this)" content="btech"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="自筹">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbBudgetYear" runat="server" CssClass="kpms-textbox-money"
                                    selfid='<%#Eval("BudgetStatisticsID") %>' parentid='<%#Eval("ParentID") %>' Text='<%#Eval("BudgetYear")%>'
                                    EnableTheming="false" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-金额必须是数字，最多保留2位小数！"
                                    maxtext="12" onchange="getSumBudget(this)" onkeyup="getSumBudget(this)" content="budget"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="其它">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbNextYearBudget" runat="server" CssClass="kpms-textbox-money"
                                    selfid='<%#Eval("BudgetStatisticsID") %>' parentid='<%#Eval("ParentID") %>' Text='<%#Eval("NextYearBudget")%>'
                                    EnableTheming="false" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-金额必须是数字，最多保留2位小数！"
                                    maxtext="12" onchange="getSumNext(this)" onkeyup="getSumNext(this)" content="next"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:TreeGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        //#region 初始化加载
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

        function getSumBudget(obj) {
            var parentId = $(obj).attr("parentid");
            var selfid = $(obj).attr("selfid");
            if (parentId != "") {
                var sum = 0;
                var budget = 0;
                var budgetP = 0;
                $("input[parentid='" + parentId + "'][content$=budget]").each(function () { //当年预算自筹
                    var val = $(this).val();
                    if (val != "" && !isNaN(val) && val > 0) {
                        sum += parseFloat(val) * 100;
                    }
                });
                var bs = 0;
                $("input[selfid='" + selfid + "'][content$=budget]").each(function () {//同一行明年预算其它
                    var vals = $(this).val();
                    var varb = $("input[selfid='" + selfid + "'][content$=next]").val(); //同一行明年预算其它
                    var vartec = $("input[selfid='" + selfid + "'][content$=btech]").val(); //同一行科技经费
                    if (vals != "" && !isNaN(vals) && vals > 0) {
                        bs = parseFloat(vals) * 100;
                    }
                    if (varb != "" && !isNaN(varb) && varb > 0) {
                        bs += parseFloat(varb) * 100;
                    }
                    if (vartec != "" && !isNaN(vartec) && vartec > 0) {
                        bs += parseFloat(vartec) * 100;
                    }

                    $("input[selfid='" + selfid + "'][content$=budgetSum]").val(bs / 100); //同一行当年预算自筹 + 明年预算其它

                });

                var bsum = $("input[selfid='" + parentId + "'][content$=next]").val(); //一级明年预算其它
                var techsum = $("input[selfid='" + parentId + "'][content$=next]").val(); //一级科技经费

                if (bsum == "") {
                    bsum = "0";
                }
                if (techsum == "") {
                    techsum = "0";
                }
                if (sum > 0) {
                    $("input[selfid='" + parentId + "'][content$=budget]").val(sum / 100); //一级当年预算自筹

                    $("input[selfid='" + parentId + "'][content$=budgetSum]").val((parseFloat(bsum) * 100 + parseFloat(techsum) * 100 + sum) / 100); //一级当年预算自筹 + 明年预算其它
                }
            }
        }

        function getSumNext(obj) {
            var parentId = $(obj).attr("parentid");
            var selfid = $(obj).attr("selfid");
            if (parentId != "") {
                var sum = 0;
                $("input[parentid='" + parentId + "'][content$=next]").each(function () {//明年预算其它
                    var val = $(this).val();
                    if (val != "" && !isNaN(val) && val > 0) {
                        sum += parseFloat(val) * 100;
                    }
                });

                var bs = 0;
                $("input[selfid='" + selfid + "'][content$=next]").each(function () {//同一行明年预算其它
                    var vals = $(this).val();
                    var varb = $("input[selfid='" + selfid + "'][content$=budget]").val(); //同一行明年预算自筹
                    var vartech = $("input[selfid='" + selfid + "'][content$=btech]").val(); //同一行科技经费
                    if (vals != "" && !isNaN(vals) && vals > 0) {
                        bs = parseFloat(vals) * 100;
                    }
                    if (varb != "" && !isNaN(varb) && varb > 0) {
                        bs += parseFloat(varb) * 100;
                    }
                    if (vartech != "" && !isNaN(vartech) && vartech > 0) {
                        bs += parseFloat(vartech) * 100;
                    }

                    $("input[selfid='" + selfid + "'][content$=budgetSum]").val(bs / 100); //同一行当年预算自筹 + 明年预算其它

                });

                var bsum = $("input[selfid='" + parentId + "'][content$=budget]").val(); //一级当年预算自筹
                var btech = $("input[selfid='" + parentId + "'][content$=btech]").val(); //一级当年预算自筹
                if (bsum == "") {
                    bsum = "0";
                }
                if (btech == "") {
                    btech = "0";
                }

                if (sum > 0) {
                    $("input[selfid='" + parentId + "'][content$=next]").val(sum / 100); //一级明年预算其它

                    $("input[selfid='" + parentId + "'][content$=budgetSum]").val((parseFloat(bsum) * 100 + parseFloat(btech) * 100 + sum) / 100); //一级当年预算自筹 + 明年预算其它
                }
            }
        }

        function getSumBudTech(obj) {
            var parentId = $(obj).attr("parentid");
            var selfid = $(obj).attr("selfid");
            if (parentId != "") {
                var sum = 0;
                $("input[parentid='" + parentId + "'][content$=btech]").each(function () {//科技经费
                    var val = $(this).val();
                    if (val != "" && !isNaN(val) && val > 0) {
                        sum += parseFloat(val) * 100;
                    }
                });

                var bs = 0;
                $("input[selfid='" + selfid + "'][content$=btech]").each(function () {//同一行科技经费
                    var vals = $(this).val();
                    var varb = $("input[selfid='" + selfid + "'][content$=budget]").val(); //同一行明年预算自筹
                    var varnext = $("input[selfid='" + selfid + "'][content$=next]").val(); //同一行其它
                    if (vals != "" && !isNaN(vals) && vals > 0) {
                        bs = parseFloat(vals) * 100;
                    }
                    if (varb != "" && !isNaN(varb) && varb > 0) {
                        bs += parseFloat(varb) * 100;
                    }
                    if (varnext != "" && !isNaN(varnext) && varnext > 0) {
                        bs += parseFloat(varnext) * 100;
                    }

                    $("input[selfid='" + selfid + "'][content$=budgetSum]").val(bs / 100); //同一行当年预算自筹 + 明年预算其它+科技费用

                });

                var bsum = $("input[selfid='" + parentId + "'][content$=budget]").val(); //一级当年预算自筹
                var bnext = $("input[selfid='" + parentId + "'][content$=next]").val(); //一级其它
                if (bsum == "") {
                    bsum = "0";
                }
                if (bnext == "") {
                    bnext = "0";
                }

                if (sum > 0) {
                    $("input[selfid='" + parentId + "'][content$=btech]").val(sum / 100); //一级明年预算其它

                    $("input[selfid='" + parentId + "'][content$=budgetSum]").val((parseFloat(bsum) * 100 + parseFloat(bnext) * 100 + sum) / 100); //一级当年预算自筹 + 明年预算其它
                }
            }
        }

    </script>
</asp:Content>
