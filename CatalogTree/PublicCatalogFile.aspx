<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicCatalogFile.aspx.cs"
    Title="文档记录" Inherits="Zhongsoft.Portal.EPMS.List.ProjectDesign.PublicCatalogFile"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:Repeater runat="server" ID="metroRepeater" OnItemDataBound="metroRepeater_ItemDataBound">
        <ItemTemplate>
            <asp:Button runat="server" ID="btnStartFlow" Text="发起流程" CssClass="btn-toolmenu"
                OnClientClick="return openFlow();" />
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">主&nbsp;题</span> <span>
        <asp:TextBox MaxLength="20" ID="tbTitle" ToolTip="请输入主题" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <zhongsoft:LightPowerGridView ID="ProcessList" AllowPaging="true" PageSize="15" runat="server"
                UseDefaultDataSource="true" OnRowCommand="ProcessList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="20px">
                        <HeaderTemplate>
                            <img src="/Portal/Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%# FlowState(Eval("ProcessStatus").ToString(),
                      Eval("ProcessInstanceId").ToString(), 
                     Eval("packageName").ToString(), 
                     Eval("processId").ToString(), 
                      string.Empty, string.Empty)%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="主题">
                        <ItemTemplate>
                            <div style="width: 420px;" class="autoskip">
                                <a onclick="viewForm('<%#Eval("FormId") %>','<%#Eval("ProcessInstanceId")%>','<%#Eval("ProcessStatus")%>')">
                                    <%# Eval("ProcessInstanceName") %></a></div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProcessName" HeaderStyle-Width="120px" HeaderText="表单类型" />
                    <asp:TemplateField HeaderText="发起人" HeaderStyle-Width="250px">
                        <ItemTemplate>
                            <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="发起时间" HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <%# GetStartDate(DateTime.Parse(Eval("StartDateTime").ToString()))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
            <table class="tz-table" style="width: 100%">
                <tr id="trQuery" runat="server">
                    <td colspan="2">
                        <div style="width: 100%; float: left; padding-top: 3px;">
                            <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block; background: #fff;
                                border: #d5dfe5 1px solid;">
                                <legend class="rtm_fds_tle">
                                    <div id="toolbarlay">
                                        相关文件</div>
                                </legend>
                                <div style="background-color: #EFF2F7;" id="divQuery">
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom: 0px;">
                                        <tr id="trleader">
                                            <td align="right">
                                                <zhongsoft:LightFileUploader runat="server" ID="fu" CssClass="subtoolbarlink" EnableTheming="false"
                                                    OnClick="btnBindFile_Click"> <span>
                            <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"
                                height="16" />上传文件</span></zhongsoft:LightFileUploader>
                                                <asp:LinkButton ID="lbBatchDownLoad" runat="server" CssClass="subtoolbarlink" EnableTheming="false"
                                                    OnClientClick="return BatchDownLoad();"><span>
                            <img id="img1" src="<%=WebAppPath %>/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
                                height="16" />批量下载</span></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </fieldset>
                        </div>
                    </td>
                </tr>
                <tr id="fileInfo">
                    <td colspan="2">
                        <zhongsoft:LightPowerGridView ID="gvAttachList" AllowPaging="true" PageSize="15"
                            runat="server" UseDefaultDataSource="true" OnRowCommand="ProcessList_RowCommand"
                            OnRowDataBound="gvAttachList_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="文件标题">
                                    <ItemTemplate>
                                        <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("DCFileId") %>"
                                            target="_blank" title="<%# Eval("DCFileName") %>">
                                            <%# Eval("DCFileName").ToString().Length > this.FileNameLength ? Eval("DCFileName").ToString().Substring(0, FileNameLength) : Eval("DCFileName").ToString()%>
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="DesignClassedName" HeaderStyle-Width="200px" HeaderText="工作分类" />
                                <asp:BoundField DataField="SpecialtyName" HeaderStyle-Width="100px" HeaderText="专业"
                                    Visible="false" />
                                <asp:BoundField DataField="FileAddUserName" HeaderStyle-Width="70px" HeaderText="创建人" />
                                <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("OrganizationId") %>' />
                                        <input type="hidden" runat="server" id="hiSpecialtyID" value='<%#Eval("SpecialtyID") %>' />
                                        <input type="hidden" runat="server" id="hiDesignClassedID" value='<%#Eval("DesignClassedID") %>' />
                                        <asp:LinkButton ID="btnDel" runat="server" CommandName="del" CommandArgument='<%#Eval("DCFileID") %>'
                                            EnableTheming="false">
                                                <img alt="" src="/Portal/Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                                        </asp:LinkButton>
                                        <input type="hidden" runat="server" id="hiDCFileName" value='<%# Eval("DCFileName") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
            <input type="hidden" runat="server" id="hiPath" />
            <input type="hidden" runat="server" id="hiKeyID" />
            <input type="hidden" runat="server" id="hiBatchLoadIDS" />
            <!--选中的专业个数-->
            <input type="hidden" runat="server" id="hiSelectedSpecialty" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        //批量下载
        function BatchDownLoad() {
            var fileIds = $("#<%=hiBatchLoadIDS.ClientID %>").val();
            if (fileIds != "") {
                fileIds = fileIds.substring(0, fileIds.length - 1);
                var url = "/Sys/FileDocument/BatchFileDownload.aspx?fileSourceId=" + fileIds + "&customerPath=1";
                showDivDialog(url, null, 700, 550);
                return false;
            }
            else {
                alert("没有要下载的资料");
            }

            return false;
        }

        function viewForm(formId, processId, processStatus) {
            var url;
            var DAMSPath = '<%=EDPortal.BLL.Sys.SysConfig.Instance.DAMSWebAppPath %>';
            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/CatalogTree/Handler/CheckIsDAMSModule.ashx?FormID="+formId, null),
                data: { },
                async: false,
                cache: false,
                success: function (res) {
                    if (res == "False") {
                        url = '/Portal/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=' + formId + '&prcinstid=' + processId;
                    } else {
                        url = DAMSPath+'Sys/Workflow/FormDetail.aspx?actionType=1&FormID=' + formId + '&prcinstid=' + processId;
                    }
                    window.open(encodeURI(url), "", "");
                }
            });

        }

        function openFlow(url) {
            window.open(encodeURI(url));
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
