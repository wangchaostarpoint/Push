<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SRPMProjectMemberEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.TSM.List.TSM.SRPMProjectMemberEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                是否外单位协作人员
            </td>
            <td class="td-r" colspan="3">
                <asp:CheckBox ID="cbIsCooperationUnitUser" runat="server" ActiveStatus="(2.*)" Text="是" />
                <input type="hidden" runat="server" id="hiIsCoUser" field="IsCooperationUnitUser"
                    tablename="SRPM_MemberOfWF" />
                <zhongsoft:LightDropDownList ID="ddlCooperationUnit" runat="server" CssClass="kpms-ddl"
                    field="CooperationUnitID" tablename="SRPM_MemberOfWF" ActiveStatus="(23.*)" Visible="false">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiCooperationUnitName" field="CooperationUnitName"
                    tablename="SRPM_MemberOfWF" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r" nowrap="nowrap">
                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" class="kpms-textbox-short"
                    Field="UserName" TableName="SRPM_MemberOfWF" readonly="readonly" req="1" ActiveStatus="(23.*)">
                </zhongsoft:XHtmlInputText>
                <asp:LinkButton ID="lbtnSelectUser" runat="server" CssClass="btn-look-up" EnableTheming="false"
                    displaystatus="(2.*)">
                    <img alt="选择人员" src="<%=WebAppPath %>/Themes/Images/look-up.gif" onclick="return selectUser();" />
                </asp:LinkButton>
                <input type="hidden" runat="server" id="hiUserId" field="UserID" tablename="SRPM_MemberOfWF" />
            </td>
            <td class="td-l">
                年龄<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAge" runat="server" Field="Age" TableName="SRPM_MemberOfWF"
                    CssClass="kpms-textbox-money" EnableTheming="false" ActiveStatus="(23.*)" req="1"
                    regex="^[1-9]\d*$" errmsg="-请输入正整数！" maxtext="2"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                身份证<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbIdCardNO" runat="server" Field="IdentityCardNO" TableName="SRPM_MemberOfWF"
                    CssClass="kpms-textbox-money"  ActiveStatus="(23.*)" req="1"
                    regex="^[1-9]\d*$" errmsg="-请输入正整数！" maxtext="32"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                从事专业
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="LightTextBox2" runat="server" Field="SPECIALTY" TableName="SRPM_MemberOfWF"
                    CssClass="kpms-textbox-money" EnableTheming="false" ActiveStatus="(23.*)" ></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                职称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlJobRank" runat="server" CssClass="kpms-ddl" EnableTheming="false"
                    req="1" Field="JobRank" TableName="SRPM_MemberOfWF" ActiveStatus="(23.*)" Visible="false">
                    <asp:ListItem Text="请选择" Value=""></asp:ListItem>
                    <asp:ListItem Text="高级" Value="高级"></asp:ListItem>
                    <asp:ListItem Text="中级" Value="中级"></asp:ListItem>
                    <asp:ListItem Text="初级" Value="初级"></asp:ListItem>
                </zhongsoft:LightDropDownList>
                <zhongsoft:LightTextBox ID="tbJobRank" runat="server" Field="JobRank" TableName="SRPM_MemberOfWF"
                    maxtext="32" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                职务<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbDuty" runat="server" Field="Duty" TableName="SRPM_MemberOfWF"
                    maxtext="32" req="1" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                学历
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbEduction" runat="server" Field="Eduction" TableName="SRPM_MemberOfWF"
                    maxtext="16" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                角色<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlRole" runat="server" CssClass="kpms-ddl" EnableTheming="false"
                    req="1" Field="Role" TableName="SRPM_MemberOfWF" ActiveStatus="(23.*)">
                    <asp:ListItem Text="请选择" Value=""></asp:ListItem>
                    <asp:ListItem Text="负责人" Value="负责人"></asp:ListItem>
                    <asp:ListItem Text="主编人" Value="主编人"></asp:ListItem>
                    <asp:ListItem Text="参编人" Value="参编人"></asp:ListItem>
                    <asp:ListItem Text="顾问" Value="顾问"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所在单位
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlDeptID" runat="server" CssClass="kpms-ddl" EnableTheming="false"
                    Field="DeptID" TableName="SRPM_MemberOfWF" ActiveStatus="(23.*)" />
                <input type="hidden" runat="server" id="hiDeptName" field="DeptName" tablename="SRPM_MemberOfWF" />
            </td>
            <td class="td-l">
                性别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSex" field="Sex" tablename="SRPM_MemberOfWF"
                    req="1" activestatus="(23.*)">
                    <asp:ListItem Text="请选择" Value=""></asp:ListItem>
                    <asp:ListItem Text="男" Value="男"></asp:ListItem>
                    <asp:ListItem Text="女" Value="女"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专业技术资格等级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlTechQualifLevel" runat="server" CssClass="kpms-ddl" EnableTheming="false"
                    Field="TechQualifLevel" TableName="SRPM_MemberOfWF" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目任务分工<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbProjectDivision" runat="server" req="1" CssClass="com_textbox_max"
                    TextMode="MultiLine" maxtext="128" Field="ProjectDivision" TableName="SRPM_MemberOfWF"
                    Height="30px" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                每年用于本项目的月数
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbHisResearchProjectResult" runat="server" CssClass="com_textbox_max"
                    TextMode="MultiLine" maxtext="128" Field="HisResearchProjectResult" TableName="SRPM_MemberOfWF"
                    Height="30px" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiMemberID" field="MemberID" tablename="SRPM_MemberOfWF" />
    <input type="hidden" runat="server" id="hiProjectListID" field="ProjectListID" tablename="SRPM_MemberOfWF" />
    <input type="hidden" runat="server" id="hiUserXml" />
    <script type="text/javascript">
        $cbox = $("#<%=cbIsCooperationUnitUser.ClientID %>");
        $ddlUnit = $("#<%=ddlCooperationUnit.ClientID %>");
        $uName = $("#<%=tbUserName.ClientID %>");
        $uId = $("#<%=hiUserId.ClientID %>");
        $dId = $("#<%=hiDeptName.ClientID %>");
        $dName = $("#<%=ddlDeptID.ClientID %>");


        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            checkIsCooperationUnitUser();

            //添加更改事件
            $cbox.click(function () { checkIsCooperationUnitUser(); });
            $ddlUnit.change(function () { changeCoUnit() });
        }

        //是否协作人员
        function checkIsCooperationUnitUser() {
            $btnUser = $("#<%=lbtnSelectUser.ClientID %>");

            if ($cbox.attr("checked")) {
                $ddlUnit.show().attr("req", "1");
                $btnUser.hide();
                if ("<%=ActionType %>" == "Create") {
                    $uName.removeAttr("readonly");
                    $uName.css("background-color", "#FFFFBB");
                }
            }
            else {
                $ddlUnit.hide().removeAttr("req").val("");
                $btnUser.show();
                if ("<%=ActionType %>" == "Create") {
                    $uName.attr("readonly", "readonly");
                    $uName.css("background-color", "#DDFFDD");
                }
            }
        }

        //更改合作单位选项
        function changeCoUnit() {
            var unit = $ddlUnit.find("option:selected").text();
            if ($ddlUnit.val() == "") {
                unit = "";
            }
        }

        //选择人员
        function selectUser() {
            $sex = $("#<%=ddlSex.ClientID %>");
            var param = new InputParamObject("s");
            var reObj = getUsers("", param, "");
            if (reObj != null) {
                var uid = reObj.buildAttrJson("o", "id");
                var uname = reObj.buildAttrJson("o", "name");
                var did = reObj.buildAttrJson("o", "OrgUnitId");
                var dname = reObj.buildAttrJson("o", "OrgUnitName");
                var ueduction = reObj.buildAttrJson("o", "EDUCATION");
                var uduty = reObj.buildAttrJson("o", "RANKNAME");
                var uage = reObj.buildAttrJson("o", "Age");
                var jobRank = reObj.buildAttrJson("o", "SKILLTITLE");
                var sex = reObj.buildAttrJson("o", "Sex");
                var idCardNo = reObj.buildAttrJson("o", "IDENTITYCARDNO");
                $uId.val(uid);
                $uName.val(uname);
                $dId.val(dname);
                $dName.val(did);
                $sex.val(sex);
                $("#<%=tbAge.ClientID %>").val(uage);
                $("#<%=tbEduction.ClientID %>").val(ueduction);
                $("#<%=tbDuty.ClientID %>").val(uduty);
                $("#<%=tbJobRank.ClientID %>").val(jobRank);
                $("#<%=tbIdCardNO.ClientID %>").val(idCardNo);
                $("#<%=LightTextBox2.ClientID %>").val(SPECIALTY);

            }
            return false;
        }

    </script>
</asp:Content>
