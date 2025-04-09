<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TechProjectInfoEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.TSM.List.TM.TechProjectInfoEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table id="Table1" class="tz-table" width="100%">
        <tr>
            <td class="td-m" style="text-align: center; height: 24px" colspan="6">
                <strong>科技项目信息</strong>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtTechProjectCode" field="TECHPROJECTCODE"
                    req="1" tablename="TSM_TECHPROJECTENTITY" class="kpms-textbox" readonly="readonly"
                    activestatus="(2.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan='3'>
                <zhongsoft:LightTextBox ID="tbTechProjectName" runat="server" EnableTheming="false"
                    req="1" activestatus="(23.*)" field="TECHPROJECTNAME" tablename="TSM_TECHPROJECTENTITY"
                    MaxLength="64">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目经理A<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiTechProjectMGRId" field="TECHPROJECTMGRID"
                    tablename="TSM_TECHPROJECTENTITY" />
                <input type="hidden" runat="server" id="hiTechProjectMGRCode" field="TECHPROJECTMGRCODE"
                    tablename="TSM_TECHPROJECTENTITY" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsTechProjectMGRName" field="TECHPROJECTMGRNAME"
                    tablename="TSM_TECHPROJECTENTITY" IsMutiple="false" ResultForControls="{'hiTechProjectMGRId':'id','hiTechProjectMGRCode':'UserCode'}"
                    EnableTheming="false" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" req="1" />
            </td>
            <td class="td-l">
                项目经理B
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiTechProjectMGRIdB" field="TECHPROJECTMGRIDB"
                    tablename="TSM_TECHPROJECTENTITY" />
                <input type="hidden" runat="server" id="hiTechProjectMGRCodeB" field="TECHPROJECTMGRCODEB"
                    tablename="TSM_TECHPROJECTENTITY" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsTechProjectMGRNameB" field="TECHPROJECTMGRNAMEB"
                    tablename="TSM_TECHPROJECTENTITY" IsMutiple="false" ResultForControls="{'hiTechProjectMGRIdB':'id','hiTechProjectMGRCodeB':'code'}"
                    EnableTheming="false" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                进度(%)
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRateOfOrogress" field="RATEOFPROGRESS"
                    tablename="TSM_TECHPROJECTENTITY" class="kpms-textbox"  
                    activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目级别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtTechProjectLevel" field="TECHPROJECTLEVEL"
                    tablename="TSM_TECHPROJECTENTITY" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                立项年度
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBuildDate" field="BUILDDATE" tablename="TSM_TECHPROJECTENTITY"
                    class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                所属类型
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongType" field="BELONGTYPE" tablename="TSM_TECHPROJECTENTITY"
                    class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                申请人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" field="APPLYUSERNAME"
                    tablename="TSM_TECHPROJECTENTITY" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                联系方式
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPhone" field="APPLYUSERPHONE" tablename="TSM_TECHPROJECTENTITY"
                    class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                申请时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDate" field="APPLYDATE" tablename="TSM_TECHPROJECTENTITY"
                    class="kpms-textbox" readonly="readonly" activestatus="(23.*)" style="width: 70px">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                申请部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDeptName" field="APPLYDEPTNAME"
                    tablename="TSM_TECHPROJECTENTITY" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                实施年月
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbImplementYear" field="IMPLEMENTYEAR"
                    activestatus="(23.*)" tablename="TSM_TECHPROJECTENTITY" MaxLength="64">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                实施部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlImplementDeptName" runat="server" field="IMPLEMENTDEPTID"
                    req="1" tablename="TSM_TECHPROJECTENTITY" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiImplementDeptName" field="IMPLEMENTDEPTNAME"
                    tablename="TSM_TECHPROJECTENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                开始时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" class="kpms-textbox-comparedate"
                    compare="1" req="1" readonly="readonly" field="STARTDATE" tablename="TSM_TECHPROJECTENTITY"
                    activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                结束时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
                    compare="1" req="1" readonly="readonly" field="ENDDATE" tablename="TSM_TECHPROJECTENTITY"
                    activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                项目总工日<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTechProjectSumHour" runat="server" Field="TECHPROJECTSUMHOUR"
                    regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确的工时,如34.32"
                    req="1" activestatus="(23.*)" TableName="TSM_TECHPROJECTENTITY">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目审批意见<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtTechProjectState" field="TECHPROJECTSTATE"
                    tablename="TSM_TECHPROJECTENTITY" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                项目类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlTechProjectType" runat="server" Field="TECHPROJECTTYPE"
                    req="1" TableName="TSM_TECHPROJECTENTITY" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                立项级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlBuildLevel" runat="server" Field="BUILDLEVEL"
                    req="1" TableName="TSM_TECHPROJECTENTITY" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否依托工程
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="radlIsSupportProject" Field="IsSupportProject"
                    req="1" activestatus="(23.*)" TableName="TSM_TECHPROJECTENTITY" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                依托工程
            </td>
            <td class="td-m" colspan="3">
                <input type="hidden" id="hiSupportProjectID" runat="server" field="SUPPORTPROJECTID"
                    tablename="TSM_TECHPROJECTENTITY" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSupportProjectName" field="SUPPORTPROJECTNAME"
                    tablename="TSM_TECHPROJECTENTITY" IsMutiple="false" ResultForControls="{'hiSupportProjectID':'id'}"
                    EnableTheming="false" PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                意向合作单位
            </td>
            <td class="td-r" colspan='5'>
                <zhongsoft:LightTextBox ID="tbCooperateCustomer" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" activestatus="(23.*)" field="COOPERATECUSTOMER" tablename="TSM_TECHPROJECTENTITY"
                    TextMode="MultiLine" maxtext="128" Rows="3" Width="96%">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目主要研究内容<span class="req-star">*</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（简述）
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbTechProjectContent" runat="server" CssClass="kpms-textarea"
                    req="1" EnableTheming="false" activestatus="(23.*)" tablename="TSM_TECHPROJECTENTITY"
                    field="TECHPROJECTCONTENT" TextMode="MultiLine" maxtext="512" Rows="3" Width="96%">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" nowrap>
                项目总体预期目标<span class="req-star">*</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（简述）
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbTechProjectExpectGoal" runat="server" CssClass="kpms-textarea"
                    req="1" EnableTheming="false" activestatus="(23.*)" tablename="TSM_TECHPROJECTENTITY"
                    field="TECHPROJECTEXPECTGOAL" TextMode="MultiLine" maxtext="512" Rows="3" Width="96%">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                节点信息
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbNodeInfo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" tablename="TSM_TECHPROJECTENTITY" field="NODEINFO" TextMode="MultiLine"
                    maxtext="512" Rows="3" Width="96%">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" tablename="TSM_TECHPROJECTENTITY" field="MEMO" TextMode="MultiLine"
                    maxtext="1024" Rows="3" Width="96%">
                </zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiTechProjectId" field="TECHPROJECTID" tablename="TSM_TECHPROJECTENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center; height: 24px" colspan="6">
                <strong>科技项目组成员</strong>
            </td>
        </tr>
        <tr>
            <td colspan='6' style="font-weight: bold" align="right">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsAddMember" IsMutiple="true"
                    ResultForControls="{'hiUserID':'id'}" EnableTheming="false" Text="选择科技项目组成员"
                    OnlyShowButton="true" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(3.*)" OnClick="lbsAddMember_Click" />
                <input type="hidden" id="hiUserID" name="hiUserID" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="lpdgMember" runat="server" AllowSorting="true"
                    ShowHeaderWhenEmpty="true" DataKeyNames="TECHPROJECTMEMBERID" BindGridViewMethod="BindMember"
                    OnRowCommand="lpdgMember_RowCommand" OnRowDataBound="lpdgMember_RowDataBound">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="USERNAME" HeaderText="姓名" HeaderStyle-Width="13%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ORGUNITNAME" HeaderText="部门" HeaderStyle-Width="15%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="SPECIALTY" HeaderText="专业" HeaderStyle-Width="12%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="专业分工" HeaderStyle-Width="30%">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText runat="server" ID="txtTechProjectTotalCharge" class="kpms-textbox"
                                    value='<%#Eval("TASKCONTENT")%>' Regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                                    ErrMsg="请输入最多两位小数的金额！" activestatus="(23.*)">
                                </zhongsoft:XHtmlInputText>
                                <input type="hidden" runat="server" id="hiTechProjectMemberId" value='<%#Eval("TECHPROJECTMEMBERID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目角色" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectRole" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                                <input type="hidden" id="hiProjectRole" value='<%#Eval("TECHPROJECTROLE") %>' runat="server" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDeleteActor" EnableTheming="false" CommandName="DeleteData"
                                    CommandArgument='<%#Eval("TECHPROJECTMEMBERID") %>' OnClientClick='return confirm("确定要删除吗？");'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
