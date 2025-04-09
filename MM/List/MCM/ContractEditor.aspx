<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractEditor.aspx.cs"
    Title="合同详细" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register TagPrefix="uc1" TagName="UCCurrency" Src="../../UI/Controls/UCCurrency.ascx" %>
<%@ Register TagPrefix="uc2" TagName="UCMainBody" Src="../../UI/Controls/UCMainBody.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UCContractRelProjectInfo" Src="../../UI/Controls/UCContractRelProjectInfo.ascx" %>
<%@ Register TagPrefix="uc4" TagName="UCContractRelFile" Src="../../UI/Controls/UCContractRelFile.ascx" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="<%=WebAppPath %>/FM/UI/Script/FMGeneralScript.js"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">合同编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                    req="1" maxlength="32" tablename="MCM_CONTRACTENTITY" field="CONTRACTCODE" activestatus="(23.*)" />
            </td>
            <%--            <td class="td-l">
                归档编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtFileNo" runat="server" type="text" class="kpms-textbox"
                    MaxLength="16" tablename="MCM_CONTRACTENTITY" field="FILENUM" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>--%>
            <td class="td-l">合同名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox type="text" ID="tbContractName" runat="server" field="CONTRACTNAME"
                    req="1" tablename="MCM_CONTRACTENTITY" activestatus="(23.*)" MaxLength="64" />
            </td>
        </tr>
        <tr>
            <td class="td-l">合同类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlContractType" runat="server" field="PARAMCONTRACTTYPEID"
                    req="1" tablename="MCM_CONTRACTENTITY" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiContractTypeName" field="CONTRACTTYPENAME"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
            <td class="td-l">合同地域<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbRegion" runat="server" RepeatDirection="Horizontal" tablename="MCM_CONTRACTENTITY"
                    req="1" field="REGION" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">所属行业
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlBelongPlate" runat="server" field="BELONGPLATEID"
                    tablename="MCM_CONTRACTENTITY" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同承办部门
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlUndertakeDeptID" Field="UNDERTAKEDEPTID" tableName="MCM_CONTRACTENTITY"
                    activestatus="(23.*)" runat="server">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiUndertakeDeptName" field="UNDERTAKEDEPTNAME"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
            <td class="td-l">合同承办人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbUndertakeUserName" field="UNDERTAKEUSERNAME"
                    tablename="MCM_CONTRACTENTITY" activestatus="(23.*)" SourceMode="SelectorPage"
                    SelectPageMode="Dialog" ShowJsonRowColName="true" DoCancel="true" Width="100px"
                    ResultAttr="name" EnableTheming="false" FilterFunction="selUndertakeUser();"
                    Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiUndertakeserID':'id'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUndertakeserID" field="UNDERTAKEUSERID"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
            <td class="td-l">合同归口部门
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlCentralisedDept" Field="CENTRALISEDDEPTID" tableName="MCM_CONTRACTENTITY"
                    activestatus="(23.*)" runat="server">
                </zhongsoft:LightDropDownList>
                <input id="hiCentralisedDeptName" type="hidden" field="CENTRALISEDDEPTNAME" runat="server"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">合同查阅部门
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlCheckDeptID" Field="CHECKEDDEPTID" tableName="MCM_CONTRACTENTITY"
                    activestatus="(23.*)" runat="server">
                </zhongsoft:LightDropDownList>
                <input id="hiCheckedDpetName" type="hidden" field="CHECKDEPTNAME" runat="server"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
            <td class="td-l">查阅人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" field="CHECKUSERNAME"
                    SelectPageMode="Dialog" tablename="MCM_CONTRACTENTITY" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px"
                    ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                    IsMutiple="true" ResultForControls="{'hiCheckUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input id="hiCheckUserID" runat="server" type="hidden" tablename="MCM_CONTRACTENTITY"
                    field="CHECKUSERID" />
            </td>
            <td class="td-l">是否列入计划
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbIsPlan" runat="server" RepeatDirection="Horizontal" needcontrol="true"
                    tablename="MCM_CONTRACTENTITY" field="ISSETPLAN" activestatus="(23.*)">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">收费情况
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbChargeState" runat="server" RepeatDirection="Horizontal"
                    needcontrol="true" tablename="MCM_CONTRACTENTITY" field="CHARGESTATE" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">合同状态
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbContractState" runat="server" RepeatDirection="Horizontal"
                    tablename="MCM_CONTRACTENTITY" field="CONTRACTSTATE" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">中止/注销/呆账时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSpecialDate" type="text" class="kpms-textbox-date"
                    readonly="readonly" activestatus="(23.*)" field="SPECIALDATE" tablename="MCM_CONTRACTENTITY">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">变更/结算/批概合同额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtChangeSettleValue" tablename="MCM_CONTRACTENTITY"
                    class="kpms-textbox-money" field="CHANGESETTLEVALUE" activestatus="(23.*)" />
            </td>
            <td class="td-l">完成合同额(万元)
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtHadCompleteValue" tablename="MCM_CONTRACTENTITY"
                    readonly="readonly" class="kpms-textbox-money" field="HADCOMPLETEVALUE" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">合同总额(万元)
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtContractValue" tablename="MCM_CONTRACTENTITY"
                    readonly="readonly" maxlength="32" class="kpms-textbox-money" field="CONTRACTVALUE"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">累计收费额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtHadCharge" tablename="MCM_CONTRACTENTITY"
                    readonly="readonly" class="kpms-textbox-money" field="HADCHARGE" activestatus="(23.*)" />
            </td>
            <td class="td-l">签订日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtSignDate" tablename="MCM_CONTRACTENTITY"
                    readonly="readonly" class="kpms-textbox-date" field="SIGNDATE" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">合同项目类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlContractProjType" runat="server" field="CONTRACTPROJTYPE"
                    tablename="MCM_CONTRACTCHECKFORM" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-m" colspan="4"></td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">合同主体
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <uc2:UCMainBody ID="ucMainBody" runat="server"></uc2:UCMainBody>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">合同金额
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m">
                <uc1:UCCurrency ID="ucCurrency" runat="server"></uc1:UCCurrency>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同额更改说明
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemmo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTENTITY" field="VALUECHANGEEXPLAIN"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="MCM_CONTRACTENTITY" field="MEMO"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiTest" />
            </td>
        </tr>
        <tr class="trProject">
            <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">合同关联项目
            </td>
        </tr>
        <tr class="trProject">
            <td colspan="6">
                <uc3:UCContractRelProjectInfo ID="ucRelProjectInfo" runat="server"></uc3:UCContractRelProjectInfo>
            </td>
        </tr>
        <tr class="trProject">
            <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">合同相关流程
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvRelateForms" runat="server" AllowPaging="true"
                    PageSize="15" BindGridViewMethod="BindInvoiceDisuse" AutoGenerateColumns="false"
                    UseDefaultDataSource="true">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="FLOWNAME" HeaderText="流程名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="CREATEUSERNAME" HeaderText="创建人">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="CREATEDATE" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" DataParamFields="MCMFORMID,ISOLD"
                            ImageUrl="../../../Themes/Images/btn_dg_view.gif" EditItemClick="viewFlowDetail"
                            ItemStyle-Width="40px">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr class="trProject">
            <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">合同相关文件
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvAllContractFile" runat="server" AllowPaging="true"
                    UseDefaultDataSource="true" AutoGenerateColumns="false" DataKeyNames="FILEDETAILID"
                    OnRowDataBound="gvAllContractFile_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="文件名称">
                            <ItemTemplate>
                                <a runat="server" id="aFileName" style="text-decoration: underline; color: #0033FF;">
                                    <%#Eval("FILENAME")%></a>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <span class="req-star">请点击按钮上传文档（word或excel格式）</span>
            </td>
        </tr>
        <tr id="Tr1" runat="server" displaystatus="(3.*)">
            <td colspan="6" style="text-align: right">
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" CssClass="subtoolbarlink"
                    EnableTheming="false" OnClick="btnAdd_Click"> <span>
                            <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/ico_fujian.gif" alt="上传相关资料" width="16"
                                height="16" />上传文件</span></zhongsoft:LightFileUploader>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                    AutoGenerateColumns="false" DataKeyNames="FILEDETAILID" OnRowCommand="gvList_RowCommand"
                    ShowExport="true" OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="文件名称">
                            <ItemTemplate>
                                <a runat="server" id="aFileName" style="text-decoration: underline; color: #0033FF;">
                                    <%#Eval("FILENAME")%></a>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiFilePath" value='<%#Eval("FILEPATH") %>' />
                                <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                    EnableTheming="false" CommandArgument='<%#Eval("FILEDETAILID") %>'><img id="btDelete" title="删除" style="CURSOR: hand" src="../../../Themes/Images/btn_dg_delete.gif" border="0"></asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">合同收费信息
            </td>
        </tr>
        <tr id="Tr2" runat="server">
            <td colspan="6" align="right">
                <span style="float: right;" id="spanAddProject" runat="server">
                    <asp:LinkButton runat="server" ID="lbtnAddProject" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClientClick="return AddChargeInfo()">
                        <span>
                            <img id="Img2" runat="server" src="~/Themes/Images/btn_add.gif" alt="添加收费信息" width="16"
                                height="16" />添加收费信息</span>
                    </asp:LinkButton>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvContractCharge" runat="server" AllowPaging="true"
                    UseDefaultDataSource="true" AutoGenerateColumns="false" BindGridViewMethod="BindContractChargeInfo"
                    ShowExport="true">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="PAYREQUISITIONNAME" HeaderText="到款通知单名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="RECEIVEDATE" HeaderText="到款时间" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="CURRENTCHARGEAMOUNT" HeaderText="到款金额（万元）"
                            ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightButtonField HeaderText="查看" DataParamFields="CONTRACTCHARGEFORMID,ISOLD,CONTRACTID,RECEIVECORPDETAILID"
                            EditItemClick="viewChargeFlowDetail" ImageUrl="../../../Themes/Images/btn_dg_view.gif"
                            ItemStyle-Width="40px">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiContractID" field="CONTRACTID" tablename="MCM_CONTRACTENTITY" />
    <!----记录要中止的合同是否 生产不立项----->
    <input type="hidden" runat="server" id="hiNotBuild" field="NOTBUILD" tablename="MCM_CONTRACTENTITY" />
    <!---是否已返回--->
    <input type="hidden" runat="server" id="hiIsReturn" field="ISRETURN" tablename="MCM_CONTRACTENTITY" />
    <input type="hidden" runat="server" id="hiFlag" field="FLAG" tablename="MCM_CONTRACTENTITY" />
    <!--合同基础类型--->
    <input type="hidden" runat="server" id="hiBaseType" field="BASETYPE" tablename="MCM_CONTRACTENTITY"
        value="合同" />
    <input type="hidden" runat="server" id="hiFileSourceID" field="FILESOURCEID" tablename="MCM_CONTRACTENTITY" />
    <asp:Button runat="server" ID="btnReloadList" Visible="False" OnClick="btnReloadList_OnClick" />
    <script>

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            if (typeof (ucCurrency_Init) == "function") {
                ucCurrency_Init();
            }
            if (typeof (ucMainBody_Init) == "function") {
                ucMainBody_Init();
            }
            if (typeof (ucContractRelProject_Init) == "function") {
                ucContractRelProject_Init();
            }

            if ("<%=ActionType %>" != "Read") {
                accessOfMainSureDisplay(false);
                accessOfSureDisplay(false);
            }
            else {
                accessOfMainSureDisplay(true);
                accessOfSureDisplay(true);
            }
            accessOfAddProDisplay();
        }

        function checkForm() {
            //合同相对方和合同金额必须填写
            if ("<%=ActionType %>" != "Read") {
                if (getMainBodyNum() < 1) {
                    alert("请填写合同相对方信息");
                    return false;
                }
                if (getCurrencyNum() < 1) {
                    alert("请填写合同金额信息");
                    return false;
                }

            }
            return true;
        }

        //查看流程信息
        function viewFlowDetail(bizid, isOld) {
            if (bizid == null || bizid == "" || bizid == undefined) {
                alert("该数据为历史数据导入，无可查看流程！");
                return;
            }
            var urlStr = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizid, IsOld: isOld });
            window.open(urlStr);
            return false;
        }

        //查看收费流程信息
        function viewChargeFlowDetail(bizid, isOld, CONTRACTID, RECEIVECORPDETAILID) {
            if (bizid == "NULL" || bizid == "" || bizid == undefined || bizid == null) {
                viewNoFlowDetail(CONTRACTID, RECEIVECORPDETAILID);
                return;
            }
            var urlStr = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizid, IsOld: isOld });
            window.open(urlStr);
            return false;
        }
        //查看非收费流程信息
        function viewNoFlowDetail(CONTRACTID, RECEIVECORPDETAILID) {
            var urlStr = buildQueryUrl("/MM/List/MCM/ContractChargeAdd.aspx", { CONTRACTID: CONTRACTID, RECEIVECORPDETAILID: RECEIVECORPDETAILID, actionType: 1 });
            showDivDialog(urlStr, null, 800, 500, AddProjectCallBack);
            return false;
        }

        //选择客户联系人信息
        function selUndertakeUser() {
            var undertakeDeptID = $("#<%=ddlUndertakeDeptID.ClientID %>").val();
            if (undertakeDeptID == "") {
                alert("请选择合同承办部门");
                return false;
            }
            return "{OrganizationId:'" + undertakeDeptID + "'}";
        }

        //添加收费信息
        function AddChargeInfo() {
            var url = buildQueryUrl("/MM/List/MCM/ContractChargeAdd.aspx", { CONTRACTID: $("#<%=hiContractID.ClientID %>").val(), actionType: 2 });
            showDivDialog(url, null, 800, 500, AddProjectCallBack);
            return false;
        }

        function AddProjectCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnReloadList,"") %>
        }


    </script>
</asp:Content>
