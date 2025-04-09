<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_HighRiskReportForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Risk.WF_HighRiskReportForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">子项目名称<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" EnableTheming="false" PageWidth="900px"
                ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode','tbManagerUserName':'ManagerUserName','hiManagerUserID':'ManagerUserID'}"
                Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" ActiveStatus="(23.编制)" field="ProjectName" tablename="EPMS_RiskManagement" />
            <input type="hidden" id="hiOrganizationID" runat="server" field="OrganizationID" tablename="EPMS_RiskManagement" />
        </td>
        <td class="td-l">子项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly"
                ActiveStatus="(23.编制)" field="ProjectCode" tablename="EPMS_RiskManagement" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申报人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbApplyUserName" runat="server" readonly="readonly"
                ActiveStatus="(2.编制)" field="ApplyUserName" tablename="EPMS_RiskManagement" />
            <input type="hidden" id="hiApplyUserID" name="hiApplyUserID" runat="server" tablename="EPMS_RiskManagement" field="ApplyUserID" />
        </td>
        <td class="td-l">申报时间</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="tbApplyDate" runat="server" readonly="readonly"
                ActiveStatus="(2.编制)" field="ApplyDate" tablename="EPMS_RiskManagement" />
        </td>
    </tr>    
    <tr>
        <td class="td-m" colspan="6" style="text-align: center;">
            <b>项目中高风险详细信息</b>
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.编制)" align="right">
        <td colspan="6">
            <asp:Label ID="Label2" runat="server" displaystatus="(23.编制)" Text="增加"></asp:Label>
            <zhongsoft:LightTextBox ID="tbAddCnt" Width="5" value="1" ToolTip="请填写1至10之间的整数"
                runat="server" Style="width: 20px;" regex="^([1-9]|10)$" errmsg="增加行数请填写1至10之间的整数"
                displaystatus="(23.编制)">
            </zhongsoft:LightTextBox>
            <asp:Label ID="Label3" runat="server" displaystatus="(23.编制)" Text="行"></asp:Label>
            <asp:ImageButton runat="server" ID="ImageButton1" ImageUrl="~/Themes/Images/btn_add.gif"
                displaystatus="(23.编制)" OnClick="ibtnAddRow_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gvList" AutoGenerateColumns="false" PermissionStatus="true"
                DataKeyNames="RiskItemID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindData"
                PageSize="100" AllowPaging="true" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand"
                ShowExport="true" HideFieldOnExport="删除" OnExport="gvList_Export">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="风险描述<span class='req-star'>*</span>" ItemStyle-Width="110px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbRiskDescribe" Text='<%# Eval("RiskDescribe") %>'
                                CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="false" req="1"
                                ActiveStatus="(23.编制)"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="风险级别<span class='req-star'>*</span>" ItemStyle-Width="75px">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlRiskRank" req="1" ActiveStatus="(23.编制)">
                                <asp:ListItem Value="">请选择</asp:ListItem>
                                <asp:ListItem Value="中等">中等</asp:ListItem>
                                <asp:ListItem Value="高">高</asp:ListItem>
                                <asp:ListItem Value="极高">极高</asp:ListItem>                               
                            </zhongsoft:LightDropDownList>
                            <input id="hiRiskRank" runat="server" type="hidden" value='<%# Eval("RiskRank") %>' />
                            <asp:Label ID="lblRiskRank" runat="server" Visible="false"><%#Eval("RiskRank") %></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="控制措施、预案<span class='req-star'>*</span>" ItemStyle-Width="110px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbControlMeasure" CssClass="kpms-textarea" runat="server"
                                Text='<%# Eval("ControlMeasure") %>' TextMode="MultiLine" EnableTheming="false"
                                req="1" ActiveStatus="(23.编制)"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="责任人<span class='req-star'>*</span>" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector ID="tbDutyUserName" runat="server" ActiveStatus="(23.编制)"
                                class="kpms-textbox" IsMutiple="false" SourceMode="SelectorPage" ShowJsonRowColName="true" ResultAttr="name"
                                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ResultForControls="{'hiDutyUserID':'id'}"
                                SelectPageMode="Dialog" Value='<%# Eval("DutyUserName") %>' req="1" />
                            <input type="hidden" runat="server" id="hiDutyUserID" value='<%# Eval("DutyUserID") %>' />
                            <asp:Label ID="lblDutyUserName" runat="server" Visible="false"><%#Eval("DutyUserName") %></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="风险存续时间<span class='req-star'>*</span>" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="tbEndDate" runat="server" req="1"
                                readonly="readonly" ActiveStatus="(23.编制)" value='<%# Eval("EndDate") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="说明" ItemStyle-Width="110px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server"
                                Text='<%# Eval("Memo") %>' TextMode="MultiLine" EnableTheming="false" ActiveStatus="(23.编制)"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" Visible="false">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiRiskManagementID" name="hiRiskManagementID" runat="server" tablename="EPMS_RiskManagement" field="RiskManagementID" />
<input type="hidden" id="hiFormType" name="hiFormType" runat="server" tablename="EPMS_RiskManagement" field="FormType" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
</script>
