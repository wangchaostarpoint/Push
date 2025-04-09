<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishAndArchiveApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishAndArchiveApplyForm" %>
<%@ Register Src="../../UI/Publish/PublishTaskDetail.ascx" TagName="UCPublishTaskDetail" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td colspan="6" style="text-align: right;">
            <asp:Button Text="打印出案报告申请单" ID="Button1" runat="server" OnClientClick="showPrintPage()" />
            <asp:Button runat="server" ID="btnTest" Text="Init" OnClick="btnTest_Click" Visible="false" />
            <asp:Button runat="server" ID="btnTestArchiveCode" Text="ArchiveCode" OnClick="btnTestArchiveCode_Click" Visible="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">发送单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" field="CustomerName"
                tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                Writeable="false" ShowAttrs="name" ResultForControls="{'hiCustomerId':'id'}" SelectPageMode="Dialog"
                req="1" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiCustomerId" type="hidden" field="CustomerId" runat="server" tablename="MM_Publish_ApplyForm" />
        </td>
        <td class="td-l">序号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSendCode" type="text" class="kpms-textbox"
                readonly="readonly" activestatus="(23.发起申请)(23.申请人修改)" field="SendCode" tablename="MM_Publish_ApplyForm">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" field="ProjectName"
                tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false" SelectPageMode="Dialog" PageWidth="850"
                Writeable="false" ShowAttrs="name" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','hiOrganizationID1':'id','hiProjectCode':'ProjectCode','hiProjectName':'name'}" Filter="{IsNeedArchivesNo:'1'}"
                req="1" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiOrganizationID" type="hidden" field="ProjectId" runat="server" tablename="MM_Publish_ApplyForm" />
            <input id="hiOrganizationID1" type="hidden" field="OrganizationID" runat="server" tablename="EPMS_PublishConsign" />
            <input id="hiProjectCode" type="hidden" field="ProjectCode" runat="server" tablename="EPMS_PublishConsign" />
            <input id="hiProjectName" type="hidden" field="ProjectName" runat="server" tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" field="ProjectCode"
                class="kpms-textbox" readonly="readonly" tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">设计阶段
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" class="kpms-textbox"
                activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)" readonly="readonly" tablename="MM_Publish_ApplyForm" field="Phase">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">打印类型<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblPrintType" runat="server" RepeatColumns="2" field="PrintType" tablename="EPMS_PublishConsign"
                activestatus="(23.发起申请)(23.申请人修改)" req="1">
                <asp:ListItem Text="黑白" Value="黑白"></asp:ListItem>
                <asp:ListItem Text="彩打" Value="彩打"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">证书是否加二维码<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsQRCode" runat="server" RepeatColumns="2" field="IsQRCode" tablename="EPMS_PublishConsign"
                activestatus="(23.发起申请)(23.申请人修改)" req="1">
                <asp:ListItem Text="是" Value="是"></asp:ListItem>
                <asp:ListItem Text="否" Value="否"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l" runat="server" visible="false">合同编号
        </td>
        <td class="td-r" runat="server" visible="false">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractCode" field="ContractCode" Width="30%"
                tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="CONTRACTCODE"
                EnableTheming="false" Writeable="false" ShowAttrs="name,CONTRACTCODE"
                ResultForControls="{'hiContractId':'id','hiContractName':'name'}" PageUrl="~/MM/Obsolete/ContractSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiContractId" field="ContractId" tablename="MM_Publish_ApplyForm" />
            <input type="hidden" runat="server" id="hiContractName" field="ContractName" tablename="MM_Publish_ApplyForm" />
        </td>
        <td class="td-l">申请人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbapplyPeople" tablename="MM_Publish_ApplyForm" field="applyPeople"
                activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)" PageWidth="800px" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiapplyPeopleId':'id','tbApplyUserPhone':'MobilePhone'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                req="1"></zhongsoft:LightObjectSelector>
            <input id="hiapplyPeopleId" runat="server" type="hidden" tablename="MM_Publish_ApplyForm"
                field="applyPeopleId" />
        </td>
        <td class="td-l">申请人单位
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtapplyDept" field="ApplyDept" Width="30%"
                tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Filter="{OrganizationLevel:'2'}" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyDeptID" field="applyDepttId" tablename="MM_Publish_ApplyForm" />
        </td>
        <td class="td-l">申请人电话
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplyUserPhone" runat="server" tablename="MM_Publish_ApplyForm" field="ApplyUserPhone"
                activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtapplyDate" type="text" class="kpms-textbox-date"
                readonly="readonly" activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)" field="applyDate" tablename="MM_Publish_ApplyForm">
            </zhongsoft:XHtmlInputText>
        </td>
        <td colspan="4" class="td-m"></td>
    </tr>
    <tr>
        <td class="td-l"><span class="req-star">证书（份数）</span>
        </td>
        <td class="td-m" colspan="5">
            <table class="tz-table">
                <tr>
                    <td class="td-l"><span class="req-star">设计证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4SJ" runat="server" class="kpms-textbox-money"
                            tablename="MM_Publish_ApplyForm" field="CertificateCount4SJ" activestatus="(23.发起申请)(23.申请人修改)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l"><span class="req-star">水保证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4SB" runat="server" class="kpms-textbox-money"
                            tablename="MM_Publish_ApplyForm" field="CertificateCount4SB" activestatus="(23.发起申请)(23.申请人修改)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l"><span class="req-star">水资源证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4SZY" runat="server" class="kpms-textbox-money"
                            tablename="MM_Publish_ApplyForm" field="CertificateCount4SZY" activestatus="(23.发起申请)(23.申请人修改)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l"><span class="req-star">咨询证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4ZX" runat="server" class="kpms-textbox-money"
                            tablename="MM_Publish_ApplyForm" field="CertificateCount4ZX" activestatus="(23.发起申请)(23.申请人修改)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l"><span class="req-star">电力证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4DL" runat="server" class="kpms-textbox-money"
                            tablename="MM_Publish_ApplyForm" field="CertificateCount4DL" activestatus="(23.发起申请)(23.申请人修改)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l"></td>
                    <td class="td-r"></td>
                </tr>
                <tr>
                    <td class="td-l"><span class="req-star">其他</span></td>
                    <td class="td-m" colspan="3">
                        <table style="width: 80%;">
                            <tr>
                                <td><span class="req-star">证书名称</span></td>
                                <td>
                                    <zhongsoft:LightTextBox ID="tbOtherCertificateName" runat="server" tablename="MM_Publish_ApplyForm" field="OtherCertificateName"
                                        activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)"></zhongsoft:LightTextBox></td>
                                <td><span class="req-star">证书数量</span></td>
                                <td>
                                    <zhongsoft:XHtmlInputText ID="txtCertificateCount4Other" runat="server" class="kpms-textbox-money"
                                        tablename="MM_Publish_ApplyForm" field="CertificateCount4Other" activestatus="(23.发起申请)(23.申请人修改)" Regex="^\d+" ErrMsg="请填写非负整数">
                                    </zhongsoft:XHtmlInputText>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td-l"><span class="req-star">证书确认情况*</span></td>
                    <td>
                        <asp:RadioButtonList runat="server" ID="rblCertificateIsConfirm" RepeatDirection="Horizontal" tablename="MM_Publish_ApplyForm" field="CertificateIsConfirm">
                            <asp:ListItem runat="server" Text="同意" Value="同意" />
                            <asp:ListItem runat="server" Text="不同意" Value="不同意" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="MM_Publish_ApplyForm" field="Memo"
                activestatus="(23.发起申请)(23.申请人修改)(23.经办人修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m">资料（任务）信息
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc1:UCPublishTaskDetail ID="UCApplyFormDetail1" runat="server" ApplyType="出案报告审批单" OnFormDataBind="UCApplyFormDetail1_FormDataBind" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="4">
            <span>产品文件信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
        <td class="td-m" colspan="2"><span style="float: right">按任务筛选
            <asp:DropDownList runat="server" ID="ddlWbs" EnableTheming="false" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlWbs_SelectedIndexChanged"></asp:DropDownList>
        </span></td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span1">
                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="下载所有文件" OnClientClick="return zipDownloadFile('signDwg','');">
                    <span>
                        <img runat="server" src="~/Themes/Images/ico_fujian.gif" alt="下载所有文件" width="16"
                            height="16" />下载所有文件</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="LinkButton2" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="下载DWG" OnClientClick="return zipDownloadFile('signDwg','图纸');">
                    <span>
                        <img runat="server" src="~/Themes/Images/ico_fujian.gif" alt="下载DWG" width="16"
                            height="16" />下载DWG</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnZIPDownLoadDWG" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="下载文本" OnClientClick="return zipDownloadFile('signDwg','文本');">
                    <span>
                        <img runat="server" src="~/Themes/Images/ico_fujian.gif" alt="下载文本" width="16"
                            height="16" />下载文本</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnZIPDownLoadPDF" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载PDF" OnClientClick="return zipDownloadFile('signPdf','');">
                    <span>
                        <img runat="server" src="~/Themes/Images/ico_fujian.gif" alt="下载PDF" width="16"
                            height="16" />下载PDF</span>
                </asp:LinkButton>
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m">
            <zhongsoft:LightPowerGridView ID="gvProduct" runat="server" AutoGenerateColumns="false" ShowExport="false"
                AllowPaging="true" PageSize="50" UseDefaultDataSource="true"
                BindGridViewMethod="UserControl.BindProduct" Width="100%"
                ShowFooter="false" DataKeyNames="ProductID">
                <Columns>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="图号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="图名" Width="150px" ItemStyle-Width="150px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MapSize" HeaderText="图幅">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="设计人" ItemStyle-Width="40px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传时间" ItemStyle-Width="40px" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="下载" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDownLoadDWG" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="下载" OnClientClick='<%# String.Format("return downloadProductFile(\"{0}\",\"{1}\",\"{2}\")", Eval("ProductID"), "", Eval("FileFormat")) %>'>
                                <span>
                                    <img id="img3" src="../../Themes/Images/ico_fujian.gif" alt="下载" width="16"
                                        height="16" />下载</span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="下载PDF" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDownLoadPDF" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="下载PDF" OnClientClick='<%# String.Format("return downloadProductFile(\"{0}\",\"{1}\",\"{2}\")", Eval("ProductID"), "signPdf", Eval("FileFormat")) %>'>
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
    <tr class="charge">
        <td class="td-l">印制内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <asp:CheckBoxList runat="server" ID="cblConsignContent" RepeatDirection="Horizontal" req="1"
                activestatus="(23.印制确认)" OnSelectedIndexChanged="cblConsignContent_SelectedIndexChanged" AutoPostBack="true">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiConsignContent" name="hiConsignContent"
                tablename="EPMS_PublishConsign" field="ConsignContent" />
        </td>
        <td class="td-r" style="text-align: right">
            <table class="tz-table">
                <tr>
                    <td>新增</td>
                    <td>
                        <zhongsoft:LightDropDownList runat="server" ID="ddlConsignContent" activestatus="(23.印制确认)" />
                    </td>
                    <td>
                        <zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2" activestatus="(23.印制确认)" /></td>
                    <td>
                        <asp:Button runat="server" ID="btnInSure" Text="确定" OnClick="btnInSure_OnClick" activestatus="(23.印制确认)" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="charge">
        <td colspan="6" class="td-m">
            <zhongsoft:LightPowerGridView ID="gvPrint" runat="server" AutoGenerateColumns="false" ShowExport="false"
                AllowPaging="false" UseDefaultDataSource="true" ShowPager="false" ShowPageSizeChange="false"
                BindGridViewMethod="UserControl.BindPrint" Width="100%" OnRowDataBound="gvPrint_RowDataBound"
                ShowFooter="false" DataKeyNames="PublishConsignPrintID,PrintContent" OnRowCommand="gvPrint_OnRowCommand">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PrintContent" HeaderText="内容">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="份数（套）" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrintCount" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("PrintCount") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="UInteger"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="复印（张）"  ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlPrintCopyCount">
                                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                <asp:ListItem Text="200" Value="200"></asp:ListItem>
                                <asp:ListItem Text="300" Value="300"></asp:ListItem>
                            </zhongsoft:LightDropDownList>
                            <input type="hidden" runat="server" id="hiPrintCopyCount" value='<%# Eval("PrintCopyCount") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="每份总张数"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrintCopyCount" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("PrintCopyCount") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="UInteger"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="封面（张）"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrintCoverCount" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("PrintCoverCount") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="UInteger"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="胶装"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrintGluedCount" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("PrintGluedCount") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="UInteger"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>

                    <zhongsoft:LightTemplateField HeaderText="A4黑白"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbA4BW" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("A4BW") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="Decimal2"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>

                    <zhongsoft:LightTemplateField HeaderText="A4彩色"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbA4Color" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("A4Color") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="Decimal2"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="A3黑白" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbA3BW" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("A3BW") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="Decimal2"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="A3彩色" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbA3Color" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("A3Color") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="Decimal2"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>

                    <zhongsoft:LightTemplateField HeaderText="加长图"  ItemStyle-HorizontalAlign="Right" Visible="False">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbLongerImg" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("LongerImg") %>'
                                Style="text-align: right;width:98%" DataType="UInteger"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>

                    <zhongsoft:LightTemplateField HeaderText="费用（元）" ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText runat="server" ID="txtPrintPrice" readonly="readonly" DefaultValue='<%# Eval("PrintPrice") %>' flag="ChargeSum" class="kpms-textbox-money" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注" >
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" MaxLength="256" Style="width: 120px"
                                Text='<%#Eval("Memo") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="Del" EnableTheming="false"
                                CommandArgument='<%#Eval("PublishConsignPrintID") %>'>
                                <img alt="删除" onclick="if(!confirm('确认要删除吗？')) return false;" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr class="charge">
        <td class="td-m" colspan="6">
            <span>出图</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr class="charge">
        <td colspan="6" class="td-m">
            <table class="tz-table" width="100%">
                <tr>
                    <td class="td-l">图纸类型</td>
                    <td class="td-l">A0</td>
                    <td class="td-l">A1</td>
                    <td class="td-l">A2</td>
                    <td class="td-l">A3</td>
                    <td class="td-l">A4</td>
                    <td class="td-l">费用（元）</td>
                    <td class="td-l">备注</td>
                </tr>
                <tr>
                    <td class="td-l">相纸彩图（张）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA0" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA1" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA2" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA3" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA4" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgPrice" runat="server" class="kpms-textbox-money"
                            field="PhotoColorImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgMemo" runat="server" class="kpms-textbox"
                            field="PhotoColorImgMemo" tablename="EPMS_PublishConsign" activestatus="(23.印制确认)(23.计费)" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">普通彩图（张）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA0" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA1" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA2" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA3" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA4" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgPrice" runat="server" class="kpms-textbox-money"
                            field="ColorImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgMemo" runat="server" class="kpms-textbox"
                            field="ColorImgMemo" tablename="EPMS_PublishConsign" activestatus="(23.印制确认)(23.计费)" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">白图（张）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA0" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA1" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA2" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA3" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA4" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgPrice" runat="server" class="kpms-textbox-money"
                            field="WhiteImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgMemo" runat="server" class="kpms-textbox"
                            field="WhiteImgMemo" tablename="EPMS_PublishConsign" activestatus="(23.印制确认)(23.计费)" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">硫酸图（张）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA0" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA1" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA2" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA3" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA4" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgPrice" runat="server" class="kpms-textbox-money"
                            field="VitriolImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgMemo" runat="server" class="kpms-textbox"
                            field="VitriolImgMemo" tablename="EPMS_PublishConsign" activestatus="(23.印制确认)(23.计费)" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">其他</td>
                    <td class="td-m" colspan="5"></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOtherDrawOutPrice" runat="server" class="kpms-textbox-money"
                            field="OtherDrawOutPrice" tablename="EPMS_PublishConsign"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOtherDrawOutMemo" runat="server" class="kpms-textbox"
                            field="OtherDrawOutMemo" tablename="EPMS_PublishConsign" activestatus="(23.印制确认)(23.计费)" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="charge">
        <td class="td-m" colspan="6">
            <span>晒图</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr class="charge">
        <td colspan="6" class="td-m">
            <table class="tz-table" width="100%">
                <tr>
                    <td class="td-l">底图（张）</td>
                    <td class="td-l">印制份数（份）</td>
                    <td class="td-l">重量（KG）</td>
                    <td class="td-l">折图重量（KG）</td>
                    <td class="td-l">费用（元）</td>
                    <td class="td-l">备注</td>
                </tr>
                <tr>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBottomImgCount" runat="server" class="kpms-textbox-money"
                            field="BottomImgCount" tablename="EPMS_PublishConsign"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请填写非负数,最多包含两位小数" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPrintCount" runat="server" class="kpms-textbox-money"
                            field="PrintCount" tablename="EPMS_PublishConsign"
                            activestatus="(23.印制确认)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBaskImgWeight" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="BaskImgWeight">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtFoldImgWeight" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="BaskImgWeight">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBaskImgPrice" runat="server" class="kpms-textbox-money"
                            field="BaskImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBluePrintMemo" runat="server" class="kpms-textbox"
                            field="BluePrintMemo" tablename="EPMS_PublishConsign" activestatus="(23.印制确认)(23.计费)" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">其他</td>
                    <td class="td-m" colspan="3"></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOtherBlueprintPrice" runat="server" class="kpms-textbox-money"
                            field="OtherBlueprintPrice" tablename="EPMS_PublishConsign"
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtOtherBlueprintMemo" runat="server" class="kpms-textbox"
                            field="OtherBlueprintMemo" tablename="EPMS_PublishConsign" activestatus="(23.印制确认)(23.计费)" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="charge">
        <td class="td-l">总费用</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtChargeSum" runat="server" class="kpms-textbox-money"
                field="ChargeSum" tablename="EPMS_PublishConsign" readonly="readonly"
                activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-m" colspan="4">
    </tr>
</table>
<table class="tz-table" flag="archive">
    <tr>
        <td class="td-m" colspan="6">
            <span>归档移交信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
        印制内
    </tr>
    <tr>
        <td class="td-l">移交人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTransferUserName" runat="server" TableName="DAMS_PRODUCTTRANSFORM"
                Field="TransferUserName" ActiveStatus="(23.发起申请)(23.申请人修改)" ReadOnly="true" />
            <input type="hidden" id="hiTransferUserID" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="TransferUserID" />
            <input type="hidden" id="hiTransferUserCode" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="TransferUserCode" />
        </td>
        <td class="td-l">移交部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTransferDeptName" runat="server" TableName="DAMS_PRODUCTTRANSFORM"
                Field="TransferDeptName" ActiveStatus="(23.发起申请)(23.申请人修改)" ReadOnly="true" />
            <input type="hidden" id="hiTransferDeptID" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="TransferDeptID" />
        </td>
        <td class="td-l">移交时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbTransferDate" activestatus="(23.发起申请)(23.申请人修改)"
                req="1" class="kpms-textbox-date" readonly="readonly" field="TransferDate" tablename="DAMS_PRODUCTTRANSFORM" />
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m">
            <zhongsoft:LightPowerGridView ID="gvWBSList" runat="server" AutoGenerateColumns="False" PermissionStatus="true" OnRowDataBound="gvWBSList_RowDataBound"
                DataKeyNames="DetailID" ItemShowLength="20" BindGridViewMethod="BindWBSList">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="工程编号" DataField="ProjectCode" Visible="false">
                    </zhongsoft:LightBoundField>
                    <%--<zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectName" ItemStyle-Width="200px" MaxLength="15">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="工程名称" ItemStyle-Width="250px" Visible="false">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important;">
                                <%#Eval("ProjectName")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode">
                    </zhongsoft:LightBoundField>
                    <%--<zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName" ItemStyle-Width="100px" MaxLength="15">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="任务名称" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important;">
                                <%#Eval("WBSName")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="归档份数<span style=color:Red >*</span>">
                        <ItemTemplate>
                            <input id="hiDetailID" runat="server" type="hidden" value='<%#Eval("DetailID") %>' />
                            <zhongsoft:LightTextBox runat="server" ID="tbArchiveCnt" activestatus="(23.归档确认)" Text='<%#Eval("ArchiveCnt") %>' req="1" DataType="Integer" Style="text-align: right"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="目录">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbDirectoryCnt" activestatus="(23.归档确认)" Text='<%#Eval("DirectoryCnt") %>' DataType="Integer" Style="text-align: right"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="说明书" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbTextCnt" DataType="Integer" activestatus="(23.归档确认)"
                                Style="text-align: right" Text='<%#Eval("TextCnt") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="清册">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbInventoryCnt" activestatus="(23.归档确认)" Text='<%#Eval("InventoryCnt") %>' DataType="Integer" Style="text-align: right"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="张数">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbPaperCnt" activestatus="(23.归档确认)" Text='<%#Eval("PaperCnt") %>' DataType="Integer" Style="text-align: right"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="件数">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbBookCnt" activestatus="(23.归档确认)" Text='<%#Eval("BookCnt") %>' DataType="Integer" Style="text-align: right"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="是否<br />压力管道" Visible="false">
                        <ItemTemplate>
                            <asp:RadioButtonList ID="rblIsPressurePiping" runat="server" activestatus="(23.归档确认)">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                            <input id="hiIsPressurePiping" runat="server" type="hidden" value='<%#Eval("IsPressurePiping") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbtnView" runat="server" Customer="Customer" OnClientClick="return false;" EnableTheming="false">
                                             <img onclick='return viewRollDetail("<%#Eval("WBSINFOID") %>")' alt="查看" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" title="查看成品文件" />
                                        </asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" EnableTheming="false" Visible="false"
                                            CommandArgument='<%#Eval("DetailID") %>'>
						             <img alt="删除" onclick="if(!confirm('如果该项目下有归档的任务，一起删除。确认要删除吗？')) return false;" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" />
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---主键ID--->
<input type="hidden" runat="server" id="hiApplyFormId" field="ApplyFormId" tablename="MM_Publish_ApplyForm" />
<input type="hidden" runat="server" id="hiPublishConsignID" field="PublishConsignID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiApplyType" field="ApplyType" tablename="MM_Publish_ApplyForm" />
<%--印制申请信息--%>
<input type="hidden" runat="server" id="hiConsignUserID" tablename="EPMS_PublishConsign" field="ConsignUserID" />
<input type="hidden" runat="server" id="hiConsignUserName" tablename="EPMS_PublishConsign" field="ConsignUserName" />
<input type="hidden" runat="server" id="hiConsignDeptID" tablename="EPMS_PublishConsign" field="ConsignDeptID" />
<input type="hidden" runat="server" id="hiConsignDeptName" tablename="EPMS_PublishConsign" field="ConsignDeptName" />
<input type="hidden" runat="server" id="hiConsignTime" tablename="EPMS_PublishConsign" field="ConsignTime" />
<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName" tablename="EPMS_PublishConsign" />
<!--价格-->
<input type="hidden" runat="server" id="hiPublishSingleCost" />
<%--成品档案移交流程ID--%>
<input type="hidden" id="hiTransFormID" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="TransFormID" />

<%--是否外来任务标识：否--%>
<input type="hidden" id="hiIsOutRoll" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="IsOutRoll" value="0" />

<!---经营处--->
<input type="hidden" runat="server" id="hiJYPeopleId" field="JYPeopleId" tablename="MM_Publish_ApplyForm" />
<input type="hidden" runat="server" id="hiJYPeople" field="JYPeople" tablename="MM_Publish_ApplyForm" />
<!---生产处--->
<input type="hidden" runat="server" id="hiSCPeopleId" field="SCPeopleId" tablename="MM_Publish_ApplyForm" />
<input type="hidden" runat="server" id="hiSCPeople" field="SCPeople" tablename="MM_Publish_ApplyForm" />
<!---项目总工--->
<input type="hidden" runat="server" id="hiXMPeopleId" field="XMPeopleId" tablename="MM_Publish_ApplyForm" />
<input type="hidden" runat="server" id="hiXMPeople" field="XMPeople" tablename="MM_Publish_ApplyForm" />
<!---分院--->
<input type="hidden" runat="server" id="hiFYPeopleId" field="FYPeopleId" tablename="MM_Publish_ApplyForm" />
<input type="hidden" runat="server" id="hiFYPeople" field="FYPeople" tablename="MM_Publish_ApplyForm" />
<script>

    function initCustomerPlugin() {
           //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();

        $('[flag="PhotoColorImg"]').bind('input propertychange', function () {
            var value = sum("相纸彩图"
                , $("#<%=txtPhotoColorImgA0.ClientID%>").val()
                , $("#<%=txtPhotoColorImgA1.ClientID%>").val()
                , $("#<%=txtPhotoColorImgA2.ClientID%>").val()
                , $("#<%=txtPhotoColorImgA3.ClientID%>").val()
                , $("#<%=txtPhotoColorImgA4.ClientID%>").val());

            $("#<%=txtPhotoColorImgPrice.ClientID%>").val(value);
            sumChargeSum();

        });
        $('[flag="ColorImg"]').bind('input propertychange', function () {

            var value = sum("普通彩图"
                , $("#<%=txtColorImgA0.ClientID%>").val()
                , $("#<%=txtColorImgA1.ClientID%>").val()
                , $("#<%=txtColorImgA2.ClientID%>").val()
                , $("#<%=txtColorImgA3.ClientID%>").val()
                , $("#<%=txtColorImgA4.ClientID%>").val());

            $("#<%=txtColorImgPrice.ClientID%>").val(value);
            sumChargeSum();

        });
        $('[flag="WhiteImg"]').bind('input propertychange', function () {

            var value = sum("白图"
                , $("#<%=txtWhiteImgA0.ClientID%>").val()
                , $("#<%=txtWhiteImgA1.ClientID%>").val()
                , $("#<%=txtWhiteImgA2.ClientID%>").val()
                , $("#<%=txtWhiteImgA3.ClientID%>").val()
                , $("#<%=txtWhiteImgA4.ClientID%>").val());

            $("#<%=txtWhiteImgPrice.ClientID%>").val(value);
            sumChargeSum();

        });
        $('[flag="VitriolImg"]').bind('input propertychange', function () {

            var value = sum("硫酸图"
                , $("#<%=txtVitriolImgA0.ClientID%>").val()
                , $("#<%=txtVitriolImgA1.ClientID%>").val()
                , $("#<%=txtVitriolImgA2.ClientID%>").val()
                , $("#<%=txtVitriolImgA3.ClientID%>").val()
                , $("#<%=txtVitriolImgA4.ClientID%>").val());

            $("#<%=txtVitriolImgPrice.ClientID%>").val(value);
            sumChargeSum();

        });
        $('[flag="BaskImgWeight"]').bind('input propertychange', function () {

            var jsonObject = jQuery.parseJSON($("#<%=hiPublishSingleCost.ClientID%>").val());

            var singleCost = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == "晒图" && e.SingleCostName == "晒图"; })[0].SingleCost;
            var amount = 0;
            amount = accMul($("#<%=txtBaskImgWeight.ClientID%>").val(), singleCost);
            amount = parseFloat(amount).toFixed(2);

            var ztCost = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == "晒图" && e.SingleCostName == "折图"; })[0].SingleCost;
            var amountZT = 0;
            amountZT = accMul($("#<%=txtFoldImgWeight.ClientID%>").val(), ztCost);
            amountZT = parseFloat(amountZT).toFixed(2);

            $("#<%=txtBaskImgPrice.ClientID%>").val(parseFloat(parseFloat(amount) + parseFloat(amountZT)).toFixed(2));
            sumChargeSum();

        });
        $('[flag="ChargeSum"]').bind('input propertychange', function () {
            sumChargeSum();
        });

        if ($actName == "印制确认" || $actName == "归档确认") {
            calcGvPrint();
        }

        initCharge();

        if (typeof (ucDetail_Init) == "function") {
            ucDetail_Init();
        }
    }
    function calcGvPrint() {
        var jsonObject = jQuery.parseJSON($("#<%=hiPublishSingleCost.ClientID%>").val());
        var priceFM = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == "胶装" && e.SingleCostName == "封面"; })[0].SingleCost;
        var priceJZ = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == "胶装" && e.SingleCostName == "胶装"; })[0].SingleCost;
        var priceA4HB = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == "普通黑白打印复印" && e.SingleCostName == "A4"; })[0].SingleCost;
        var priceA4CS = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == "普通彩色打印复印" && e.SingleCostName == "A4"; })[0].SingleCost;
        var priceA3HB = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == "普通黑白打印复印" && e.SingleCostName == "A3"; })[0].SingleCost;
        var priceA3CS = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == "普通彩色打印复印" && e.SingleCostName == "A3"; })[0].SingleCost;
        var tr = $('#<%=gvPrint.ClientID %>').children('tbody').children('tr');
        if (tr.length == 2 && tr[1].cells[0].innerText == "没有要查找的数据") {
            return;
        }
        for (var i = 0; i < tr.length; i++) {
            var totalMoney = 0;
            var count = tr[i].cells[1].children[0];
            var fm = tr[i].cells[3].children[0];
            var jz = tr[i].cells[4].children[0];
            var a4HB = tr[i].cells[5].children[0];
            var a4CS = tr[i].cells[6].children[0];
            var a3HB = tr[i].cells[7].children[0];
            var a3CS = tr[i].cells[8].children[0];
            var totalCost = tr[i].cells[9].children[0];
            if (typeof (fm) != "undefined" && fm.value != "") {
                totalMoney = (parseFloat(totalMoney) + parseFloat(accMul(fm.value, priceFM))).toFixed(2);
            }
            if (typeof (jz) != "undefined" && jz.value != "") {
                totalMoney = (parseFloat(totalMoney) + parseFloat(accMul(jz.value, priceJZ))).toFixed(2);
            }
            if (typeof (count) != "undefined" && count.value != "") {
                if (typeof (a4HB) != "undefined" && a4HB.value != "") {
                    totalMoney = (parseFloat(totalMoney) + parseFloat(accMul(accMul(a4HB.value, priceA4HB), count.value))).toFixed(2);
                }
                if (typeof (a4CS) != "undefined" && a4CS.value != "") {
                    totalMoney = (parseFloat(totalMoney) + parseFloat(accMul(accMul(a4CS.value, priceA4CS), count.value))).toFixed(2);
                }
                if (typeof (a3HB) != "undefined" && a3HB.value != "") {
                    totalMoney = (parseFloat(totalMoney) + parseFloat(accMul(accMul(a3HB.value, priceA3HB), count.value))).toFixed(2);
                }
                if (typeof (a3CS) != "undefined" && a3CS.value != "") {
                    totalMoney = (parseFloat(totalMoney) + parseFloat(accMul(accMul(a3CS.value, priceA3CS), count.value))).toFixed(2);
                }
            }
            totalCost.value = parseFloat(totalMoney).toFixed(2);
        }
        sumChargeSum();
    }

    // 下载文件
    function zipDownloadFile(docType, fileFormat) {
        var publishID ='<%=BusinessObjectId %>';
        var urlStr = "<%= WebAppPath %>/Sys/FileDocument/ZipFileDownLoad.aspx?publishID=" + publishID + "&docType=" + docType + "&fileFormats=" + fileFormat + "&fileTitle=" + $("#<%=txtProjectCode.ClientID %>").val() + "-" + fileFormat + "成品-";
        window.open(urlStr);
    }

    ///单个下载成品
    function downloadProductFile(productId, fileType, fileFormat) {
        if (fileType == "") {
            switch (fileFormat) {
                case "图纸":
                    fileType = "signDwg";
                    break;
                case "文本":
                    fileType = "product";
                    break;
                default:
                    break;
            }
        }

        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=" + fileType + "&fileId=" + productId;
        window.open(urlStr);
        return false;
    }

    // 计算合计价格
    function sumChargeSum() {
        var amount = 0;
        $('[flag="ChargeSum"]').each(function () {
            var value = $(this).val();
            if (value != '' && value != undefined) {
                value = parseFloat(value);
                amount += value;
            }
        });
        amount = amount.toFixed(4);

        $("#<%=txtChargeSum.ClientID%>").val(parseFloat(amount));
    }

    // 合计某类价格
    function sum(costType, a0, a1, a2, a3, a4) {
        var jsonObject = jQuery.parseJSON($("#<%=hiPublishSingleCost.ClientID%>").val());

        var singleCostA0 = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == costType && e.SingleCostName == "A0"; })[0].SingleCost;
        var singleCostA1 = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == costType && e.SingleCostName == "A1"; })[0].SingleCost;
        var singleCostA2 = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == costType && e.SingleCostName == "A2"; })[0].SingleCost;
        var singleCostA3 = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == costType && e.SingleCostName == "A3"; })[0].SingleCost;
        var singleCostA4 = jsonObject.jsonFilter(function (e, i, a) { return e.CostType == costType && e.SingleCostName == "A4"; })[0].SingleCost;
        var amount = 0; 1
        a0 = accMul(a0, singleCostA0);
        a1 = accMul(a1, singleCostA1);
        a2 = accMul(a2, singleCostA2);
        a3 = accMul(a3, singleCostA3);
        a4 = accMul(a4, singleCostA4);
        amount = accAdd(amount, a0);
        amount = accAdd(amount, a1);
        amount = accAdd(amount, a2);
        amount = accAdd(amount, a3);
        amount = accAdd(amount, a4);
        return parseFloat(amount).toFixed(2);
    }
    // 自定义过滤器
    Array.prototype.jsonFilter = function (fun /*, thisp*/) {
        var len = this.length;
        if (typeof fun != "function") {
            throw new TypeError();
        }
        var res = new Array();
        var thisp = arguments[1];
        for (var i = 0; i < len; i++) {
            if (i in this) {
                var val = this[i]; // in case fun mutates this
                if (fun.call(thisp, val, i, this)) {
                    res.push(val);
                }
            }
        }
        return res;
    };

    // 展示计费信息
    function initCharge() {
        if ($actName == "印制确认" || $actName == "费用确认" || $actName == "审核" || $action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Read %>") {
            $(".charge").show();
        }
        else {
            $(".charge").hide();
        }

        if ($actName == '归档确认' || $action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Read %>") {
            $('[flag="archive"]').show();
        }
        else {
            $('[flag="archive"]').hide();
        }
    }

    //查看任务详细信息
    function viewRollDetail(wbsInfoId) {
        var url ="<%=EDPortal.BLL.Sys.SysConfig.Instance.DAMSWebAppPath %>/DAMS/List/ACS/RollDetailEditor.aspx?actionType=1&bizId=" + wbsInfoId;
        showDivDialog(url, "", "900", "600", null);
        return false;
    }

    //打印
    function showPrintPage() {

        var processStatus = '0';
        <%
    if (ProcessManager != null)
    {

    %>
        processStatus = '<%=ProcessManager.WorkflowProcessStatus.GetHashCode()%>';
         <%
    }
    %>
        if (processStatus != '7') {
            alert('出案报告申请单必须在流程结束后才可以打印。');
            return false;
        }
        else {
            var id = $("#<%=hiApplyFormId.ClientID %>").val();
            var url = buildQueryUrl("EPMS/List/Publish/Print/ApplyFormPrint.aspx", { "ApplyFormId": id });
            window.open(url);
        }
    }
    function checkForm() {
        if ($formAction == 0) {
            var chargeSum = $("#<%=txtChargeSum.ClientID %>").val();
            if ($actName == "申请人修改" || $actName == "发起申请") {
                return checkTask();
            }
            else if ($actName == "印制确认" && chargeSum == "") {
                alert("总费用不可为空！");
                return false;
            }
        }

        return true;
    }
</script>