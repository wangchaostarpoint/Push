<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishConsignAddForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishConsignAddForm" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<%@ Register Src="~/EPMS/UI/Publish/PublishCostDetail.ascx" TagName="PublishCostDetail" TagPrefix="uc1" %>

<table class="tz-table">
    <tr>
        <td class="td-l">项目代号<span id="red" class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectCode" IsMutiple="false"
                Writeable="false" field="ProjectCode" tablename="EPMS_PublishConsign" SelectPageMode="Dialog"
                ResultForControls="{'hiOrganizationId':'id','txtProjectName':'name'}" EnableTheming="false"
                Text="选择项目" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="ProjectCode" activestatus="(23.填写图纸加晒单)"
                req="1" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.填写图纸加晒单)"
                req="1" class="kpms-textbox" readonly="readonly" field="ProjectName" tablename="EPMS_PublishConsign" />
        </td>
    </tr>
    <tr>
        <td class="td-l">需印制部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtConsignDeptName" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiConsignDeptID':'id'}" EnableTheming="false"
                PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" req="1"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写图纸加晒单)"
                TableName="EPMS_PublishConsign" field="ConsignDeptName" />
            <input type="hidden" runat="server" id="hiConsignDeptID" tablename="EPMS_PublishConsign"
                field="ConsignDeptID" />
        </td>
        <td class="td-l">印制资料<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbPublishMaterial" field="PublishMaterial" req="1"
                tablename="EPMS_PublishConsign" activestatus="(23.填写图纸加晒单)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">计划送印日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanSendTime" runat="server" activestatus="(23.填写图纸加晒单)"
                class="kpms-textbox-date" readonly="readonly" field="PlanSendTime" tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">实际送印日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFactSendTime" runat="server" activestatus="(23.填写图纸加晒单)"
                class="kpms-textbox-date" readonly="readonly" field="FactSendTime" tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">要求完成日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRequireCompleteTime" runat="server" activestatus="(23.填写图纸加晒单)"
                class="kpms-textbox-date" readonly="readonly" field="RequireCompleteTime" tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">委托人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtConsignUserName" readonly="readonly"
                class="kpms-textbox" activestatus="(23.填写图纸加晒单)" field="ConsignUserName"
                tablename="EPMS_PublishConsign">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiConsignUserID" runat="server" field="ConsignUserID"
                tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-m" colspan="4"></td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="Memo" tablename="EPMS_PublishConsign" activestatus="(23.填写图纸加晒单)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>加晒信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span1" runat="server" displaystatus="(23.填写图纸加晒单)">
                <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="选择加晒任务"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="选择加晒任务" width="16"
                            height="16" />选择加晒任务</span>
                </asp:LinkButton></span>
            <span style="float: right;">
                <asp:LinkButton runat="server" ID="lbtnZIPDownLoadDWG" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载DWG" OnClientClick="return zipDownloadFile('signDwg');">
                    <span>
                        <img runat="server" id="img9" src="~/Themes/Images/ico_fujian.gif" alt="打包下载DWG" width="16"
                            height="16" />打包下载DWG</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnZIPDownLoadPDF" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="打包下载PDF" OnClientClick="return zipDownloadFile('signPdf');">
                    <span>
                        <img runat="server" id="img10" src="~/Themes/Images/ico_fujian.gif" alt="打包下载PDF" width="16"
                            height="16" />打包下载PDF</span>
                </asp:LinkButton>
            </span>
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
                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="任务编号" Width="150px" ItemStyle-Width="150px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" HeaderStyle-Width="150px">
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
</table>

<input runat="server" type="hidden" id="hiPublishConsignID" tablename="EPMS_PublishConsign"
    field="PublishConsignID" />
<input type="hidden" runat="server" id="hiWBSXML" />
<asp:Button runat="server" ID="btnSelWBS" OnClick="btnSelWBS_Click" Style="display: none" />
<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName" tablename="EPMS_PublishConsign" />
<!--出版任务筛选条件-->
<input type="hidden" runat="server" id="hiPublishState" />
<!--成品文件数量-->
<input type="hidden" runat="server" id="hiProductCount" />
<script type="text/javascript">
    function initCustomerPlugin() {
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "填写图纸加晒单") {
                if ($('#<%=gvWBS.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                    return confirm("您确定不选择加晒卷册吗？")
                }
            }
        }
        return true;
    }

    $('#<%=lbtnSelWBS.ClientID %>').live('click', function () {
        selWBS();
    });

    //选择加晒卷册
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

    ///打包下载文件
    function zipDownloadFile(docType) {
        var productCount = parseInt($("#<%=hiProductCount.ClientID %>").val());
        if (productCount <= 0) {
            alert("暂无可下载的文件。");
            return;
        }
        var publishID ='<%=BusinessObjectId %>';
        var urlStr = "<%= WebAppPath %>/Sys/FileDocument/ZipFileDownLoad.aspx?publishID=" + publishID + "&docType=" + docType + "&fileTitle=" + $("#<%=txtProjectCode.ClientID %>").val() + "-" + "成品";
        window.open(urlStr);
    }

</script>

