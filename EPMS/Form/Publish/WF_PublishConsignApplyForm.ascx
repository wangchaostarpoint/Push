<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishConsignApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishConsignApplyForm" %>

<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">项目名称<span id="red" class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" IsMutiple="false"
                Writeable="false" tablename="EPMS_PublishConsign" field="ProjectName" SelectPageMode="Dialog"
                ResultForControls="{'hiOrganizationId':'id','txtProjectCode':'ProjectCode'}" EnableTheming="false"
                Text="选择项目" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写印制申请单)"
                req="1" OnClick="lbsProjectName_Click" />
            <input type="hidden" runat="server" id="hiOrganizationID" name="hiOrganizationId"
                tablename="EPMS_PublishConsign" field="OrganizationID" />
        </td>
        <td class="td-l">项目编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写印制申请单)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ProjectCode"
                req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignUserName" activestatus="(23.填写印制申请单)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConsignUserName" />
            <input type="hidden" runat="server" id="hiConsignUserID" name="hiConsignUserID"
                tablename="EPMS_PublishConsign" field="ConsignUserID" />
        </td>
        <td class="td-l">电话<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignUserTel" activestatus="(23.填写印制申请单)"
                class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConsignUserTel" />
        </td>
        <td class="td-l">申请部门<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignDeptName" activestatus="(23.填写印制申请单)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConsignDeptName" />
            <input type="hidden" runat="server" id="hiConsignDeptID" name="hiConsignDeptID"
                tablename="EPMS_PublishConsign" field="ConsignDeptID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请日期<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignTime" activestatus="(23.填写印制申请单)"
                readonly="readonly" class="kpms-textbox-date" TableName="EPMS_PublishConsign" Field="ConsignTime" />
        </td>
        <td class="td-l">批准人<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConfirmUserName" activestatus="(23.批准)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConfirmUserName" />
            <input type="hidden" runat="server" id="hiConfirmUserID" name="hiConfirmUserID"
                tablename="EPMS_PublishConsign" field="ConfirmUserID" />
        </td>
        <td class="td-r" colspan="2"></td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>印制任务信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span runat="server" class="req-star" displaystatus="(23.?)">如果任务进行了线上校审，则会自动带出出版成品PDF，不需要再上传；否则需要上传出版成品PDF。
            </span>
            <span id="span4" runat="server" displaystatus="(2.?)" style="cursor: hand; height: 16px; float: right"
                class="req-star">请先保存再选择印制任务
            </span>
            <span style="float: right;" id="Span3" runat="server" displaystatus="(23.填写印制申请单)">
                <asp:LinkButton runat="server" ID="lbtnViewPublishInfo" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="任务出版记录"
                    OnClientClick="return viewPublishInfo();">
                    <span>
                        <img runat="server" src="~/Themes/Images/btn_dg_view.gif" alt="印制任务记录" width="16"
                            height="16" />印制任务记录</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="选择出版任务" OnClientClick="return false;">
                    <span>
                        <img runat="server" src="~/Themes/Images/btn_add.gif" alt="选择印制任务" width="16"
                            height="16" />
                        选择印制任务
                    </span>
                </asp:LinkButton>
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvWBS" runat="server" AutoGenerateColumns="false" ShowExport="false"
                AllowPaging="true" PageSize="10" UseDefaultDataSource="true"
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
                                CommandName="EditData" CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('你确定需修改吗？')) return false;"
                                CssClass="btn" Text="需修改" Style="color: Red; font-weight: bold;" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="DeleteData" ToolTip="删除"
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
        <td class="td-l">印制内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cblConsignContent" RepeatDirection="Horizontal" req="1"
                activestatus="(23.填写印制申请单)"
                OnSelectedIndexChanged="cblConsignContent_SelectedIndexChanged" AutoPostBack="true">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiConsignContent" name="hiConsignContent"
                tablename="EPMS_PublishConsign" field="ConsignContent" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvPrint" runat="server" AutoGenerateColumns="false" ShowExport="false"
                AllowPaging="false" UseDefaultDataSource="true" ShowPager="false" ShowPageSizeChange="false"
                BindGridViewMethod="UserControl.BindPrint" Width="100%" OnRowDataBound="gvPrint_RowDataBound"
                ShowFooter="false" DataKeyNames="PublishConsignPrintID,PrintContent">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PrintContent" HeaderText="内容">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="份数（套）" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrintCount" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("PrintCount") %>'
                                Style="text-align: right;" Regex="^\d+" ErrMsg="请填写非负整数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="复印（张）" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlPrintCopyCount">
                                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                <asp:ListItem Text="200" Value="200"></asp:ListItem>
                                <asp:ListItem Text="300" Value="300"></asp:ListItem>
                            </zhongsoft:LightDropDownList>
                            <input type="hidden" runat="server" id="hiPrintCopyCount" value='<%# Eval("PrintCopyCount") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="封面（张）" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrintCoverCount" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("PrintCoverCount") %>'
                                Style="text-align: right;" Regex="^\d+" ErrMsg="请填写非负整数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="胶装" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrintGluedCount" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("PrintGluedCount") %>'
                                Style="text-align: right;" Regex="^\d+" ErrMsg="请填写非负整数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="费用（元）" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Right" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPrintPrice" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("PrintPrice") %>' Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$"
                                Style="text-align: right;" errmsg="请输入正数，最多8位整数，2位小数" flag="ChargeSum"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否有证书</td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsHadCertificate" runat="server" RepeatColumns="2" field="IsHadCertificate" tablename="EPMS_PublishConsign" activestatus="(23.填写印制申请单)">
                <asp:ListItem Text="是" Value="是"></asp:ListItem>
                <asp:ListItem Text="否" Value="否"></asp:ListItem>
            </asp:RadioButtonList>
        </td>

        <td class="td-l">是否二维码</td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsQRCode" runat="server" RepeatColumns="2" field="IsQRCode" tablename="EPMS_PublishConsign" activestatus="(23.填写印制申请单)">
                <asp:ListItem Text="是" Value="是"></asp:ListItem>
                <asp:ListItem Text="否" Value="否"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">打印类型</td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblPrintType" runat="server" RepeatColumns="2" field="PrintType" tablename="EPMS_PublishConsign" activestatus="(23.填写印制申请单)">
                <asp:ListItem Text="黑白" Value="黑白"></asp:ListItem>
                <asp:ListItem Text="彩打" Value="彩打"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr class="CertificateCount">
        <td class="td-l">证书份数</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCertificateCount" runat="server" class="kpms-textbox-money"
                field="CertificateCount" tablename="EPMS_PublishConsign" activestatus="(23.填写印制申请单)" Regex="^\d+" ErrMsg="请填写非负整数">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-r" colspan="2">
        <td class="td-r" colspan="2">
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="Memo" tablename="EPMS_PublishConsign" activestatus="(23.填写印制申请单)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="4">
            <span>出版文件信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
        <td class="flexible" colspan="2"><span style="float: right">按任务筛选
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
                    ToolTip="打包下载PDF" OnClientClick="return zipDownloadFile('signPdf','图纸');">
                    <span>
                        <img runat="server" src="~/Themes/Images/ico_fujian.gif" alt="下载PDF" width="16"
                            height="16" />下载PDF</span>
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
        <td class="flexible" colspan="6">
            <span>出图</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr class="charge">
        <td colspan="6">
            <table class="tz-table" width="100%">
                <tr>
                    <td class="td-l">图纸类型</td>
                    <td class="td-l">A0</td>
                    <td class="td-l">A1</td>
                    <td class="td-l">A2</td>
                    <td class="td-l">A3</td>
                    <td class="td-l">A4</td>
                    <td class="td-l">费用（元）</td>
                </tr>
                <tr>
                    <td class="td-l">相纸彩图（张）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA0" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA1" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA2" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA3" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgA4" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="PhotoColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhotoColorImgPrice" runat="server" class="kpms-textbox-money"
                            field="PhotoColorImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">普通彩图（张）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA0" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA1" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA2" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA3" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgA4" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="ColorImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtColorImgPrice" runat="server" class="kpms-textbox-money"
                            field="ColorImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">白图（张）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA0" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA1" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA2" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA3" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgA4" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="WhiteImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtWhiteImgPrice" runat="server" class="kpms-textbox-money"
                            field="WhiteImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">硫酸图（张）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA0" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA1" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA2" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA3" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgA4" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;" flag="VitriolImg">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtVitriolImgPrice" runat="server" class="kpms-textbox-money"
                            field="VitriolImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="charge">
        <td class="flexible" colspan="6">
            <span>晒图</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr class="charge">
        <td colspan="6">
            <table class="tz-table" width="100%">
                <tr>
                    <td class="td-l">底图（张）</td>
                    <td class="td-l">印制份数（份）</td>
                    <td class="td-l">重量（KG）</td>
                    <td class="td-l">费用（元）</td>
                </tr>
                <tr>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBottomImgCount" runat="server" class="kpms-textbox-money"
                            field="BottomImgCount" tablename="EPMS_PublishConsign"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPrintCount" runat="server" class="kpms-textbox-money"
                            field="PrintCount" tablename="EPMS_PublishConsign"
                            activestatus="(23.印制)(23.计费)" Regex="^\d+" ErrMsg="请填写非负整数" style="width: 98%;">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBaskImgWeight" runat="server" class="kpms-textbox-money"
                            activestatus="(23.印制)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="BaskImgWeight">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBaskImgPrice" runat="server" class="kpms-textbox-money"
                            field="BaskImgPrice" tablename="EPMS_PublishConsign" readonly="readonly"
                            activestatus="(23.印制)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
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
                activestatus="(23.印制)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-r" colspan="2">
        <td class="td-r" colspan="2">
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
<input type="hidden" runat="server" id="hiIsHaveNeedModify" />
<input type="hidden" runat="server" id="hiWBSID" />
<asp:LinkButton runat="server" ID="lbtCope" OnClick="btnCope_Click" Style="display: none"></asp:LinkButton>

<!--主键-->
<input type="hidden" id="hiPublishConsignID" runat="server" tablename="EPMS_PublishConsign" field="PublishConsignID" />
<!--出版任务筛选条件-->
<input type="hidden" runat="server" id="hiPublishState" />

<input type="hidden" runat="server" id="hiWBSXML" />

<asp:Button runat="server" ID="btnSelWBS" OnClick="btnSelWBS_Click" Style="display: none" />

<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName" tablename="EPMS_PublishConsign" />
<!--价格-->
<input type="hidden" runat="server" id="hiPublishSingleCost" />
<%--JS部分--%>
<script type="text/javascript">

    //页面加载执行
    function initCustomerPlugin() {
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
            $("#<%=txtBaskImgPrice.ClientID%>").val(amount);
            sumChargeSum();

        });
        $('[flag="ChargeSum"]').bind('input propertychange', function () {
            sumChargeSum();
        });

        checkIsHadCertificate();
        $("#<%=rblIsHadCertificate.ClientID%>").live("click", function () {
            checkIsHadCertificate();
        })

        initCharge();
    }

    //保存、发送调用（进行相关逻辑验证）
    function checkForm() {
        //0:发送 1:回退 2:保存 3:转交 -1:null
        if ($formAction == 0) {

        }

        //最终验证通过，必须返回true（验证不通过返回false并alert错误提示），否则会导致发送无反应
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

    $('#<%=lbtnSelWBS.ClientID %>').live('click', function () {
        if (checkProject()) {
            selWBS();
        }
    });

    //验证是否选择了项目
    function checkProject() {
        var organizationID = $('#<%=hiOrganizationID.ClientID %>').val();
        if (checkProject == "") {
            alert("请先选择项目");
            return false;
        }
        return true;
    }

    //选择加晒任务
    function selWBS() {
        var param = new InputParamObject("m");
        var organizationID = $("#<%=hiOrganizationID.ClientID %>").val();
        var publishState = $("#<%=hiPublishState.ClientID %>").val();
        var json = { OrganizationID: organizationID, WBSState: 4, IsShowMore: 1, PublishState: publishState }
        getWBS('<%=hiWBSXML.ClientID %>', param, json, bindWBS);
        return false;
    }

    // 绑定任务信息
    function bindWBS() {
        $("#<%=btnSelWBS.ClientID %>").click();
    }

    // 任务出版记录
    function viewPublishInfo() {
        if (checkProject()) {
            var organizationID = $("#<%=hiOrganizationID.ClientID %>").val();
            var json = { OrganizationID: organizationID, ExceptConsignFormID: "<%=BusinessObjectId%>", ViewPublishInfo: "true" };
            var url = buildQueryUrl('/EPMS/List/Publish/PublishConsignList.aspx', json);
            showDivDialog(url, "", 900, 500, null);
            return false;
        }
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
    // 检查是否持有证书，是的情况才显示证书份数
    function checkIsHadCertificate() {
        if ($("#<%=rblIsHadCertificate.ClientID%>").find("input:checked").val() == "是") {
            $(".CertificateCount").show();
        } else {
            $(".CertificateCount").hide();
        }
    }
    // 展示计费信息
    function initCharge() {
        if ($actName == "印制" || $actName == "计费" || $action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Read %>") {
            $(".charge").show();
        } else {
            $(".charge").hide();
        }
    }
</script>
