<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegulationItemList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.RegulationItemList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">填写部门</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlFillDept" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" runat="server" id="spSpecialty"><span class="filter-block-lb">
        <asp:Label runat="server" ID="lbSpecialty">专业</asp:Label></span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block" runat="server" id="spClassification"><span
            class="filter-block-lb">
            <asp:Label runat="server" ID="lbClassification">法律法规分类</asp:Label></span> <span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlClassification" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">
                <asp:Label runat="server" ID="lbName">名称</asp:Label></span> <span>
                    <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
                        EnableTheming="false"></zhongsoft:LightTextBox>
                </span></span><span class="filter-block" runat="server" id="spQueryInfo"><span class="filter-block-lb">
                    <asp:Label runat="server" ID="lbQueryInfo">发布/批准部门</asp:Label></span> <span>
                        <zhongsoft:LightTextBox ID="tbQueryInfo" runat="server" CssClass="kpms-textboxsearch"
                            EnableTheming="false"></zhongsoft:LightTextBox>
                    </span></span><span class="filter-block" runat="server" id="spVersion"><span class="filter-block-lb">
                        <asp:Label runat="server" ID="lbVersion">替代文件或版本</asp:Label></span> <span>
                            <zhongsoft:LightTextBox ID="tbVersion" runat="server" CssClass="kpms-textboxsearch"
                                EnableTheming="false"></zhongsoft:LightTextBox>
                        </span></span><span class="filter-block" runat="server" id="spCode"><span class="filter-block-lb">
                            <asp:Label runat="server" ID="lbCode">应急预案编号</asp:Label></span> <span>
                                <zhongsoft:LightTextBox ID="tbCode" runat="server" CssClass="kpms-textboxsearch"
                                    EnableTheming="false"></zhongsoft:LightTextBox>
                            </span></span><span class="filter-block"><span class="filter-block-lb">级别</span> <span>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlLevel" class="kpms-ddlsearch"
                                    EnableTheming="false">
                                </zhongsoft:LightDropDownList>
                            </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnImport" OnClientClick="return importData()"
            AccessLevel="3" CssClass="subtoolbarlink" OnClick="lbtnImport_Click" EnableTheming="false">
           </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="BindGrid" ShowExport="true" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Classification" HeaderText="法律法规分类">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="应急预案编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemName" HeaderText="名称" ShowToolTip="true"
                Width="250">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VersionInfo" HeaderText="版本号" ShowToolTip="true"
                Width="100">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ImplementationDate" HeaderText="发布日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ReplaceFile" HeaderText="替换文件或版本" Width="120"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApprovalDepartment" HeaderText="发布/批准部门" Width="120"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showRegulationDetail"
                DataParamFields="ParamRegulationItemID,ItemType" CommandName="ViewData" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiHignLevel" value="院级" />
    <input type="hidden" runat="server" id="hiLowLevel" value="部门级" />
    <script type="text/jscript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        //查看法律法规、规程规范、通用图集、应急预案详细页面
        function showRegulationDetail(bizId, itemType) {
            var json = { itemType: itemType };
            var url = buildBizUrl(1, bizId, "EPMS/List/Plan/RegulationItemEditor.aspx", json);
            return showDivDialog(url, null, 700, 450, null);
        }

        function importData() {
            var url = buildQueryUrl("EPMS/List/Plan/RegulationItemImport.aspx", { ItemType: "<%=ItemType %>" });
            showDivDialog(url, null, 600, 300, rebindGridData);
            return false;
        }

        function rebindGridData() { 
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnImport,"") %>
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
