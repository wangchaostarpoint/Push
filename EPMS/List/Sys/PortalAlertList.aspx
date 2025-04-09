<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PortalAlertList.aspx.cs"
    Title="我接收的工作提醒" Inherits="Zhongsoft.Portal.EPMS.List.Sys.PortalAlertList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">主&nbsp;题</span> <span>
        <asp:TextBox ID="tbTitle" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目名称/编号</span>
        <span>
            <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">阅读状态</span> <span>
            <zhongsoft:LightDropDownList ID="ddlReadState" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">类&nbsp;别</span>
            <span>
                <zhongsoft:LightDropDownList ID="ddlAlertType" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lkbRead" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClick="lkbRead_Click"><span>批量已读</span></asp:LinkButton>
    <asp:Button runat="server" ID="btnTest" Text="测试" OnClick="btnTest_Click" Visible="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvPortalAlert" AutoGenerateColumns="false"
        DataKeyNames="AlertID,RelationUrl" ShowExport="true" HideFieldOnExport="全部" runat="server"
        BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowCommand="gvPortalAlert_RowCommand"
        OnRowDataBound="gvPortalAlert_RowDataBound" AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="Title">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="Title"
                ShowToolTip="true" Width="250px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="主题" ItemStyle-Width="200px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbTitle" runat="server" CommandName="readAlert" CommandArgument='<%#Eval("AlertID") %>'
                        OnClientClick='<%# String.Format("return ViewItem(\"{0}\")", Eval("AlertID")) %>'
                        ToolTip='<%#Eval("Title") %>' Text='<%#Eval("Title").ToString().Length > 25 ? Eval("Title").ToString().Substring(0, 24) + "..." : Eval("Title")%>'
                        EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="内容" DataField="Content" SortExpression="Content"
                ShowToolTip="true" Width="200px" MaxLength="10">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="类别" DataField="AlertType" SortExpression="AlertType"
                Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="级别" DataField="AlertLevel" SortExpression="AlertLevel"
                Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="发送人" DataField="SendUserName" SortExpression="SendUserName"
                Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="发送时间" DataField="AlertTime" SortExpression="AlertTime"
                DataFormatString="{0:yyyy-MM-dd}" Width="80px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="接收时间" DataField="CreateDate" SortExpression="CreateDate"
                DataFormatString="{0:yyyy-MM-dd}" Width="80px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阅读时间" Width="80px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阅读状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="相关链接">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbUrl" runat="server" CommandName="readAlert" CommandArgument='<%#Eval("AlertID") %>'
                        OnClientClick='<%# String.Format("return openUrl(\"{0}\")", Eval("RelationUrl")) %>'
                        ToolTip='<%#Eval("RelationUrl") %>' Text='打开' EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="80px" HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvPortalAlert.CheckedClientID %>";
        function openUrl(url) {
            window.open(url);
            return true;
        }

        function ViewItem(alertID) {
            var url = "/EPMS/List/Sys/PortalAlertEditor.aspx";
            var json = { actionType: 3, bizId: alertID, PageType: "readPage" };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600, null);
            return true;
        }
        function DealItem(alertID) {
            var url = "/EPMS/List/Sys/PortalAlertUsersEditor.aspx";
            var json = { actionType: 3, bizId: alertID };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 650, 500, afterBind);
            return false;
        }
        function afterBind() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
