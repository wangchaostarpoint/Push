<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ForceCheckForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Product.WF_ForceCheckForm" %>
<table class="tz-table">
    <tr>
        <td rowspan="3" class="td-l">工程项目
        </td>
        <td class="td-l">工程名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','hiProjectCode':'ProjectCode','txtPhaseName':'PhaseName','hiPhaseID':'PhaseID'}"
                EnableTheming="false" PageWidth="900px" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" TableName="EPMS_ForceCheck" Field="ProjectName" ActiveStatus="(23.填写检查表)" />
            <input type="hidden" id="hiOrganizationID" name="hiProjectID" runat="server" tablename="EPMS_ForceCheck" field="OrganizationID" />
            <input type="hidden" id="hiProjectCode" name="hiProjectID" runat="server" tablename="EPMS_ForceCheck" field="ProjectCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计阶段</td>
        <td class="td-m" colspan="4">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtPhaseName" runat="server" readonly="readonly"
                tablename="EPMS_ForceCheck" field="PhaseName" ActiveStatus="(23.填写检查表)" />
            <input type="hidden" id="hiPhaseID" runat="server" tablename="EPMS_ForceCheck" field="PhaseID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">产品名称</td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="tbProductName" runat="server" TableName="EPMS_ForceCheck" Field="ProductName" ActiveStatus="(23.填写检查表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">检查专业<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <asp:CheckBoxList ID="cblSpecialty" req="1" runat="server" ActiveStatus="(23.填写检查表)" RepeatColumns="5"></asp:CheckBoxList>
            <input type="hidden" id="hiCheckSpecialtyIDs" runat="server" tablename="EPMS_ForceCheck" field="CheckSpecialtyIDs" />
            <input type="hidden" id="hiCheckSpecialCodes" runat="server" tablename="EPMS_ForceCheck" field="CheckSpecialCodes" />
            <input type="hidden" id="hiCheckSpecialtyNames" runat="server" tablename="EPMS_ForceCheck" field="CheckSpecialtyNames" />
        </td>
        <td class="td-l">编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtForceCode" runat="server"
                tablename="EPMS_ForceCheck" field="ForceCode" ActiveStatus="(23.填写检查表)" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" style="text-align: center;">
            <b>一、《强制性条文管理办法》检查</b>
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.填写检查表)" align="right">
        <td colspan="6">
            <asp:Button runat="server" ID="btnInitCheck" Text="初始化检查内容项"
                displaystatus="(23.填写检查表)" OnClick="btnInitCheck_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gvManageCheckList" AutoGenerateColumns="false" PermissionStatus="true"
                DataKeyNames="ManageCheckID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindData" PageSize="50"
                AllowPaging="true" OnRowDataBound="gvManageCheckList_RowDataBound" OnRowCommand="gvManageCheckList_RowCommand"
                ShowExport="true" HideFieldOnExport="删除" OnExport="gvManageCheckList_Export">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="检查内容" DataField="CheckContent"></zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="是否符合">
                        <ItemStyle Width="40px" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblIsFit" runat="server" Visible="false"></asp:Label>
                            <asp:RadioButtonList ID="rblIsFit" runat="server" ActiveStatus="(23.填写检查表)" RepeatDirection="Horizontal"></asp:RadioButtonList>
                            <input id="hiCheckContentID" runat="server" type="hidden" value='<%#Eval("CheckContentID") %>' />
                            <input id="hiIsFit" runat="server" type="hidden" value='<%#Eval("IsFit") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="不符合说明">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbNotFitExplain" TextMode="MultiLine" ActiveStatus="(23.填写检查表)"
                                CssClass="kpms-textarea" EnableTheming="false" Text='<%#Eval("NotFitExplain") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="Del" EnableTheming="false"
                                CommandArgument='<%#Eval("ManageCheckID") %>'>
                                    <img alt="删除" onclick="if(!confirm('确认要删除吗？')) return false;" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif"   />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" style="text-align: center;">
            <b>二、项目涉及的强制性条文执行情况检查</b>
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.填写检查表)" align="right">
        <td colspan="6">
            <asp:LinkButton runat="server" ID="lbtnSelTemplate" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="选择强条模板" OnClientClick="return false;">
                <span>
                    <img runat="server" src="~/Themes/Images/btn_add.gif" alt="选择强条模板" width="16"
                        height="16" />
                    选择强条模板
                </span>
            </asp:LinkButton>

            <asp:Label ID="Label2" runat="server" displaystatus="(23.填写检查表)" Text="增加"></asp:Label>
            <zhongsoft:LightTextBox ID="tbAddCnt" Width="5" value="1" ToolTip="请填写1至10之间的整数" runat="server" Style="width: 20px;"
                regex="^([1-9]|10)$" errmsg="增加行数请填写1至10之间的整数" displaystatus="(23.填写检查表)">
            </zhongsoft:LightTextBox>
            <asp:Label ID="Label3" runat="server" displaystatus="(23.填写检查表)" Text="行"></asp:Label>
            <asp:ImageButton runat="server" ID="ibtnAddRow" ImageUrl="~/Themes/Images/btn_add.gif"
                displaystatus="(23.填写检查表)" OnClick="ibtnAddRow_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gvExecuteCheckList" AutoGenerateColumns="false" PermissionStatus="true"
                DataKeyNames="ExecuteCheckID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindGrid" PageSize="50"
                AllowPaging="true" OnRowDataBound="gvExecuteCheckList_RowDataBound" OnRowCommand="gvExecuteCheckList_RowCommand"
                ShowExport="true" HideFieldOnExport="删除" OnExport="gvExecuteCheckList_Export">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="标准名称" HeaderStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbStandardName" ActiveStatus="(23.填写检查表)" TextMode="MultiLine"
                                CssClass="kpms-textarea" MaxLength="100" EnableTheming="false" Text='<%#Eval("StandardName") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="标准编号" HeaderStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbStandardCode" ActiveStatus="(23.填写检查表)" TextMode="MultiLine"
                                CssClass="kpms-textarea" MaxLength="100" EnableTheming="false" Text='<%#Eval("StandardCode") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="条款号" HeaderStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbClauseNo" ActiveStatus="(23.填写检查表)" TextMode="MultiLine"
                                CssClass="kpms-textarea" MaxLength="50" EnableTheming="false" Text='<%#Eval("ClauseNo") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="强制性条文内容" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbCheckContent" TextMode="MultiLine" ActiveStatus="(23.填写检查表)"
                                CssClass="kpms-textarea" EnableTheming="false" Text='<%#Eval("CheckContent") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="执行情况说明" HeaderStyle-Width="80px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbExplain" TextMode="MultiLine" ActiveStatus="(23.填写检查表)"
                                CssClass="kpms-textarea" EnableTheming="false" Text='<%#Eval("Explain") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="执行情况" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:Label ID="lblExecuteResult" runat="server" Visible="false"></asp:Label>
                            <asp:RadioButtonList ID="rblExecuteResult" runat="server" ActiveStatus="(23.填写检查表)" RepeatDirection="Vertical"></asp:RadioButtonList>
                            <input id="hiExecuteResult" runat="server" type="hidden" value='<%#Eval("ExecuteResult") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="Del" EnableTheming="false"
                                CommandArgument='<%#Eval("ExecuteCheckID") %>'>
                                    <img alt="删除" onclick="if(!confirm('确认要删除吗？')) return false;" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif"   />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiForceCheckID" runat="server" tablename="EPMS_ForceCheck" field="ForceCheckID" />
<input type="hidden" runat="server" id="hiTemplateXML" />
<asp:Button runat="server" ID="btnAddTemplateData" OnClick="btnAddTemplateData_Click" Style="display: none" />

<script type="text/javascript">
    function initCustomerPlugin() {
        $('#<%=lbtnSelTemplate.ClientID %>').on('click', function () {
            selTemplate();
        });
    }

    //选择强条模板
    function selTemplate() {
        var param = new InputParamObject("m");

        var json = {}
        getMandatoryTemplate('<%=hiTemplateXML.ClientID %>', param, json, addTemplateData);
        return false;
    }

    //添加模板数据到表单子表
    function addTemplateData() {
        $('#<%=btnAddTemplateData.ClientID%>').click();
    }

</script>

