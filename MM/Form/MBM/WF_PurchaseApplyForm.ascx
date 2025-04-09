<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PurchaseApplyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_PurchaseApplyForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<%@ Register Src="~/GM/UI/Controls/ProjectSelector.ascx" TagName="ProjectSelector"
    TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<table class="tz-table" width="100%">
    <uc1:ProjectSelector ID="ProjectSelector" runat="server" />
    <tr>
        <td class="td-l">
            流水号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplyCode" Field="APPLYCODE" tableName="MBM_PURCHASEAPPLYORBGFORM"
                ReadOnly="true" activestatus="(23.填写采购申请单)(23.修改采购申请单)" runat="server">
            </zhongsoft:LightTextBox>
        </td>
        <td colspan="4"></td>
    </tr>
    <tr applynx="1" runat="server">
        <td class="td-l">
            项目负责人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtChargerName" field="CHARGERNAME"
                tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiChargerId':'id','hiChargerCode':'LoginID'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiChargerId" runat="server" field="CHARGERID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
            <input type="hidden" id="hiChargerCode" runat="server" field="CHARGERCODE" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l">
            类型
        </td>
        <td class="td-r" nowrap colspan="3">
            <asp:RadioButtonList ID="rblDeviceType" runat="server" RepeatDirection="Horizontal"
                field="DEVICETYPE" tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)"
                Visible="false">
            </asp:RadioButtonList>
            <asp:RadioButtonList ID="rblApplyLittleType" runat="server" RepeatDirection="Horizontal"
                field="APPLYLITTLETYPE" tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)(23.申请部门部长审批)">
            </asp:RadioButtonList>
            <input type="hidden" id="hiApplyLittleType" runat="server" field="APPLYLITTLETYPE"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
    </tr>
    <tr runat="server">
        <td class="td-l">
            采购任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbTaskName" req="1" Field="TASKNAME" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写采购申请单)(23.修改采购申请单)" runat="server" maxtext="64">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            采购申请部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplyDeptName" Field="APPLYDEPTNAME" CssClass="kpms-textbox-short"
                EnableTheming="false" ReadOnly="true" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)"
                runat="server">
            </zhongsoft:LightTextBox>
            <input type="hidden" id="hiApplyDeptId" runat="server" field="APPLYDEPTID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            估算价格（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbEstimatedPrice" Field="ESTIMATEDPRICE" req="1" Regex="(^[1-9]\d{0,9}(\.\d{1,6})?$)|(^[0]\.\d{1,6}$)"
                ErrMsg="请输入正数，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)"
                runat="server">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            申请人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lboApplyerName" field="APPLYERNAME"
                tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiApplyerId':'id','hiApplyerCode':'LoginID','tbApplyDeptName':'OrgUnitName','hiApplyDeptId':'OrgUnitId'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyerId" runat="server" field="APPLYERID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
            <input type="hidden" id="hiApplyerCode" runat="server" field="APPLYERCODE" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l">
            创建日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtFillDate" tablename="MBM_PURCHASEAPPLYORBGFORM"
                readonly="readonly" class="kpms-textbox-date" field="FILLDATE" activestatus="(23.填写采购申请单)(23.修改采购申请单)" />
        </td>
    </tr>
    <tr applygc="1" runat="server">
        <td class="td-l">
            采购范围<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList ID="rblPurchaseRange" runat="server" RepeatDirection="Horizontal"
                field="PURCHASERANGE" tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)"
                onchange="return purchaseRangeChange()" OnSelectedIndexChanged="rblPurchaseRange_SelectedIndexChanged"
                AutoPostBack="true">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiRollXml" />
        </td>
    </tr>
    <tr id="trSpecialty">
        <td class="td-l">
            委托内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cbSpecialty" activestatus="(23.填写采购申请单)(23.修改采购申请单)"
                RepeatDirection="Horizontal" RepeatColumns="5">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr id="delegateRollInfo">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvDelegateRoll" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="DELEGATEDETAILID"
                BindGridViewMethod="UserControl.BindRollInfo" OnRowCommand="gvDelegateRoll_RowCommand"
                ShowHeaderWhenEmpty="true" ShowExport="true">
                <Columns>
                    <%--  <zhongsoft:LightBoundField DataField="SpecialtyCode" HeaderText="专业代字" />--%>
                    <zhongsoft:LightTemplateField HeaderText="专业代字" ItemStyle-Width="40px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbSpecialtyCode" Text='<%#Eval("SpecialtyCode") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业" />
                    <zhongsoft:LightBoundField DataField="RollCode" HeaderText="卷册编号" />
                    <zhongsoft:LightBoundField DataField="RollName" HeaderText="卷册名称" />
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该项目吗？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr runat="server" nodisplaystatus="(23.填写采购申请单)" applygc="1">
        <td class="td-l">
            采购内容签入合同额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbSignMoney" Field="SIGNMONEY" Regex="(^[1-9]\d{0,9}(\.\d{1,6})?$)|(^[0]\.\d{1,6}$)"
                ErrMsg="请输入正数，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.核定费用)" runat="server">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-m" colspan="4">
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.采购部门意见)(23.处理)(23.资料补充)(23.申请人确认)">
        <td class="td-l">
            采购承办人<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsPurchaseHandlerName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                req="1" ResultAttr="name" ActiveStatus="(23.采购部门意见)" ResultForControls="{'hiPurchaseHandlerId':'id','hiPurchaseHandlerCode':'code'}"
                IsMutiple="true" ShowJsonRowColName="true" SourceMode="SelectorPage" Filter="{OrganizationId:'AE426299-3BCC-4417-B4C9-323FAFF293B8'}"
                field="PURCHASEHANDLERNAME" tablename="MBM_PURCHASEAPPLYORBGFORM" />
            <input id="hiPurchaseHandlerId" type="hidden" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                field="PURCHASEHANDLERID" />
            <input id="hiPurchaseHandlerCode" type="hidden" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                field="PURCHASEHANDLERCODE" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" applygcky="1" runat="server">
    <tr>
        <td align="center" style="font-weight: bold" colspan="6">
            申请理由
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)">
        <td align="center" style="font-weight: bold" colspan="6">
            <asp:Label runat="server" ID="lbShowMind" Text="如果您选择了申请理由，请将该申请理由对应的原因填写完整！"></asp:Label></font>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            <asp:CheckBox runat="server" ID="cbIsHumanResourceReason" field="ISHUMANRESOURCE"
                tablename="MBM_PURCHASEAPPLYORBGFORM" applyReason="1" Text="人力资源" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" />
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:LightTextBox ID="tbProjectRun" runat="server" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)"
                Field="PROJECTRUN" TableName="MBM_PURCHASEAPPLYORBGFORM" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="1024" />
        </td>
        <td class="td-m" colspan="2">
            <span style="vertical-align: middle">简述</span>
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" ID="tbHRMemo" runat="server"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Field="HRMEMO"
                TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" Style="vertical-align: middle" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbIsEquipmentReason" field="ISEQUIPMENT" tablename="MBM_PURCHASEAPPLYORBGFORM"
                applyReason="1" Text="设备" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" />
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:LightTextBox ID="tbEquipmentName" runat="server" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)"
                Field="EQUIPMENTNAME" TableName="MBM_PURCHASEAPPLYORBGFORM" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="1024" />
        </td>
        <td class="td-m" colspan="2">
            <span style="vertical-align: middle">简述</span>
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" ID="tbEquipmentMemo"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="EQUIPMENTMEMO" TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" Style="vertical-align: middle" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbIsProfessionReason" field="ISPROFESSION" tablename="MBM_PURCHASEAPPLYORBGFORM"
                applyReason="1" Text="资质" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" />
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:LightTextBox ID="tbNeedProfession" runat="server" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)"
                Field="NEEDPROFESSION" TableName="MBM_PURCHASEAPPLYORBGFORM" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="1024" />
        </td>
        <td class="td-m" colspan="2">
            <span style="vertical-align: middle">简述</span>
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" ID="tbProfessionMemo"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="ProfessionMemo" TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" Style="vertical-align: middle" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbAbilityReason" field="ISABILITY" tablename="MBM_PURCHASEAPPLYORBGFORM"
                applyReason="1" Text="能力" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" />
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" ID="tbAbilityMemo"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="ABILITYMEMO" TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbIsReason" field="ISREASON" tablename="MBM_PURCHASEAPPLYORBGFORM"
                applyReason="1" Text="成本原因（经济核算）" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" />
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" ID="tbReasonMemo"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="REASONMEMO" TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbIsOtherReason" field="ISOTHER" tablename="MBM_PURCHASEAPPLYORBGFORM"
                applyReason="1" Text="其他" activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" />
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" ID="tbOtherMemo"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="OTHERMEMO" TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" applynx="1" runat="server">
    <tr applynx="1">
        <td align="center" style="font-weight: bold" colspan="6">
            项目要求
        </td>
    </tr>
    <tr applynx="1">
        <td class="td-l">
            具体采购范围、内容、资质要求
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)" ID="tbQualificatioinYq"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="QUALIFICATIONYQ" TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" />
        </td>
    </tr>
    <tr applynx="1">
        <td class="td-l">
            工期或供货时间要求
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)" ID="tbDateYq" runat="server"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Field="DATEYQ"
                TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" />
        </td>
    </tr>
    <tr id="parameter" applynx="1">
        <td class="td-l">
            规格型号、配置、参数
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)" ID="tbParameterYq"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="PARAMETERYQ" TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" />
        </td>
    </tr>
    <tr id="detail" applynx="1">
        <td class="td-l">
            图纸、工作量清单
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)" ID="tbDetailedList"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="DETAILEDLIST" TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" />
        </td>
    </tr>
    <tr applynx="1">
        <td class="td-l">
            验收标准及方式
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写采购申请单)(23.修改采购申请单)" ID="tbMethod" runat="server"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Field="METHODS"
                TableName="MBM_PURCHASEAPPLYORBGFORM" maxtext="1024" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            采购内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbPurchaseContent" Field="PURCHASECONTENT" CssClass="kpms-textarea"
                req="1" EnableTheming="false" TextMode="MultiLine" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写采购申请单)(23.修改采购申请单)" runat="server" Rows="3" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr applynx="1" runat="server">
        <td class="td-l">
            采购原因
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbPurchaseReason" Field="PURCHASEREASON" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写采购申请单)(23.修改采购申请单)" runat="server" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="Tr5" applygcnx="1" runat="server">
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" Field="MEMO" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写采购申请单)(23.修改采购申请单)" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr applygcky="1" runat="server" class="trSupply">
        <td>
        </td>
        <td align="center" style="font-weight: bold" colspan="4" width="70%">
            合格供方库推荐单位<span id="Span2" class="req-star" runat="server" displaystatus="(123.?)">先保存再选择单位</span>
        </td>
        <td align="right">
            <table>
                <tr>
                    <td>
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsQualifiedSupplier" IsMutiple="true"
                            FilterFunction="qualifiedSupplierFilter()" EnableTheming="false" OnlyShowButton="true"
                            PageUrl="~/MM/Obsolete/SupplierSelector.aspx" ShowJsonRowColName="true" ResultAttr="name"
                            displaystatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" activestatus="(23.填写采购申请单)(3.修改采购申请单)(3.市场部采购流程)"
                            OnClick="lbsQualifiedSupplier_Click" />
                    </td>
                    <td>
                        选择合格供方单位
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" applygcky="1" class="trSupply">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvQualifiedList" runat="server" DataKeyNames="UINTID"
                AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="gvQualifiedList_RowCommand"
                UseDefaultDataSource="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="SUPPLYNAME" HeaderText="单位名称" />
                    <zhongsoft:LightBoundField DataField="CONTACTER" HeaderText="联系人" Width="70" />
                    <zhongsoft:LightBoundField DataField="TELEPHONE" HeaderText="联系电话" Width="100" />
                    <zhongsoft:LightTemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("UINTID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr applygcky="1" runat="server" class="trSupply">
        <td>
        </td>
        <td align="center" style="font-weight: bold" colspan="4" width="70%">
            供方库推荐单位<span id="Span3" class="req-star" runat="server" displaystatus="(123.?)">先保存再选择单位</span>
        </td>
        <td align="right">
            <table>
                <tr>
                    <td>
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsUnit" IsMutiple="true" FilterFunction="unitFilter()"
                            EnableTheming="false" OnlyShowButton="true" PageUrl="~/MM/Obsolete/SupplierSelector.aspx"
                            ShowJsonRowColName="true" ResultAttr="name" displaystatus="(23.填写采购申请单)(3.修改采购申请单)(3.市场部采购流程)"
                            activestatus="(23.填写采购申请单)(3.修改采购申请单)(3.市场部采购流程)" OnClick="lbsUnit_Click" />
                    </td>
                    <td>
                        选择供方单位
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" applygcky="1" class="trSupply">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvUnit" runat="server" DataKeyNames="UINTID" AutoGenerateColumns="False"
                AllowPaging="True" OnRowCommand="gvUnit_RowCommand" UseDefaultDataSource="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="SUPPLYNAME" HeaderText="单位名称" />
                    <zhongsoft:LightBoundField DataField="CONTACTER" HeaderText="联系人" Width="70" />
                    <zhongsoft:LightBoundField DataField="TELEPHONE" HeaderText="联系电话" Width="100" />
                    <zhongsoft:LightTemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("UINTID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr applygcky="1" runat="server" class="trSupply">
        <td>
        </td>
        <td align="center" style="font-weight: bold" colspan="4" width="70%">
            非库中推荐单位<span id="Span4" class="req-star" runat="server" displaystatus="(123.?)">先保存再选择单位</span>
        </td>
        <td align="right">
            <table>
                <tr>
                    <td>
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsNotInUnit" IsMutiple="true"
                            Filter="{SupplierType:'3'}" EnableTheming="false" OnlyShowButton="true" PageUrl="~/MM/Obsolete/SupplierSelector.aspx"
                            ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写采购申请单)(3.修改采购申请单)(3.市场部采购流程)"
                            displaystatus="(23.填写采购申请单)(23.修改采购申请单)(3.市场部采购流程)" OnClick="lbsNotInUnit_Click" />
                    </td>
                    <td>
                        选择非库中单位
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr runat="server" applygcky="1" class="trSupply">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvNotInUnit" runat="server" DataKeyNames="UINTID"
                AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="gvNotInUnit_RowCommand"
                UseDefaultDataSource="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="SUPPLYNAME" HeaderText="单位名称" />
                    <zhongsoft:LightBoundField DataField="CONTACTER" HeaderText="联系人" Width="70" />
                    <zhongsoft:LightBoundField DataField="TELEPHONE" HeaderText="联系电话" Width="100" />
                    <zhongsoft:LightTemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("UINTID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr runat="server" applynx="1" applykynx="1">
        <td align="center" style="font-weight: bold" colspan="6">
            推荐单位<span id="Span5" class="req-star" runat="server" displaystatus="(123.?)">先保存再添加单位</span>
        </td>
    </tr>
    <tr id="Tr7" runat="server" applynx="1" applykynx="1" displaystatus="(23.填写采购申请单)(3.修改采购申请单)(3.市场部采购流程)">
        <td align="right" style="font-weight: bold" colspan="6">
            添加
            <zhongsoft:LightTextBox runat="server" ID="tdNum" Width="30px" Style="text-align: right"
                regex="\d{1,3}" errmsg="请输入正确的行号！">
            </zhongsoft:LightTextBox>
            行
            <asp:Button ID="btnAddApply" runat="server" Text="确定" OnClick="btnAddApply_Click"
                class="btn" />
        </td>
    </tr>
    <tr id="Tr6" runat="server" applykynx="1" applynx="1">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvApplyUnit" runat="server" DataKeyNames="UINTID"
                AutoGenerateColumns="False" AllowPaging="True" OnRowDataBound="gvApplyUnit_RowDataBound"
                OnRowCommand="gvApplyUnit_RowCommand" UseDefaultDataSource="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="单位名称<span class='req-star'>*</span>" HeaderStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbName" runat="server" class="kpms-textbox" MaxLength="64"
                                req="1" Text='<%# DataBinder.Eval(Container.DataItem, "SUPPLYNAME") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="联系人<span class='req-star'>*</span>" HeaderStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPerson" runat="server" class="kpms-textbox" MaxLength="18"
                                req="1" Text='<%# DataBinder.Eval(Container.DataItem, "CONTACTPERSON") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="联系电话<span class='req-star'>*</span>" HeaderStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPhone" runat="server" class="kpms-textbox" MaxLength="16"
                                req="1" Text='<%# DataBinder.Eval(Container.DataItem, "TELEPHONE") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("UINTID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="Tr4" runat="server">
        <td class="td-l">
            推荐供方理由
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRecommendReason" Field="RECOMMENDREASON" CssClass="kpms-textarea"
                EnableTheming="false" Rows="2" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)(23.市场部采购流程)"
                runat="server"  TextMode="MultiLine" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server">
        <td class="td-l">
            不足三家原因说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbNotMeetReason" Field="NOTMEETREASON" CssClass="kpms-textarea"
                EnableTheming="false" Rows="2" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写采购申请单)(23.修改采购申请单)(23.市场部采购流程)"
                runat="server" TextMode="MultiLine" maxtext="1024">
            </zhongsoft:LightTextBox>
            <br />
            填写说明：
            <asp:Label runat="server" ID="lbDescription"></asp:Label>
        </td>
    </tr>
    <tr runat="server" nodisplaystatus="(23.填写采购申请单)" applygc="1" id="trQulity">
        <td class="td-l">
            技术质量部意见<span class="req-star" id="redCode2">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbCheckOpinion" Field="CHECKOPINION" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.技术质量部部长审核意见)(23.技术质量部部长审核)" runat="server" maxtext="256" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="5" req="1">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server" nodisplaystatus="(23.填写采购申请单)" applygcky="1">
        <td class="td-l" nowrap>
            院长办公会是否同意<span class="req-star" id="redCode1">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList ID="rblOpinion" runat="server" RepeatDirection="Horizontal"
                req="1" field="OPINION" tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.传达院长办公会意见)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
                <asp:ListItem Value="2">未提交</asp:ListItem>
                <asp:ListItem Value="3">同意，不需要上会</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr runat="server" nodisplaystatus="(23.填写采购申请单)" applygcky="1">
        <td class="td-l">
            院长办公会意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbOpioionContent" Field="OPINIONCONTENT" CssClass="kpms-textarea"
                EnableTheming="false" Rows="3" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.传达院长办公会意见)"
                runat="server" TextMode="MultiLine" maxtext="512">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.经营管理部部长审核)(23.经营管理部部长阅示)" applygcky="1">
        <td class="td-l">
            采购承办部门<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightDropDownList runat="server" ID="ddlUndertakeDeptId" field="UNDERTAKEDEPTID"
                tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.经营管理部部长审核)(23.经营管理部部长阅示)"
                req="1" OnSelectedIndexChanged="ddlPurchaseOrg_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input id="hiUndertakeDeptName" type="hidden" field="UNDERTAKEDEPTNAME" runat="server"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.处理)(23.资料补充)(23.申请人确认)">
        <td class="td-l" nowrap>
            是否需要补充提资<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsNeedMaterial" runat="server" RepeatDirection="Horizontal"
                req="1" field="ISNEEDMATERIAL" tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.处理)">
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0">否</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.处理)(23.资料补充)(23.申请人确认)" class="supplyMaterial">
        <td class="td-l">
            补充说明
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox activestatus="(23.处理)" ID="tb" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Field="MATERIALDESCRIPTION" TableName="MBM_PURCHASEAPPLYORBGFORM"
                maxtext="512" />
        </td>
    </tr>
    <tr id="supplyMaterail" class="supplyMaterial" runat="server" displaystatus="(23.处理)(23.资料补充)(23.申请人确认)">
        <td class="td-l" nowrap>
            补充资料是否合格<span class="req-star" id="trMaterail">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rbMaterailQualified" runat="server" RepeatDirection="Horizontal"
                field="MATERIALQUALIFIED" tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.处理)">
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0">否</asp:ListItem>
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiHasSupplyMaterail" field="HASSUPPLYMATERAIL"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
    </tr>
    <tr class="supplyMaterial">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            相关文件
        </td>
    </tr>
    <tr class="supplyMaterial" runat="server" displaystatus="(23.资料补充)">
        <td colspan="6" style="text-align: right">
            <asp:Button ID="Button1" runat="server" Text="上传相关资料" activestatus="(23.*)" OnClientClick="return upLoadFiles1();"
                OnClick="btnAdd" />
        </td>
    </tr>
    <tr class="supplyMaterial">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                OnRowCommand="gvList_RowCommand" AutoGenerateColumns="false" DataKeyNames="MATERIALSID"
                ShowExport="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="文件名称">
                        <ItemTemplate>
                            <a runat="server" id="aFileName" style="text-decoration: underline; color: #0033FF;">
                                <%#Eval("MATERIALSNAME")%></a>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiFilePath" value='<%#Eval("FILEPATH") %>' />
                            <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                EnableTheming="false" CommandArgument='<%#Eval("MATERIALSID") %>'><img id="btDelete" title="删除" style="CURSOR: hand" src="../../Themes/Images/btn_dg_delete.gif" border="0"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr applyky="1" runat="server">
        <td align="center" style="font-weight: bold" colspan="6">
            科技项目资料<span id="Span1" class="req-star" runat="server" displaystatus="(123.?)">请先保存再上传资料</span>
        </td>
    </tr>
    <tr displaystatus="(23.填写采购申请单)(3.修改采购申请单)" runat="server" applyky="1">
        <td align="right" style="font-weight: bold" colspan="6">
            添加
            <zhongsoft:LightTextBox runat="server" ID="tbRowNum" Width="30px" Style="text-align: right"
                regex="\d{1,3}" errmsg="请输入正确的行号！">
            </zhongsoft:LightTextBox>
            行
            <asp:Button runat="server" ID="btnSure" Text="确定" OnClick="btnSure_Click" />
        </td>
    </tr>
    <tr runat="server" applyky="1">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvMaterials" runat="server" ShowExport="false"
                PermissionStatus="true" UseDefaultDataSource="true" AllowPaging="true" DataKeyNames="MATERIALSID"
                OnRowDataBound="gvMaterials_RowDataBound" OnRowCommand="gvMaterials_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="资料编号" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="15%">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbMaterialsCode" Text='<%#Eval("MATERIALSCODE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="资料类别" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="13%">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlType" activestatus="(23.填写采购申请单)(23.修改采购申请单)"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" req="1"
                                Width="200px">
                            </zhongsoft:LightDropDownList>
                            <input type="hidden" id="hiType" value='<%#Eval("MATERIALSTYPE") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="资料名称" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="55%">
                        <ItemTemplate>
                            <uc1:AttachmentView ID="AttaListFile" runat="server" RepeatColumns="1" ShowDelete="true"
                                ShowDeleteBySelf="true" />
                            <input type="hidden" runat="server" id="hiUploadId" value='<%#Eval("MATERIALSID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="上传资料" ItemStyle-HorizontalAlign="center" HeaderStyle-Width="60px">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnAttach" ImageUrl="~/Themes/Images/btn_dg_upfile.gif" runat="server"
                                CommandName="UploadFile" Style="cursor: hand; height: 16px;" ToolTip="上传资料" CausesValidation="false"
                                DisplayStatus="(3.*)" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDeleteActor" EnableTheming="false" CommandName="DeleteData"
                                OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("MATERIALSID") %>'>
                                <img alt="删除" title="删除" src="../../Themes/Images/btn_dg_delete.gif" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<%--流程主键ID--%>
<input type="hidden" id="hiApplyId" runat="server" field="APPLYID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
<input type="hidden" id="hiBigTypeName" runat="server" field="APPLYBigType" tablename="MBM_PURCHASEAPPLYORBGFORM" />
<input type="hidden" id="hiOrganizationId" runat="server" field="ProjectID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
<input type="hidden" id="hiProjectManagerId" runat="server" />
<%--有效--%>
<input type="hidden" id="hiIsEffective" runat="server" field="ISEFFECTIVE" tablename="MBM_PURCHASEAPPLYORBGFORM"
    value="0" />
<input type="hidden" id="hiApplyOrBg" runat="server" field="APPLYORBG" tablename="MBM_PURCHASEAPPLYORBGFORM"
    value="0" />
<%-- 申请批准时间--%>
<input type="hidden" id="hiReceive" runat="server" field="RECEIVETIME" tablename="MBM_PURCHASEAPPLYORBGFORM" />
<%--角色名称--%>
<input type="hidden" id="hiRoleNameA" runat="server" value="部门负责人" />
<input type="hidden" id="hiRoleNameB" runat="server" value="经营经理" />
<input type="hidden" id="hiRoleNameC" runat="server" value="主管院长" />
<input type="hidden" id="hiRoleNameD" runat="server" value="首席计划师" />
<input type="hidden" id="hiRoleNameH" runat="server" value="院高层" />
<input type="hidden" id="hiRoleNameE" runat="server" value="科室负责人" />
<input type="hidden" id="hiRoleNameF" runat="server" value="采购专责" />
<input type="hidden" id="hiRoleNameG" runat="server" value="科技专责" />
<input type="hidden" id="hiDeptNameA" runat="server" value="技术质量部" />
<input type="hidden" id="hiDeptNameB" runat="server" value="经营管理部" />
<input type="hidden" id="hiDeptNameC" runat="server" value="总包采购室" />
<input type="hidden" id="hiDeptNameD" runat="server" value="总承包事业部" />
<input type="hidden" id="hiDeptNameE" runat="server" value="院高层" />
<asp:LinkButton ID="lbtnRefresh" runat="server" OnClick="lbtnRefresh_Click" Style="display: none"></asp:LinkButton>
<script type="text/javascript">
    var changeValue = 0;
    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();
        //控制卷册和专业的显隐性
        displayOfRollAndSpe();
        //控制供方列表的显隐，勘测设计项目时才显示供方列表
        displayOfSupply();
        //控制推荐单位不足三家的说明
        displayOfDescription();
        if ($actName == "填写采购申请单") {
            if ($bizCtx.action == "<%=(int)AccessLevel.Create %>") {
                $("#<%=tbProjectRun.ClientID %>").val("本专业技术人员（包括外聘人员）共计人数：\n现正进行工程：\n现正进行子项：\n可用于本项目人员:");
                $("#<%=tbEquipmentName.ClientID %>").val("本工程项目需设备名称：\n需要设备数量(台/套）：\n院现有设备数量(台/套）：");
                $("#<%=tbNeedProfession.ClientID %>").val("本工程项目需单位资质：\n人员资质：\n我院现有资质情况：");
            }
            controlPurchaseContent();
            $("#<%=parameter.ClientID %>").hide();
            $("#<%=detail.ClientID %>").hide();
            var $value = $("[applygcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applyky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applygc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applynx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applygcnx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[isbudget]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[nobudget]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            $("#redCode1").hide();
            $("#redCode2").hide();
        }
        else if ($actName == "传达院长办公会意见") {
            $("#redCode1").show();
            $("#redCode2").hide();
        }
        else if ($actName == "技术质量部部长审核意见" || $actName == "技术质量部部长审核") {
            $("#redCode1").hide();
            $("#redCode2").show();
        }
        else if ($actName == "处理") {
            $("#<%=rblIsNeedMaterial.ClientID %> ").live("change", function () { displayOfSupplyMaterail(); });
        }
        else {
            $("#redCode1").hide();
            $("#redCode2").hide();
        }

        //采购申请类型（大类）不同，显示不同内容
        setApplyTypeControl("");

        $('#<%=rblPurchaseRange.ClientID %>').click(function () {
            purchaseRangeChange();
        })

        //采购申请类型（小类）不同，显示不同内容
        var applyLitType = $("#<%=rblApplyLittleType.ClientID %> input[type='radio']:checked").val();
        setLittleTypeControl(applyLitType);

        $('#<%=rblApplyLittleType.ClientID %>').click(function () {
            var applyLittleType = $("#<%=rblApplyLittleType.ClientID %> input[type='radio']:checked").val();
            setLittleTypeControl(applyLittleType);
        })

        controlQualityDisplay();
        displayOfSupplyMaterail();
        displayOfSupply();
        initControlPlugin();
    }

    function doParentMethod(name, pId) {
        $('#<%=hiBigTypeName.ClientID %>').val(name);
        $('#<%=hiOrganizationId.ClientID %>').val(pId);
        setApplyTypeControl("change");
        controlQualityDisplay();
        displayOfSupplyMaterail();
        displayOfSupply();
    }

    //处理步骤，若已经补充过资料，控制 是否需要补充资料不可编辑
    function displayOfSupplyMaterail() {
        //如果需要补充资料显示，补充说明和资料信息 rblIsNeedMaterial
        var isNeedMaterail = $("#<%=rblIsNeedMaterial.ClientID %> input[type='radio']:checked").val();
        if (isNeedMaterail == "1") {
            $(".supplyMaterial").show();
        }
        else {
            $(".supplyMaterial").hide();
        }
        var hasSupplyMaterial = $("#<%=hiHasSupplyMaterail.ClientID %>").val();
        //处理步骤，若已经补充过资料，控制 是否需要补充资料不可编辑
        if (hasSupplyMaterial == "1") {
            $("#<%=rblIsNeedMaterial.ClientID %>").attr("disabled", "disabled");
            $("#<%=rbMaterailQualified.ClientID %>").attr("req", "1");
            $("#<%=supplyMaterail.ClientID %>").show();
        }
        else {
            $("#<%=supplyMaterail.ClientID %>").hide();
            $("#<%=rbMaterailQualified.ClientID %>").removeAttr("req");
        }
    }

    //控制卷册和专业的显隐
    function displayOfRollAndSpe() {
        var rangeValue = getPurchaseRange();
        if (rangeValue == "专业委托") {
            $("#trSpecialty").show();
            $("#delegateRollInfo").hide();
            $("#<%=cbSpecialty.ClientID %>").attr("req", "1");
        }
        else {
            $("#trSpecialty").hide();
            $("#<%=cbSpecialty.ClientID %>").removeAttr("req");
            if (rangeValue == "卷册委托") {
                $("#delegateRollInfo").show();
            }
            else {
                $("#delegateRollInfo").hide();
            }
        }
    }

    //获取采购范围信息
    function getPurchaseRange() {
        return $("#<%=rblPurchaseRange.ClientID %> input[type='radio']:checked").val();
    }
    //获取申请大类
    function getApplyType() {
        return $("#<%=hiBigTypeName.ClientID %>").val();
    }
    //获取申请小类
    function getLittleType() {
        return $("#<%=rblApplyLittleType.ClientID %> input[type='radio']:checked").val();
    }
    //获取设备类型
    function getNXLittleType() {
        return $("#<%=rblDeviceType.ClientID %> input[type='radio']:checked").val();
    }

    //卷册委托时，必须选择卷册信息
    function checkHasSelRoll() {
        var rollLength = $("#<%=gvDelegateRoll.ClientID %> [id$=lbSpecialtyCode]").length;
        if (rollLength < 1) {
            return false;
        }
        return true;
    }

    //采购范围变化
    function purchaseRangeChange() {
        var applyType = getApplyType();
        var rangeValue = getPurchaseRange();
        var organizationID = getOrganizationID();
        if (applyType == "勘测设计项目" || applyType == "总承包项目" || applyType == "科技项目") {
            if (organizationID == "") {
                alert("请选择项目");
                return false;
            }
            if (applyType == "勘测设计项目") {
                if (rangeValue == "卷册委托") {
                    //弹出卷册选择页面
                    var sdf = selRollInfo();
                    if (sdf) {
                        document.getElementById('<%=lbtnRefresh.ClientID %>').click();
                    }
                    return sdf;
                }
            }
        }
        else if (applyType == "内需采购") {
            var projectName = $("#<%=tbTaskName.ClientID %>").val();
            if (projectName == "") {
                alert("请填写采购任务");
                return false;
            }
            var masterName = $("#<%=txtChargerName.ClientID %>").val();
            if (masterName == "") {
                alert("请选择负责人");
                return false;
            }
        }
        controlPurchaseContent();
        return true;
    }

    //控制技术质量部已将是否显示
    function controlQualityDisplay() {
        var bigType = getApplyType();
        var littleType = getLittleType();
        if ((bigType == "勘测设计项目" && littleType == "勘测设计技术性外委") || bigType == "科技项目") {
            $("#<%=trQulity.ClientID %>").show();
        }
        else {
            $("#<%=trQulity.ClientID %>").hide();
        }
    }

    //控制采购内容
    function controlPurchaseContent() {

    }

    function getOrganizationID() {
        return organizationID = $("#<%=hiOrganizationId.ClientID %>").val();
    }
    function selRollInfo() {
        var param = new InputParamObject("m");
        var organizationID = getOrganizationID();
        var json = "{OrganizationID:'" + organizationID + "'}";
        var reObj = getRollInfo("<%=hiRollXml.ClientID %>", param, json);
        var rollXml = $("#<%=hiRollXml.ClientID %>").val();
        if (reObj != null && rollXml != "") {
            return true;
        }
        return false;
    }
    //控制供方单位的显示
    function displayOfSupply() {
        var applyType = getApplyType();
        if (applyType != "勘测设计项目") {
            $(".trSupply").hide();
        }
        else {
            $(".trSupply").show();
        }
    }

    //控制不足三家说明的提示
    function displayOfDescription() {
        var applyType = getApplyType();
        if (applyType == "勘测设计项目") {
            $("#<%=lbDescription.ClientID %>").html("勘测设计项目非库中推荐单位不足三家，需填写不足三家原因说明");
        }
        else {
            $("#<%=lbDescription.ClientID %>").html(applyType + "推荐单位不足三家，需填写不足三家原因说明");
        }
    }

    function changeAttrInfo(applyType) {
        var applyType = getApplyType();
        if (applyType == "勘测设计项目") {
            //$('#<%=rblApplyLittleType.ClientID %>').attr('req', '1');
            $("#<%=tbDateYq.ClientID %>").removeAttr("req");
            $("#<%=tbMethod.ClientID %>").removeAttr("req");
            $("#<%=tbDetailedList.ClientID %>").removeAttr("req");
            $("#<%=tbParameterYq.ClientID %>").removeAttr("req");
        }
        else if (applyType == "科技项目" || applyType == "总承包项目") {
            $('#<%=tbSignMoney.ClientID %>').removeAttr('req');
            $('#<%=rblApplyLittleType.ClientID %>').removeAttr('req');
            $("#<%=tbDateYq.ClientID %>").removeAttr("req");
            $("#<%=tbMethod.ClientID %>").removeAttr("req");
            $("#<%=tbDetailedList.ClientID %>").removeAttr("req");
            $("#<%=tbParameterYq.ClientID %>").removeAttr("req");
        }
        else if (applyType == "内需采购") {
            $('#<%=rblApplyLittleType.ClientID %>').attr('req', '1');
            $('#<%=tbSignMoney.ClientID %>').removeAttr('req');
        }
    }

    //采购申请类型（大类）不同，显示不同内容
    function setApplyTypeControl(type) {
        var applyType = getApplyType();
        if (applyType == "勘测设计项目") {
            var $value = $("[applygcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[applygc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[applyky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applynx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applygcnx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            if ($actName == "核定费用") {
                $('#<%=tbSignMoney.ClientID %>').attr('req', '1');
            }

            if (type == "change") {
                if (changeValue != 0) {
                    //alert("更改采购申请类型时，将会清空之前填写的部分信息！");
                }
                $("#<%=tbSignMoney.ClientID %>").val("");
                $("#<%=rblApplyLittleType.ClientID %>").val("");
                $("#<%=hiApplyLittleType.ClientID %>").val("");
                $("#<%=txtChargerName.ClientID %>").val("");
                $("#<%=txtChargerName.ClientID %>").next().val("");
                $("#<%=hiChargerId.ClientID %>").val("");
                $("#<%=hiChargerCode.ClientID %>").val("");
                $("#<%=rblDeviceType.ClientID %>").val("");
                $("#<%=tbQualificatioinYq.ClientID %>").val("");
                $("#<%=tbDateYq.ClientID %>").val("");
                $("#<%=tbParameterYq.ClientID %>").val("");
                $("#<%=tbDetailedList.ClientID %>").val("");
                $("#<%=tbMethod.ClientID %>").val("");
                $("#<%=tbPurchaseReason.ClientID %>").val("");
                $("#<%=tbMemo.ClientID %>").val("");

                //$("#<%=hiOrganizationId.ClientID %>").val("");
                changeValue = 1;
            }
        }
        else if (applyType == "总承包项目") {
            var $value = $("[applygcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[applygc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applyky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applynx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applygcnx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            //$("#<%=hiOrganizationId.ClientID %>").val("");
            changeValue = 1;
        }
        else if (applyType == "科技项目") {
            var $value = $("[applygcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[applygc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applyky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[applynx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applygcnx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applykynx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }

            var $value = $("[nobudget]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            $('#<%=tbSignMoney.ClientID %>').removeAttr('req');
            if (type == "change") {
                if (changeValue != 0) {
                    //alert("更改采购申请类型时，将会清空之前填写的部分信息！");
                }

                $("#<%=tbSignMoney.ClientID %>").val("");
                $("#<%=hiApplyDeptId.ClientID %>").val("");
                $("#<%=rblPurchaseRange.ClientID %>").val("");
                $("#<%=tbMemo.ClientID %>").val("");
                $("#<%=rblIsNeedMaterial.ClientID %>").val("");
                $("#<%=rblApplyLittleType.ClientID %>").val("");
                $("#<%=hiApplyLittleType.ClientID %>").val("");
                $("#<%=txtChargerName.ClientID %>").val("");
                $("#<%=txtChargerName.ClientID %>").next().val("");
                $("#<%=hiChargerId.ClientID %>").val("");
                $("#<%=hiChargerCode.ClientID %>").val("");
                $("#<%=rblDeviceType.ClientID %>").val("");
                $("#<%=tbQualificatioinYq.ClientID %>").val("");
                $("#<%=tbDateYq.ClientID %>").val("");
                $("#<%=tbParameterYq.ClientID %>").val("");
                $("#<%=tbDetailedList.ClientID %>").val("");
                $("#<%=tbMethod.ClientID %>").val("");
                $("#<%=tbPurchaseReason.ClientID %>").val("");
                $("#<%=tbMemo.ClientID %>").val("");
                $("#<%=rblIsNeedMaterial.ClientID %>").val("");

                //$("#<%=hiOrganizationId.ClientID %>").val("");
                changeValue = 1;
            }
        }
        else if (applyType == "内需采购") {
            var $value = $("[applygcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applygc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applyky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[applynx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[applygcnx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[applykynx]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            if (type == "change") {
                if (changeValue != 0) {
                    //alert("更改采购申请类型时，将会清空之前填写的部分信息！");
                }

                $("#<%=tbSignMoney.ClientID %>").val("");
                $("#<%=rblPurchaseRange.ClientID %>").val("");
                $("#<%=tbProjectRun.ClientID %>").val("");
                $("#<%=tbHRMemo.ClientID %>").val("");
                $("#<%=tbEquipmentName.ClientID %>").val("");
                $("#<%=tbEquipmentMemo.ClientID %>").val("");
                $("#<%=tbNeedProfession.ClientID %>").val("");
                $("#<%=tbProfessionMemo.ClientID %>").val("");
                $("#<%=tbAbilityMemo.ClientID %>").val("");
                $("#<%=tbReasonMemo.ClientID %>").val("");
                $("#<%=tbOtherMemo.ClientID %>").val("");
                $("#<%=tbMemo.ClientID %>").val("");
                $("#<%=rblIsNeedMaterial.ClientID %>").val("");

                //$("#<%=hiOrganizationId.ClientID %>").val("");
                changeValue = 1;
            }
        }
        if (($actName == "填写采购申请单" || $actName == "修改采购申请单") && $bizCtx.action != "<%=(int)AccessLevel.Read %>") {
            changeAttrInfo();
        }
    }
    //采购申请类型（小类）不同，显示不同内容
    function setLittleTypeControl(applyLittleType) {
        var bigApplyType = getApplyType();
        var isControl = ($actName == "填写采购申请单" || $actName == "修改采购申请单") && bigApplyType == "内需采购";
        //设备物资采购时，工期或供货时间要求，规格型号、配置、参数，验收标准及方式必输
        if (isControl) {
            $("#<%=tbDateYq.ClientID %>").attr("req", "1");
            $("#<%=tbMethod.ClientID %>").attr("req", "1");
        }
        if (applyLittleType == "设备物资") {
            $("#<%=parameter.ClientID %>").show();
            $("#<%=detail.ClientID %>").hide();
            $("#<%=tbDetailedList.ClientID %>").val("");
            if (isControl) {
                $("#<%=tbParameterYq.ClientID %>").attr("req", "1");
                $("#<%=tbDetailedList.ClientID %>").removeAttr("req");
            }
        }
        //小型基建采购时，工期或供货时间要求，图纸、工作量清单，验收标准及方式必输
        else if (applyLittleType == "小型基建") {
            $("#<%=parameter.ClientID %>").hide();
            $("#<%=detail.ClientID %>").show();
            $("#<%=tbParameterYq.ClientID %>").val("");
            if (isControl) {
                $("#<%=tbDetailedList.ClientID %>").attr("req", "1");
                $("#<%=tbParameterYq.ClientID %>").removeAttr("req");
            }
        }
        //其他服务采购时，工期或供货时间要求，验收标准及方式必输
        else {
            $("#<%=parameter.ClientID %>").hide();
            $("#<%=detail.ClientID %>").hide();
            $("#<%=tbParameterYq.ClientID %>").val("");
            $("#<%=tbDetailedList.ClientID %>").val("");
            if (isControl) {
                $("#<%=tbDetailedList.ClientID %>").removeAttr("req");
                $("#<%=tbParameterYq.ClientID %>").removeAttr("req");
            }
        }
    }

    //上传附件
    function upLoadFile(fileSrcId) {
        showUploadForm(fileSrcId, "Module");
        return true;
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "填写采购申请单" || $actName == "修改采购申请单") {
                var applyType = getApplyType();
                var reason = $("#<%=tbNotMeetReason.ClientID %>").val();
                var tjReason = $("#<%=tbNotMeetReason.ClientID %>").val();

                if (applyType == "内需采购" || applyType == "科技项目") {
                    var unit = $('#<%=gvApplyUnit.ClientID %>')[0].rows.length;
                    if (unit < 3) {
                        alert("推荐单位至少填写一家！");
                        return false;
                    }
                    if (unit < 5 && reason == "") {
                        alert("推荐单位不足三家，请补充推荐单位或填写不足三家的理由！");
                        return false;
                    }
                }
                else {
                    var qualifiedCount = $('#<%=gvQualifiedList.ClientID %>')[0].rows.length;
                    var unitCount = $('#<%=gvUnit.ClientID %>')[0].rows.length;
                    var notInUnitCount = $('#<%=gvNotInUnit.ClientID %>')[0].rows.length;

                    if (applyType == "勘测设计项目") {
                        if (qualifiedCount < 3 && unitCount < 3 && notInUnitCount < 3) {
                            alert("请至少推荐一个合格供方库中单位或供方库中单位或推荐三家非库中单位");
                            return false;
                        }
                        if (qualifiedCount < 3 && unitCount < 3 && notInUnitCount < 5 && reason == "") {
                            alert("非库中推荐单位不足三家，请补充非库中推荐单位或填写其不足三家的理由！");
                            return false;
                        }
                    }
                }

                //必须有设总或项目负责人
                var organizationID = getOrganizationID();
                if (organizationID != "") {
                    var master = $("<%=hiProjectManagerId.ClientID %>").val();
                    if (master == "") {
                        if (applyType == "勘测设计项目") {
                            alert("请确认该项目已有项目设总");
                            return false;
                        }
                        else if (applyType == "科技项目") {
                            alert("请确认该项目已有项目经理");
                            return false;
                        }
                        else {
                            var managerName = $("#<%=hiChargerId.ClientID %>").val();
                            if (managerName == "") {
                                alert("请确认该项目已有项目负责人");
                                return false;
                            }
                        }
                    }
                }
                //非内需采购时，必须至少选择一个申请理由
                var isChecked = checkHasCheckReason();
                if (applyType != "内需采购" && !isChecked) {
                    alert("请至少选择一个申请理由!");
                    return false;
                }
                var purchaseRange = getPurchaseRange();
                //卷册委托，要选择卷册信息
                if (purchaseRange == "卷册委托") {
                    if (!checkHasSelRoll()) {
                        alert("请选择要委托的卷册");
                        return false;
                    }
                }
            }
        }
        return true;
    }

    //判断是否选择了申请理由
    function checkHasCheckReason() {
        var isChecked = false;
        var $applyReason = $("input[type='checkbox'][id$=Reason]");
        for (var j = 0; j <= $applyReason.length; j++) {
            if ($($applyReason[j]).attr("checked") == "checked") {
                isChecked = true;
                break;
            }
        }
        return isChecked;
    }

    //上传文件
    function upLoadFiles1() {
        showUploadForm($currBizId, "Form");
        return true; ;
    }

    //选择合格供方筛选条件
    function qualifiedSupplierFilter() {
        var applyType = getApplyType();
        var isShowAddBtn;
        if (applyType == "勘测设计项目") {
            isShowAddBtn = "false";
        }
        else {
            isShowAddBtn = "true";
        }

        return "{SupplierType:'0',IsShowAddBtn:'" + isShowAddBtn + "'}";
    }

    //选择供方筛选条件
    function unitFilter() {
        var applyType = getApplyType();
        var isShowAddBtn;
        if (applyType == "勘测设计项目") {
            isShowAddBtn = "false";
        }
        else {
            isShowAddBtn = "true";
        }

        return "{SupplierType:'1',IsShowAddBtn:'" + isShowAddBtn + "'}";
    }
</script>
