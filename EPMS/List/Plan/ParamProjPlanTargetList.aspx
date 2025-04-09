<%@ Page Title="产品质量、环境和职业健康安全管理目标、措施及测评设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ParamProjPlanTargetList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ParamProjPlanTargetList" %>

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
    <span class="filter-block"><span class="filter-block-lb">目标分类</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlTargetType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">目标内容</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbTargetContent" EnableTheming="False" CssClass="kpms-textboxsearch" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="ParamProjectPlanTargetID"
        UseDefaultDataSource="true" BindGridViewMethod="BindData" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Center" HeaderText="序号">
                <ItemStyle Width="40px" />
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="目标分类" DataField="TargetType" />
            <zhongsoft:LightTemplateField HeaderText="目标内容">
                <ItemTemplate>
                    <div style="width: 100%; white-space: normal; word-break: break-all; word-wrap: break-word;">
                        <%# Eval("TargetContent") %>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="目标分解">
                <ItemTemplate>
                    <div style="width: 100%; white-space: normal; word-break: break-all; word-wrap: break-word;">
                        <%# Eval("TargetResolve") %>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="实施措施">
                <ItemTemplate>
                    <div style="width: 100%; white-space: normal; word-break: break-all; word-wrap: break-word;">
                        <%# Eval("ImplementingMeasures") %>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showDetail" DataParamFields="ParamProjectPlanTargetID"
                CommandName="ViewData" />
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" DataParamFields="ParamProjectPlanTargetID"
                CommandName="EditData" />
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnReload" Visible="False" OnClick="btnReload_OnClick" />
    <script type="text/jscript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        //新建
        function addDetailItem() {
            var param = { actionType: 2 };
            var url = buildQueryUrl("/EPMS/List/Plan/ParamProjPlanTargetEditor.aspx", param);
            showDivDialog(url, "", 700, 450, rebindGridData);
            return false;
        }

        //查看
        function showDetail(bizId) {
            var url = buildBizUrl(1, bizId, "EPMS/List/Plan/ParamProjPlanTargetEditor.aspx", null);
            return showDivDialog(url, null, 700, 450, null);
        }
        //编辑
        function editDetail(bizId) {
            var url = buildBizUrl(3, bizId, "EPMS/List/Plan/ParamProjPlanTargetEditor.aspx", null);
            return showDivDialog(url, null, 700, 450, rebindGridData);
        }

        function rebindGridData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnReload,"") %>
        }
        //导入
        function importData() {
            var url = buildQueryUrl("EPMS/List/Plan/ProjPlanTargetImport.aspx", null);
            showDivDialog(url, null, 600, 300, rebindGridData);
            return false;
        }
        function rebindGridData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnImport,"") %>
        }
        //下载模板
        function download() {
            window.open("<%=WebAppPath%>/EPMS/Download/产品质量、环境和职业健康安全管理目标、措施及测评导入模板.xlsx");
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
