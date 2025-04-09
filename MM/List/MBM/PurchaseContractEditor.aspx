<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseContractEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.PurchaseContractEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="采购合同详细" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                合同编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractCode" runat="server" tablename="MCM_CONTRACTENTITY"
                    req="1" MaxLength="32" field="CONTRACTCODE" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                归档编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbReturnCode" runat="server" tablename="MCM_CONTRACTENTITY"
                    MaxLength="16" field="FILENUM" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbContractName" runat="server" tablename="MCM_CONTRACTENTITY"
                    req="1" field="CONTRACTNAME" MaxLength="64" activestatus="(23.*)" />
            </td>
        </tr>
        <tr id="parentContract">
            <td class="td-l">
                主合同名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsPurchaseContract" field="PARENTCNAME"
                    tablename="MCM_CONTRACTENTITY" activestatus="(23.*)" SelectPageMode="Dialog"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" Writeable="false" ShowAttrs="name" ResultForControls="{'hiParentId':'id'}"
                    PageWidth="750" Filter="{IsOutsourcing:'1'}" PageUrl="~/MM/Obsolete/ContractSelector.aspx">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiParentId" field="PARENTCID" tablename="MCM_CONTRACTENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同类型
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblContractAddState" runat="server" RepeatDirection="Horizontal"
                    field="NEWORADD" tablename="MCM_CONTRACTENTITY" activestatus="(23.*)">
                    <asp:ListItem Value="0" Selected="True">新签</asp:ListItem>
                    <asp:ListItem Value="1">补充</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                采购合同类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlContractType" activestatus="(23.*)" runat="server"
                    req="1" tablename="MCM_CONTRACTENTITY" field="PARAMCONTRACTTYPEID" Width="100%">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiContractTypeName" field="CONTRACTTYPENAME"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                采购方式<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rblPurchaseType" runat="server" RepeatDirection="Horizontal"
                    req="1" field="PURCHASETYPE" tablename="MCM_CONTRACTENTITY" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                采购合同相对方<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsContractRelativesName" PageUrl="~/MM/Obsolete/SupplierSelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" Filter="{SupplierType:'2'}" ActiveStatus="(23.*)"
                    SelectPageMode="Dialog" SourceMode="SelectorPage" field="CONTRACTRELATIVESNAME"
                    tablename="MBM_PURCHASEAPPLYORBGFORM" req="1" ResultForControls="{'hiContractRelativesId':'id'}" />
                <input type="hidden" id="hiContractRelativesId" runat="server" field="CONTRACTRELATIVESID"
                    tablename="MBM_PURCHASECONTRACTSPFORM" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                采购合同额（万元）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractMoney" Field="CONTRACTVALUE" regex="^[-+]?([[1-9]\d{0,7}(\.\d{1,6})?$)|(^[0](\.\d{1,6})?$)"
                    errmsg="请输入数字，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                    req="1" tableName="MCM_CONTRACTENTITY" activestatus="(23.*)" runat="server" onblur="checkValue()">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                采购申请部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlApplyId" Field="APPLYID" tableName="MCM_CONTRACTENTITY"
                    req="1" activestatus="(23.*)" runat="server">
                </zhongsoft:LightDropDownList>
                <input type="hidden" id="hiApplyName" runat="server" field="APPLYNAME" tablename="MCM_CONTRACTENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同承办部门
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlUndertakeDeptID" Field="UNDERTAKEDEPTID" tableName="MCM_CONTRACTENTITY"
                    activestatus="(23.*)" runat="server">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiUndertakeDeptName" field="UNDERTAKEDEPTNAME"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
            <td class="td-l">
                合同承办人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbUndertakeUserName" field="UNDERTAKEUSERNAME"
                    SelectPageMode="Dialog" tablename="MCM_CONTRACTENTITY" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px"
                    ResultAttr="name" EnableTheming="false" FilterFunction="selUndertakeUser();"
                    Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiUndertakeserID':'id'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUndertakeserID" field="UNDERTAKEUSERID"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同状态
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rbContractState" runat="server" RepeatDirection="Horizontal"
                    tablename="MCM_CONTRACTENTITY" field="CONTRACTSTATE" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                签订日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtSignDate" tablename="MCM_CONTRACTENTITY"
                    readonly="readonly" class="kpms-textbox-date" field="SIGNDATE" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                录入日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtCreat" tablename="MCM_CONTRACTENTITY"
                    readonly="readonly" class="kpms-textbox-date" field="FILLDATE" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtMemo" Field="MEMO" tableName="MCM_CONTRACTENTITY"
                    activestatus="(23.*)" runat="server" maxtext="256" class="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" Rows="5">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                附件
            </td>
            <td class="td-m" colspan="3">
                <%--  <asp:ImageButton ID="ibtnAttach" ImageUrl="~/Themes/Images/btn_dg_upfile.gif" runat="server"
                    Style="cursor: hand; height: 16px;" ToolTip="上传附件" CausesValidation="false" OnClientClick="upLoadFile()"
                    OnClick="ibtnAttach_Click" DisplayStatus="(3.*)" />--%>
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" CssClass="subtoolbarlink"
                    EnableTheming="false" OnClick="lbtnUpload_Click"> <span>
                            <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/ico_fujian.gif" alt="上传相关资料" width="16"
                                height="16" />上传文件</span></zhongsoft:LightFileUploader>
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiContractId" tablename="MCM_CONTRACTENTITY" field="CONTRACTID"
        runat="server" />
    <input type="hidden" runat="server" id="hiCheckID" />
    <input type="hidden" runat="server" id="hiFileSourceID" field="FILESOURCEID" tablename="MCM_CONTRACTENTITY" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="MCM_CONTRACTENTITY" />
    <input type="hidden" runat="server" id="hiIsReturn" field="ISRETURN" tablename="MCM_CONTRACTENTITY" />
    <!--合同基础类型--->
    <input type="hidden" runat="server" id="hiBaseType" field="BASETYPE" tablename="MCM_CONTRACTENTITY"
        value="外委合同" />
    <script type="text/javascript">
        //上传证书
        function upLoadFile() {

            var fileSourceId = $("#<%=hiFileSourceID.ClientID %>").val();
            showUploadForm(fileSourceId, "Module");
            return true;
        }

        function initCustomerPlugin() {
            //验证正则表达式
            checkRegex();
            //验证正则表达式
            checkMaxLength();

            //合同类型若为新签，则采购合同名称手填；若为补充，则为选择
            var contractType = $("#<%=rblContractAddState.ClientID %> input[type='radio']:checked").val();
            setContractTypeControl(contractType);

            $('#<%=rblContractAddState.ClientID %>').click(function () {
                var type = $("#<%=rblContractAddState.ClientID %> input[type='radio']:checked").val();
                setContractTypeControl(type);
            })
        }

        //选择承办人信息
        function selUndertakeUser() {
            var undertakeDeptID = $("#<%=ddlUndertakeDeptID.ClientID %>").val();
            if (undertakeDeptID == "") {
                alert("请选择合同承办部门");
                return false;
            }
            return "{OrganizationId:'" + undertakeDeptID + "'}";
        }

        //合同类型若为新签，则采购合同名称手填；若为补充，则为选择
        function setContractTypeControl(contractType) {
            if (contractType == "0") {
                $("#parentContract").hide();
                $('#<%=lbsPurchaseContract.ClientID %>').removeAttr('req');
            }
            else {
                $("#parentContract").show();
                $('#<%=lbsPurchaseContract.ClientID %>').attr('req', '1');
            }
            checkValue();
        }

        //合同类型为新签时，采购合同额不可以为负数，合同类型为补充时，采购合同额可以为负数
        function checkValue() {
            var contractMoney = $("#<%=tbContractMoney.ClientID %>").val();
            if (contractMoney != "") {
                var contractType = $("#<%=rblContractAddState.ClientID %> input[type='radio']:checked").val();
                if (contractType == "0") {
                    if (contractMoney < 0) {
                        alert("新签合同的采购合同额不可以为负数！");
                        $("#<%=tbContractMoney.ClientID %>").val("");
                    }
                }
            }
        }
    </script>
</asp:Content>
