<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProductArchiveForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_ProductArchiveForm" %>
<%@ Register Src="../../UI/Publish/PublishTaskDetail.ascx" TagName="UCPublishTaskDetail" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td colspan="4" style="text-align: right;">
            <asp:Button Text="打印归档证" ID="Button1" runat="server" OnClientClick="showPrintPage()" />
            <asp:Button runat="server" ID="btnTest" Text="Init" OnClick="btnTest_Click" Visible="false" />
            <asp:Button runat="server" ID="btnTestArchiveCode" Text="ArchiveCode" OnClick="btnTestArchiveCode_Click" Visible="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">序号
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSendCode" type="text" class="kpms-textbox"
                readonly="readonly" activestatus="(23.发起申请)" field="SendCode" tablename="MM_Publish_ApplyForm">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" field="ProjectName"
                tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.经办人修改)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false" SelectPageMode="Dialog" PageWidth="850"
                Writeable="false" ShowAttrs="name" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','hiOrganizationID1':'id','hiProjectCode':'ProjectCode','hiProjectName':'name'}"
                req="1" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiOrganizationID" type="hidden" field="ProjectId" runat="server" tablename="MM_Publish_ApplyForm" />
            <input id="hiOrganizationID1" type="hidden" field="OrganizationID" runat="server" tablename="EPMS_PublishConsign" />
            <input id="hiProjectCode" type="hidden" field="ProjectCode" runat="server" tablename="EPMS_PublishConsign" />
            <input id="hiProjectName" type="hidden" field="ProjectName" runat="server" tablename="EPMS_PublishConsign" />
        </td>

    </tr>
    <tr>
        <td class="td-l">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" field="ProjectCode"
                class="kpms-textbox" readonly="readonly" tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.经办人修改)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">设计阶段
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" class="kpms-textbox"
                activestatus="(23.发起申请)(23.经办人修改)" readonly="readonly" tablename="MM_Publish_ApplyForm" field="Phase">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l" runat="server" visible="false">合同编号
        </td>
        <td class="td-r" runat="server" visible="false">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractCode" field="ContractCode" Width="30%"
                tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.经办人修改)" SelectPageMode="Dialog"
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
                activestatus="(23.发起申请)(23.经办人修改)" PageWidth="800px" SelectPageMode="Dialog"
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
                tablename="MM_Publish_ApplyForm" activestatus="(23.发起申请)(23.经办人修改)" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Filter="{OrganizationLevel:'2'}" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyDeptID" field="applyDepttId" tablename="MM_Publish_ApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人电话
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplyUserPhone" runat="server" tablename="MM_Publish_ApplyForm" field="ApplyUserPhone"
                activestatus="(23.发起申请)(23.经办人修改)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">申请时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtapplyDate" type="text" class="kpms-textbox-date"
                readonly="readonly" activestatus="(23.发起申请)(23.经办人修改)" field="applyDate" tablename="MM_Publish_ApplyForm">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">说明
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="MM_Publish_ApplyForm" field="Memo"
                activestatus="(23.发起申请)(23.经办人修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4" height="25" style="font-weight: bold; text-align: center">资料（任务）信息
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <uc1:UCPublishTaskDetail ID="UCApplyFormDetail1" runat="server" OnFormDataBind="UCApplyFormDetail1_FormDataBind"
                ApplyType="设计档案移交" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="2">
            <span>产品文件信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
        <td class="flexible" colspan="2"><span style="float: right">按任务筛选
            <asp:DropDownList runat="server" ID="ddlWbs" EnableTheming="false" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlWbs_SelectedIndexChanged"></asp:DropDownList>
        </span></td>
    </tr>
    <tr>
        <td colspan="4">
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
        <td colspan="4">
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
</table>
<table class="tz-table" flag="archive">
    <tr>
        <td class="flexible" colspan="6">
            <span>归档移交信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td class="td-l">移交人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTransferUserName" runat="server" TableName="DAMS_PRODUCTTRANSFORM"
                Field="TransferUserName" ActiveStatus="(23.发起申请)" ReadOnly="true" />
            <input type="hidden" id="hiTransferUserID" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="TransferUserID" />
            <input type="hidden" id="hiTransferUserCode" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="TransferUserCode" />
        </td>
        <td class="td-l">移交部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTransferDeptName" runat="server" TableName="DAMS_PRODUCTTRANSFORM"
                Field="TransferDeptName" ActiveStatus="(23.发起申请)" ReadOnly="true" />
            <input type="hidden" id="hiTransferDeptID" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="TransferDeptID" />
        </td>
        <td class="td-l">移交时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbTransferDate" activestatus="(23.发起申请)"
                req="1" class="kpms-textbox-date" readonly="readonly" field="TransferDate" tablename="DAMS_PRODUCTTRANSFORM" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
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
                    <zhongsoft:LightTemplateField HeaderText="是否<br/>压力管道" Visible="false">
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
                                             <img onclick='return viewRollDetail("<%#Eval("WBSINFOID") %>")' alt="查看" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" title="查看成品文件"/>
                                        </asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" EnableTheming="false" Visible="false"
                                            CommandArgument='<%#Eval("DetailID") %>'>
						             <img alt="删除" onclick="if(!confirm('如果该项目下有归档的任务，一起删除。确认要删除吗？')) return false;" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif"  />
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
<input type="hidden" runat="server" id="hiApplyType" field="ApplyType" tablename="MM_Publish_ApplyForm" />

<%--成品档案移交流程ID--%>
<input type="hidden" id="hiTransFormID" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="TransFormID" />

<%--是否外来任务标识：否--%>
<input type="hidden" id="hiIsOutRoll" runat="server" tablename="DAMS_PRODUCTTRANSFORM" field="IsOutRoll" value="0" />

<script>

    function initCustomerPlugin() {
        if (typeof (ucDetail_Init) == "function") {
            ucDetail_Init();
        }

        initFormInfo();
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

    // 展示表单信息
    function initFormInfo() {
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
            alert('归档证必须在流程结束后才可以打印。');
            return false;
        }
        else {
            var id = $("#<%=hiApplyFormId.ClientID %>").val();
            var url = buildQueryUrl("EPMS/List/Publish/Print/ArchivePrint.aspx", { "ApplyFormId": id });
            window.open(url);
        }
    }

</script>
