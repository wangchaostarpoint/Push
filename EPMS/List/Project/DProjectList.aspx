<%@ Page Title="典型项目完成情况统计" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="DProjectList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.DProjectList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年度</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanYear" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">
        <asp:Label runat="server" ID="lbPlanCycle" secondflag="noYear">月度</asp:Label></span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanPeriod" class="kpms-ddlsearch"
                EnableTheming="false" secondflag="noYear">
            </zhongsoft:LightDropDownList>
        </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false"
            AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span>专业</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span>任务类别</span><span>
        <zhongsoft:LightDropDownList ID="ddlTaskType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="OrganizationID"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TaskType" HeaderText="任务类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目负责人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AllCount" HeaderText="卷册总数" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastAllCount" HeaderText="上月末累计完成" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ThisCount" HeaderText="本月完成" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ThisAllCount" HeaderText="本月末累计完成" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ComRate" HeaderText="累计完成百分比" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:P2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="档案袋" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lkRollBag" runat="server" OnClientClick="return false;" EnableTheming="false"
                        ForeColor="Blue">  
                        <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif"  onclick="viewDetail('<%#Eval("OrganizationID") %>')" /></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        //打开流程页面
        function viewForm(bizId, extendAttr) {
            var json = { bizid: bizId, ExtendedAttribute: extendAttr, IsOld: 2 };
            var url = buildQueryUrl('Custom/List/C_FormDetailLoading.aspx', json);
            window.open(url);
        }

        function viewDetail(projId) {
            var year = $('#<%=ddlPlanYear.ClientID %>').val();
            var month = $('#<%=ddlPlanPeriod.ClientID %>').val();
            var spe = $('#<%=ddlSpecialty.ClientID %>').val();
            var json = { OrganizationID: projId, year: year, month: month, ExecSpecialtyID: spe };
            var url = buildQueryUrl('/EPMS/List/WBS/DProjectWBSList.aspx', json);
            showDivDialog(url, "", 950, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
