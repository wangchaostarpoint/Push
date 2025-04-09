<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProprietaryTechnicalList.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TSM.ProprietaryTechnicalList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">成果名称</span><span>
        <zhongsoft:LightTextBox ID="tbResultName" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
            MaxLength="20"></zhongsoft:LightTextBox></span></span> <span class="filter-block"><span
                class="filter-block-lb">专有技术编号</span><span>
                    <zhongsoft:LightTextBox ID="tbProprietatyCode" runat="server" EnableTheming="false"
                        CssClass="kpms-textboxsearch" MaxLength="20"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">主要完成人/工号</span><span>
        <zhongsoft:LightTextBox ID="tbInventor" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
            MaxLength="20"></zhongsoft:LightTextBox></span></span> 
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
    
    
    <span class="filter-block"><span
                class="filter-block-lb">发证时间</span><span>
                    <zhongsoft:XHtmlInputText ID="txtStarteDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                        compare="1" />
                    至
                    <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                        compare="1" />
                </span></span><span class="filter-block"><span class="filter-block-lb">类别</span><span>
                    <zhongsoft:LightDropDownList ID="ddlTechType" runat="server" class="kpms-ddlsearch"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnImport" runat="server" OnClick="btnImport_Click">
        <span>导入Excel</span>
    </asp:LinkButton>
    <asp:FileUpload ID="fupAllowance" runat="server" />
    <a href="../../Templete/专有技术模版.xls">导入模版下载</a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="10"
        UseDefaultDataSource="true" AutoGenerateColumns="false" AllowSorting="true" ShowExport="true"
        OnDataBound="gvList_DataBound" DataKeyNames="PROPRIETARYID" BindGridViewMethod="BindGrid"
        OnRowCommand="gvList_RowCommand" HideFieldOnExport="全选,专有技术证书,上传证书">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="RESULTSNAME" HeaderText="成果名称" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="成果名称">
                <ItemTemplate>
                    <div style="word-break: break-all !important; white-space: normal !important; width: 200px;">
                        <%#Eval("RESULTSNAME")%>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PROPRIETARYCODE" HeaderText="专有技术编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="INVENTORCODE" HeaderText="主要完成人工号" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="INVENTORNAME" HeaderText="主要完成人" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="主要完成人">
                <ItemTemplate>
                    <div style="word-break: break-all !important; white-space: normal !important; width: 200px;">
                        <%#Eval("INVENTORNAME")%>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PATENTEECODE" HeaderText="权利人编号" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PATENTEENAME" HeaderText="权利人" MaxLength="25">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ISSUINGTIME" HeaderText="发证时间" ItemStyle-HorizontalAlign="center"
                DataFormatString="{0:yyyy-MM-dd}" Width="65px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RIGHTSSCOPE" HeaderText="权利范围" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="权利范围">
                <ItemTemplate>
                    <div style="word-break: break-all !important; white-space: normal !important; width: 100px;">
                        <%#Eval("RIGHTSSCOPE")%>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="TECHTYPE" HeaderText="类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VALUE" HeaderText="价值（元）" ItemStyle-HorizontalAlign="right">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="专有技术证书">
                <ItemTemplate>
                    <uc1:AttachmentView ID="Certificate" runat="server" RepeatColumns="1"  FileNameLength="15" />
                    <input type="hidden" runat="server" id="hiFileID" value='<%#Eval("PROPRIETARYID") %>' />
                    <input type="hidden" runat="server" id="hiUserID" value='<%#Eval("CREATEUSERID") %>' />
                </ItemTemplate>
                <HeaderStyle Width="10%"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" Visible="false" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFlag" Text='<%#Eval("Issue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发布" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="20px" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnIssue" Visible="false" EnableTheming="false" CommandName="IssueData"
                        CommandArgument='<%#Eval("PROPRIETARYID") %>'>
                                <img alt="发布" title="发布" src="../../../Themes/Images/btn_attention.png" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="上传证书" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="20px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnView" EnableTheming="false" CommandName="UploadFile">
                                <img alt="上传证书" title="上传证书" src="../../../Themes/Images/btn_dg_upfile.gif"                                 
                                     onclick="return upLoadFile('<%#Eval("PROPRIETARYID") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除证书" Visible="false" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                        CommandArgument='<%#Eval("PROPRIETARYID") %>' OnClientClick='return confirm("确定要删除吗？");'>
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
            var url = buildQueryUrl('/TSM/List/TSM/ProprietaryTechnicalEditor.aspx', json);
            showDivDialog(url, "", 800, 500, rebindGridData);
            return false;
        } 
    </script>
</asp:Content>
