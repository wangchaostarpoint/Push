<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PurchaseConCheckForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_PurchaseConCheckForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<table class="tz-table">
    <tr>
        <td class="td-l">采购合同类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblContractTypeName" field="ContractTypeName" tablename="MM_PurchaseConCheck"
                req="1" RepeatDirection="Horizontal" activestatus="(23.提交合同)(3.返回修改)" AutoPostBack="true"
                OnSelectedIndexChanged="rblContractTypeName_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">费用性质<%--<span class="req-star">*</span>--%>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlCostType" TableName="MM_PurchaseConCheck"
                Field="CostType" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbContractName" runat="server" MaxLength="256" req="1"
                field="ContractName" tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)(3.返回修改)" CssClass="kpms-textbox"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l" style="display: none">合同编号
        </td>
        <td class="td-r" style="display: none">
            <zhongsoft:LightTextBox ID="tbContractCode" runat="server" MaxLength="64"
                field="ContractCode" tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)(3.返回修改)" CssClass="kpms-textbox"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">工程名称<span class="req-star" reqflag="externalReq">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtMarketProjectName" field="MarketProjectName"
                tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)(3.返回修改)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true"
                ResultForControls="{'hiMarketProjectID':'id','txtMarketProjectCode':'MarketProjectCode'}"
                PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx" Filter="{IsFormalProject:'1'}"
                EnableTheming="false" PageWidth="850" Writeable="false"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiMarketProjectID" field="MarketProjectID" tablename="MM_PurchaseConCheck" />
        </td>
        <td class="td-l">工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMarketProjectCode" readonly="readonly"
                class="kpms-textbox" activestatus="(23.提交合同)(3.返回修改)" field="MarketProjectCode"
                tablename="MM_PurchaseConCheck">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">合同金额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContractValue" EnableTheming="false" req="1"
                CssClass="kpms-textbox-money" DataType="Decimal6" activestatus="(23.提交合同)(3.返回修改)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiContractValue" field="ContractValue"
                tablename="MM_PurchaseConCheck" />
        </td>
        <td class="td-l">合同份数<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContractNum" EnableTheming="false" req="1" field="ContractNum"
                tablename="MM_PurchaseConCheck" CssClass="kpms-textbox-money" DataType="PositiveInteger" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">质保金（万元）
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbWarrantyGold" EnableTheming="false"
                CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.提交合同)(3.返回修改)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiWarrantyGold" field="WarrantyGold"
                tablename="MM_PurchaseConCheck" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" activestatus="(23.提交合同)(3.返回修改)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyUserID':'id'}" field="ApplyUserName" tablename="MM_PurchaseConCheck"
                PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyUserID" runat="server" field="ApplyUserID"
                tablename="MM_PurchaseConCheck" />
        </td>
        <td class="td-l">签约人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractorName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" activestatus="(23.提交合同)(3.返回修改)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                ResultForControls="{'hiContractorID':'id'}" field="ContractorName" tablename="MM_PurchaseConCheck"
                PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiContractorID" runat="server" field="ContractorID"
                tablename="MM_PurchaseConCheck" />
            <input type="hidden" id="hiContractorDept" runat="server" field="ContractorDept"
                tablename="MM_PurchaseConCheck" />
        </td>
        <td class="td-l">签约日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtSignDate" runat="server" activestatus="(23.提交合同)(3.返回修改)"
                class="kpms-textbox-date" readonly="readonly" field="SignDate" tablename="MM_PurchaseConCheck">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">合同单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtEntrustUnitName" field="EntrustUnitName"
                tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)(3.返回修改)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true"
                ResultForControls="{'hiEntrustUnitID':'id','tbContactUserName':'ContactPerson','tbContactPhone':'CompanyPhone'}"
                PageUrl="~/MM/Obsolete/SupplierSelector.aspx" req="1"
                EnableTheming="false" PageWidth="850" Writeable="false"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiEntrustUnitID" field="EntrustUnitID" tablename="MM_PurchaseConCheck" />
        </td>
    </tr>
    <tr>
        <td class="td-l">联系人<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbContactUserName" runat="server" MaxLength="32" req="1"
                field="ContactUserName" tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)(3.返回修改)" CssClass="kpms-textbox"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">联系人电话<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbContactPhone" runat="server" MaxLength="32" req="1"
                field="ContactPhone" tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)(3.返回修改)" CssClass="kpms-textbox"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server" visible="false">
        <td class="td-l">建设地点
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbBuildPlace" runat="server" MaxLength="256"
                field="BuildPlace" tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)(3.返回修改)" CssClass="kpms-textbox"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server" visible="false">
        <td class="td-l">计划结束日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanEndDate" runat="server" activestatus="(23.提交合同)(3.返回修改)"
                class="kpms-textbox-date" readonly="readonly" field="PlanEndDate" tablename="MM_PurchaseConCheck">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">实施日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtImplementDate" runat="server" activestatus="(23.提交合同)(3.返回修改)"
                class="kpms-textbox-date" readonly="readonly" field="ImplementDate" tablename="MM_PurchaseConCheck">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">完成日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFinishDate" runat="server" activestatus="(23.提交合同)(3.返回修改)"
                class="kpms-textbox-date" readonly="readonly" field="FinishDate" tablename="MM_PurchaseConCheck">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" field="Memo" tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)(3.返回修改)" CssClass="kpms-textarea"
                EnableTheming="False" MaxLength="1024" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>关联收费合同</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span3" runat="server" displaystatus="(3.提交合同)">
                <asp:LinkButton runat="server" ID="lbtnSelContract" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="选择合同" width="16"
                            height="16" />选择合同</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvContract" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="ReleChargeContractTempID" OnRowCommand="gvContract_RowCommand">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ContractCode" HeaderText="合同编号" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractName" HeaderText="合同名称" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContractValue" HeaderText="合同金额（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="HadCharge" HeaderText="已收费（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CharePercent" HeaderText="已收费比例" DataFormatString="{0:P2}" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("ReleChargeContractTempID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">相关附件
        </td>
        <td class="td-m" colspan="5">
            <asp:LinkButton runat="server" ID="lbtnUp" displaystatus="(3.提交合同)(3.返回修改)" EnableTheming="False" OnClientClick="return uploadFileStamp('Form','General');">
                <img src="../../Themes/Images/btn_upload.gif">
                <span>上传附件</span>
            </asp:LinkButton>
            <span class="req-star" style="float: right;"
                id="Span2" runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
            <uc3:UpLoadFile ID="uploadFile" runat="server" />
        </td>
    </tr>
</table>
<input runat="server" type="hidden" id="hiPurchaseConCheckID" tablename="MM_PurchaseConCheck"
    field="PurchaseConCheckID" />
<input runat="server" type="hidden" id="hiContractID" tablename="MM_ContractCheck"
    field="ContractID" />
<input runat="server" type="hidden" id="hiBackStep" tablename="MM_PurchaseConCheck"
    field="BackStep" />
<input type="hidden" runat="server" id="hiReleContract" />
<input type="hidden" runat="server" id="hiCreateDeptLevel" tablename="MM_ContractCheck"
    field="CreateDeptLevel" />
<input runat="server" type="hidden" id="hiUndertakeDeptID" tablename="MM_ContractEntity"
    field="UndertakeDeptID" />
<input runat="server" type="hidden" id="hiUndertakeDeptName" tablename="MM_ContractEntity"
    field="UndertakeDeptName" />
<asp:Button runat="server" ID="btnBindReleContract" OnClick="btnBindReleContract_Click" Style="display: none" />
<asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />
<div id="hide" style="display: none">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">是否需协办部门
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbIsNeedCoDept" activestatus="(23.提交合同)"
                    runat="server" field="IsNeedCoDept" tablename="MM_PurchaseConCheck"></asp:CheckBox>
                <input type="hidden" runat="server" id="hiIsNeedCoDept" tablename="MM_PurchaseConCheck" field="IsNeedCoDept" />
            </td>
            <td class="td-l" flag="coDept">协办部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" flag="coDept">
                <zhongsoft:LightObjectSelector runat="server" ID="txtCoDeptNames" IsMutiple="true"
                    ResultForControls="{'hiCoDeptIDs':'id'}" EnableTheming="false"
                    PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" SelectPageMode="Dialog" Filter="{showTree:'1'}"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.提交合同)"
                    TableName="MM_PurchaseConCheck" field="CoDeptNames" />
                <input type="hidden" runat="server" id="hiCoDeptIDs" tablename="MM_PurchaseConCheck"
                    field="CoDeptIDs" />
            </td>
            <td class="td-m" colspan="4" flag="noCoDept" style="display: none"></td>
        </tr>
        <tr>
            <td class="td-l">是否需副总师批
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbIsNeedMaster" activestatus="(23.提交合同)"
                    runat="server" field="IsNeedMaster" tablename="MM_PurchaseConCheck"></asp:CheckBox>
                <input type="hidden" runat="server" id="hiIsNeedMaster" tablename="MM_PurchaseConCheck" field="IsNeedMaster" />
            </td>
            <td class="td-l" flag="master">副总师<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" flag="master">
                <zhongsoft:LightObjectSelector runat="server" ID="txtMasterName" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(23.提交合同)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiMasterID':'id'}" field="MasterName" tablename="MM_PurchaseConCheck"
                    PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" Filter="{'RoleName':'副总工程师'}"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiMasterID" runat="server" field="MasterID"
                    tablename="MM_PurchaseConCheck" />
            </td>
            <td class="td-m" colspan="4" flag="noMaster" style="display: none"></td>
        </tr>
        <tr>
            <td class="td-l">主管领导<span class="req-star">*</span></td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="tbMianLeaderName" req="1" IsMutiple="false" SelectPageMode="Dialog"
                    ResultForControls="{'hiMianLeaderID':'id'}" EnableTheming="false"
                    Text="选择主管领导" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    Filter="{'OrganizationId':'F9A24FD1-3C1F-4FFE-AB5E-11509D8827EE','IsOnlyFilterDept':'1'}"
                    ResultAttr="name" activestatus="(23.提交合同)" TableName="MM_PurchaseConCheck" Field="MianLeaderName" />
                <input type="hidden" id="hiMianLeaderID" runat="server" tablename="MM_PurchaseConCheck" field="MianLeaderID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否需董事长批
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBox ID="cbIsNeedChief" activestatus="(23.提交合同)"
                    runat="server" field="IsNeedChief" tablename="MM_PurchaseConCheck"></asp:CheckBox>
                <input type="hidden" runat="server" id="hiIsNeedChief" tablename="MM_PurchaseConCheck" field="IsNeedChief" />

            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    function initCustomerPlugin() {
        //将是否需要xx审批，整合到通用意见处
        $('#userSelect').append($('#hide').html());
        $('#hide').empty();

<%--        setMarketReq();
        $('#<%=rblContractTypeName.ClientID %>').live('change', function () {
            setMarketReq();
        });--%>

        setCoDeptInfo(true);
        $('#<%=cbIsNeedCoDept.ClientID %>').live('change', function () {
            setCoDeptInfo(false);
        });

        setMasterInfo(true);
        $('#<%=cbIsNeedMaster.ClientID %>').live('change', function () {
            setMasterInfo(false);
        });

        //是否需董事长批
        setChiefInfo(true);
        $('#<%=cbIsNeedChief.ClientID %>').live('change', function () {
            setChiefInfo(false);
        });
    }

    function setMarketReq() {
        var contractType = $("#<%=rblContractTypeName.ClientID %> input[type='radio']:checked").val();
        if (contractType == "勘测设计外委") {
            $('[reqflag = "externalReq"]').show();
            $('#<%=txtMarketProjectName.ClientID %>').attr("req", "1");
        }
        else {
            $('[reqflag = "externalReq"]').hide();
            $('#<%=txtMarketProjectName.ClientID %>').removeAttr("req");
        }
    }

    $('#<%=lbtnSelContract.ClientID %>').live('click', function () {
        selContract();
    });

    //选择合同
    function selContract() {
        var param = new InputParamObject("m");
        var json = { BaseType: "0" };
        getDivContract('<%=hiReleContract.ClientID %>', param, json, bindContract);
        return false;
    }

    function bindContract() {
        $("#<%=btnBindReleContract.ClientID %>").click();
    }

    //协办部门
    function setCoDeptInfo(isLoad) {
        if (isLoad) {
            var isNeedCoDept = $('#<%=hiIsNeedCoDept.ClientID%>').val();
            if (isNeedCoDept == '1')
                $("#<%=cbIsNeedCoDept.ClientID%>").attr('checked', true);
        }

        if ($("#<%=cbIsNeedCoDept.ClientID%>").is(':checked')) {
            $('[flag = "coDept"]').show();
            $('[flag = "noCoDept"]').hide();
            $("#<%=txtCoDeptNames.ClientID%>").attr("req", "1");
            $('#<%=hiIsNeedCoDept.ClientID%>').val('1');
        }
        else {
            $('[flag = "coDept"]').hide();
            $('[flag = "noCoDept"]').show();
            $("#<%=txtCoDeptNames.ClientID%>").removeAttr("req");
            $('#<%=hiIsNeedCoDept.ClientID%>').val('0');
            //清空选择的协办部门信息
            $('#<%=txtCoDeptNames.ClientID%>').val('');
            $('#<%=txtCoDeptNames.ClientID%>_hivalue').val('');
            $('#<%=hiCoDeptIDs.ClientID%>').val('');
        }
    }

    //主管副总
    function setMasterInfo(isLoad) {
        if (isLoad) {
            var isNeedMaster = $('#<%=hiIsNeedMaster.ClientID%>').val();
            if (isNeedMaster == '1')
                $("#<%=cbIsNeedMaster.ClientID%>").attr('checked', true);
        }

        if ($("#<%=cbIsNeedMaster.ClientID%>").is(':checked')) {
            $('[flag = "master"]').show();
            $('[flag = "noMaster"]').hide();
            $("#<%=txtMasterName.ClientID%>").attr("req", "1");
            $('#<%=hiIsNeedMaster.ClientID%>').val('1');
        }
        else {
            $('[flag = "master"]').hide();
            $('[flag = "noMaster"]').show();
            $("#<%=txtMasterName.ClientID%>").removeAttr("req");
            $('#<%=hiIsNeedMaster.ClientID%>').val('0');

            //清空选择的主管副总信息
            $('#<%=txtMasterName.ClientID%>').val('');
            $('#<%=txtMasterName.ClientID%>_hivalue').val('');
            $('#<%=hiMasterID.ClientID%>').val('');
        }
    }

    //是否需董事长批
    function setChiefInfo(isLoad) {
        if (isLoad) {
            var isNeedChief = $('#<%=hiIsNeedChief.ClientID%>').val();
            if (isNeedChief == '1') {
                $("#<%=cbIsNeedChief.ClientID%>").attr('checked', true);
            }
        }

        if ($("#<%=cbIsNeedChief.ClientID%>").is(':checked')) {
            $('#<%=hiIsNeedChief.ClientID%>').val('1');
        }
        else {
            $('#<%=hiIsNeedChief.ClientID%>').val('0');
        }
    }

    //上传附件
    function uploadFileStamp(flag, fileType) {
        var fileSrcId = '<%=BusinessObjectId%>';
        showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
        return false;
    }

    //新建、编辑申请设备弹出层callback方法
    function uploadFileCallBack() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
    }

</script>
