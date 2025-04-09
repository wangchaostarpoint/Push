<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishConsignDeptForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishConsignDeptForm" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<%@ Register Src="~/EPMS/UI/Publish/PublishCostDetail.ascx" TagName="PublishCostDetail" TagPrefix="uc1" %>

<table class="tz-table">
    <tr>
        <td class="td-l">印制类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cblPublishType" RepeatDirection="Horizontal"
                req="1" tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiPublishType" field="PublishType" tablename="EPMS_PublishConsign" />
        </td>
    </tr>
    <tr>
        <td class="td-l">需印制部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtConsignDeptName" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiConsignDeptID':'id'}" EnableTheming="false"
                PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" req="1"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写印制出版任务单)"
                TableName="EPMS_PublishConsign" field="ConsignDeptName" />
            <input type="hidden" runat="server" id="hiConsignDeptID" tablename="EPMS_PublishConsign"
                field="ConsignDeptID" />
        </td>
        <td class="td-l">印制资料<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbPublishMaterial" field="PublishMaterial" req="1"
                tablename="EPMS_PublishConsign" activestatus="(23.填写印制出版任务单)"></zhongsoft:LightTextBox>
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
                class="kpms-textbox" activestatus="(23.部门主任审批)(23.科室主任审批)" field="ManagerUserName"
                tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiManagerUserID" runat="server" field="ManagerUserID"
                tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">主管部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtOperationDept" readonly="readonly"
                class="kpms-textbox" activestatus="(23.填写印制出版任务单)" field="OperationDept"
                tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiOperationDeptID" runat="server" field="OperationDeptID"
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
    <tr style="display: none">
        <td class="td-m" colspan="6">
            <asp:Button ID="btnCope" runat="server" ToolTip="拒绝出版" OnClientClick="return showCopeInfo('divModifyReason')"
                CssClass="btn" Text="拒绝出版" Style="color: Red; font-weight: bold; float: left" Visible="false" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>出版文件信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            <span style="float: right">
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false" ToolTip="上传附件"
                    DisplayStatus="(23.填写印制出版任务单)" OnClick="lbtnUpload_Click"><img src="../../Themes/Images/btn_upload.gif"/>
                        <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star"
                            id="Span2" runat="server" displaystatus="(2.?)"> 请先保存再上传附件</span>
                <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="批量下载" OnClientClick="return batchDownloadFile();">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
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
    <tr>
        <td colspan="6">
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
    <tr>
        <td class="flexible" colspan="6">
            <span>加晒信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span1" runat="server" displaystatus="(23.填写印制出版任务单)">
                <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="选择加晒卷册"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="选择加晒卷册" width="16"
                            height="16" />选择加晒卷册</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:TreeGridView ID="gvWBS" runat="server" AutoGenerateColumns="false" ShowExport="false"
                AllowPaging="true" PageSize="50" UseDefaultDataSource="true"
                BindGridViewMethod="UserControl.BindWBS" Width="100%" OnRowCommand="gvWBS_RowCommand"
                OnRowDataBound="gvWBS_RowDataBound"
                ShowFooter="false" DataKeyNames="ProductID" ParentIdColumn="WBSID" SelfIdColumn="ProductID">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="25px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# gvWBS.CreateHeader(Container.DataItem)%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="卷册编号" Width="150px" ItemStyle-Width="150px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" HeaderStyle-Width="150px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="加晒图纸" HeaderStyle-Width="300px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="操作" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" Visible="false" ToolTip="删除"
                                CommandArgument='<%# Eval("ProductID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span>
                                    <img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="下载" Visible="false"
                                OnClientClick='<%# String.Format("return batchDownloadProduct(\"{0}\",\"{1}\")", Eval("ProductID"), Eval("DownLoadType")) %>'>
                                <span>
                                    <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="下载" width="16" title="下载"
                                        height="16" />下载</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnSingleDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="下载" Visible="false"
                                OnClientClick='<%# String.Format("return downloadProductFile(\"{0}\",\"{1}\")", Eval("ProductID"), Eval("DownLoadType")) %>'>
                                <span>
                                    <img runat="server" id="img2" src="~/Themes/Images/ico_fujian.gif" alt="下载" width="16" title="下载"
                                        height="16" />下载</span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:TreeGridView>
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
<asp:LinkButton runat="server" ID="lbtCope" OnClick="btnCope_Click" Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiWBSXML" />
<asp:Button runat="server" ID="btnSelWBS" OnClick="btnSelWBS_Click" Style="display: none" />

<input type="hidden" runat="server" id="hiCreateDeptLevel" tablename="EPMS_PublishConsign"
    field="CreateDeptLevel" />
<script type="text/javascript">
    function initCustomerPlugin() {
        computeSum();
        if ($actName == "部门主任审批" || $actName == "科室主任审批") {
            //需要自动发送的步骤，调用以下方法即可
            setAutoSend();
        }
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "填写印制出版任务单") {
                if ($('#<%=gvFile.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据" && $('#<%=gvWBS.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                    return confirm("您确定不上传出版文件或选择加晒卷册吗？")
                }
            }
        }
        return true;
    }

    //弹出拒绝出版原因层
    function showCopeInfo(div) {
        if (confirm("确定发起拒绝出版?")) {
            initCopeEvent(div);
            $("#" + div).dialog({ height: 240 });
            $("#" + div).dialog('open');
            $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        }
        return false;
    }

    function initCopeEvent(div) {
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
                    if (reason == "") {
                        alert("请输入拒绝出版原因");
                    }
                    else {
                        <%=Page.ClientScript.GetPostBackEventReference(this.lbtCope,"")%>;

                        $(this).dialog("close");
                    }
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    ///批量下载文件
    function batchDownloadFile() {
        var fileSourceID = '<%=BusinessObjectId %>';
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?fileSourceId=" + fileSourceID;
        showDivDialog(urlStr, null, 750, 550, null);
        return false;
    }

    //打包下载附件
    function zipDownloadAttach() {
        var fileSourceID = '<%=BusinessObjectId %>';
        var urlStr = "<%= WebAppPath %>/Sys/FileDocument/ZipFileDownLoad.aspx?fileSourceId=" + fileSourceID + "&fileTitle=" + $("#<%=txtConsignDeptName.ClientID %>").val() + "-出版成品-";
        window.open(urlStr);
    }

    $('#<%=lbtnSelWBS.ClientID %>').live('click', function () {
        selWBS();
    });

    //选择加晒卷册
    function selWBS() {
        var param = new InputParamObject("m");
        var json = { WBSState: 4 }
        getWBS('<%=hiWBSXML.ClientID %>', param, json, bindWBS);
        return false;
    }

    function bindWBS() {
        $("#<%=btnSelWBS.ClientID %>").click();
    }

    ///批量下载成品
    function batchDownloadProduct(wbsIds, idType) {
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=product&" + idType + "=" + wbsIds;
        showDivDialog(urlStr, null, 750, 550, null);
        return false;
    }


    ///单个下载成品
    function downloadProductFile(productId, fileType) {
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=" + fileType + "&fileId=" + productId;
        window.open(urlStr);
        return false;
    }

</script>

