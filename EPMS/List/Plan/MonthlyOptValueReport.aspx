<%@ Page Title="月度产值统计" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="MonthlyOptValueReport.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.MonthlyOptValueReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">计划年月</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>年
        <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>月
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程名称/项目编号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">所属工程包</span> <span>
        <zhongsoft:LightTextBox ID="tbPackage" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectPhase" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程类别</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" flag="ddlDept"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" 
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" AllowFrozing="true" FrozenColNum="5"
        DataKeyNames="PlanActivityOfProjectID" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程涉及专业" DataField="RelateMajors">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="规模" DataField="ProjectScale" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程类别" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ManagerDeptName")))?"":Eval("ManagerDeptName")+"：" )+Eval("ManagerUserName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划开始时间" DataField="PlanStartDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成时间" DataField="PlanCompleteDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="目前已完成进度（%）" DataField="ThisFactTotalRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目估算产值（万元）" DataField="MEstimateContractVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段估算产值（万元）" DataField="PEstimateContractVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段已完成估算产值（万元）" DataField="FinishedESVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段待完成估算产值（万元）" DataField="ToDoESVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目合同产值（万元）" DataField="MContractValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段合同产值（万元）" DataField="PContractValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段已完成合同产值（万元）" DataField="FinishedCEVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本阶段待完成合同产值（万元）" DataField="ToDoCEVal" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月计划完成进度" DataField="ThisPlanFinishRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月实际完成进度" DataField="ThisFactFinishRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月完成估算产值（万元）" DataField="ThisFactESValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="本月完成合同产值（万元）" DataField="ThisFactCEValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下月计划完成进度" DataField="NextPlanFinishRate" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下月计划完成估算产值（万元）" DataField="NextPlanESValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="下月计划完成合同产值（万元）" DataField="NextPlanCEValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目状态">
                <ItemTemplate>
                    <asp:Label ID="lbProjectState" runat="server" Text='<%# Eval("ProjectState") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="总卷册数量" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationID") %>','','','')" title='<%# Eval("TotalRollNum")%>'
                        style="color: Blue"><%# Eval("TotalRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已完成卷册" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return viewItem('<%#Eval("OrganizationID") %>','FactCompleteTime','','')" title='<%# Eval("TotalFinishRollNum")%>'
                        style="color: Blue"><%# Eval("TotalFinishRollNum")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="卷册去向" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnRoll" runat="server" EnableTheming="false" OnClientClick="return false" ToolTip="查看卷册去向">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="viewRollInfo('3','<%# Eval("OrganizationID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div id="dialogDiv" style="display: none">
        <asp:CheckBox runat="server" ID="ckbCheckAll" Text="全选" checkFlag="all" />
        <hr/>
        <asp:CheckBoxList runat="server" ID="ckblExportFilter" flag="ckbl" RepeatDirection="Horizontal" RepeatColumns="3" />
    </div>
    <input type="hidden" runat="server" id="hiSelectValue" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            var rowFilter = "<%=RowFilter%>";
            if (rowFilter == "" || parseBool('<%=KPMSUser.IsAdmin%>')) {
                $('[flag="ddlDept"]').show();
            }
            else {
                $('[flag="ddlDept"]').hide();
            }
            
            exportBind();

        }

        //初始化各个控件绑定值
        function exportBind() {
            //绑定全选控件点击方法
            $("#<%=ckbCheckAll.ClientID %>").live("click", function () { allFilterSelect(); });
            //绑定复选列表控件点击方法(针对全选控件选中状态)
            $("#<%=ckblExportFilter.ClientID %>").live("click", function () { setAllChecked(); });
            //初始化全选控件状态为不选中
            $("[checkFlag='all']").find("input")[0].checked = false;
            //根据全选控件状态,初始化控件列表选中状态
            allFilterSelect();
            //导出Excel控件解绑
            $("[title='导出Excel']").unbind();
            //导出Excel控件绑定点击方法
            $("[title='导出Excel']").each(function () {
                $(this).live('click', function () {
                    $("#dialogDiv").show();
                    showExcelFilterDialog();
                    return false;
                });
            });
        }

        //全选点击事件
        function allFilterSelect() {
            var $checkAll = $("[checkFlag='all']").find("input");
            $("#<%=ckblExportFilter.ClientID %> input").each(function () { 
                $(this)[0].checked=$checkAll[0].checked ;
                if ($checkAll[0].checked)
                    $(this).next().css("font-weight", "bold");
                else
                    $(this).next().removeAttr("style");
            });
            if ($checkAll[0].checked)
                $checkAll.next().css("font-weight", "bold");
            else 
                $checkAll.next().removeAttr("style");
            return false;
        }

        //设置全选是否选中
        function setAllChecked(){
            var isAllChecked = true;
            var $checkAll = $("[checkFlag='all']").find("input");
            $("#<%=ckblExportFilter.ClientID %> input").each(function () { 
                if(!$(this)[0].checked){
                    isAllChecked=false;
                }
            });
            $checkAll[0].checked = isAllChecked;
            if (isAllChecked)
                $checkAll.next().css("font-weight", "bold");
            else
                $checkAll.next().removeAttr("style");
        }

        //弹出层
        function showExcelFilterDialog() {
            $("#dialogDiv").dialog({
                autoOpen: true,   // 是否自动弹出窗口
                modal: true,    // 设置为模态对话框
                resizable: true,
                width: 650,   //弹出框宽度
                height: 430,   //弹出框高度
                title: "选择导出列",  //弹出框标题
                position: "center",  //窗口显示的位置
                buttons: {
                    '确定': function () {
                        //找到不需要导出的列
                        var values = "";
                        $("input[id^='<%=ckblExportFilter.ClientID%>']").each(function () {
                            if (!this.checked) {
                                values = values + $(this).next().text() + ",";
                            }
                        });
                        $("#<%=hiSelectValue.ClientID%>").val(values);

                        //导出Excel控件解绑,否则点击确定会再次弹出层
                        $("[title='导出Excel']").unbind();
                        //为导出Excel按钮绑定单击事件,否则因为解绑无法进入后天默认导出方法
                        $("[title='导出Excel']").each(function () {
                            $(this).live('click', function () {
                                return true;
                            });
                        });
                        //执行默认导出
                        $("[title='导出Excel']")[0].click();
                        //重新绑定导出Excel按钮可以弹出层
                        exportBind();
                        $(this).dialog("close");
                    },
                    '取消': function () {
                        $(this).dialog("close");
                        $("#dialogDiv").hide();
                    }
                }
            });
        }

        

        //打开卷册目录
        function viewItem(orgID, timeField, dataMonth, dataYear) {
            var url = buildQueryUrl("/EPMS/List/Plan/ProjectWeekPlanWBSList.aspx",
                {
                    OrganizationID: orgID, TimeField: timeField, DataMonth: dataMonth, DataYear: dataYear
                });
            showDivDialog(url, null, 850, 500, null);

            return false;
        }

        //卷册去向
        function viewRollInfo(actionType, organizationID) {
            var json = { actionType: actionType, OrganizationID: organizationID };
            var url = buildQueryUrl('', json);
            showDivDialog(url, "", 650, 400, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
