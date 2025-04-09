<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TechProjectExpenditure.ascx.cs"
    Inherits="Zhongsoft.Portal.TSM.Form.TM.WF_TechProjectExpenditure" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" field="ProjectName"
                req="1" tablename="SRPM_ProjectCheckForm" IsMutiple="false" EnableTheming="false"
                ResultForControls="{ 'hiProjectListID':'ProjectListID',
                 'tbProjectManagerName':'ProjectManagerName','hiProjectManagerID':'ProjectManagerID'
                ,'txtProjectDeptName':'ProjectDeptName','txtTechnologySource':'TechnologySource','hiProjectDeptID':'ProjectDeptID'
                ,'txtMobilePhone':'MobilePhone' ,'hiProjectManagerID':'ProjectManagerID','tbYear':'ProjectYear'}"
               SelectPageMode="Dialog"  ResultAttr="name" ShowJsonRowColName="true" activestatus="(23.提出结算申请)(23.修改结算申请)"
                PageUrl="~/TSM/Obsolete/TechProjectTaskSelector.aspx" />
            <input type="hidden" runat="server" id="hiProjectListID" field="ProjectListID" tablename="SRPM_ProjectCheckForm" />
        </td>
        <td class="td-l">
            承担部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectDeptName" runat="server" readonly="readonly"
                Field="ProjectDeptName" TableName="SRPM_ProjectCheckForm" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiProjectDeptID" field="ProjectDeptID" tablename="SRPM_ProjectCheckForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                style="width: 120px" tablename="SRPM_ProjectCheckForm" field="ContractCode" readonly="readonly"
                activestatus="(23.提出结算申请)(23.修改结算申请)" />
        </td>
        <td class="td-l">
            合同名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="ContractName"
                tablename="SRPM_ProjectCheckForm" activestatus="(23.提出结算申请)(23.修改结算申请)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE', 'tbContractName':'name'}"
                PageWidth="850" PageUrl="~/MM/Obsolete/ContractSelector.aspx" ></zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="ContractID" runat="server" tablename="SRPM_ProjectCheckForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            立项年度
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbYear" runat="server" readonly="readonly" Field="ProjectYear"
                TableName="SRPM_ProjectCheckForm" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            项目负责人
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="tbProjectManagerName" runat="server" readonly="readonly"
                Field="ProjectManagerName" TableName="SRPM_ProjectCheckForm" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiProjectManagerID" field="ProjectManagerID"
                tablename="SRPM_ProjectCheckForm" />
        </td>
        <td class="td-l">
            手机号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtMobilePhone" runat="server" readonly="readonly"
                Field="MobilePhone" TableName="SRPM_ProjectCheckForm" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            结算时间<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:XHtmlInputText ID="tbApplyDate" runat="server" Field="ApplyDate" Tablename="SRPM_ProjectCheckForm"
                readonly="readonly" class="kpms-textbox-date" req="1" ActiveStatus="(23.提出结算申请)(23.修改结算申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            结算说明
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectEvolve" runat="server" CssClass="com_textbox_max"
                TextMode="MultiLine" maxtext="128" Field="CruxTechnology" TableName="SRPM_ProjectCheckForm"
                Height="30px" ActiveStatus="(23.提出结算申请)(23.修改结算申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" style="border-right: none;">
            结算费用（万元）：
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:TreeGridView ID="tgvBudgetDetailList" runat="server" AutoGenerateColumns="false"
                SelfIdColumn="BudgetStatisticsID" ParentIdColumn="ParentID" PageSize="100" UseDefaultDataSource="true"
                DataKeyNames="BudgetStatisticsID" IndentSize="10" OnRowDataBound="tgvBudgetDetailList_RowDataBound"
                ShowFooter="true">
                <FooterStyle Font-Bold="true" HorizontalAlign="Right" />
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
                    <asp:BoundField DataField="SmallCostName" HeaderText="预算科目" ItemStyle-Width="120px" />                     
                    <asp:TemplateField HeaderText="总预算(万元)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbBudgetMoney" runat="server" CssClass="kpms-textbox-money"
                                selfid='<%#Eval("BudgetStatisticsID") %>' parentid='<%#Eval("ParentID") %>' Text='<%#Eval("BudgetMoney")%>'
                                EnableTheming="false" regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-金额必须是数字，最多保留2位小数！"
                                maxtext="12" content="budgetSum"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="本次结算(万元)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbThisCost" runat="server" CssClass="kpms-textbox-money"
                                selfid='<%#Eval("BudgetStatisticsID") %>' parentid='<%#Eval("ParentID") %>' Text='<%#Eval("ThisCost")%>'
                                EnableTheming="false" regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-金额必须是数字，最多保留2位小数！"
                                maxtext="12" onchange="getSumCost(this)" onkeyup="getSumCost(this)" content="cost"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已结算额(万元)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbAlOccurNumber" runat="server" CssClass="kpms-textbox-money"
                                selfid='<%#Eval("BudgetStatisticsID") %>' parentid='<%#Eval("ParentID") %>' Text='<%#Eval("AlOccurNumber")%>'
                                EnableTheming="false" regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-金额必须是数字，最多保留2位小数！"
                                maxtext="12" content="budgetold" Enabled="false"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="总结算额(万元)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbAmber" runat="server" CssClass="kpms-textbox-money"
                                selfid='<%#Eval("BudgetStatisticsID") %>' parentid='<%#Eval("ParentID") %>' Text='<%#Eval("BudgetAlOccurNumber")%>'
                                EnableTheming="false" regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-金额必须是数字，最多保留2位小数！"
                                maxtext="12" content="budgetoldsum" Enabled="false"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:TreeGridView>
        </td>
    </tr>
    <tr id="Tr3" runat="server">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvFileList" runat="server" AutoGenerateColumns="false"
                AllowPaging="true" BindGridViewMethod="BindFileListGrid">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名">
                        <ItemTemplate>
                            <a href="<%=WebAppPath %>/Sys/FileDocument/FileDownload.aspx?fileId=<%#Eval("FileId") %>"
                                title="【点击下载】<%# Eval("FileName") %>" target="_blank" style="color: Blue; text-decoration: underline;">
                                <%# Eval("FileName") %>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UploadDate" HeaderText="上传时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                        ItemStyle-Width="120px" />
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" EnableTheming="false" runat="server" CommandArgument='<%#Eval("FileId") %>'
                                CommandName="DeleteData">
                                        <img alt="删除" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" title="点击删除该文件"
                                         onclick="return confirm('-确定删除该文件吗？');"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<%--流程主键  --%>
<input type="hidden" runat="server" id="hiSRPMProjectCheckID" field="SRPMProjectCheckID"
    tablename="SRPM_ProjectCheckForm" />
<input type="hidden" runat="server" id="hiAcceptanceMethod" field="AcceptanceMethod"
    tablename="SRPM_ProjectCheckForm" value="结算" />
<script type="text/javascript">
    //加载相关方法
    function InitCustomerPlugin() {
        checkRegex();
        checkMaxLength();

    }

    function getSumCost(obj) {
        var parentId = $(obj).attr("parentid");
        var selfid = $(obj).attr("selfid");

        if (parentId != "") {
            var sum = 0;
            $("input[parentid='" + parentId + "'][content$=cost]").each(function () {
                var val = $(this).val();
                if (val != "" && !isNaN(val)) {
                    sum += parseFloat(val) * 100;
                }
            });
            

            var bde = $("input[selfid='" + selfid + "'][content$=cost]").val();
            var budgetSum = $("input[selfid='" + selfid + "'][content$=budgetSum]").val();
            var budgetold = $("input[selfid='" + selfid + "'][content$=budgetold]").val();
            var budgetsum = $("input[selfid='" + parentId + "'][content$=budgetold]").val();
            if (budgetold == "") {
                budgetold = 0;
            }
            if (budgetsum == "") {
                budgetsum = 0;
            }
            $("input[selfid='" + selfid + "'][content$=budgetoldsum]").val(parseFloat(budgetold) + parseFloat(bde)); 

            if (parseFloat(budgetold) + parseFloat(bde) > budgetSum) {
                alert("[本次结算+已结算额] 不能大于总预算！");
                $("input[selfid='" + parentId + "'][content$=cost]").val(0);
                $("input[selfid='" + selfid + "'][content$=cost]").val(0);  
            }
            else { 
                $("input[selfid='" + parentId + "'][content$=cost]").val(sum / 100);
                $("input[selfid='" + parentId + "'][content$=budgetoldsum]").val((parseFloat(budgetsum) + parseFloat(sum)/100)  );
            }
        }
    } 
    
</script>
