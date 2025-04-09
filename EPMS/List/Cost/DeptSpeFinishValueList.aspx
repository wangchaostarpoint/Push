<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="DeptSpeFinishValueList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.DeptSpeFinishValueList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <asp:UpdatePanel ID="panelProjOverallPlan" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <span class="filter-block"><span>事业部</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span>科室</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlSubDept" class="kpms-ddlsearch"
                    EnableTheming="false" AutoPostBack="true" OnSelectedIndexChanged="ddlSubDept_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span>专业</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpe" class="kpms-ddlsearch" EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span>年份</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear" class="kpms-ddlsearch" EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span>起始月份</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlBeginMonth" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span>结束月份</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlEndMonth" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div style="text-align: center; font-weight: bold; font-size: larger">
        <asp:Label runat="server" ID="lbTitle"></asp:Label>
    </div>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" ShowPageSizeChange="true"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
        AllowPaging="true" UseDefaultDataSource="true" BindGridViewMethod="BindData"
        AllowFrozing="false" ShowEmptyDataHeader="false" EmptyDataText="没有数据" OnRowDataBound="gvList_RowDataBound"
        OnRowCreated="gvList_RowCreated">
        <Columns>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        //工程类别明细
        function viewTypeDetail(year, startMonth, endMonth, speId, deptId, parentDeptId, parentOrgName, orgUnitName, specialtyName) {
            var json = { Year: year, StartMonth: startMonth, EndMonth: endMonth, SpeId: speId, DeptId: deptId, ParentDeptId: parentDeptId, ParentOrgName: encodeURI(parentOrgName), OrgUnitName: encodeURI(orgUnitName), SpecialtyName: encodeURI(specialtyName) };
            var url = buildQueryUrl("EPMS/List/Cost/ProjTypeFinishValueDetail.aspx", json);
            showModal(url, null, 800, 650);
        }
        //工程项目明细
        function viewProjDetail(year, startMonth, endMonth, speId, deptId, parentDeptId, parentOrgName, orgUnitName, specialtyName) {
            var json = { Year: year, StartMonth: startMonth, EndMonth: endMonth, SpeId: speId, DeptId: deptId, ParentDeptId: parentDeptId, ParentOrgName: encodeURI(parentOrgName), OrgUnitName: encodeURI(orgUnitName), SpecialtyName: encodeURI(specialtyName) };
            var url = buildQueryUrl("EPMS/List/Cost/ProjValueDetailOfDeptSpe.aspx", json);
            showModal(url, null, 1000, 950);
        }
    </script>
</asp:Content>
