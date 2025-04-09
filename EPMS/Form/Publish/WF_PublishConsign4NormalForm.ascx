<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishConsign4NormalForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishConsign4NormalForm" %>

<table class="tz-table">
    <tr>
        <td class="td-l">印制类型<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList ID="rblPublishType" runat="server" RepeatColumns="2" tablename="EPMS_PublishConsign" field="PublishType"
                req="1" activestatus="(23.发起申请)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr flag="project">
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" IsMutiple="false"
                Writeable="false" tablename="EPMS_PublishConsign" field="ProjectName" SelectPageMode="Dialog"
                ResultForControls="{'hiOrganizationId':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName'}" EnableTheming="false"
                Text="选择项目" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.发起申请)"
                OnClick="lbsProjectName_Click" />
            <input type="hidden" runat="server" id="hiOrganizationID" name="hiOrganizationId"
                tablename="EPMS_PublishConsign" field="OrganizationID" />
        </td>
    </tr>
    <tr flag="project">
        <td class="td-l">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.发起申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ProjectCode" />
        </td>
        <td class="td-l">设计阶段
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" class="kpms-textbox"
                activestatus="(23.发起申请)(23.经办人修改)" readonly="readonly" tablename="EPMS_PublishConsign" field="PhaseName">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-m" colspan="2">
    </tr>
    <tr>
        <td class="td-l">申请人<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignUserName" activestatus="(23.发起申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConsignUserName" />
            <input type="hidden" runat="server" id="hiConsignUserID" name="hiConsignUserID"
                tablename="EPMS_PublishConsign" field="ConsignUserID" />
        </td>
        <td class="td-l">电话<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignUserTel" activestatus="(23.发起申请)"
                class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConsignUserTel" />
        </td>
        <td class="td-l">申请部门<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignDeptName" activestatus="(23.发起申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConsignDeptName" />
            <input type="hidden" runat="server" id="hiConsignDeptID" name="hiConsignDeptID"
                tablename="EPMS_PublishConsign" field="ConsignDeptID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请日期<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignTime" activestatus="(23.发起申请)"
                readonly="readonly" class="kpms-textbox-date" TableName="EPMS_PublishConsign" Field="ConsignTime" />
        </td>
        <td class="td-l">批准人<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConfirmUserName" activestatus="(23.费用确认)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConfirmUserName" />
            <input type="hidden" runat="server" id="hiConfirmUserID" name="hiConfirmUserID"
                tablename="EPMS_PublishConsign" field="ConfirmUserID" />
        </td>
        <td class="td-r" colspan="2"></td>
    </tr>

    <tr>
        <td class="td-l"><span class="req-star">证书（份数）</span>
        </td>
        <td class="td-m" colspan="6">
            <table class="tz-table">
                <tr>
                    <td class="td-l"><span class="req-star">设计证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4SJ" runat="server" class="kpms-textbox-money"
                            tablename="EPMS_PublishConsign" field="CertificateCount4SJ" activestatus="(23.发起申请)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l"><span class="req-star">水保证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4SB" runat="server" class="kpms-textbox-money"
                            tablename="EPMS_PublishConsign" field="CertificateCount4SB" activestatus="(23.发起申请)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l"><span class="req-star">水资源证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4SZY" runat="server" class="kpms-textbox-money"
                            tablename="EPMS_PublishConsign" field="CertificateCount4SZY" activestatus="(23.发起申请)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l"><span class="req-star">咨询证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4ZX" runat="server" class="kpms-textbox-money"
                            tablename="EPMS_PublishConsign" field="CertificateCount4ZX" activestatus="(23.发起申请)" Regex="^\d+" ErrMsg="请填写非负整数">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l"><span class="req-star">电力证书</span></td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtCertificateCount4DL" runat="server" class="kpms-textbox-money"
                            tablename="EPMS_PublishConsign" field="CertificateCount4DL" activestatus="(23.发起申请)" Regex="^\d+" ErrMsg="请填写非负整数">
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
                                    <zhongsoft:LightTextBox ID="tbOtherCertificateName" runat="server" tablename="EPMS_PublishConsign" field="OtherCertificateName"
                                        activestatus="(23.发起申请)"></zhongsoft:LightTextBox></td>
                                <td><span class="req-star">证书数量</span></td>
                                <td>
                                    <zhongsoft:XHtmlInputText ID="txtCertificateCount4Other" runat="server" class="kpms-textbox-money"
                                        tablename="EPMS_PublishConsign" field="CertificateCount4Other" activestatus="(23.发起申请)" Regex="^\d+" ErrMsg="请填写非负整数">
                                    </zhongsoft:XHtmlInputText>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td-l"><span class="req-star">证书确认情况*</span></td>
                    <td>
                        <asp:RadioButtonList runat="server" ID="rblCertificateIsConfirm" RepeatDirection="Horizontal" tablename="EPMS_PublishConsign" field="CertificateIsConfirm" req="1">
                            <asp:ListItem runat="server" Text="同意" Value="同意" />
                            <asp:ListItem runat="server" Text="不同意" Value="不同意" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="Memo" tablename="EPMS_PublishConsign" activestatus="(23.发起申请)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6">
            <span>印制文件信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            <span style="float: right">
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false" ToolTip="上传附件"
                    DisplayStatus="(23.发起申请)" OnClick="lbtnUpload_Click"><img src="../../Themes/Images/btn_upload.gif" />
                        <span>上传附件</span></zhongsoft:LightFileUploader>
                <span class="req-star" id="Span2" runat="server" displaystatus="(2.?)">请先保存再上传附件</span>
                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载" OnClientClick="return zipDownloadAttach();">
                    <span>
                        <img runat="server" id="img8" src="~/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
                            height="16" />批量下载</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m">
            <zhongsoft:LightPowerGridView ID="gvFile" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="FileID" OnRowCommand="gvFile_RowCommand" OnRowDataBound="gvFile_RowDataBound" AllowPaging="true" PageSize="50"
                BindGridViewMethod="UserControl.BindFile">
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
    <tr class="charge">
        <td class="td-l">印制内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <asp:CheckBoxList runat="server" ID="cblConsignContent" RepeatDirection="Horizontal" req="1"
                activestatus="(23.印制确认)"
                OnSelectedIndexChanged="cblConsignContent_SelectedIndexChanged" AutoPostBack="true">
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
                                Style="text-align: right; width:98%" DataType="UInteger"></zhongsoft:LightTextBox>
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
                    <zhongsoft:LightTemplateField HeaderText="封面（张）" ItemStyle-HorizontalAlign="Right">
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
                    <zhongsoft:LightTemplateField HeaderText="A3黑白"  ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbA3BW" runat="server" class="kpms-textbox-money"
                                EnableTheming="false" Text='<%# Eval("A3BW") %>' onchange="calcGvPrint();"
                                Style="text-align: right;width:98%" DataType="Decimal2"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="A3彩色"  ItemStyle-HorizontalAlign="Right">
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
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" MaxLength="256" Style="width:120px"
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
                            activestatus="(23.印制确认)(23.计费)" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多8位整数，2位小数" style="width: 98%;" flag="ChargeSum">
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

<!--主键-->
<input type="hidden" id="hiPublishConsignID" runat="server" tablename="EPMS_PublishConsign" field="PublishConsignID" />
<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName" tablename="EPMS_PublishConsign" />
<!--价格-->
<input type="hidden" runat="server" id="hiPublishSingleCost" />

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
        if ($actName == "印制确认" || $actName == "费用确认") {
            calcGvPrint();
        }

        initCharge();

        initPublishType();
        $("#<%=rblPublishType.ClientID%>").on("change", function () {
            initPublishType();
        })
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

    //根据印制类型，控制是否显示项目信息
    function initPublishType() {
        if ($("#<%=rblPublishType.ClientID%> input:checked").val() == '<%=Zhongsoft.Portal.EPMS.PublishType.项目.GetHashCode()%>') {
            $('[flag="project"]').show();
            $('#<%=lbsProjectName.ClientID%>').attr('req', '1');
        }
        else {
            $('[flag="project"]').hide();
            $('#<%=lbsProjectName.ClientID%>').removeAttr('req');
            $('#<%=hiOrganizationID.ClientID%>').val('');
            $('#<%=txtProjectCode.ClientID%>').val('');
            $('#<%=lbsProjectName.ClientID%>').val('');
            $('#<%=txtPhase.ClientID%>').val('');
        }
    }

    //打包下载附件
    function zipDownloadAttach() {
        var fileSourceID = '<%=BusinessObjectId %>';
        var urlStr = "<%= WebAppPath %>/Sys/FileDocument/ZipFileDownLoad.aspx?fileSourceId=" + fileSourceID + "&fileTitle=" + $("#<%=txtConsignDeptName.ClientID %>").val() + "-出版成品-";
        window.open(urlStr);
    }

    //保存、发送调用（进行相关逻辑验证）
    function checkForm() {
        //0:发送 1:回退 2:保存 3:转交 -1:null
        if ($formAction == 0) {
            var result = $("#<%= rblCertificateIsConfirm.ClientID%>").find("input:checked").val();
            var chargeSum = $("#<%=txtChargeSum.ClientID %>").val();
            if (result != "" && result != null && result != undefined && result == "不同意") {
                alert('您选择了不同意，请点击需修改按钮回退进行修改！');
                return false;
            } else if ($actName == "印制确认" && chargeSum == "") {
                alert("总费用不可为空！");
                return false;
            }
            return true;
        }

        //最终验证通过，必须返回true（验证不通过返回false并alert错误提示），否则会导致发送无反应
        return true;
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
    }
</script>