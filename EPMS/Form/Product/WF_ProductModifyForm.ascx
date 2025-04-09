<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProductModifyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Product.WF_ProductModifyForm" %>
<%@ Register Src="../../UI/Product/RollSignInfo.ascx" TagName="RollSignInfo" TagPrefix="uc7" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" width="100%">
    <tr runat="server" displaystatus="(23.提交修改申请)" style="display: none">
        <td colspan="8" class="td-m">
            <font color="red">
                <asp:Label runat="server" displaystatus="(23.提交修改申请)" ID="lbShowPass" Text="如果所选卷册或关联卷册有出版流程，请传阅出版公司 打字员 绘图员 调度员！"></asp:Label>
                <br />
                <br />
                <asp:Label runat="server" displaystatus="(23.提交修改申请)" ID="lbZHRoll" Text="如果修改综合卷的关联卷册，请在综合卷成品管理中进行操作。"></asp:Label></font>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" OnClick="txtProjectName_OnClick"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)" req="1" ShowSelectBtn="true"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProductModify"
                field="OrganizationID" />
        </td>
        <td class="td-l">项目编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)"
                readonly="readonly" class="kpms-textbox" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','txtWBSOwnerName':'WBSOwnerName','hiWBSOwnerId':'WBSOwnerID','txtBelongSpecialtyName':'BelongSpecialtyName','hiSpecialId':'ExecSpecialtyID','hiBelongSpecialtyCode':'ExecSpecialtyCode','txtBelongDeptName':'ExecSpecialtyName','hiBelongDeptID':'BelongDeptID','ddlWBSType':'ParamWBSTypeID','hiWBSType':'WBSType','hiWBSFlag':'WBSFlag','txtWBSType':'WBSType'}"
                activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)" BeforeSelect="beforeSelectWbs()"
                FilterFunction="wbsFilter()" AfterSelect="afterWBSSelect()" req="1" ShowSelectBtn="true"></zhongsoft:LightObjectSelector>
            <asp:LinkButton runat="server" ID="btnAfterSelectWBS" OnClick="btnAfterSelectWBS_Click"
                Visible="false"></asp:LinkButton>
            <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_ProductModify" field="WBSID" />
        </td>
        <td class="td-l">编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)"
                readonly="readonly" class="kpms-textbox" req="1" />
        </td>
        <td class="td-l">任务类型
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSType" activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)"
                readonly="readonly" class="kpms-textbox" />
        </td>
    </tr>
    <tr style="display: none;">
        <td class="td-l">修改类型<span class="req-star">*</span>
        </td>
        <td class="td-r" nowrap>
            <asp:RadioButtonList runat="server" ID="rbtnModifyNature" RepeatDirection="Horizontal"
                TableName="EPMS_ProductVerifyForm" Field="ModifyNature" activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)(23.审核)(23.审批)(23.批准)"
                req="1">
                <asp:ListItem Value="简单修改" Selected="True">简单修改</asp:ListItem>
                <asp:ListItem Value="设计修改">设计修改</asp:ListItem>
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiModifyNature" field="ModifyNature" tablename="EPMS_ProductVerifyForm" />
        </td>
        <td colspan="6" class="td-m">
            <font color="red">
                <asp:Label runat="server" Text="简单修改：【反馈提出人结果】或【设总修改】步骤在AutoCAD中签出修改成品；"></asp:Label>
                <br />
                <br />
                <asp:Label runat="server" Text="设计修改：【反馈提出人结果】或【设总修改】步骤发送至结束，将重新发起该卷册的校审流程"></asp:Label></font>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-m" colspan="8">
            <span class="req-star">《成品设计修改》流程只能修改因图框、图签等图纸图面问题；
                <br />
                若成品数量或设计方案有变化，请删除当前卷册的《成品设计修改》流程，然后发起《项目删除审批流程》删除当前的《成品四级校审》流程，重新发起新《成品四级校审》流程。
            </span>
        </td>
    </tr>
</table>
<uc7:RollSignInfo ID="rollSignInfo" runat="server" Visible="false" />
<table>
    <tr>
        <td class="td-l">修改原因<span class="req-star">*</span>
        </td>
        <td colspan="7" class="td-m">
            <zhongsoft:LightTextBox ID="tbModifyReason" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)" field="ModifyReason"
                tablename="EPMS_ProductModify" TextMode="MultiLine" maxtext="128" Rows="4" Width="98%"
                req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr style="display: none" runat="server" displaystatus="(23.反馈提出人结果)(23.提交修改申请)">
        <td class="td-m" colspan="8" style="width: 100%;" align="center">
            <asp:Label ID="lbWarning1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label><br />
            <asp:Label ID="lbWarning2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="flexible" id="tdTitle">修改成品列表
        </td>
        <td id="tdReworkDo" style="white-space: nowrap;">
            <a href="javascript:StartCAD();" id='cadStart' style="text-decoration: underline; color: Blue; display: none;">启动协同校审系统</a> <a href="javascript:InstallCAD();" id='cadInstall'
                style="text-decoration: underline; color: Blue; display: none;">安装协同校审系统</a>
        </td>
        <td style="white-space: nowrap; float: right" id="tdBatchDownLoad">
            <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                ToolTip="下载成品" OnClientClick="return batchDownloadProduct();">
                <span>
                    <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="下载成品" width="16"
                        height="16" />批量下载</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="8">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvProductList" AllowPaging="false"
                AutoGenerateColumns="false" AllowSorting="true" DataKeyNames="ProductID" UseDefaultDataSource="true"
                BindGridViewMethod="BindGrid" OnRowDataBound="gvProductList_RowDataBound" EmptyDataText="没有成品信息">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号" SortExpression="ProductCode" />
                    <zhongsoft:LightTemplateField HeaderText="成品名称" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <a runat="server" id="aProductName" class="aStyle">
                                    <%#Eval("ProductName")%></a>
                                <asp:Label runat="server" ID="lbProductName" Text='<%#Eval("ProductName")%>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="FileFormat" HeaderText="格式" SortExpression="FileFormat" />
                    <zhongsoft:LightBoundField DataField="ProductType" HeaderText="成品类别" SortExpression="ProductType" />
                    <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传日期" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.?)"
                readonly="readonly" class="kpms-textbox" />
        </td>
        <td class="td-l">专业总工
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtReCheckUser" activestatus="(23.?)"
                readonly="readonly" class="kpms-textbox" />
        </td>
        <td class="td-l">申请人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWriteUserName" activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductModify" Field="WriteUserName" />
            <input type="hidden" runat="server" id="hiWriteUserID" tablename="EPMS_ProductModify"
                field="WriteUserID" />
        </td>
        <td class="td-l">申请日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWriteTime" activestatus="(23.提交修改申请)(23.修改成品)(23.填写成品设计修改申请)"
                readonly="readonly" class="kpms-textbox-date" TableName="EPMS_ProductModify"
                Field="WriteTime" />
        </td>
    </tr>
</table>
<!--用于检查协同校审工具是否安装-->
<object id="CADActive" style="display: none" classid="clsid:F4B25887-127F-46A9-BF75-30332B826B51">
</object>
<input type="hidden" runat="server" id="hiRecheckUserID" tablename="EPMS_ProductModify"
    field="RecheckUserID" />
<input type="hidden" runat="server" id="hiSpecialId" />
<input type="hidden" runat="server" id="hiRecheckUserName" tablename="EPMS_ProductModify"
    field="RecheckUserName" />
<input type="hidden" runat="server" id="hiConfirmUserID" tablename="EPMS_ProductModify"
    field="ConfirmUserID" />
<input type="hidden" runat="server" id="hiConfirmUserName" tablename="EPMS_ProductModify"
    field="ConfirmUserName" />
<!--主键-->
<input type="hidden" id="hiFormID" runat="server" tablename="EPMS_ProductModify"
    field="ProductModifyID" />
<input type="hidden" runat="server" id="hiPublishDeptCode" value="01017051" />
<input type="hidden" runat="server" id="hiPublishRoleName" value="打字员,绘图员,调度员" />
<script type="text/javascript">
    $gridCheckedClientID = "<%=gvProductList.CheckedClientID %>";
    function initCustomerPlugin() {
        //检查是否安装了协同校审
        var object = document.all.CADActive.object;
        if (object == null || object == undefined) {
            $("#cadInstall").show();
        }
        else {
            $("#cadStart").show();
        }
        if (($actName != "反馈提出人结果" && $actName != "设总修改" || $("#<%=hiModifyNature.ClientID %>").val() == "设计修改")) {
            if ($actName == "审核" || $actName == "确认") {
                $("#tdTitle").attr("colspan", "7");
            } else {
                $("#tdTitle").attr("colspan", "8");
            }
            $("#tdReworkDo").hide();
        }
        if ($actName == "审核" || $actName == "反馈提出人结果" || $actName == "确认") {
            $("#tdBatchDownLoad").show();
        } else {
            $("#tdBatchDownLoad").hide();
        }
    }

    function checkForm() {
        if ($formAction == 0) {//原有属性: $readyFormSend
            if ($actName == "提交修改申请") {
                if (checkHasSelModifyProduct() < 1) {
                    alert("请至少选择一个需要修改的成品！");
                    return false;
                }
            }
            if ($actName == "确认") {
                var signState = GetSignState();
                if (signState.indexOf("正在批签") > -1 || signState.indexOf("处理中") > -1) {
                    alert("该卷册成品正在批签，请等待批签成功后再次发送！");
                    return false;
                }
            }
            var checkType = "ProductModifyLock";
            if ($actName == "签署确认" || $actName == "自动批签及PLT确认") { checkType = "CheckSignSuccess"; }
            result = syncCheckDateIsRight(checkType);
            if (result != "" && result != null && result != undefined) {
                if ($actName == "提交修改申请") {
                    alert("在" + result + "的CAD中还有图纸未签入，为了避免图纸版本冲突，请提醒" + result + "将所有图纸都签入后再发送！");
                    return false;
                }
                else if ($actName == "签署确认" || $actName == "自动批签及PLT确认") {
                    //在自动批签及PLT确认步骤，再进行
                    if (result == "批签失败") {
                        alert("该卷册" + result + ",请查找原因流程回退到相关人员重新修改图纸");
                        return false;
                    }
                    else {
                        alert("该卷册" + result + ",建议您等待系统批签完成确认无误后再发送！");
                        return false;
                    }
                }
            }
        }
        return true;
    }

    //启动协同校审
    function StartCAD() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == "") {
            alert("-请先选择项目");
        }
        else {
            var url = "/Portal/EPMS/List/Product/ProductCADStart.aspx?OrganizationId=" + orgId;
            window.open(url);
        }
    }

    //安装在线助手
    function InstallCAD() {
        var strPath = "/Portal/Sys/Download/setup.exe";
        window.open(strPath);
    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择任务！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var ownerId = '<%=KPMSUser.Id %>';
        var formType = '<%=Zhongsoft.Portal.EPMS.Obsolete.WBSFormTypeSelect.成品设计修改.ToString() %>';
        return { OrganizationID: orgId, WBSType: '<%=(int)WBSMode.任务管理 %>', WBSFormTypeSelect: formType, OwnerId: ownerId };
    }

    function afterWBSSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAfterSelectWBS, "")%>;
    }

    //判断是否已勾选要修改的成品信息
    function checkHasSelModifyProduct() {
        var checkedValue = $("#" + $gridCheckedClientID).val().length;
        var updateNum = 0;
        if (checkedValue > 1) {
            checkedValue = $("#" + $gridCheckedClientID).val().substring(1, checkedValue - 1);
            if (checkedValue != "")
                updateNum = checkedValue.split(",").length;
        }
        return updateNum;
    }

    function syncCheckDateIsRight(checkType) {
        var result = "";
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
            data: { 'checkType': checkType, 'WBSID': $("#<%=hiWBSID.ClientID %>").val() },
            async: false,
            cache: false,
            success: function (res) {
                result = res;
            },
            error: function (err) {
                //alert(err);
            }
        });
        return result;
    }

    //单个下载成品
    function downloadProductFile(productId) {
        //校审也下载带签字成品
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=sign&fileId=" + productId;
        window.open(urlStr);
        //showDivDialog(urlStr, null, 750, 550);
        return false;
    }
    ///批量下载成品（注意不要多个方法重名，导致调用方法异常）
    function batchDownloadProduct() {
        var workFlowID = '<%=BusinessObjectId %>';
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?ProductModify=1&BizId=" + workFlowID;
        showDivDialog(urlStr, null, 750, 550, "");
        return false;
    }
</script>
