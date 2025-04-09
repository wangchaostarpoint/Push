<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjManagerFinishValueList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjManagerFinishValueList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>项目组织部门</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>工程类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlType" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>设总</span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtName" IsMutiple="false" SelectPageMode="Dialog"
            SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            Style="width: 40px" EnableTheming="false" ResultForControls="{'hiUserID':'id'}"
            Writeable="false" Filter="{'IsDefaultMyDept':'1'}" PageWidth="850px" ShowAttrs="name,UserCode"
            PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
        <input type="hidden" id="hiUserID" runat="server" />
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div style="text-align: center; font-weight: bold; font-size: larger">
        <asp:Label runat="server" ID="lbTitle"></asp:Label>
    </div>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" ShowPageSizeChange="true"
        PageSize="9" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
        AllowPaging="true" UseDefaultDataSource="true" BindGridViewMethod="BindData"
        ShowFooter="true" AllowFrozing="false" ShowEmptyDataHeader="false" EmptyDataText="没有数据"
        OnRowDataBound="gvList_RowDataBound" OnRowCreated="gvList_RowCreated">
        <Columns>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        //工程项目明细
        function viewDetail(year, startMonth, endMonth, deptId, orgUnitName, projTypeId, projTypeName, projManagerId, projManagerName) {
            var json = { Year: year, StartMonth: startMonth, EndMonth: endMonth, DeptId: deptId, OrgUnitName: encodeURI(orgUnitName), ProjTypeId: projTypeId, ProjTypeName: encodeURI(projTypeName), ProjManagerId: encodeURI(projManagerId), ProjManagerName: encodeURI(projManagerName) };
            var url = buildQueryUrl("EPMS/List/Cost/ProjValueDetailOfManager.aspx", json);
            showModal(url, null, 1000, 950);
            return false;
        }
    </script>
</asp:Content>
