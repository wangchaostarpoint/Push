<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StandardValidationInnerList.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.QSM.List.StandardValidationInnerList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">评审年度</span><span>
         <zhongsoft:LightDropDownList ID="ddlValidationYear" runat="server"   Width="100px">
                </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">评审报告名称</span><span>
        <zhongsoft:LightTextBox ID="tbFileName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false">  </zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" PageSize="15"
        ShowExport="true" UseDefaultDataSource="true" DataKeyNames="StandardValidationInnerManageID"
        OnExport="gvList_Export" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound"
        HideFieldOnExport="全选">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridView">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="ValidationContent" HeaderText="评审报告名称" ItemStyle-Width="90px">
                <ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="ValidationYear" HeaderText="评审年度" ItemStyle-Width="30px">
                <ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="ValidationType" HeaderText="评审类型" ItemStyle-Width="60px">
                <ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DraftDeptName" HeaderText="管理部门" ItemStyle-Width="90px">
                <ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DraftManName" HeaderText="编制人" ItemStyle-Width="60px">
                <ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DraftDate" HeaderText="编制日期" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:yyyy-MM-dd}">
                <ItemStyle Width="70px"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiKey" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function checkGridView(array) {
            transParamToToolBar(array, null);
            $("#<%=hiKey.ClientID %>").val(array);

        }


        //根据List页面传递编辑页参数值
        function beforeDialog(actionType, bizId) {
            var enterType = "<%=SvType %>";
            var url = buildBizUrl(actionType, bizId, "QSM/List/StandardValidationInnerEditor.aspx?StvType=" + enterType, null);
            switch (actionType) {
                case "1":
                    showModal(url, "", 850, 600);
                    break;
                case "3":
                case "2":
                    if (checkReturn(showModal(url, "", 850, 600))) {
                        if (typeof (rebindGridData) == "function") {
                            rebindGridData();
                        }
                    }
                    break;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
