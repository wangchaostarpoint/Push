<%@ Page Title="风险和机遇识别及控制措施设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ParamRiskControlList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ParamRiskControlList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnDetailNew" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return addDetailItem()">
            <img src="../../../Themes/Images/btn_new.gif"/><span>新建</span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnImport" OnClientClick="return importData()"
                        AccessLevel="3" CssClass="subtoolbarlink" OnClick="lbtnImport_OnClick" EnableTheming="false">导入
        </asp:LinkButton>
        <a href="javascript:download();"><span style="border-bottom: solid 1px">下载模板</span></a>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">风险控制和机遇来源</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbName" CssClass="kpms-textareasearch" EnableTheming="False"/>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">风险等级</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRiskRank" class="kpms-ddlsearch"
                                     EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">发生概率</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlProbability" class="kpms-ddlsearch"
                                     EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">影响程度</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlExpectedResult" class="kpms-ddlsearch"
                                     EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true" OnRowDataBound="gvList_OnRowDataBound"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="ParamRiskControlID"
        UseDefaultDataSource="true" BindGridViewMethod="BindData" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Center" HeaderText="序号">
                <ItemStyle Width="40px" />
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="RiskName" HeaderText="风险和机遇来源" Width="120" ShowToolTip="true"
                SortExpression="RiskName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskDescribe" HeaderText="风险和机遇描述" ShowToolTip="true"
                Width="150" SortExpression="RiskDescribe">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskRank" HeaderText="风险等级" Width="50" SortExpression="RiskRank">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Probability" HeaderText="发生概率" Width="70"
                SortExpression="RiskProcessMode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExpectedResult" HeaderText="影响程度" Width="70"
                SortExpression="ExpectedResult">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CounterMeasure" HeaderText="控制措施" Width="150"
                SortExpression="CounterMeasure" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showDetail" DataParamFields="ParamRiskControlID"
                CommandName="ViewData" />
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" DataParamFields="ParamRiskControlID"
                                        CommandName="EditData" />
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnLoad" OnClick="btnReload_OnClick" Visible="False"/>
    <script type="text/jscript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        //新建
        function addDetailItem() {
            var param = { actionType: 2 };
            var url = buildQueryUrl("/EPMS/List/Plan/ParamRiskControlEditor.aspx", param);
            showDivDialog(url, "", 700, 450, rebindGridData);
            return false;
        }

        //查看
        function showDetail(bizId) {
            var url = buildBizUrl(1, bizId, "EPMS/List/Plan/ParamRiskControlEditor.aspx", null);
            return showDivDialog(url, null, 700, 450, null);
        }

        //编辑
        function editDetail(bizId) {
            var url = buildBizUrl(3, bizId, "EPMS/List/Plan/ParamRiskControlEditor.aspx", null);
            return showDivDialog(url, null, 700, 450, rebindGridData);
        }

        function rebindGridData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnLoad,"") %>
        }
        //导入
        function importData() {
            var url = buildQueryUrl("EPMS/List/Plan/RiskControlImport.aspx", null);
            showDivDialog(url, null, 600, 300, rebindGridData);
            return false;
        }
        function rebindGridData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnImport,"") %>
        }
        //下载模板
        function download() {
            window.open("<%=WebAppPath%>/EPMS/Download/风险和机遇识别及控制措施导入模板.xlsx");
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
