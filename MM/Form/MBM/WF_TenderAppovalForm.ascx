<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TenderAppovalForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_TenderAppovalForm" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            评审内容<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblInvisibleAssetCode" runat="server" RepeatDirection="Horizontal"
                req="1" field="INVISIBLEASSETCODE" tablename="MBM_TENDERAPPROVALFORM" activestatus="(23.填写报告)(23.修改报告)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            采购申请编号
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsApplyCode" ActiveStatus="(23.填写报告)(23.修改报告)"
                PageUrl="~/MM/Obsolete/PurchaseApplySelector.aspx" SourceMode="SelectorPage"
                field="APPLYCODE" tablename="MBM_TENDERAPPROVALFORM" ResultAttr="APPLYCODE" ResultForControls="{'hiApplyId':'id','txtProjectName':'PROJECTNAME','txtProjectCode':'PROJECTCODE','hiFid':'FID','hiPid':'PID'}" />
            <input type="hidden" id="hiApplyId" runat="server" field="APPLYID" tablename="MBM_TENDERAPPROVALFORM" />
        </td>
        <td class="td-l">
            采购编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPurchaseCode" Field="PURCHASECODE" class="kpms-textbox"
                tableName="MBM_TENDERAPPROVALFORM" readonly="readonly" activestatus="(23.填写报告)(23.修改报告)"
                runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l" id="type">
            采购方式<span class="req-star">*</span>
        </td>
        <td class="td-m" id="typeList" colspan="3">
            <asp:RadioButtonList ID="rblInvisibleAssetName" runat="server" RepeatDirection="Horizontal"
                field="INVISIBLEASSETNAME" tablename="MBM_TENDERAPPROVALFORM" activestatus="(23.填写报告)(23.修改报告)">
            </asp:RadioButtonList>
            <input type="hidden" id="hiInvisibleAssetName" runat="server" field="INVISIBLEASSETNAME"
                tablename="MBM_TENDERAPPROVALFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtProjectName" Field="PROJECTNAME" class="kpms-textbox"
                tableName="MBM_TENDERAPPROVALFORM" activestatus="(23.填写报告)(23.修改报告)" runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" ActiveStatus="(23.填写报告)(23.修改报告)"
                class="kpms-textbox" field="PROJECTCODE" tablename="MBM_TENDERAPPROVALFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            发起人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPromoterName" Field="PROMOTERNAME" class="kpms-textbox"
                readonly="readonly" tableName="MBM_TENDERAPPROVALFORM" activestatus="(23.填写报告)(23.修改报告)"
                runat="server">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiPromoterId" runat="server" field="PROMOTERID" tablename="MBM_TENDERAPPROVALFORM" />
            <input type="hidden" id="hiPromoterCode" runat="server" field="PROMOTERCODE" tablename="MBM_TENDERAPPROVALFORM" />
        </td>
        <td class="td-l">
            发起部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtLaunchDeptName" Field="LAUNCHDEPTNAME" class="kpms-textbox"
                tableName="MBM_TENDERAPPROVALFORM" readonly="readonly" activestatus="(23.填写报告)(23.修改报告)"
                runat="server">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiLaunchDeptId" runat="server" field="LAUNCHDEPTID" tablename="MBM_TENDERAPPROVALFORM" />
        </td>
        <td class="td-l">
            发起时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtLaunchTime" tablename="MBM_TENDERAPPROVALFORM"
                readonly="readonly" class="kpms-textbox-date" field="LAUNCHTIME" activestatus="(23.填写报告)(23.修改报告)" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" style="text-align: left">
            <asp:Button runat="server" ID="btnView" CssClass="kpms-btn" EnableTheming="false"
                Text="查看申请流程" OnClientClick="return viewApplyForm();"></asp:Button>
            <input type="hidden" id="hiFid" runat="server" field="FID" tablename="MBM_TENDERAPPROVALFORM" />
            <input type="hidden" id="hiPid" runat="server" field="PID" tablename="MBM_TENDERAPPROVALFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            说明<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" Field="MEMO" tableName="MBM_TENDERAPPROVALFORM"
                activestatus="(23.填写报告)(23.修改报告)" runat="server" maxtext="1024" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="3" req="1">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="supply">
        <td class="td-l">
            预中标供应商
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSupplyName" PageUrl="~/MM/Obsolete/SupplierSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" Filter="{SupplierType:'3'}" ActiveStatus="(23.填写报告)(23.修改报告)"
                field="SUPPLYNAME" tablename="MBM_TENDERAPPROVALFORM" ResultForControls="{'hiSupplyId':'id'}" />
            <input type="hidden" id="hiSupplyId" runat="server" field="SUPPLYID" tablename="MBM_TENDERAPPROVALFORM" />
        </td>
    </tr>
    <tr runat="server" nodisplaystatus="(23.填写报告)(23.校核)">
        <td class="td-l">
            参加评审人员
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsReviewPersonName" ActiveStatus="(3.审核)"
                SourceMode="SelectorPage" OnClientClick="return getValue();" OnClick="lbsReviewPersonName_Click" />
            <input type="hidden" id="hiReviewPersonName" runat="server" field="REVIEWPERSONNAME"
                tablename="MBM_TENDERAPPROVALFORM" />
            <input type="hidden" id="hiReviewPersonId" runat="server" field="REVIEWPERSONID"
                tablename="MBM_TENDERAPPROVALFORM" />
            <input type="hidden" id="hiReviewPersonCode" runat="server" field="REVIEWPERSONCODE"
                tablename="MBM_TENDERAPPROVALFORM" />
        </td>
    </tr>
    <tr runat="server" displaystatus="(3.返回采购专责)">
        <td class="td-m" colspan="6" style="text-align: left">
            <asp:Button runat="server" ID="btnPrint" CssClass="kpms-btn" EnableTheming="false"
                Text="打印预中标通知书" OnClientClick="return print();"></asp:Button>
        </td>
    </tr>
    <tr displaystatus="(3.返回采购专责)" runat="server">
        <td class="td-l" colspan="6" style="font-weight: bold; text-align: center">
            附件信息<span id="files" class="req-star" runat="server" displaystatus="(2.*)">先保存再上传附件</span>
        </td>
    </tr>
    <tr id="Tr1" runat="server" displaystatus="(3.返回采购专责)">
        <td class="td-m" colspan="6" style="text-align: right">
            <asp:LinkButton runat="server" ID="lbtnUpByFile" OnClientClick="uploadFileForm();"
                OnClick="lbtnUpByFile_Click" CssClass="kpms-btn" EnableTheming="false">
                    <img alt="点此上传文件" id="imgUpByFile" src="../../Themes/Images/btn_dg_upfile.gif" 
                    style="cursor:hand; border:0;" />
                    <span>上传</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr id="file" runat="server" displaystatus="(3.返回采购专责)">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="FILEID" AutoGenerateColumns="False"
                AllowPaging="True" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名" ItemStyle-Width="100%">
                        <ItemTemplate>
                            <a href="/portal/sys/fileDocument/FileDownload.aspx?fileId=<%#Eval("FILEID") %>"
                                target="_parent" title="点击下载文件" class="kpms-attachmenta" style="text-decoration: underline;
                                color: #0033FF;">
                                <%# Eval("FILENAME")%>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("FILEID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---流程主键ID-->
<input type="hidden" runat="server" id="hiInvisibleAssetId" field="INVISIBLEASSETID"
    tablename="MBM_TENDERAPPROVALFORM" />
<input type="hidden" runat="server" id="hiReviewPersonXml" field="REVIEWPERSONXML"
    tablename="MBM_TENDERAPPROVALFORM" />
<%--角色名称--%>
<input type="hidden" id="hiRoleNameA" runat="server" value="部门负责人" />
<input type="hidden" id="hiRoleNameE" runat="server" value="科室负责人" />
<input type="hidden" id="hiDeptNameC" runat="server" value="总包采购室" />
<input type="hidden" id="hiDeptNameD" runat="server" value="总承包事业部" />
<script>
    //查看选择的采购申请流程
    function viewApplyForm() {
        var fid = $('#<%=hiFid.ClientID %>').val();
        var pid = $('#<%=hiPid.ClientID %>').val();
        if (fid != "" && pid != "") {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + fid + "&prcInstId=" + pid;
            window.open(urlStr);
            return false;
        }
        else {
            alert("请先选择采购申请编号！");
            return false;
        }
    }

    function getValue() {
        var param = new InputParamObject("m");
        var re = getUsersNew('<%=hiReviewPersonXml.ClientID %>', param, "");
        if (re != null) {
            $('#<%=hiReviewPersonId.ClientID %>').val(re.buildAttrJson("o", "id"));
            $('#<%=hiReviewPersonCode.ClientID %>').val(re.buildAttrJson("o", "UserCode"));
            $('#<%=lbsReviewPersonName.ClientID %>').val(re.buildAttrJson("o", "name"));
            $('#<%=hiReviewPersonName.ClientID %>').val(re.buildAttrJson("o", "name"));
            return true;
        }
        return false;
    }

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

        $("#typeList").hide();
        $("#type").hide();
        $("#supply").hide();
        $("#tb").show();

        //根据评审内容，显示相应信息 
        var complete = $("#<%=rblInvisibleAssetCode.ClientID %> input[type='radio']:checked").val();
        setControl(complete, "load");

        //当评审内容发生变化时
        $('#<%=rblInvisibleAssetCode.ClientID %>').click(function () {
            var isComplete = $("#<%=rblInvisibleAssetCode.ClientID %> input[type='radio']:checked").val();
            setControl(isComplete, "change");
        })
    }
    //根据材料是否齐全控件显示不同内容
    function setControl(isComplete, load) {
        if (isComplete == "采购文件") {
            $("#typeList").show();
            $("#type").show();
            $("#supply").hide();
            $("#tb").hide();
            $('#<%=rblInvisibleAssetName.ClientID %>').attr('req', '1');
            $("#<%=hiSupplyId.ClientID %>").val("");
            if (load == "change") {
                $("#<%=txtPurchaseCode.ClientID %>").val("");
            }
        }
        else if (isComplete == "定标报告") {
            $("#typeList").hide();
            $("#type").hide();
            $("#supply").show();
            $("#tb").show();
            $('#<%=rblInvisibleAssetName.ClientID %>').removeAttr('req');
            $("#<%=rblInvisibleAssetName.ClientID %>").val("");
            $("#<%=hiInvisibleAssetName.ClientID %>").val("");
            if (load == "change") {
                $("#<%=txtPurchaseCode.ClientID %>").val("");
            }
        }
    }

    function checkForm() {
        if ($formAction == 0 && $actName == "返回采购专责") {
            var count = $('#<%=gvList.ClientID %>')[0].rows.length;
            if (count <= 2) {
                alert("请上传附件！");
                return false;
            }
        }
        return true;
    }

    //上传附件
    function uploadFileForm() {
        var fileSrcId = $("#<%=hiInvisibleAssetId.ClientID %>").val();
        showUploadForm(fileSrcId, "Module");
        return true;
    }

</script>
