<%@ Page Language="C#" AutoEventWireup="true" Title="成品类别参数参数设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamProductTypeList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProductTypeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">成品类别</span> <span>
        <zhongsoft:LightTextBox ID="tbRule" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目级别</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectLevel" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged"
            class="kpms-ddlsearch" EnableTheming="false" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务类别</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">校审规则</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRule" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnCopy" OnClientClick="return batchCopyProductType()"
            CssClass="subtoolbarlink" OnClick="lbtnCopy_Click" EnableTheming="false">
            <span>
                <img runat="server" id="img2" src="~/Themes/Images/C_write.gif" alt="批量复制" height="16" />批量复制</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="100"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="ParamProductTypeID"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProductType" HeaderText="成品类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductTypeForShort" HeaderText="简称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目阶段简称">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPhase"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="校审规则">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbRule"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="校审岗位及角色">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbVerify"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamProductTypeID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamProductTypeID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        //复制成品类别
        function batchCopyProductType() {
            var url = buildQueryUrl("EPMS/List/Sys/BatchCopyProductType.aspx", null);
            showDivDialog(url, null, 600, 300, refreshProductType);
            return false;
        }

        function refreshProductType() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnCopy,"") %>
            return false;
        }
    

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
