<%@ Page Language="C#" AutoEventWireup="true" Title="强条模板" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="MandatoryTemplateList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.MandatoryTemplateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">专业</span> <span>
        <zhongsoft:LightTextBox ID="tbSpecialtyName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">规范名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">条款号</span> <span>
        <zhongsoft:LightTextBox ID="tbItemCode" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <%--以下隐掉--%>
    <span class="filter-block" runat="server" visible="false"><span class="filter-block-lb">项目类型</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlProjType">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" runat="server" visible="false"><span class="filter-block-lb">专业</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" runat="server" visible="false"><span class="filter-block-lb">卷册编号</span> <span>
        <zhongsoft:LightTextBox ID="tbWBSCode" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnImport" OnClientClick="return importMandatory()"
            AccessLevel="3" CssClass="subtoolbarlink" OnClick="lbtnImport_Click" EnableTheming="false">
            <span>
                <img runat="server" id="img2" src="~/Themes/Images/C_write.gif" alt="导入强条" height="16" />导入强条信息</span>
        </asp:LinkButton>
    </div>
    <div class="subtoolbarbg">
        <a class="subtoolbarlink" onclick="domnloadTemplateFile()">
            <span>
                <img runat="server" id="img1" src="~/Themes/Images/ico_excel.gif" alt="导入强条" height="16" />下载强条导入模板</span>
        </a>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="MandatoryTemplateID" UseDefaultDataSource="false" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="工程类型" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbProjType"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="专业" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbSpeclaity"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SerialCode" HeaderText="序号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MandatoryName" HeaderText="标准名称" DataParamFields="MandatoryTemplateID"
                DialogMode="Dialog" EditItemClick="viewDetail">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MandatoryCode" HeaderText="标准编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="条款号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MandatoryContent" HeaderText="条款内容"
                ShowToolTip="true" Width="230">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="EffectiveTime" HeaderText="生效时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExpirationTime" HeaderText="失效时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用" ItemStyle-Width="120px">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("MandatoryTemplateID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiManagerRoleName" value="" />
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        function viewDetail(bizId) {
            var json = { actionType: 1, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Sys/MandatoryTemplateEditor.aspx', json);
            showDivDialog(url, null, 850, 450, rebindGridData);
        }

        function importMandatory() {
            var url = buildQueryUrl("EPMS/List/Sys/MandatoryTemplateImport.aspx", null);
            showDivDialog(url, null, 600, 300, rebindGridData);
            return false;
        }

        //下载模板文件
        function domnloadTemplateFile() {
            var url = buildQueryUrl("EPMS/Download/强制性条文导入模板.xlsx", null);
            window.open(url, '_blank');
        }

        function rebindGridData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnImport,"") %>
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
