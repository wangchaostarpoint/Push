<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_OnBusinessForm.ascx.cs"
    Inherits="Zhongsoft.Portal.TestSubSys.Form.WF_OnBusinessForm" %>
<table class="tz-table">
    <tr>
        <td colspan="4" class="tz-title">
           基本信息
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请人
        </td>
        <td class="td-m">
            <input type="hidden" runat="server" id="hiFormId" field="FormId" tablename="OnBusinessForm" />
            <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="OnBusinessForm" />
            <zhongsoft:LightTextBox runat="server" ID="tbUserName" field="UserName" tablename="OnBusinessForm"
                ReadOnly="true" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            申请部门
        </td>
        <td class="td-m">
            <input type="hidden" runat="server" id="hiOrgId" field="OrgId" tablename="OnBusinessForm" />
            <zhongsoft:LightTextBox runat="server" ID="tbOrgName" field="OrgName" tablename="OnBusinessForm"
                ReadOnly="true" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请日期
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox runat="server" ID="tbApplyDate" CssClass="kpms-textbox-date"
                EnableTheming="false" field="ApplyDate" tablename="OnBusinessForm" ReadOnly="true"
                ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
        </td>
        <td class="td-m">
            <%--   <zhongsoft:LightObjectSelector runat="server" ID="adsdsa" SourceMode="SelectorPage"
                PageUrl="~/Sys/OrgUsers/UserSelector.aspx" ResultAttr="name" ActiveStatus="(23.*)"
               />--%>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="tz-title">
           报销明细
        </td>
    </tr>
    <tr>
        <td colspan="4" class="td-m" style="text-align: right">
            <asp:LinkButton runat="server" ID="btnNew" class="kpms-btn" OnClick="btnNew_Click"
                displaystatus="(3.*)" OnClientClick="return check();">
                      <img alt ="" src="../../Themes/Images/btn_new.gif"/><span>新建明细</span>
            </asp:LinkButton>
            <span runat="server" displaystatus="(2.*)" class="req-star">请先保存在添加明细</span>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="true"
                AutoUpdateMethod="UpdataAjaxRow" OnRowCommand="gvList_RowCommand" DataKeyNames="DetailId"
                AscxUri="/Portal/TestSubSys/Form/WF_OnBusinessForm.ascx" AutoUpdateData="true"
                PermissionStatus="true" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="出差人" HeaderStyle-Width="20%">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiDetailId" field="DetailId" value='<%#Eval("DetailId") %>' />
                            <input type="hidden" runat="server" id="hiFormId" field="FormId" value='<%#Eval("FormId") %>' />
                            <input type="hidden" runat="server" id="hiUserId" field="UserId" value='<%#Eval("UserId") %>' />
                            <zhongsoft:LightObjectSelector runat="server" ID="lbsUser" ResultForControls="{'hiUserId':'id'}"
                                SelectPageMode="Iframe" SourceMode="SelectorPage" PageUrl="~/Sys/OrgUsers/UserSelector.aspx"
                                ResultAttr="name" field="UserName" ActiveStatus="(23.*)" req="1" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightTemplateField HeaderText="类型" HeaderStyle-Width="15%">
                        <ItemTemplate>
                            <asp:DropDownList runat="server" ID="ddlType" ActiveStatus="(23.*)" field="Type"
                                req="1">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <asp:TemplateField HeaderText="费用" HeaderStyle-Width="15%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbExpense" regex="^\d*$" errmsg="费用只能填写数字"
                                ActiveStatus="(23.*)" field="Expense" Text='<%#Eval("Expense") %>' req="1"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="说明" HeaderStyle-Width="30%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" ActiveStatus="(23.*)" field="Memo"
                                maxtext="10" Text='<%#Eval("Memo") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%#Eval("DetailId") %>'
                                CommandName="DeleteData">
						 <img    onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }


    function check() {

        return $("#<%=gvList.ClientID %>").find("[disabled != 'disabled'][req = 1]").checkReqField();
    }
</script>
