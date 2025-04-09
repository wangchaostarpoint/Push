<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="WBSProjectPeriodList.aspx.cs" Inherits="Zhongsoft.Portal.QSM.List.ProjectPeriodPlanList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年度</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanYear" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">月度 </span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanPeriod" class="kpms-ddlsearch"
            EnableTheming="false" secondflag="noYear">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <!----->
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false">
        </zhongsoft:LightTextBox>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlSpecial" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block" style="display: none"><span class="filter-block-lb">交出类别</span><span>
        <zhongsoft:LightDropDownList ID="ddlStatisticType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Text="完成时间" Value="FactCompleteTime,PlanCompleteTime"></asp:ListItem>
            <asp:ListItem Text="室交出时间" Value="FactRecheckTime1,PlanRecheckTime1"></asp:ListItem>
            <asp:ListItem Text="部交出时间" Value="R.FactRecheckTime2,PlanRecheckTime1"></asp:ListItem>
            <asp:ListItem Text="院交出时间" Value="FactDeliveryTime,PlanCompleteTime"></asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block" style="display: none"><span class="filter-block-lb">卷册来源</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlRollFrom" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
    <!----->
    <span class="filter-block" style="display: none"><span class="filter-block-lb">时间</span>
        <span>
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStartDate" runat="server"
                readonly="readonly" req="1" />
            <input id="hiStartDate" type="hidden" runat="server" />
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtEndDate" runat="server"
                readonly="readonly" req="1" />
            <input id="hiEndDate" type="hidden" runat="server" />
        </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvDeptWBS" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" UseDefaultDataSource="true"
        FooterStyle-ForeColor="Red" ShowFooter="true" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" OnRowDataBound="gvDeptWBS_RowDataBound" PageSize="10">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ParamProjectTypeName" HeaderText="工程类型" ItemStyle-HorizontalAlign="Left">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OrganizationID" HeaderText="项目ID" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-HorizontalAlign="Left">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ItemStyle-HorizontalAlign="Left">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业" ItemStyle-HorizontalAlign="Left">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="计划开始<br/>设计任务数" FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return ViewDetail('<%#Eval("OrganizationID") %>','<%#Eval("ParamProjectTypeID") %>','<%#Eval("ProjectCode") %>','<%#Eval("BelongSpecialtyID") %>',0)">
                        <%#Eval("PlanStartCount")%></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="计划进行<br/>任务数" FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return ViewDetail('<%#Eval("OrganizationID") %>','<%#Eval("ParamProjectTypeID") %>','<%#Eval("ProjectCode") %>','<%#Eval("BelongSpecialtyID") %>',1)">
                        <%#Eval("PlanOnGoing")%></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="计划完成<br/>任务数" FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return ViewDetail('<%#Eval("OrganizationID") %>','<%#Eval("ParamProjectTypeID") %>','<%#Eval("ProjectCode") %>','<%#Eval("BelongSpecialtyID") %>',2)">
                        <%#Eval("PlanToComplete")%></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="实际完成<br/>任务数" FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return ViewDetail('<%#Eval("OrganizationID") %>','<%#Eval("ParamProjectTypeID") %>','<%#Eval("ProjectCode") %>','<%#Eval("BelongSpecialtyID") %>',3)">
                        <%#Eval("FactCompleted")%></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Percentage" HeaderText="完成比例" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="未完成的<br/>计划任务" FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a onclick="return ViewDetail('<%#Eval("OrganizationID") %>','<%#Eval("ParamProjectTypeID") %>','<%#Eval("ProjectCode") %>','<%#Eval("BelongSpecialtyID") %>',4)">
                        <%#Eval("NotCompleteInPlan")%></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function ViewDetail(projectid, projecttype, projectcode, specialtyid, type) {
            var ColumnName = $("#<%=ddlStatisticType.ClientID %>").val();
            var sStart = $("#<%=hiStartDate.ClientID %>").val();
            var sEnd = $("#<%=hiEndDate.ClientID %>").val();
            var ptr = $("#<%=txtStartDate.ClientID%>").val();
            if (ptr !== null || ptr !== undefined || ptr !== '') {
                sStart = ptr;
            }
            ptr = $("#<%=txtEndDate.ClientID%>").val();
            if (ptr !== null || ptr !== undefined || ptr !== '') {
                sEnd = ptr;
            }

            var url = buildQueryUrl("EPMS/List/Plan/ProjMthPlanWBSDetailList.aspx", { "secid": "7E397DE8-8855-4E67-8BAE-D7671F2F811D", "ProjectID": projectid, "ProjectType": projecttype, "ProjectCode": projectcode, "BelongSpecialtyID": specialtyid, "StartDate": sStart, "EndDate": sEnd, "ColumnName": ColumnName, "FilterType": type });

            showDivDialog(url, null, 1100, 550, null);
        }

    </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
