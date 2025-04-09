<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishConsignStatistics.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishConsignStatistics" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" id="spProj" runat="server"><span class="filter-block-lb">
        项目编号</span><span>
            <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block" id="spRoll" runat="server"><span class="filter-block-lb">
            卷册编号</span><span>
                <asp:TextBox ID="tbRollInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">当前状态</span><span>
                <zhongsoft:LightDropDownList ID="ddlState" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">出版类型</span><span>
                <zhongsoft:LightDropDownList ID="ddlConsignType" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">委托日期</span><span><asp:CheckBox
        ID="chkConsignTime" runat="server" Checked="true" />
        <zhongsoft:XHtmlInputText runat="server" ID="startConsignTime" compare="2" class="kpms-textbox-comparedate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至<zhongsoft:XHtmlInputText runat="server" ID="endConsignTime" compare="2" class="kpms-textbox-comparedate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightDropDownList ID="ddlDeptInfo" runat="server" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">收费状态</span><span>
        <zhongsoft:LightDropDownList ID="ddlChargeState" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Value="">请选择</asp:ListItem>
            <asp:ListItem Value="0">未计费</asp:ListItem>
            <asp:ListItem Value="1">已计费</asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">出版日期</span> <span>
        <asp:CheckBox ID="CheckBox1" runat="server" Checked="false" />
        <zhongsoft:XHtmlInputText runat="server" ID="tbBeginPublish" compare="2" class="kpms-textbox-comparedate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至<zhongsoft:XHtmlInputText runat="server" ID="tbEndPublish" compare="2" class="kpms-textbox-comparedate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block"><span class="filter-block-lb">出版编号</span><span>
        <asp:TextBox ID="tbPublishCode" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false"
        DataKeyNames="PublishConsignID" AllowFrozing="true" runat="server" ShowPageSizeChange="true"
        UseDefaultDataSource="false" AllowSorting="true" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand" BindGridViewMethod="BindDataGrid" Width="100%"
        ShowExport="true" HideFieldOnExport="全选">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="出版编号" DataField="RecordNumber">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="委托人" DataField="ConsignUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="委托部门" DataField="ConsignDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="委托日期" DataField="ConsignTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出版日期" DataField="FactCompleteTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出版类型" DataField="ConsignTypeName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="当前状态">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPublishState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="收费状态">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbChargeState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditorData" DataParamFields="PublishConsignID"
                EditItemClick="editDetail">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" DataParamFields="PublishConsignID">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function editDetail(publishConsignID) {
            var url = buildBizUrl(3, publishConsignID, "/EPMS/List/Publish/PublishConsignNewEditor.aspx", null);
            showDivDialog(url, null, 550, 300, refreshInfo);
        }       
    </script>
</asp:Content>
