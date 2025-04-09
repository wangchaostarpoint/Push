<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PersonnelBorrowBGForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MIM.WF_PersonnelBorrowBGForm" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            原申请编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlPersonBorrowCode" Field="PERSONBORROWCODE" tableName="MIM_PERSONBORROWORBGFORM"
                req="1" activestatus="(23.填写变更信息)(23.修改变更信息)" runat="server" AutoPostBack="true"
                OnSelectedIndexChanged="ddlPersonBorrowCode_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiPersonBorrowCode" field="PERSONBORROWCODE"
                tablename="MIM_PERSONBORROWORBGFORM" />
        </td>
        <td class="td-l">
            变更编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPersonBorrowBGCode" Field="PERSONBORROWBGCODE" tableName="MIM_PERSONBORROWORBGFORM"
                readonly="readonly" activestatus="(23.填写变更信息)(23.修改变更信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托单位（甲方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustDeptName" Field="ENTRUSTDEPTNAME" tableName="MIM_PERSONBORROWORBGFORM"
                readonly="readonly" activestatus="(23.填写变更信息)(23.修改变更信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiEntrustDeptId" field="ENTRUSTDEPTID" tablename="MIM_PERSONBORROWORBGFORM" />
        </td>
        <td class="td-l">
            受托单位（乙方）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustedDeptName" Field="ENTRUSTEDDEPTNAME" tableName="MIM_PERSONBORROWORBGFORM"
                activestatus="(23.填写变更信息)(23.修改变更信息)" runat="server" readonly="readonly" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiEntrustedDeptId" runat="server" field="ENTRUSTEDDEPTID"
                tablename="MIM_PERSONBORROWORBGFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" Field="PROJECTCODE" tableName="MIM_PERSONBORROWORBGFORM"
                readonly="readonly" activestatus="(23.填写变更信息)(23.修改变更信息)" runat="server" class="kpms-textbox-short">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiMarketProjectId" field="MARKETPROJECTID"
                tablename="MIM_PERSONBORROWORBGFORM" />
        </td>
        <td class="td-l">
            工程名称
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectName" Field="PROJECTNAME" tableName="MIM_PERSONBORROWORBGFORM"
                readonly="readonly" activestatus="(23.填写变更信息)(23.修改变更信息)" runat="server" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="3">
            原借用人员信息
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvOldList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                PermissionStatus="true" PageSize="15" AutoGenerateColumns="false" DataKeyNames="ID">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="USERNAME" HeaderText="姓名">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="STATION" HeaderText="岗位">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="START" HeaderText="起始时间" DataFormatString="{0:yyyy-MM-dd }">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ENDT" HeaderText="截止时间" DataFormatString="{0:yyyy-MM-dd }">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="终止时间" HeaderStyle-Width="20%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtNewEnd" value='<%#Eval("ENDDATE","{0:yyyy-MM-dd}") %>'
                                activestatus="(23.填写变更信息)(23.修改变更信息)" class="kpms-textbox-date" runat="server"
                                onblur="return checkDate(this)" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                            <input type="hidden" id="hiUserId" value='<%#Eval("USERID") %>' runat="server" />
                            <input type="hidden" id="hiStartDate" value='<%#Eval("START","{0:yyyy-MM-dd}") %>'
                                runat="server" content="typeId" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="6" style="font-weight: bold; text-align: center">
            补充借用人员信息<span id="users" class="req-star" runat="server" displaystatus="(2.*)">先保存再选择人员</span>
        </td>
    </tr>
    <tr>
        <td class="td-r">
            <asp:Button ID="btnSelectPersonnel" runat="server" Text="选择需借用的人员" OnClientClick="return selPersonnel();"
                DisplayStatus="(3.填写变更信息)(3.修改变更信息)" OnClick="btnSelPersonnel_Click" />
        </td>
    </tr>
    <tr id="userList">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvNewList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                PermissionStatus="true" PageSize="15" AutoGenerateColumns="false" DataKeyNames="PERSONNELBORROWDETAILID"
                OnRowCommand="gvNewList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="BORROWUSERNAME" HeaderText="姓名">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="POSITIONNAME" HeaderText="岗位">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="起始时间<span class='req-star'>*</span>" HeaderStyle-Width="20%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtStart" value='<%#Eval("STARTDATE","{0:yyyy-MM-dd}") %>'
                                onblur="return checkDate(this)" activestatus="(3.填写变更信息)(3.修改变更信息)" class="kpms-textbox-date"
                                runat="server" req="1" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="截止时间<span class='req-star'>*</span>" HeaderStyle-Width="20%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtEnd" value='<%#Eval("ENDDATE" ,"{0:yyyy-MM-dd}") %>'
                                onblur="return checkDate(this)" activestatus="(3.填写变更信息)(3.修改变更信息)" class="kpms-textbox-date"
                                runat="server" req="1" readonly="readonly">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                                OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("PERSONNELBORROWDETAILID")%>'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_detail.gif"                                     />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr id="money">
        <td class="td-l">
            预估费用额度（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbEstimateVal" activestatus="(3.填写变更信息)(3.修改变更信息)"
                field="ESTIMATEVAL" tablename="MIM_PERSONBORROWORBGFORM" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,2})?$"
                ErrMsg="请输入正数，最多8位整数，2位小数" req="1" CssClass="kpms-textbox-money" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            特别说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtSpecialMemo" Field="SPECIALMEMO" tableName="MIM_PERSONBORROWORBGFORM"
                activestatus="(23.填写变更信息)(23.修改变更信息)" runat="server" maxtext="256" class="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="5">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l" nodisplaystatus="(23.填写变更信息)" runat="server">
            委托方总经理意见
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblEntrustd" runat="server" RepeatDirection="Horizontal"
                nodisplaystatus="(23.填写变更信息)" req="1" field="ENTRUSTDMANAGEROPINION" tablename="MIM_PERSONBORROWORBGFORM"
                activestatus="(23.（甲方）总经理审批)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr id="entrusted">
        <td class="td-l" nodisplaystatus="(23.填写变更信息)" runat="server">
            受托方总经理意见
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblEntrusted" runat="server" RepeatDirection="Horizontal"
                nodisplaystatus="(23.填写变更信息)" req="1" field="ENTRUSTDEDMANAGEROPINION" tablename="MIM_PERSONBORROWORBGFORM"
                activestatus="(23.（乙方）总经理审批)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr id="manage">
        <td class="td-l" nodisplaystatus="(23.填写变更信息)" runat="server">
            经营管理部部长意见
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblManage" runat="server" RepeatDirection="Horizontal" req="1"
                nodisplaystatus="(23.填写变更信息)" field="MANAGEMENTOPINION" tablename="MIM_PERSONBORROWORBGFORM"
                activestatus="(23.部门负责人审批)">
                <asp:ListItem Value="0">同意</asp:ListItem>
                <asp:ListItem Value="1">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<%--流程主键ID--%>
<input type="hidden" id="hiPersonnelBorrowId" runat="server" field="PERSONBORROWORBGFORMID"
    tablename="MIM_PERSONBORROWORBGFORM" />
<input type="hidden" id="hiChange" runat="server" field="APPLYORCHANGE" tablename="MIM_PERSONBORROWORBGFORM"
    value="1" />
<%--内部协议书编号--%>
<input type="hidden" id="hiInternalAgrCode" runat="server" field="INTERNALAGREEMENTCODE"
    tablename="MIM_PERSONBORROWORBGFORM" />
<input type="hidden" id="hiInternalAgrId" runat="server" field="INTERNALAGREEMENTID"
    tablename="MIM_PERSONBORROWORBGFORM" />
<%--角色名称--%>
<input type="hidden" id="hiRoleNameZ" runat="server" value="总经理" />
<input type="hidden" id="hiRoleNameF" runat="server" value="副总经理" />
<input type="hidden" id="hiManage" runat="server" value="经营经理" />
<!--借用人员--->
<input type="hidden" id="hiPersonnel" runat="server" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();

        if ($bizCtx.action == "<%=(int)AccessLevel.Create %>") {
            $("#userList").hide();
            $("#money").hide();
        }
        else {
            $("#userList").show();
            $("#money").show();
        }
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "（甲方）总经理审批") {
                var entrust = $("#<%=rblEntrustd.ClientID %> input[type='radio']:checked").val();
                if (entrust == "1") {
                    alert("审批不同意则不可发送到下一步！");
                    return false;
                }
            }
            else if ($actName == "（乙方）总经理审批") {
                var entrusted = $("#<%=rblEntrusted.ClientID %> input[type='radio']:checked").val();
                if (entrusted == "1") {
                    alert("审批不同意则不可发送到下一步！");
                    return false;
                }
            }
            else if ($actName == "部门负责人审批") {
                var manage = $("#<%=rblManage.ClientID %> input[type='radio']:checked").val();
                if (manage == "1") {
                    alert("审批不同意则不可发送到下一步！");
                    return false;
                }
            }
        }
        return true;
    }

    //原借用人员及补充借用人员列表中，开始日期与截止日期做比较
    function checkDate(obj) {
        if ($(obj).val() != "") {
            var preFromDate = $(obj).parent('td').parent('tr').find('[id$=txtStart]');
            var preToDate = $(obj).parent('td').parent('tr').find('[id$=txtEnd]');
            var oldDate = $(obj).parent('td').parent('tr').find('[id$=hiStartDate]');
            var newDate = $(obj).parent('td').parent('tr').find('[id$=txtNewEnd]');
            //开始日期与截止日期做比较
            if (preFromDate != undefined && preFromDate.val() != "") {
                if (preFromDate.val() > $(obj).val()) {
                    alert("本行开始时间必须小于截止时间!");
                    $(obj).val('');
                    return false;
                }
            }
            if (preToDate != undefined && preToDate.val() != "") {
                if (preToDate.val() < $(obj).val()) {
                    alert("本行开始时间必须小于截止时间!");
                    $(obj).val('');
                    return false;
                }
            }
            if (newDate != undefined && newDate.val() != "" && oldDate != undefined && oldDate.val() != "") {
                if (oldDate.val() > $(obj).val()) {
                    alert("本行开始时间必须小于截止时间!");
                    $(obj).val('');
                    return false;
                }
            }
        }
    }

    //选择借用人员
    function selPersonnel() {
        var orgId = $('#<%=hiEntrustedDeptId.ClientID %>').val();
        orgId = "'" + orgId + "'";
        var param = new InputParamObject("m");
        var re = getUsersNew('<%=hiPersonnel.ClientID %>', param, "{OrganizationId:" + orgId + "}");
        if (re != null) {
            if ($('#<%=hiPersonnel.ClientID %>').val() != '' && $('#<%=hiPersonnel.ClientID %>').val() != "<root/>") {
                return true;
            }
        }
        return false;
    }
</script>
