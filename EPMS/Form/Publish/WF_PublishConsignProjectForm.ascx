<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishConsignProjectForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishConsignProjectForm" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<%@ Register Src="~/EPMS/UI/Publish/PublishCostDetail.ascx" TagName="PublishCostDetail" TagPrefix="uc1" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table">
    <tr>
        <td class="td-l">项目代号<span id="red" class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectCode" IsMutiple="false"
                Writeable="false" field="ProjectCode" tablename="EPMS_PublishConsign" SelectPageMode="Dialog"
                ResultForControls="{'hiOrganizationId':'id','txtProjectName':'name'}" EnableTheming="false"
                Text="选择项目" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="ProjectCode" activestatus="(23.填写印制出版任务单)"
                req="1" OnClick="txtProjectCode_Click" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.填写印制出版任务单)"
                req="1" class="kpms-textbox" readonly="readonly" field="ProjectName" tablename="EPMS_PublishConsign" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>出版任务信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span runat="server" class="req-star" displaystatus="(23.?)">如果任务进行了线上校审，则会自动带出出版成品PDF，不需要再上传；否则需要上传出版成品PDF。</span>
            <span id="span4" runat="server" displaystatus="(2.?)" style="cursor: hand; height: 16px; float: right"
                class="req-star">请先保存再选择出版任务</span>
            <span style="float: right;" id="Span3" runat="server" displaystatus="(23.填写印制出版任务单)">
                <asp:LinkButton runat="server" ID="lbtnViewPublishInfo" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="任务出版记录"
                    OnClientClick="return viewPublishInfo();">
                    <span>
                        <img runat="server" id="img13" src="~/Themes/Images/btn_dg_view.gif" alt="任务出版记录" width="16"
                            height="16" />任务出版记录</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="选择出版任务"
                    OnClientClick="return false;">
                    <span>
                        <img runat="server" id="img6" src="~/Themes/Images/btn_add.gif" alt="选择出版任务" width="16"
                            height="16" />选择出版任务</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvWBS" runat="server" AutoGenerateColumns="false" ShowExport="false"
                AllowPaging="true" PageSize="50" UseDefaultDataSource="true"
                BindGridViewMethod="UserControl.BindWBS" Width="100%" OnRowCommand="gvWBS_RowCommand"
                ShowFooter="false" DataKeyNames="WBSID" OnRowDataBound="gvWBS_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="25px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号" HeaderStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" HeaderStyle-Width="150px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSModifyState" HeaderText="修改状态">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="拒绝出版" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:Button ID="btnCope" runat="server" ToolTip="拒绝出版"
                                OnClientClick='<%# String.Format("return showCopeInfo(\"divModifyReason\",\"{0}\")",Eval("WBSID")) %>'
                                CssClass="btn" Text="拒绝出版" Style="color: Red; font-weight: bold;" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="需修改" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:Button ID="btnModify" runat="server" ToolTip="需修改"
                                CommandName="modify" CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('你确定需修改吗？')) return false;"
                                CssClass="btn" Text="需修改" Style="color: Red; font-weight: bold;" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" ToolTip="删除"
                                CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span>
                                    <img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">计划送印日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanSendTime" runat="server" activestatus="(23.填写印制出版任务单)"
                class="kpms-textbox-date" readonly="readonly" field="PlanSendTime" tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">实际送印日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFactSendTime" runat="server" activestatus="(23.填写印制出版任务单)"
                class="kpms-textbox-date" readonly="readonly" field="FactSendTime" tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">要求完成日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRequireCompleteTime" runat="server" activestatus="(23.填写印制出版任务单)"
                class="kpms-textbox-date" readonly="readonly" field="RequireCompleteTime" tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目经理
            （或部门主任）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" readonly="readonly"
                class="kpms-textbox" activestatus="(23.填写印制出版任务单)" field="ManagerUserName"
                tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiManagerUserID" runat="server" field="ManagerUserID"
                tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">委托人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignUserName" readonly="readonly"
                class="kpms-textbox" activestatus="(23.填写印制出版任务单)" field="ConsignUserName"
                tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiConsignUserID" runat="server" field="ConsignUserID"
                tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="Memo" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr flag="attach">
        <td class="flexible" colspan="6">
            <span>出版文件信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" /><span class="req-star">为了快速高效出版，请上传PDF文件，文件名也要符合命名规范</span>
            <span style="float: right">
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false" ToolTip="上传附件"
                    DisplayStatus="(23.填写印制出版任务单)" OnClick="lbtnUpload_Click"><img src="../../Themes/Images/btn_upload.gif"/>
                        <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star"
                            id="Span5" runat="server" displaystatus="(2.?)"> 请先保存再上传附件</span>
                <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="批量下载" OnClientClick="return batchDownloadAttach();">
                    <span>
                        <img runat="server" id="img7" src="~/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
                            height="16" />批量下载</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载" OnClientClick="return zipDownloadAttach();">
                    <span>
                        <img runat="server" id="img8" src="~/Themes/Images/ico_fujian.gif" alt="打包下载" width="16"
                            height="16" />打包下载</span>
                </asp:LinkButton></span>

        </td>
    </tr>
    <tr flag="attach">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvAttach" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="FileID" OnRowCommand="gvAttach_RowCommand" OnRowDataBound="gvAttach_RowDataBound" AllowPaging="true" PageSize="50"
                BindGridViewMethod="UserControl.BindAttach">
                <Columns>
                    <zhongsoft:LightBoundField DataField="FileName" HeaderText="文件名称">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="上传人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传时间" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="操作" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiFilePath" value='<%# Eval("FilePath") %>' />
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" ToolTip="删除"
                                CommandArgument='<%# Eval("FileID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span>
                                    <img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"
                                target="_blank" title="下载<%# Eval("FileName") %>">
                                <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="下载" width="16"
                                    height="16" /></span>
                            </a>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6"><span style="float: right">选择任务进行成品下载
            <asp:DropDownList runat="server" ID="ddlWbs" EnableTheming="false" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlWbs_SelectedIndexChanged"></asp:DropDownList>
        </span></td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>出版图纸信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span1">
                <asp:LinkButton runat="server" ID="lbtnDownLoadDWG" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="批量下载DWG" OnClientClick="return batchDownloadFile('signDwg','图纸');" Visible="false">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="批量下载DWG" width="16"
                            height="16" />批量下载DWG</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnZIPDownLoadDWG" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载DWG" OnClientClick="return zipDownloadFile('signDwg','图纸');">
                    <span>
                        <img runat="server" id="img9" src="~/Themes/Images/ico_fujian.gif" alt="打包下载DWG" width="16"
                            height="16" />打包下载DWG</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnDownLoadPDF" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="批量下载PDF" OnClientClick="return batchDownloadFile('signPdf','图纸');" Visible="false">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/ico_fujian.gif" alt="批量下载PDF" width="16"
                            height="16" />批量下载PDF</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnZIPDownLoadPDF" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载PDF" OnClientClick="return zipDownloadFile('signPdf','图纸');">
                    <span>
                        <img runat="server" id="img10" src="~/Themes/Images/ico_fujian.gif" alt="打包下载PDF" width="16"
                            height="16" />打包下载PDF</span>
                </asp:LinkButton>
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvProduct" runat="server" AutoGenerateColumns="false" ShowExport="false"
                AllowPaging="true" PageSize="50" UseDefaultDataSource="true"
                BindGridViewMethod="UserControl.BindProduct" Width="100%"
                ShowFooter="false" DataKeyNames="ProductID">
                <Columns>
                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" Width="150px" ItemStyle-Width="150px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MapSize" HeaderText="图幅">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="设计人" ItemStyle-Width="40px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传时间" ItemStyle-Width="40px" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="下载" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" >
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDownLoadDWG" EnableTheming="false"
                                ToolTip="下载DWG" OnClientClick='<%# String.Format("return downloadProductFile(\"{0}\",\"{1}\")", Eval("ProductID"), "signDwg") %>'>
                                <span>
                                    <img  id="img3" src="../../Themes/Images/ico_fujian.gif" alt="下载DWG" width="16"
                                        height="16" />下载DWG</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnDownLoadPDF" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="下载PDF" OnClientClick='<%# String.Format("return downloadProductFile(\"{0}\",\"{1}\")", Eval("ProductID"), "signPdf") %>'>
                                <span>
                                    <img  id="img4" src="../../Themes/Images/ico_fujian.gif" alt="下载PDF" width="16"
                                        height="16" />下载PDF</span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>出版文本信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span2">
                <asp:LinkButton runat="server" ID="lbtnDownLoadProductFile" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="批量下载文本" OnClientClick="return batchDownloadFile('product','文本');" Visible="false">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/ico_fujian.gif" alt="批量下载文本" width="16"
                            height="16" />批量下载文本</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnZIPDownLoadProductFile" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载文本" OnClientClick="return zipDownloadFile('product','文本');">
                    <span>
                        <img runat="server" id="img11" src="~/Themes/Images/ico_fujian.gif" alt="打包下载文本" width="16"
                            height="16" />打包下载文本</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnDownLoadFilePDF" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="批量下载PDF" OnClientClick="return batchDownloadFile('signPdf','文本');" Visible="false">
                    <span>
                        <img runat="server" id="img5" src="~/Themes/Images/ico_fujian.gif" alt="批量下载PDF" width="16"
                            height="16" />批量下载PDF</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnZIPDownLoadFilePDF" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载PDF" OnClientClick="return zipDownloadFile('signPdf','文本');">
                    <span>
                        <img runat="server" id="img12" src="~/Themes/Images/ico_fujian.gif" alt="打包下载PDF" width="16"
                            height="16" />打包下载PDF</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvFile" runat="server" AutoGenerateColumns="false" ShowExport="false"
                AllowPaging="true" PageSize="50" UseDefaultDataSource="true"
                BindGridViewMethod="UserControl.BindFile" Width="100%"
                ShowFooter="false" DataKeyNames="ProductID">
                <Columns>
                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" Width="150px" ItemStyle-Width="150px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="设计人" ItemStyle-Width="40px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传时间" ItemStyle-Width="40px" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="下载" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDownLoadDWG" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="下载文本" OnClientClick='<%# String.Format("return downloadProductFile(\"{0}\",\"{1}\")", Eval("ProductID"), "product") %>'>
                                <span>
                                    <img  id="img3" src="../../Themes/Images/ico_fujian.gif" alt="下载文本" width="16"
                                        height="16" />下载文本</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnDownLoadPDF" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="下载PDF" OnClientClick='<%# String.Format("return downloadProductFile(\"{0}\",\"{1}\")", Eval("ProductID"), "signPdf") %>'>
                                <span>
                                    <img  id="img4" src="../../Themes/Images/ico_fujian.gif" alt="下载PDF" width="16"
                                        height="16" />下载PDF</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnDownLoadSign" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="下载签署页" OnClientClick='<%# String.Format("return downloadProductFile(\"{0}\",\"{1}\")", Eval("ProductID"), "signPage") %>'>
                                <span>
                                    <img  id="img5" src="../../Themes/Images/ico_fujian.gif" alt="下载PDF" width="16"
                                        height="16" />下载签署页</span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">常规排版</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbRegularSetType" runat="server" MaxLength="32" field="RegularSetType" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">特殊要求排版</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbSpecialSetType" runat="server" MaxLength="32" field="SpecialSetType" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>

        </td>
        <td class="td-r" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">简装</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbSimpleBack" runat="server" MaxLength="32" field="SimpleBack" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">平装</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPaperBack" runat="server" MaxLength="32" field="PaperBack" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>

        </td>
        <td class="td-l">精装</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbHardCover" runat="server" MaxLength="32" field="HardCover" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">两证一照</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTwoCardOnePhoto" runat="server" MaxLength="32" field="TwoCardOnePhoto" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">咨询证</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbConsultationCard" runat="server" MaxLength="32" field="ConsultationCard" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>

        </td>
        <td class="td-l">其他</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbOtherCard" runat="server" MaxLength="32" field="OtherCard" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">普通纸张</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPlainPaper" runat="server" MaxLength="32" field="PlainPaper" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">铜版纸</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbArtPaper" runat="server" MaxLength="32" field="ArtPaper" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>

        </td>
        <td class="td-l">其他</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbOtherPaper" runat="server" MaxLength="32" field="OtherPaper" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">黑白复印</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBWCopy" runat="server" MaxLength="32" field="BWCopy" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">彩色复印</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbColorCopy" runat="server" MaxLength="32" field="ColorCopy" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>

        </td>
        <td class="td-l">彩色打印</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbColorPrint" runat="server" MaxLength="32" field="ColorPrint" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">出版份数</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPublishNum" runat="server" MaxLength="32" field="PublishNum" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">加急</td>
        <td class="td-r">
            <asp:RadioButtonList ID="rdblIsUrgent" runat="server" RepeatColumns="2" field="IsUrgent" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)">
                <asp:ListItem Text="是" Value="是"></asp:ListItem>
                <asp:ListItem Text="否" Value="否"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-r" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">其他要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbOtherRequirement" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" maxtext="512" Rows="4" field="OtherRequirement" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">封面颜色</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbCoverColor" runat="server" MaxLength="32" field="CoverColor" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">份 数</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbCoverNum" runat="server" MaxLength="32" field="CoverNum" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>

        </td>
        <td class="td-l">加 印</td>
        <td class="td-r">
            <asp:RadioButtonList ID="rdblIsOverPrint" runat="server" RepeatColumns="2" field="IsOverPrint" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)">
                <asp:ListItem Text="是" Value="是"></asp:ListItem>
                <asp:ListItem Text="否" Value="否"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc1:PublishCostDetail ID="PublishCostDetail" runat="server" />
        </td>
    </tr>
</table>
<div id="divModifyReason" style="display: none" title="填写拒绝出版原因">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">请输入拒绝出版原因:
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbModifyReason" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="512" Rows="4" />
            </td>
        </tr>
    </table>
</div>

<input runat="server" type="hidden" id="hiPublishConsignID" tablename="EPMS_PublishConsign"
    field="PublishConsignID" />
<input type="hidden" runat="server" id="hiIsConfirmCost" tablename="EPMS_PublishConsign"
    field="IsConfirmCost" value="0" />
<asp:LinkButton runat="server" ID="lbtCope" OnClick="btnCope_Click" Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiWBSXML" />
<input type="hidden" runat="server" id="hiIsHaveNeedModify" />

<asp:Button runat="server" ID="btnSelWBS" OnClick="btnSelWBS_Click" Style="display: none" />
<input type="hidden" runat="server" id="hiWBSID" />
<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName" tablename="EPMS_PublishConsign" />
<!--出版任务筛选条件-->
<input type="hidden" runat="server" id="hiPublishState" />
<script type="text/javascript">
    function initCustomerPlugin() {
        // 隐藏出版文件信息
        setAttachHide();
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "填写印制出版任务单") {
                if ($('#<%=gvWBS.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                    alert("请选择要出版的任务");
                    return false;
                }
            }
            if ($("#<%=hiIsHaveNeedModify.ClientID %>").val() != "0" && parseBool('<%=IsPrintStep%>')) {
                alert("当前有需修改的任务，不能往下发送");
                return false;
            }
        }
        return true;
    }

    //弹出拒绝出版原因层
    function showCopeInfo(div, wbsID) {
        if (confirm("确定发起拒绝出版?")) {
            initCopeEvent(div, wbsID);
            $("#" + div).dialog({ height: 240 });
            $("#" + div).dialog('open');
            $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        }
        return false;
    }

    function initCopeEvent(div, wbsID) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 150,
            minWidth: 300,
            modal: true,
            buttons: {
                "确定": function () {
                    var reason = $("#<%=tbModifyReason.ClientID %>").val();
                    $("#<%=hiWBSID.ClientID %>").val(wbsID);
                    if (reason == "") {
                        alert("请输入拒绝出版原因");
                    }
                    else {
                        <%=Page.ClientScript.GetPostBackEventReference(this.lbtCope,"")%>;

                        $(this).dialog("destroy");
                    }
                },
                "取消": function () {
                    $(this).dialog("destroy");
                }
            }
        });
    }

    ///批量下载文件
    function batchDownloadFile(docType, fileFormat) {
        var wbsIds = $("#<%=ddlWbs.ClientID %>").val();
        if (wbsIds == "") {
            alert("请先选择要进行下载的任务");
            return false;
        }
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?wbsIds=" + wbsIds + "&docType=" + docType + "&fileFormats=" + fileFormat;
        showDivDialog(urlStr, null, 750, 550, null);
        return false;
    }

    ///打包下载文件
    function zipDownloadFile(docType, fileFormat) {
        var publishID ='<%=BusinessObjectId %>';
        var urlStr = "<%= WebAppPath %>/Sys/FileDocument/ZipFileDownLoad.aspx?publishID=" + publishID + "&docType=" + docType + "&fileFormats=" + fileFormat + "&fileTitle=" + $("#<%=txtProjectCode.ClientID %>").val() + "-" + fileFormat + "成品-";
        window.open(urlStr);
    }

    ///批量下载成品
    function batchDownloadProduct(productIds, docType) {
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=" + docType + "&fileSourceId=" + productIds;
        showDivDialog(urlStr, null, 750, 550, null);
        return false;
    }

    //批量下载附件
    function batchDownloadAttach() {
        var fileSourceID = '<%=BusinessObjectId %>';
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?fileSourceId=" + fileSourceID;
        showDivDialog(urlStr, null, 750, 550, null);
        return false;
    }

    //打包下载附件
    function zipDownloadAttach() {
        var fileSourceID = '<%=BusinessObjectId %>';
        var urlStr = "<%= WebAppPath %>/Sys/FileDocument/ZipFileDownLoad.aspx?fileSourceId=" + fileSourceID + "&fileTitle=" + $("#<%=txtProjectCode.ClientID %>").val() + "-出版成品-";
        window.open(urlStr);
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var josn = {
            "OrganizationID": $("#<%=hiOrganizationId.ClientID %>").val(), WBSState: <%=WBSState.已完成.GetHashCode()%> };
        return josn;
    }


    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationId.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择任务！');
            return false;
        }
        return true;
    }

    ///单个下载成品
    function downloadProductFile(productId, fileType) {
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=" + fileType + "&fileId=" + productId;
        window.open(urlStr);
        return false;
    }

    //验证是否选择了项目
    function checkProject() {
        var orgID = $('#<%=hiOrganizationId.ClientID %>').val();
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        return true;
    }

    $('#<%=lbtnSelWBS.ClientID %>').live('click', function () {
        if (checkProject()) {
            selWBS();
        }
    });

    //选择加晒任务
    function selWBS() {
        var param = new InputParamObject("m");
        var organizationID = $("#<%=hiOrganizationId.ClientID %>").val();
        var publishState = $("#<%=hiPublishState.ClientID %>").val();
        var json = { OrganizationID: organizationID, WBSState: 4, IsShowMore: 1, PublishState: publishState }
        getWBS('<%=hiWBSXML.ClientID %>', param, json, bindWBS);
        return false;
    }

    function bindWBS() {
        $("#<%=btnSelWBS.ClientID %>").click();
    }

    function viewPublishInfo() {
        if (checkProject()) {
            var organizationID = $("#<%=hiOrganizationId.ClientID %>").val();
            var json = { OrganizationID: organizationID, ExceptConsignFormID:"<%=BusinessObjectId%>" };
            var url = buildQueryUrl('/EPMS/List/Publish/PublishConsignList.aspx', json);
            showDivDialog(url, "", 900, 500, null);
            return false;
        }
    }

    // 出版文件信息隐藏
    function setAttachHide() {
        $('[flag="attach"]').hide();
    }
</script>


