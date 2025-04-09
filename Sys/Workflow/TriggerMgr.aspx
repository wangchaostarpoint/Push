<%@ Page Title="触发器配置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="TriggerMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.TriggerMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">触发源</span> <span>
        <asp:TextBox ID="tbLabel" runat="server" EnableViewState="true" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvTrigger" DataKeyNames="TriggerFeatureId">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <asp:BoundField HeaderText="编号" DataField="TriggerCode" />
            <asp:BoundField HeaderText="名称" DataField="TriggerName" />
          <asp:TemplateField HeaderText="步骤">
                <ItemTemplate>
                    <%#GetActName(Eval("TriggerParam"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="功能">
                <ItemTemplate>
                    <%#GetFeatureType(Eval("FeatureType"))%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
    <script>
        function checkList(array) {
            //向顶部工具条传入参数
            var otherParam = { "sourceId": "<%=SourceId %>" };
            transParamToToolBar(array, otherParam);
        }

        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvTrigger.CheckedClientID %>");
            checkList(array);
        }
        function beforeDialog(actionType, bizId) {
            var sourceId = '<%=Request["sourceId"] %>';
            var params = { "sourceId": sourceId }
            var url = buildBizUrl(actionType, bizId, "Sys/Workflow/TriggerEditor.aspx", params);
            switch (actionType) {
                case "1":
                    showModal(url, "", 600, 500);
                    break;
                case "3":
                case "2":
                    if (checkReturn(showModal(url, "", 600, 500))) {
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
