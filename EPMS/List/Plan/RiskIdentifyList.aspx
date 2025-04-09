<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RiskIdentifyList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.RiskIdentifyList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">填写部门</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlFillDept" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">风险类别</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRiskCategory" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">风险名称</span> <span>
        <zhongsoft:LightTextBox ID="tbRiskName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">风险等级</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRiskRank" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">风险处理方式</span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlRiskProcessMode" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">预期效果</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="dllExpectedResult" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnImport" OnClientClick="return importData()"
            CssClass="subtoolbarlink" OnClick="lbtnImport_Click" EnableTheming="false"
            Text="导入项目风险辨识" ToolTip="导入项目风险辨识">
        </asp:LinkButton>
    </div>
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnAdd" CssClass="subtoolbarlink" EnableTheming="false"
            ToolTip="新建" OnClientClick="return addNewRiskIdentify()" Text="新建">
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="true" AllowSorting="true"
        DataKeyNames="ParamRiskIdentifyID" PageSize="10" AutoGenerateColumns="false"
        ShowPageSizeChange="true" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand"
        BindGridViewMethod="BindGrid" ShowExport="true" HideFieldOnExport="查看,编辑,删除">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="RiskCategory" HeaderText="风险类别" SortExpression="RiskCategory">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskName" HeaderText="风险名称" SortExpression="RiskName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskDescribe" HeaderText="风险描述" ShowToolTip="true"
                SortExpression="RiskDescribe" Width="150">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskRank" HeaderText="风险等级" SortExpression="RiskRank">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskProcessMode" HeaderText="风险处理方式" SortExpression="RiskProcessMode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExpectedResult" HeaderText="预期结果" SortExpression="ExpectedResult">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CounterMeasure" HeaderText="应对措施" ShowToolTip="true"
                SortExpression="CounterMeasure" Width="150">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人" SortExpression="FillUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门" SortExpression="FillDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}"
                SortExpression="FillDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" EditIdField="ParamRiskIdentifyID" CommandName="ViewData"
                EditPageWidth="700px" EditPageHeight="450px" EditPageUrl="~/EPMS/List/Plan/RiskIdentifyEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" EditIdField="ParamRiskIdentifyID"
                EditPageWidth="700px" EditPageHeight="450px" EditPageUrl="~/EPMS/List/Plan/RiskIdentifyEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="只能删除自己部门的项目风险辨识，确认删除？">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/jscript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        //查看项目风险辨识详细页面
//        function showIdentityDetail(bizId, itemType) {
//            var url = buildBizUrl(1, bizId, "EPMS/List/Plan/RiskIdentifyEditor.aspx", null);
//            return showDivDialog(url, null, 700, 450, null);
//        }
        
        //新建项目风险辨识
        function addNewRiskIdentify() {
               var json = { actionType: '2' };
                var url = buildQueryUrl('EPMS/List/Plan/RiskIdentifyEditor.aspx', json);
                showDivDialog(url, null, 750, 400, rebindGridData);
                return false;
        }

        function importData() {
            var url = buildQueryUrl("EPMS/List/Plan/RiskIdentifyImport.aspx", null);
            showDivDialog(url, null, 600, 300, rebindGridData);
            return false;
        }

        function rebindGridData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnImport,"") %>
             <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAdd,"") %>
        }

     

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
