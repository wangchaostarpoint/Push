<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaperEntityList.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TSM.PaperEntityList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">论文名称</span><span>
        <zhongsoft:LightTextBox ID="tbPaperName" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
            MaxLength="20"></zhongsoft:LightTextBox></span></span> <span class="filter-block"><span
                class="filter-block-lb">作者/工号</span><span>
                    <zhongsoft:LightTextBox ID="tbWriterName" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
                        MaxLength="20"></zhongsoft:LightTextBox></span></span> <span class="filter-block"><span
                            class="filter-block-lb">发表刊物</span><span>
                                <zhongsoft:LightTextBox ID="tbPublication" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
                                    MaxLength="20"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">刊物级别</span><span>
        <zhongsoft:LightTextBox ID="tbLevel" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
            MaxLength="20"></zhongsoft:LightTextBox></span></span> <span class="filter-block"><span
                class="filter-block-lb">发表时间</span><span>
                    <zhongsoft:XHtmlInputText ID="txtStarteDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                        compare="1" />
                    至
                    <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                        compare="1" />
                </span></span><span class="filter-block"><span class="filter-block-lb">类别</span><span><zhongsoft:LightDropDownList
                    ID="ddlTechType" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                </zhongsoft:LightDropDownList>
                </span></span>
    <span class="filter-block">
        <span class="filter-block-lb">摘要</span>
        <span>
            <zhongsoft:LightTextBox ID="tbAbstract" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
                MaxLength="20"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">关键词</span>
        <span>
            <zhongsoft:LightTextBox ID="tbKeyWord" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
                MaxLength="20"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnImport" runat="server" OnClick="btnImport_Click">
        <span>导入Excel</span>
    </asp:LinkButton>
    <asp:FileUpload ID="fupAllowance" runat="server" />
    <a href="../../Templete/论文模版.xls">导入模版下载</a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" UseDefaultDataSource="true" AutoGenerateColumns="false" DataKeyNames="PAPERID"
        PermissionStatus="true" AllowSorting="true" ShowExport="true" OnRowCommand="gvList_RowCommand"
        BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound" HideFieldOnExport="全选,论文,上传论文">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="PAPERNAME" HeaderText="论文名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AUTHORCODE" HeaderText="作者编号" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AUTHORNAME" HeaderText="作者">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AUTHORSORT" HeaderText="作者排序">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PUBLICATIONS" HeaderText="发表刊物">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PUBLISHEDTIME" HeaderText="发表时间" ItemStyle-HorizontalAlign="center"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PUBLICATIONSLEVEL" HeaderText="刊物级别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TECHTYPE" HeaderText="类别">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="状态" Visible="false" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFlag" Text='<%#Eval("Issue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="论文">
                <ItemTemplate>
                    <uc1:AttachmentView ID="AttaListFile" runat="server" RepeatColumns="1" />
                    <input type="hidden" runat="server" id="hiFileID" value='<%#Eval("PAPERID") %>' />
                </ItemTemplate>
                <HeaderStyle Width="22%"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发布" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="20px" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnIssue" Visible="false" EnableTheming="false" CommandName="IssueData"
                        CommandArgument='<%#Eval("PAPERID") %>'>
                                <img alt="发布" title="发布" src="../../../Themes/Images/btn_attention.png" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="上传论文" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="20px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnView" EnableTheming="false" CommandName="UploadFile">
                                <img alt="上传论文" title="上传论文" src="../../../Themes/Images/btn_dg_upfile.gif"                                 
                                     onclick="return upLoadFile('<%#Eval("PAPERID") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除论文" Visible="false" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                        CommandArgument='<%#Eval("PAPERID") %>' OnClientClick='return confirm("确定要删除吗？");'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiRoleKjzz" runat="server" value="科技专责" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        //上传证书
        function upLoadFile(fileSourceId) {
            showUploadForm(fileSourceId, "Module");
            return true;
        }
        function beforeDialog(actionType, bizId) {
            //传递父级类别id
            var param = '<%=Request.QueryString["catalogID"]%>';
            var json = { actionType: actionType, bizId: bizId,pageType:0 };
            if (param) {
                json.pageType = 1;
                json.organizationID ='<%=Request.QueryString["organizationID"]%>';
            }
            var url = buildQueryUrl('/TSM/List/TSM/PaperEntityEditor.aspx', json);
            showDivDialog(url, "", 800, 500, rebindGridData);
            return false;
        }
    </script>
</asp:Content>
