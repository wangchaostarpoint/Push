<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_GridBidPlanFixChange.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_GridBidPlanFixChange" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            投标计划安排<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rbPlanOrChange" field="PLANORCHAGE" tablename="MBM_BIDPLANFIXORCHANGE"
                RepeatDirection="Horizontal" req="1" activestatus="(2.发起投标计划安排/变更流程)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            招标编号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbBidNumber" field="BIDNUMBER" tablename="MBM_BIDPLANFIXORCHANGE"
                MaxLength="36" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="trProjectIssued">
        <td class="td-l" nowrap>
            计划名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskName" field="TASKNAME" tablename="MBM_BIDPLANFIXORCHANGE"
                class="kpms-textbox" activestatus="(23.发起投标计划安排/变更流程)(3.修改投标计划安排/变更流程)" MaxLength="158">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr id="trChangePlan">
        <td class="td-l" nowrap>
            投标计划安排<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtChangeTaskName" field="TASKNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(2.发起投标计划安排/变更流程)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" Writeable="false"
                Filter="{'IsGridPlan':'1'}" ShowAttrs="name" ResultForControls="{'hiTaskName':'name','hiOldBidPlanOrChangeID':'id'}"
                PageWidth="850" OnClick="btnTaskName_Click" PageUrl="~/MM/Obsolete/BidPlanSelector.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiTaskName" field="TASKNAME" tablename="MBM_BIDPLANFIXORCHANGE" />
            <input type="hidden" runat="server" id="hiOldBidPlanOrChangeID" field="OLDBIDPLANORCHANGEID"
                tablename="MBM_BIDPLANFIXORCHANGE" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="losCustomerName" field="CUSTOMERNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrs="name" ResultForControls="{'hiCustomerID':'id','tbCustomerAddress':'ADDRESS'}"
                PageUrl="~/MM/Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiCustomerID" field="CUSTOMERID" tablename="MBM_BIDPLANFIXORCHANGE" />
        </td>
        <td class="td-l">
            招标单位联系人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContactName" field="CONTACTMANNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                OnClientClick="return selContact()" Writeable="false" ShowAttrs="name" ResultForControls="{'hiContactID':'id'}"
                PageUrl="~/MM/Obsolete/CustomerContactSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input id="hiContactID" type="hidden" field="CONTACTMANID" runat="server" tablename="MBM_BIDPLANFIXORCHANGE" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标单位地址<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbCustomerAddress" field="CUSTOMERADDRESS"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="128" req="1" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            联系人电话<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContactPhone" field="CONTACTMANPHONE"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="16" req="1" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            承办部门
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbUndertakeDeptName" field="UNDERTAKEDEPTNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Filter="{OrganizationLevel:'2'}" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiUndertakeDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiUndertakeDeptID" field="UNDERTAKEDEPTID"
                tablename="MBM_BIDPLANFIXORCHANGE" />
        </td>
        <td class="td-l">
            承办人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbUndertakeUserName" field="UNDERTAKEUSERNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px"
                ResultAttr="name" EnableTheming="false" FilterFunction="selUndertakeUser();"
                Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiUndertakeserID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiUndertakeserID" field="UNDERTAKEUSERID"
                tablename="MBM_BIDPLANFIXORCHANGE" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            商务文件递交时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBusinessdocSubmit" class="kpms-textbox-date"
                req="1" tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" field="BUSINESSDOCSUBMIT"
                activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
        <td class="td-l" nowrap>
            技术文件递交时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTechnologydocSubmit" class="kpms-textbox-date"
                req="1" tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" field="TECHNOLOGYDOCSUBMIT"
                activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
        <td class="td-l" nowrap>
            投标报价递交时间<span class="req-star">*</span>
        </td>
        <td>
            <zhongsoft:XHtmlInputText runat="server" ID="txtBiddingDocSubmit" req="1" tablename="MBM_BIDPLANFIXORCHANGE"
                readonly="readonly" class="kpms-textbox-date" field="BIDDINGDOCSUBMIT" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投标文件递交地点<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbTbBidSubmitPlace" field="TBBIDSUBMITPLACE"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="128" req="1" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                Width="96%"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否竞争性<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsCompetition" runat="server" RepeatDirection="Horizontal"
                req="1" field="ISCOMPETITION" tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
                <asp:ListItem Value="1">竞争性</asp:ListItem>
                <asp:ListItem Value="0">非竞争性</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            接标时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtSplicingDateTime" req="1"
                tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" class="kpms-textbox-comparedate"
                compare="1" field="SPLICINGDATETIME" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
        <td class="td-l">
            开标日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDay" req="1"
                tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" class="kpms-textbox-comparedate"
                compare="1" field="STARTBIDDAY" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            相关部门<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList ID="cblDept" runat="server" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                RepeatColumns="7" req="1" RepeatDirection="Horizontal">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiReceiveDept" field="RELEVANTDEPTID" tablename="MBM_BIDPLANFIXORCHANGE" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投标性质<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList ID="rblTenderCharacter" runat="server" RepeatDirection="Horizontal"
                req="1" field="TENDERCHARACTER" tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
                <asp:ListItem Value="公开">公开</asp:ListItem>
                <asp:ListItem Value="邀请">邀请</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标代理单位
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtInviteUnitName" field="INVITEUNITNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrsLightObjectSelector="name" ResultForControls="{'hiInviteUnitId':'id','txtInviteUnitName':'INVITEUNITNAME','txtBankName':'BANKNAME','txtBankAccount':'BANKACCOUNT'}"
                PageUrl="~/MM/Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiInviteUnitId" field="INVITEUNITID" tablename="MBM_BIDPLANFIXORCHANGE" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            包信息列表
        </td>
    </tr>
    <tr id="trSure">
        <td colspan="6" style="text-align: right">
            新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click"
                Text="确定" OnClientClick="return checkFillNum()" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvPackage" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                UseDefaultDataSource="true" DataKeyNames="PACKAGEDETAILID" ShowHeaderWhenEmpty="true"
                OnRowCommand="gvPackage_RowCommand" PageSize="100" ShowExport="true" BindGridViewMethod="BindPackage"
                OnRowDataBound="gvPackage_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="包号<span class='req-star'>*</span>" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlPackage" req="1">
                            </zhongsoft:LightDropDownList>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="标段号<span class='req-star'>*</span>" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbBidNumber" runat="server" class="kpms-textbox" req="1"
                                Text='<%# Eval("BIDNUM") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="包名称<span class='req-star'>*</span>" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPackageName" runat="server" req="1" Text='<%# Eval("PACKAGENAME") %>'
                                activestatus="(3.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="工程立项审批单<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiProjectInfoFormID" value='<%#Eval("PROJECTINFOID") %>' />
                            <zhongsoft:LightObjectSelector runat="server" ID="txtTaskName" req="1" activestatus="(2.*)"
                                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Value='<%#Eval("TASKNAME") %>'
                                ResultAttr="name" ShowAttrs="name" ResultForControls="{'hiProjectInfoFormID':'id','txtProvinceName':'PROVINCENAME','txtAreaName':'AREANAME','txtPlateName':'BELONGPLATENAME'}"
                                PageUrl="~/MM/Obsolete/ProjectTaskSelector.aspx"></zhongsoft:LightObjectSelector>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="省份" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText runat="server" ID="txtProvinceName" value='<%#Eval("PROVINCENAME") %>'
                                class="kpms-textbox" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="地区/国家" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText runat="server" ID="txtAreaName" value='<%#Eval("AREANAME") %>'
                                class="kpms-textbox" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="板块" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText runat="server" ID="txtPlateName" value='<%#Eval("BELONGPLATENAME") %>'
                                class="kpms-textbox" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField HeaderText="审批单" EditItemClick="viewDetail" DataParamFields="PROJECTINFOID"
                        CommandName="ViewData" />
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该包信息吗？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---投标流程主键ID-->
<input type="hidden" runat="server" id="hiBidPlanFixChangeId" field="BIDPLANFIXORCHANGEID"
    tablename="MBM_BIDPLANFIXORCHANGE" />
<!--创建人信息-->
<input type="hidden" runat="server" id="hiCreateUserID" field="CREATEUSERID" tablename="MBM_BIDPLANFIXORCHANGE" />
<input type="hidden" runat="server" id="hiIsGridPlan" field="ISGRIDPLAN" tablename="MBM_BIDPLANFIXORCHANGE"
    value="1" />
<script>

    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();
        trPlanChangeShowOrHide();
        $("#<%=rbPlanOrChange.ClientID %>").live("change", function () { trPlanChangeShowOrHide() });
        accessOfSureDisplay();
    }

    //确定行是否隐藏
    function accessOfSureDisplay() {
        var enabled = "<%=Enabled %>";
        if (enabled.toLocaleLowerCase() == "true") {
            $("#trSure").show();
        }
        else {
            $("#trSure").hide();
        }
    }

    function getRadlName(radl) {
        var selectVal = "";
        $("#" + radl + " input").each(function () {
            if ($(this)[0].checked) {
                selectVal = $(this).siblings(0).html();
                return false;
            }
        });
        return selectVal;
    }

    function trPlanChangeShowOrHide() {
        //如果是投标计划，则选择工程立项审批流程
        var palnType = $("#<%=rbPlanOrChange.ClientID %> input[type=radio]:checked").val();
        if (palnType == "1") {
            $("#trProjectIssued").hide();
            $("#trChangePlan").show();
            $("#<%=txtTaskName.ClientID %>").removeAttr("req");
        }
        else {
            $("#trProjectIssued").show();
            $("#<%=txtTaskName.ClientID %>").attr("req", "1");
            $("#trChangePlan").hide();
        }
    }

    //选择客户联系人信息
    function selContact() {
        var customerID = $("#<%=hiCustomerID.ClientID %>").val();
        if (customerID == "") {
            alert("请选择招标单位");
        }
        else {
            var param = new InputParamObject("s");
            var json = "{CUSTOMERID: '" + customerID + "' }";
            var reObj = getCustomerContact('re', param, json);
            if (reObj != null) {
                $("#<%=txtContactName.ClientID %>").val(reObj.getName());
                $("#<%=txtContactName.ClientID %>").next().val(reObj.getName());
                $("#<%=hiContactID.ClientID %>").val(reObj.getId());
                $("#<%=tbContactPhone.ClientID %>").val(reObj.buildAttrJson("o", "PHONE"));
            }
        }
        return false;
    }

    //选择承办人信息
    function selUndertakeUser() {
        var undertakeDeptID = $("#<%=hiUndertakeDeptID.ClientID %>").val();
        if (undertakeDeptID == "") {
            alert("请选择承办部门");
            return false;
        }
        return "{OrganizationId:'" + undertakeDeptID + "'}";
    }

    function viewDetail() {
        var urlStr = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizid, IsOld: isold });
        window.open(urlStr);
        return false;
    }
</script>
