<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatentTechnologyList.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TSM.PatentTechnologyList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">专利类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlPatentType" runat="server" lass="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">专利名称</span><span>
        <zhongsoft:LightTextBox ID="tbPatentName" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
            MaxLength="20"></zhongsoft:LightTextBox></span></span> 
    <span class="filter-block"><span
                class="filter-block-lb">发明人/工号</span><span>
                    <zhongsoft:LightTextBox ID="tbInventor" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
                        MaxLength="20"></zhongsoft:LightTextBox>
                </span></span>
    <span class="filter-block">
        <span class="filter-block-lb">专利号</span>
        <span>
            <zhongsoft:LightTextBox ID="tbPatentCode" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch"
                MaxLength="20"></zhongsoft:LightTextBox>
        </span>
    </span>
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
    <br />
    <span class="filter-block">
        <span class="filter-block-lb">授权日期</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                compare="1" />
            至
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                compare="1" />
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <!-- todo打包下载，多文件下载-->
    <asp:LinkButton ID="btnDownLoad" runat="server" Visible="false" OnClientClick="return BatchDownload()"
        OnClick="btnDownLoad_Click">
        <span>批量下载</span>
    </asp:LinkButton>
    <asp:LinkButton ID="btnImport" runat="server" OnClick="btnImport_Click">
        <span>导入Excel</span>
    </asp:LinkButton>
    <asp:FileUpload ID="fupAllowance" runat="server" />
    <a href="../../Templete/专利技术模版.xls">导入模版下载</a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" UseDefaultDataSource="true" AutoGenerateColumns="false" DataKeyNames="PATENTTECHNOLOGYID"
        AllowSorting="true" ShowExport="true" OnDataBound="gvList_DataBound" OnRowCommand="gvList_RowCommand"
        BindGridViewMethod="BindGrid" HideFieldOnExport="全选,专利证书,上传证书">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="PATENTNAME" HeaderText="专利名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PATENTTYPE" HeaderText="专利类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyDate" HeaderText="申报日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="INVENTORNAME" HeaderText="发明人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PATENTEENAME" HeaderText="专利权人" MaxLength="15">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PATENTNUMBER" HeaderText="专利号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LawType" HeaderText="法律状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AcceptanceDate" HeaderText="受理日期" ItemStyle-HorizontalAlign="center"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AUTHORIZATIONDATE" HeaderText="授权日期" ItemStyle-HorizontalAlign="center"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CERTIFICATEDATE" HeaderText="证书日期" ItemStyle-HorizontalAlign="center"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VALUE" HeaderText="价值" ItemStyle-HorizontalAlign="right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DraftManName" HeaderText="申请人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DraftDeptName" HeaderText="申请部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DraftDate" HeaderText="申请日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="专利证书" Visible="false">
                <ItemTemplate>
                    <uc1:AttachmentView ID="AttaListFile" runat="server" RepeatColumns="1" />
                    <input type="hidden" runat="server" id="hiFileID" value='<%#Eval("PATENTTECHNOLOGYID") %>' />
                </ItemTemplate>
                <HeaderStyle Width="22%"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" Visible="false" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbFlag" Text='<%#Eval("Issue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发布" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="20px" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnIssue" Visible="false" EnableTheming="false" CommandName="IssueData"
                        CommandArgument='<%#Eval("PATENTTECHNOLOGYID") %>'>
                                <img alt="发布" title="发布" src="../../../Themes/Images/btn_attention.png" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="上传证书" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="20px"
                Visible="false">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnView" EnableTheming="false" CommandName="UploadFile">
                                <img alt="上传证书" title="上传证书" src="../../../Themes/Images/btn_dg_upfile.gif"                                 
                                     onclick="return upLoadFile('<%#Eval("PATENTTECHNOLOGYID") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除证书" Visible="false" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                        CommandArgument='<%#Eval("PATENTTECHNOLOGYID") %>' OnClientClick='return confirm("确定要删除吗？");'>
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

        function BatchDownload() {
            //            var fileIds = $("#" + $gridCheckedClientID).val();
            //            alert(fileIds);
            //            if (fileIds != '') {
            //                array = jQuery.parseJSON(fileIds);
            //            }
            //            alert(array);

            //获取文件id进行下载 tianhl 需为IIS设置*Mime类型
            var param = { fileIds: "'C1CC8B48-43E7-4525-AA2F-6AF8DE3A6F87','E70F0C4D-4442-4283-8B71-DD272DB5350A'" };
            var url = buildQueryUrl("Sys/FileDocument/BatchFileDownload.aspx", param);
            var dom = showModal(url, "", 800, 510);
            return false;
        }
        function beforeDialog(actionType, bizId) {
            //传递父级类别id
            var param = '<%=Request.QueryString["catalogID"]%>';
            var json = { actionType: actionType, bizId: bizId,pageType:0 };
            if (param) {
                json.pageType = 1;
                json.organizationID ='<%=Request.QueryString["organizationID"]%>';
            }
            var url = buildQueryUrl('/TSM/List/TSM/PatentTechnologyEditor.aspx', json);
            showDivDialog(url, "", 800, 500, rebindGridData);
            return false;
        }
    </script>
</asp:Content>
