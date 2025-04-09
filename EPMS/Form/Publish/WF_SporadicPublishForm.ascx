<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SporadicPublishForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_SporadicPublishForm" %>
<%--工作量填报列表--%>
<%@ Register Src="~/EPMS/UI/Publish/WorkloadDetail.ascx" TagName="WorkloadDetail" TagPrefix="uc4" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="flexible" onclick="openDetail('projDetail')">
            <span>出版委托信息</span>&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="projDetail">
    <tr>
        <td class="td-l">项目代号<span id="red" class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectCode" IsMutiple="false"
                Writeable="false" field="ProjectCode" tablename="EPMS_PublishConsign" SelectPageMode="Dialog"
                ResultForControls="{'hiOrganizationId':'id','txtProjectName':'name'}" EnableTheming="false"
                Text="选择项目" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="ProjectCode" activestatus="(23.出版委托)"
                req="1"  />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.出版委托)"
                req="1" class="kpms-textbox" readonly="readonly" field="ProjectName" tablename="EPMS_PublishConsign" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出版任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" req="1" ID="txtPublishConsignName" activestatus="(23.出版委托)" class="kpms-textbox" field="PublishConsignName" tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">出版编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRecordNumber" runat="server" activestatus="(23.出版委托)"
                TableName="EPMS_PublishConsign" Field="RecordNumber" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">设计人<span class="req-star">*</span></td>
        <td>
            <zhongsoft:LightObjectSelector runat="server" ID="losDesignerName" TableName="EPMS_PublishConsign"
                Field="DesignerName" activestatus="(23.出版委托)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrs="name" ResultForControls="{'hidDesignerID':'id','hidDesignerCode':'UserCode'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input id="hidDesignerID" type="hidden" runat="server" tablename="EPMS_PublishConsign" field="DesignerID" />
            <input id="hidDesignerCode" type="hidden" runat="server" tablename="EPMS_PublishConsign" field="DesignerCode" />
        </td>
        <td class="td-l">所属部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlDept" TableName="EPMS_PublishConsign"
                Field="BelongDeptID" activestatus="(23.出版委托)" req="1"
                OnSelectedIndexChanged="ddlDept_SelectedIndexChanged" AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiDeptName" tablename="EPMS_PublishConsign" field="BelongDeptName" />
        </td>
        <td class="td-l">所属专业
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" activestatus="(23.出版委托)"
                OnSelectedIndexChanged="ibtnSelectSpe_Click" AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiBelongSpecialtyID" tablename="EPMS_PublishConsign"
                field="BelongSpecialtyID" />
            <input type="hidden" runat="server" id="hiBelongSpecialtyCode" tablename="EPMS_PublishConsign"
                field="BelongSpecialtyCode" />
            <input type="hidden" runat="server" id="hiBelongSpecialtyName" tablename="EPMS_PublishConsign"
                field="BelongSpecialtyName" />
        </td>
    </tr>
    <tr>
        <td class="td-l">委托人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lboConsignUserName" TableName="EPMS_PublishConsign"
                Field="ConsignUserName" activestatus="(23.出版委托)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiConsignUserID':'id','txtConsignDeptName':'OrgUnitName','hiConsignDeptID':'OrgUnitId'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiConsignUserID" type="hidden" runat="server" tablename="EPMS_PublishConsign" field="ConsignUserID" />
        </td>
        <td class="td-l">委托人电话<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignUserTel" activestatus="(23.出版委托)"
                class="kpms-textbox" TableName="EPMS_PublishConsign" Field="ConsignUserTel" req="1" />
        </td>
        <td class="td-l">委托人部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConsignDeptName" runat="server" TableName="EPMS_PublishConsign"
                Field="ConsignDeptName" activestatus="(23.出版委托)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiConsignDeptID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                field="ConsignDeptID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">缓急程度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlImportantLevel" runat="server" TableName="EPMS_PublishConsign"
                Field="ImportantLevel" activestatus="(23.出版委托)(23.安排出版)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">委托出版日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConsignTime" runat="server" TableName="EPMS_PublishConsign"
                Field="ConsignTime" activestatus="(23.出版委托)(23.安排出版)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">要求出版日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRequireCompleteTime" runat="server" TableName="EPMS_PublishConsign"
                Field="RequireCompleteTime" activestatus="(23.出版委托)(23.安排出版)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr style="display: none;">
        <td class="td-l">正价</td>
        <td class="td-r" colspan="5">
            <zhongsoft:XHtmlInputText ID="tbTotalPrice" runat="server" TableName="EPMS_PublishConsign" class="kpms-textbox"
                Field="TotalPrice" activestatus="(3.统计工作量)" readonly="readonly" style="text-align: right; width: 100px">
            </zhongsoft:XHtmlInputText>
            元 
            <input type="hidden" id="hiCheapTotalPrice" runat="server" tablename="EPMS_PublishConsign" field="CheapTotalPrice" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出版要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.出版委托)(23.安排出版)" field="Memo" tablename="EPMS_PublishConsign"
                TextMode="MultiLine" maxtext="512" Rows="4">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td class="flexible" onclick="openDetail('productjDetail')">
            <span>产品列表</span>&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="productjDetail">
    <tr>
        <td class="flexible" colspan="6">
            <span style="float: right">
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false" ToolTip="上传附件"
                    DisplayStatus="(23.出版委托)(23.安排出版)" OnClick="lbtnUpload_Click"><img src="../../Themes/Images/btn_upload.gif"/>
                        <span>上传附件</span></zhongsoft:LightFileUploader>
                <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="批量下载" OnClientClick="return batchDownloadFile();">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
                            height="16" />批量下载</span>
                </asp:LinkButton>
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvFile" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="FileID" OnRowCommand="gvFile_RowCommand" AllowPaging="true" PageSize="50"
                BindGridViewMethod="BindFile">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="文件名称">
                        <ItemTemplate>
                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>" target="_blank" title="下载" style="color: blue">
                                <%# Eval("FileName") %> 
                            </a>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
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
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<uc4:WorkloadDetail ID="WorkloadDetail" runat="server" Visible="false" />
<%--出版状态 --%>
<input type="hidden" runat="server" id="hiPublishState" field="PublishState" tablename="EPMS_PublishConsign" />
<%--计费状态--%>
<input type="hidden" runat="server" id="hiChargeState" field="ChargeState" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiPublishConsignID" tablename="EPMS_PublishConsign" field="PublishConsignID" />
<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName" tablename="EPMS_PublishConsign" />
<%--缓急程度默认值--%>
<input type="hidden" runat="server" id="hiImportantLevel" value="平件" />
<%--出版类别默认是产品出版--%>
<input type="hidden" id="hiConsignCategoryID" name="hiConsignCategoryName" runat="server"
    field="ConsignCategoryID" tablename="EPMS_PublishConsign" />
<input type="hidden" id="hiConsignCategoryName" name="hiConsignCategoryName" runat="server"
    field="ConsignCategoryName" tablename="EPMS_PublishConsign" />
<%--是否分摊比例，默认不分摊--%>
<input type="hidden" runat="server" id="hiIsSplit" value="1" field="IsSplit" tablename="EPMS_PublishConsign" />
<script type="text/javascript">
    ///批量下载文件
    function batchDownloadFile() {
        var fileSourceID = '<%=BusinessObjectId %>';
        var urlStr = "<%=WebAppPath%>/Sys/FileDocument/BatchFileDownload.aspx?fileSourceId=" + fileSourceID + "&fileType=3";
        showDivDialog(urlStr, null, 750, 550, null);
        return false;
    }

</script>
