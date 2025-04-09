<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseContractEditorNew.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MBM.PurchaseContractEditorNew"
    Title="合同信息详细" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <table class="tz-table" id="tbTable" runat="server">
        <tr>
            <td class="td-l">采购合同类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblContractTypeName" field="ContractTypeName" tablename="MM_ContractEntity"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)" AutoPostBack="true"
                    OnSelectedIndexChanged="rblContractTypeName_SelectedIndexChanged">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">费用类型<%--<span class="req-star">*</span>--%>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlCostType" TableName="MM_ContractEntity"
                    Field="CostType" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="4">
                <zhongsoft:LightTextBox ID="tbContractName" runat="server" MaxLength="256" req="1"
                    field="ContractName" tablename="MM_ContractEntity" activestatus="(23.*)" CssClass="kpms-textbox"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
            <td class="td-r"><a id="aCheckForm" onclick="viewWF();" style="text-decoration: underline">查看采购合同评审单</a><span id="spNoCheckForm" class="req-star">没有对应的采购合同评审单</span></td>
        </tr>
        <tr style="display: none">
            <td class="td-l">工程名称<span class="req-star" reqflag="externalReq">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtMarketProjectName" field="MarketProjectName"
                    tablename="MM_ContractEntity" activestatus="(23.*)" SourceMode="SelectorPage"
                    SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true"
                    ResultForControls="{'hiMarketProjectID':'id','txtMarketProjectCode':'MarketProjectCode'}"
                    PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx" Filter="{IsFormalProject:'1'}"
                    EnableTheming="false" PageWidth="850" Writeable="false"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiMarketProjectID" field="MarketProjectID" tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">工程编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtMarketProjectCode" readonly="readonly"
                    class="kpms-textbox" activestatus="(23.*)" field="MarketProjectCode"
                    tablename="MM_ContractEntity">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同金额（万元）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbContractValue" EnableTheming="false" req="1"
                    CssClass="kpms-textbox-money" DataType="Decimal6" activestatus="(23.*)"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiContractValue" field="ContractValue"
                    tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">合同份数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbContractNum" EnableTheming="false" req="1" field="ContractNum"
                    tablename="MM_ContractEntity" CssClass="kpms-textbox-money" DataType="PositiveInteger" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">质保金（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWarrantyGold" EnableTheming="false"
                    CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.*)"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiWarrantyGold" field="WarrantyGold"
                    tablename="MM_ContractEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">申请人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" IsMutiple="false" req="1"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiApplyUserID':'id'}" field="ApplyUserName" tablename="MM_ContractEntity"
                    PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiApplyUserID" runat="server" field="ApplyUserID"
                    tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">签约人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtContractorName" IsMutiple="false" req="1"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiContractorID':'id'}" field="ContractorName" tablename="MM_ContractEntity"
                    PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiContractorID" runat="server" field="ContractorID"
                    tablename="MM_ContractEntity" />
                <input type="hidden" id="hiContractorDept" runat="server" field="ContractorDept"
                    tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">签约日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSignDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" field="SignDate" tablename="MM_ContractEntity">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">外委单位<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="txtEntrustUnitName" field="EntrustUnitName"
                    tablename="MM_ContractEntity" activestatus="(23.*)" SourceMode="SelectorPage"
                    SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true"
                    ResultForControls="{'hiEntrustUnitID':'id','tbContactUserName':'ContactPerson','tbContactPhone':'CompanyPhone'}"
                    PageUrl="~/MM/Obsolete/SupplierSelector.aspx" req="1"
                    EnableTheming="false" PageWidth="850" Writeable="false"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiEntrustUnitID" field="EntrustUnitID" tablename="MM_ContractEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">联系人<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbContactUserName" runat="server" MaxLength="32" req="1"
                    field="ContactUserName" tablename="MM_ContractEntity" activestatus="(23.*)" CssClass="kpms-textbox"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">联系人电话<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContactPhone" runat="server" MaxLength="32" req="1"
                    field="ContactPhone" tablename="MM_ContractEntity" activestatus="(23.*)" CssClass="kpms-textbox"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">建设地点
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbBuildPlace" runat="server" MaxLength="256"
                    field="BuildPlace" tablename="MM_ContractEntity" activestatus="(23.*)" CssClass="kpms-textbox"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">计划结束日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanEndDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" field="PlanEndDate" tablename="MM_ContractEntity">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">实施日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtImplementDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" field="ImplementDate" tablename="MM_ContractEntity">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">完成日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtFinishDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" field="FinishDate" tablename="MM_ContractEntity">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="display: none">会签状态<span class="req-star">*</span>
            </td>
            <td class="td-r" style="white-space: nowrap; display: none">
                <asp:RadioButtonList runat="server" ID="rblSignState" field="SignState" tablename="MM_ContractEntity"
                    RepeatDirection="Horizontal" activestatus="(23.*)" req="1">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">签订状态<span class="req-star">*</span>
            </td>
            <td class="td-r" style="white-space: nowrap">
                <asp:RadioButtonList runat="server" ID="rblContractStatus" field="ContractStatus" tablename="MM_ContractEntity"
                    RepeatDirection="Horizontal" activestatus="(23.*)" req="1" onClick="checkContractCode();">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">合同编号<span class="req-star" name="spanContractCode">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractCode" runat="server" MaxLength="64" activestatus="(23.*)" CssClass="kpms-textbox"
                    EnableTheming="false"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiContractCode" field="ContractCode" tablename="MM_ContractEntity" />
            </td>
            <td class="td-m" colspan="2">
                <asp:Button runat="server" Text="生成合同编号" ID="btnCreateCode" OnClick="btnCreateCode_OnClick" displaystatus="(23.*)" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" field="Memo" tablename="MM_PurchaseConCheck" activestatus="(23.提交合同)" CssClass="kpms-textarea"
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
                <span style="float: right;" id="Span3" runat="server" displaystatus="(3.*)">
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
                <zhongsoft:LightPowerGridView ID="gvContract" runat="server" UseDefaultDataSource="true"
                    DataKeyNames="ReleChargeContractID" OnRowCommand="gvContract_RowCommand" ShowFooter="true">
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
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("ReleChargeContractID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
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
                <asp:LinkButton runat="server" ID="lbtnUp" displaystatus="(3.*)" EnableTheming="False" OnClientClick="return uploadFileStamp('Form','General');">
                    <img src="../../../Themes/Images/btn_upload.gif">
                    <span>上传附件</span>
                </asp:LinkButton>
                <span class="req-star" style="float: right;"
                    id="Span2" runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
                <uc3:UpLoadFile ID="uploadFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td-l">上传盖章电子版<br />
                正式合同文件</td>
            <td class="td-m" colspan="5">
                <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(3.*)" EnableTheming="False" OnClientClick="return uploadFileStamp('Form','Stamp');">
                <img src="../../../Themes/Images/btn_upload.gif">
                <span>上传附件</span>
                </asp:LinkButton>
                <span class="req-star" style="float: right;"
                    runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
                <uc3:UpLoadFile ID="ucUploadFile" runat="server" />
            </td>
        </tr>
    </table>
    <input runat="server" type="hidden" id="hiContractID" tablename="MM_ContractEntity"
        field="ContractID" />
    <input runat="server" type="hidden" id="hiBaseType" tablename="MM_ContractEntity"
        field="BaseType" />
    <input runat="server" type="hidden" id="hiSignDate" tablename="MM_ContractEntity"
        field="SignDate" />
    <input runat="server" type="hidden" id="hiContractState" tablename="MM_ContractEntity"
        field="ContractState" />
    <input runat="server" type="hidden" id="hiFlag" tablename="MM_ContractEntity"
        field="Flag" />
    <input runat="server" type="hidden" id="hiContractSignType" tablename="MM_ContractEntity"
        field="ContractSignType" />
    <input runat="server" type="hidden" id="hiUndertakeDeptID" tablename="MM_ContractEntity"
        field="UndertakeDeptID" />
    <input runat="server" type="hidden" id="hiUndertakeDeptName" tablename="MM_ContractEntity"
        field="UndertakeDeptName" />
    <input type="hidden" runat="server" id="hiReleContract" />
    <asp:Button runat="server" ID="btnBindReleContract" OnClick="btnBindReleContract_Click" Style="display: none" />
    <asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />
    <%--特殊类型对应--%>
    <input type="hidden" runat="server" id="hiSpecialType" value="<root><o text='勘测设计外委' value='FF' /><o text='物资采购' value='内建' /><o text='总包建安分包' value='ZJ' /><o text='总包设备采购' value='ZC' /><o text='总包其他' value='ZT' /><o text='其他' value='QT' /></root>" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkContractCode();
            setCheckFormLink();
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

        //设置合同评审单链接
        function setCheckFormLink() {
            var bizId = '<%=PurchaseConCheckID%>';
            if (bizId == "") {
                $('#aCheckForm').hide();
                $('#spNoCheckForm').show();
            }
            else {
                $('#aCheckForm').show();
                $('#spNoCheckForm').hide();
            }
        }

        //查看采购合同评审单
        function viewWF() {
            var bizId = '<%=PurchaseConCheckID%>';
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, ExtendedAttribute: null };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        function checkContractCode() {
            var selectValue = $("#<%=rblContractStatus.ClientID  %> :checked").val();
            if (selectValue == "已签订") {
                $("[name$='spanContractCode']").show();
                $("#<%=tbContractCode.ClientID%>").attr("req", "1");
            } else {
                $("[name$='spanContractCode']").hide();
                $("#<%=tbContractCode.ClientID %>").removeAttr("req");
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
</asp:Content>


