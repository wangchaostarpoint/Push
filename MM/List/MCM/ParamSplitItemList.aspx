<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamSplitItemList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ParamSplitItemList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="合同拆分项" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">设计阶段</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="10" UseDefaultDataSource="true"
        BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" DataKeyNames="ParamSplitItemID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="项目类型" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="产值类型名称" DataField="SPLITITEMVALUE" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同额类型名称" DataField="SPLITITEMNAME" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="类型" DataField="BELONGTYPE" >
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        $gridCheckedClientID = "<%=this.gvList.CheckedClientID %>";

        function beforeDialog(actionType,bizid) {
            if (actionType == 2) {
                actionType = 3;
            }
            var url = buildQueryUrl("/MM/List/MCM/ParamSplitItemEditor.aspx", { actionType: actionType, bizid: bizid });
            
            showDivDialog(url, null, 800, 550, rebindGridData);

            return false;
        }


    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
