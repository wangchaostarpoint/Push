<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidProjectInfoEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.BidProjectInfoEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register TagPrefix="uc1" TagName="UCProjectAttribute" Src="../../UI/Controls/UCProjectAttribute.ascx" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                招标编号<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText type="text" ID="txtBidNumber" runat="server" field="BIDNUMBER"
                    req="1" tablename="MBM_TENDERENTITY" class="kpms-textbox" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                工程编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="tbMarketProjectCode" runat="server" field="MARKETPROJECTCODE"
                    tablename="MBM_TENDERENTITY" class="kpms-textbox" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工程名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMarketProjectName" runat="server" MaxLength="256" field="MARKETPROJECTNAME"
                    req="1" tablename="MBM_TENDERENTITY" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                招标单位<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText type="text" ID="txtBidCustomer" runat="server" field="BIDCUSTOMERNAME"
                    req="1" tablename="MBM_TENDERENTITY" class="kpms-textbox" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                招标单位联系人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtContact" activestatus="(23.*)" class="kpms-textbox"
                    field="BIDCONTACTMANNAME" tablename="MBM_TENDERENTITY">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                招标单位地址
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbCustomerAddress" field="BIDCUSTOMERADDRESS"
                    tablename="MBM_TENDERENTITY" MaxLength="128" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                联系电话
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtContactPhone" activestatus="(23.*)"
                    class="kpms-textbox" field="BIDCONTACTMANPHONE" tablename="MBM_TENDERENTITY">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:XHtmlInputText type="text" ID="txtBidPhaseName" runat="server" field="BIDPHASENAME"
                    tablename="MBM_TENDERENTITY" class="kpms-textbox" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目类型
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" tablename="MBM_TENDERENTITY"
                    field="PROJECTTYPEID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                投标组织部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText type="text" ID="txtDeptName" runat="server" field="BIDORGDEPTNAME"
                    readonly="readonly" tablename="MBM_TENDERENTITY" class="kpms-textbox" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiBidOrgDeptID" field="BIDORGDEPTID" tablename="MBM_TENDERENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属板块<span class="req-star">*</span>
            </td>
            <td id="trResource">
                <zhongsoft:LightDropDownList ID="ddlBelongPlate" runat="server" field="BELONGPLATEID"
                    req="1" tablename="MBM_TENDERENTITY" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                承办部门
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbUndertakeDeptName" field="UNDERTAKEDEPTNAME"
                    tablename="MBM_TENDERENTITY" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                    Filter="{OrganizationLevel:'2'}" Writeable="false" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiUndertakeDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUndertakeDeptID" field="UNDERTAKEDEPTID"
                    tablename="MBM_TENDERENTITY" />
            </td>
            <td class="td-l">
                承办人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" field="UNDERTAKEUSERNAME"
                    tablename="MBM_TENDERENTITY" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" Width="100px" ResultAttr="name" EnableTheming="false"
                    Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiUndertabkeUserID':'id'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
                <input id="hiUndertabkeUserID" runat="server" type="hidden" tablename="MBM_TENDERENTITY"
                    field="UNDERTAKEUSERID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                投标性质
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblTenderCharacter" runat="server" RepeatDirection="Horizontal"
                    field="TENDERCHARACTER" tablename="MBM_TENDERENTITY" activestatus="(23.*)">
                    <asp:ListItem Value="公开">公开</asp:ListItem>
                    <asp:ListItem Value="邀请">邀请</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                计划开标日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDate" readonly="readonly"
                    class="kpms-textbox-date" field="STARTBIDDATE" tablename="MBM_TENDERENTITY" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                实际开标时间
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText type="text" ID="txtFactDate" runat="server" readonly="readonly"
                    field="FACTBIDDATE" tablename="MBM_TENDERENTITY" class="kpms-textbox-date" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否竞争性
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsCompetition" runat="server" RepeatDirection="Horizontal"
                    field="ISCOMPETITION" tablename="MBM_TENDERENTITY" activestatus="(23.*)">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                中标结果<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbTenderReslut" runat="server" RepeatDirection="Horizontal"
                    req="1" field="TENDERRESULT" tablename="MBM_TENDERENTITY" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                上报集团时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtReportDate" readonly="readonly"
                    class="kpms-textbox-date" field="REPORTDATE" tablename="MBM_TENDERENTITY" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                中止原因
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tb" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    activestatus="(23.*)" EnableTheming="false" maxtext="512" tablename="MBM_TENDERENTITY"
                    field="CANCELREASON" editFirst="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否签订合同
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbIsSignContract" runat="server" RepeatDirection="Horizontal"
                    field="ISSIGNCONTRACT" tablename="MBM_TENDERENTITY" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                预估合同额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbEstimateValue" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" MaxLength="13" activestatus="(23.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                    field="CONTRACTSUM" tablename="MBM_TENDERENTITY" errmsg="预估合同额请输入正数，最多8位整数，6位小数">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                合同额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtContractValue" activitystatus="(23.*)"
                    field="CONTRACTVALUE" tablename="MBM_TENDERENTITY" class="kpms-textbox-money">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                投标保证金（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbBidSecurityAmount" errmsg="投标保证金请输入正数，最多8位整数，6位小数"
                    EnableTheming="false" MaxLength="13" activestatus="(23.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                    field="BIDSECURITYAMOUNT" tablename="MBM_TENDERENTITY" CssClass="kpms-textbox-money">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                投标保证金是否归还
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbIsReturn" runat="server" RepeatDirection="Horizontal"
                    field="BIDSECURITYISRETURN" tablename="MBM_TENDERENTITY" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                静态投资额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbStatisticInvest" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" MaxLength="13" activestatus="(23.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                    field="STATICINVESTAMOUNT" tablename="MBM_TENDERENTITY" errmsg="静态投资额请输入正数，最多8位整数，6位小数">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                基本计算额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBasicCalcuamount" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" MaxLength="13" activestatus="(23.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                    field="BASICCALCUAMOUNT" tablename="MBM_TENDERENTITY" errmsg="基本计算额请输入正数，最多8位整数，6位小数">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                投标报价（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBidPrice" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" MaxLength="13" activestatus="(23.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                    field="BIDPRICE" tablename="MBM_TENDERENTITY" errmsg="基本计算额请输入正数，最多8位整数，6位小数">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                中标价（万元）
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbGainSum" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" MaxLength="13" activestatus="(23.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                    field="GAINSUM" tablename="MBM_TENDERENTITY" errmsg="中标价请输入正数，最多8位整数，6位小数">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                招标代理单位
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsInviteUnitName" field="INVITEUNITNAME"
                    tablename="MBM_TENDERENTITY" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                    Writeable="false" ShowAttrs="name" ResultForControls="{'hiInviteUnitId':'id','txtInviteUnitName':'name','txtBankName':'BANKNAME','txtBankAccount':'BANKACCOUNT'}"
                    PageUrl="~/MM/Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiInviteUnitId" field="INVITEUNITID" tablename="MBM_BIDPLANFIXORCHANGE" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                开户行
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBankName" field="BANKNAME" tablename="MBM_TENDERENTITY"
                    class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                账号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBankAccount" field="BANKACCOUNT"
                    tablename="MBM_TENDERENTITY" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr runat="server" displaystatus="(3.*)">
            <td colspan="6" style="text-align: right">
                新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                    Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>
                <asp:Button runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" />
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
                其他投标单位
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvOtherUnit" runat="server" ShowExport="true" UseDefaultDataSource="true"
                    DataKeyNames="OTHERBIDUNITID" AllowPaging="true" BindGridViewMethod="BindOtherUnit"
                    OnRowCommand="gvOtherUnit_RowCommand" OnRowDataBound="gvOtherUnit_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="其他投标<br/>单位名称" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" ID="txtOtherBiddingName" runat="server" req="1"
                                    activestatus="(3.*)" maxlength="64" class="kpms-textbox" value='<%#Eval("BIDUNITNAME") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="其他单位静态<br/>投资额（万元）" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbOStaticInvestAmount" runat="server" CssClass="kpms-textbox-money"
                                    MaxLength="13" Style="text-align: right;" Text='<%#Eval("STATICINVESTAMOUNT") %>'
                                    activestatus="(3.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="其他单位静态投资额请输入正数，最多8位整数，6位小数">
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="其他投标单位<br/>下浮比例(%)" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbOBidPriceDownFloatPro" runat="server" CssClass="kpms-textbox-money"
                                    MaxLength="5" Style="text-align: right;" Text='<%#Eval("BIDPRICEDOWNFLOATPRO") %>'
                                    activestatus="(3.*)" regex="^([1-9][0-9]?(\.[0-9]{1,2})?)$|^(0\.[1-9][0-9]?)$|^(0\.[0-9][1-9])$|^100(\.00)?$"
                                    errmsg="其他投标单位下浮比例请输入1-100之间的数字">
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="其他投标单位<br/>报价（万元）" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbOtherBiddingUnitPrice" runat="server" CssClass="kpms-textbox-money"
                                    MaxLength="13" Style="text-align: right;" Text='<%#Eval("BIDDINGUNITPRICE") %>'
                                    activestatus="(3.*)" regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="其他投标单位报价请输入正数，最多8位整数，6位小数">
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该{0}吗？"
                            DeleteTipField="BIDUNITNAME">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m" style="text-align: right">
                <asp:Button runat="server" ID="btnView" OnClientClick="return viewOldFileInfo();"
                    displaystatus="(123.*)" Text="查看旧平台文档"></asp:Button>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                附件
            </td>
            <td class="td-m" colspan="5">
                <asp:ImageButton ID="ibtnAttach" ImageUrl="~/Themes/Images/btn_dg_upfile.gif" runat="server"
                    Style="cursor: hand; height: 16px;" ToolTip="上传附件" CausesValidation="false" OnClientClick="upLoadFile()"
                    OnClick="ibtnAttach_Click" DisplayStatus="(3.*)" />
                <uc2:AttachmentView ID="attach" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
        <%-- <tr>
            <td colspan="6">
                <uc1:UCProjectAttribute ID="ucProejctAtt" runat="server"></uc1:UCProjectAttribute>
            </td>
        </tr>--%>
    </table>
    <!----投标工程扩展表主键ID---->
    <input type="hidden" runat="server" id="hiTenderEntityID" tablename="MBM_TENDERENTITY"
        field="TENDERENTITYID" />
    <!--工程实体表信息-->
    <input type="hidden" runat="server" id="hiMarketProjectID" field="MARKETPROJECTID"
        tablename="MBM_TENDERENTITY" />
    <!--投标计划安排流程主键ID-->
    <input type="hidden" runat="server" id="hiProjectInfoID" field="PROJECTINFOID" tablename="MBM_TENDERENTITY" />
    <!---设置投标信息-->
    <input type="hidden" runat="server" id="hiFileSourceID" field="FILESOURCEID" tablename="MBM_TENDERENTITY" />
    <input type="hidden" runat="server" id="hiFlag" field="FLAG" tablename="MBM_TENDERENTITY" />
    <script>
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        //上传证书
        function upLoadFile() {
            var fileSourceId = $("#<%=hiFileSourceID.ClientID %>").val();
            showUploadForm(fileSourceId, "Module");
            return true;
        }

        function viewOldFileInfo() {
            var marketID = $("#<%=hiTenderEntityID.ClientID %>").val();
            //            var url = "<%=DicpUrl%>/Modules/WebForm/BusinessDetail.aspx?ControlUrl=ManageManagement/TenderFlowsAndDocs.ascx&ActionType=2&CaseID=" + marketID;
            var url = "<%=DicpUrl%>/Modules/WebForm/BusinessDetail.aspx?ControlUrl=ManageManagement/TenderFlowsAndDocs.ascx&ActionType=1&CaseID=" + marketID;
            window.open(url);
        }

    </script>
</asp:Content>
