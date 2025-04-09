<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IdentiyItemList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.IdentiyItemList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Import Namespace="Zhongsoft.Portal.EPMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">填写部门</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlFillDept" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" runat="server" id="spPlace">
        <asp:Label runat="server" ID="lbPlace">活动／生产／服务场所</asp:Label>
        <span>
            <zhongsoft:LightTextBox ID="tbPlace" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span><span class="filter-block" runat="server" id="spItemReource"><span
            class="filter-block-lb">
            <asp:Label runat="server" ID="lbItemReource">危险源</asp:Label></span> <span>
                <zhongsoft:LightTextBox ID="tbItemReource" runat="server" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">
                <asp:Label runat="server" ID="lbQueryName"></asp:Label></span> <span>
                    <zhongsoft:LightDropDownList runat="server" ID="ddlRiskLevelOrImportant" class="kpms-ddlsearch"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnDetailNew" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return addDetailItem()">
            <img src="../../../Themes/Images/btn_new.gif"/><span>新建</span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnImport" OnClientClick="return importData()"
            AccessLevel="3" CssClass="subtoolbarlink" OnClick="lbtnImport_Click" EnableTheming="false">
        </asp:LinkButton>
        <a href="javascript:download();"><span style="border-bottom: solid 1px">下载模板</span></a>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="ParamIdentiyItemID"
        BindGridViewMethod="BindGrid" ShowExport="true" HideFieldOnExport="查看" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Place" HeaderText="活动／生产／<br/>场所" ShowToolTip="true"
                Width="100" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemReource" HeaderText="危险源" ShowToolTip="true"
                Width="150">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemRiskAndInfluence" HeaderText="风险（可能产生的影响）"
                ShowToolTip="true" Width="100">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="EvaluationMethod" HeaderText="评价方法" ShowToolTip="true"
                Width="120" />
            <zhongsoft:LightBoundField DataField="Important" HeaderText="评价结果">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RiskLevel" HeaderText="风险等级">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ControlDetailInfo" HeaderText="控制措施" ShowToolTip="true"
                Width="100">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FurtherControl" HeaderText="进一步控制措施" ShowToolTip="true"
                Width="100" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="IsDanger" HeaderText="是否事故隐患" />
            <zhongsoft:LightBoundField DataField="ComplianceObligation" HeaderText="合规义务"  ShowToolTip="true"
                                       Width="150"/>
            <zhongsoft:LightBoundField DataField="ProgressStatus" HeaderText="实施情况"  ShowToolTip="true"
                                       Width="150"/>
            <zhongsoft:LightBoundField DataField="CompleteTime" HeaderText="完成时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showIdentityDetail" DataParamFields="ParamIdentiyItemID,ItemType"
                CommandName="ViewData" />
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editIdentityDetail" DataParamFields="ParamIdentiyItemID,ItemType"
                CommandName="EditData" />
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiLowLevel" value="部门级" />
    <script type="text/jscript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        //新建
        function addDetailItem() {
            var itemType = '<%=ItemType%>';
            var param = { actionType: 2, itemType: itemType };
            var url = buildQueryUrl("/EPMS/List/Plan/ParamIdentiyItemEditor.aspx", param);
            showDivDialog(url, "", 700, 450, rebindGridData);
            return false;
        }

        //查看法律法规、规程规范、通用图集、应急预案详细页面
        function showIdentityDetail(bizId, itemType) {
            var json = { itemType: itemType };
            var url = buildBizUrl(1, bizId, "EPMS/List/Plan/ParamIdentiyItemEditor.aspx", json);
            return showDivDialog(url, null, 700, 450, null);
        }

        //编辑
        function editIdentityDetail(bizId, itemType) {
            var json = { itemType: itemType };
            var url = buildBizUrl(3, bizId, "EPMS/List/Plan/ParamIdentiyItemEditor.aspx", json);
            return showDivDialog(url, null, 700, 450, rebindGridData);
        }

        function importData() {
            var url = buildQueryUrl("EPMS/List/Plan/IdentiyItemImport.aspx", { ItemType: "<%=ItemType %>" });
            showDivDialog(url, null, 600, 300, rebindGridData);
            return false;
        }

        function rebindGridData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnImport,"") %>
        }
        //下载模板
        function download() {
            var itemType = '<%=ItemType%>';
            if (itemType == '<%=(int)IdentiyItemType.危险源辨识%>') {
                window.open("<%=WebAppPath%>/EPMS/Download/隐患排查、危险源辨识、风险评价及控制措施导入模板.xlsx");
            }
            else if (itemType == '<%=(int)IdentiyItemType.环境因素识别%>') {
                window.open("<%=WebAppPath%>/EPMS/Download/环境因素识别评价导入模板.xlsx");
            }
            else if (itemType == '<%=(int)IdentiyItemType.重要环境因素%>') {
                window.open("<%=WebAppPath%>/EPMS/Download/重要环境因素控制导入模板.xlsx");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
