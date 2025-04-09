<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplyEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.CRM.SupplyEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="供应商详细" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../../EPMS/UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">供方名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbSupplyName" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    MaxLength="256" req="1" field="SupplyName" activestatus="(23.*)" />
            </td>
            <td class="td-l">法定代表人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbLegalPerson" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    MaxLength="32" req="1" field="LegalPerson" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">省/直辖市<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlProvince" activestatus="(23.*)" runat="server"
                    req="1" field="Province" tablename="MM_SupplyEntity">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">企业地址<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbContactAddress" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    MaxLength="256" req="1" field="ContactAddress" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">邮政编码</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPostCode" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    field="PostCode" activestatus="(23.*)" />
            </td>
            <td class="td-l">企业邮箱
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbEmail" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    field="Email" activestatus="(23.*)" DataType="Email" />
            </td>
            <td class="td-l">传真
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCompanyMax" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    field="CompanyMax" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">主要联系人
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContactPerson" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    field="ContactPerson" activestatus="(23.*)" MaxLength="32" />
            </td>
            <td class="td-l">部门
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContactDept" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    field="ContactDept" activestatus="(23.*)" MaxLength="32" />
            </td>
            <td class="td-l">职务
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContactPost" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    field="ContactPost" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">单位电话
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCompanyPhone" runat="server" class="kpms-textbox" tablename="MM_SupplyEntity"
                    field="CompanyPhone" activestatus="(23.*)" DataType="Telphone" />
            </td>
            <td class="td-l">企业性质
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlSupplyNature" activestatus="(23.*)" runat="server"
                    tablename="MM_SupplyEntity" field="SupplyNature">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">评审状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsQualifi" activestatus="(23.*)" runat="server"
                    tablename="MM_SupplyEntity" field="IsQualifi">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">经营范围
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBox runat="server" ID="cblAll" Text="全选" activestatus="(23.*)"></asp:CheckBox>
                <asp:CheckBoxList ID="cblBusinessScope" runat="server" class="kpms-textbox" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiBusinessScope" field="BusinessScope" tablename="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">以往合作情况
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbPastCooperation" Rows="3" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" runat="server" maxtext="1024" Field="PastCooperation" ActiveStatus="(23.*)"
                    TableName="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">以往业绩
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbPastAchievements" Rows="3" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" runat="server" maxtext="1024" Field="PastAchievements" ActiveStatus="(23.*)"
                    TableName="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">主要设备
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMajorEquipment" Rows="3" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" runat="server" maxtext="1024" Field="MajorEquipment" ActiveStatus="(23.*)"
                    TableName="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">资质情况
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbCreditCondition" Rows="3" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" runat="server" maxtext="1024" Field="CreditCondition" ActiveStatus="(23.*)"
                    TableName="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">质量认证情况
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbQualityCertification" Rows="3" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" runat="server" maxtext="1024" Field="QualityCertification" ActiveStatus="(23.*)"
                    TableName="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">产品信誉
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbProductReputation" Rows="3" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" runat="server" maxtext="1024" Field="ProductReputation" ActiveStatus="(23.*)"
                    TableName="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">产品价格（元）
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbPrice" runat="server" CssClass="kpms-textbox-money" tablename="MM_SupplyEntity"
                    EnableTheming="false" field="Price" activestatus="(23.*)" DataType="Decimal2" />
            </td>
        </tr>
        <tr>
            <td class="td-l">质量状况
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbQualitySituation" Rows="3" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" runat="server" maxtext="1024" Field="QualitySituation" ActiveStatus="(23.*)"
                    TableName="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" Rows="3" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" runat="server" maxtext="1024" Field="Memo" ActiveStatus="(23.*)"
                    TableName="MM_SupplyEntity" />
            </td>
        </tr>
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('customerContact')">联系人信息<span class="req-star" id="Span2" runat="server" displaystatus="(2.*)">(请先保存再添加联系人)</span>&nbsp;<img
                src="<%=WebAppPath%>/Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="tz-table" width="100%" id="customerContact">
                    <tr>
                        <td colspan="6" align="right" style="text-align: right">
                            <asp:Button ID="btnAdd" runat="server" Text="添加联系人" Width="80px" OnClientClick="return addContacter();"
                                OnClick="btnAdd_Click" ActiveStatus="(3.*)" DisplayStatus="(3.*)" />
                        </td>
                    </tr>
                    <tr id="contacter">
                        <td colspan="6">
                            <zhongsoft:LightPowerGridView ID="gvContacterList" runat="server" AllowPaging="true"
                                UseDefaultDataSource="true" PageSize="10" DataKeyNames="CONTACTERID" AutoGenerateColumns="false"
                                OnRowCommand="gvContacterList_RowCommand" BindGridViewMethod="BindContacter">
                                <Columns>
                                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <zhongsoft:LightBoundField DataField="ContacterName" HeaderText="姓名">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="性别" DataField="sex" />
                                    <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName" />
                                    <zhongsoft:LightBoundField DataField="Post" HeaderText="职务">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField DataField="PHONE" HeaderText="办公室电话">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="手机" DataField="MobilePhone" />
                                    <zhongsoft:LightBoundField DataField="EMAIL" HeaderText="电子邮箱">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="家庭电话" DataField="HomePhone" />
                                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showContacter" DataParamFields="CONTACTERID"
                                        ImageUrl="../../../Themes/Images/btn_dg_view.gif">
                                    </zhongsoft:LightButtonField>
                                    <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editContacter" DataParamFields="CONTACTERID"
                                        ImageUrl="../../../Themes/Images/btn_dg_edit.gif" Visible="false">
                                    </zhongsoft:LightButtonField>
                                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                                        Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                                                OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("CONTACTERID") %>'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif"                                     />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--主键 -->
    <input id="hiSupplyID" runat="server" field="SUPPLYID" name="hiSupplyID" tablename="MM_SupplyEntity"
        type="hidden" />
    <input id="hiFlag" runat="server" field="Flag" name="Flag" tablename="MM_SupplyEntity"
        type="hidden" value="1" />
    <asp:Button ID="btnResetList" runat="server" Visible="false" OnClick="btnResetList_Click" />

    <script type="text/javascript">
        function initCustomerPlugin() {
            initCBoxAll('<%=cblBusinessScope.ClientID %>', '<%=cblAll.ClientID %>');
            $('#<%=cblBusinessScope.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cblBusinessScope.ClientID %>', '<%=cblAll.ClientID %>');
            });

            $('#<%=cblAll.ClientID %>').live('change', function () {
                initCBoxList('<%=cblBusinessScope.ClientID %>', '<%=cblAll.ClientID %>');
            });
        }

        //查看客户联系人详细信息
        function showContacter(id) {
            var url = buildBizUrl(1, id, "MM/List/CRM/CustomerContacterEditor.aspx", { CustomerName: escape($('#<%=tbSupplyName.ClientID %>').val()) });
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 610, 330, null);
            return false;
        }

        //编辑客户联系人详细信息
        function editContacter(id) {

            var url = buildBizUrl(3, id, "MM/List/CRM/CustomerContacterEditor.aspx", { CustomerName: escape($('#<%=tbSupplyName.ClientID %>').val()) });
            //return checkReturn(showModal(url, null, 1200, 1000));
            showDivDialog(url, null, 610, 330, resetList);
            return false;
        }

        //添加联系人
        function addContacter() {
            var url = buildQueryUrl("MM/List/CRM/CustomerContacterEditor.aspx", { actionType: 2, CustomerId: $('#<%=hiSupplyID.ClientID %>').val(), CustomerName: escape($('#<%=tbSupplyName.ClientID %>').val()) });

            //return checkReturn(showModal(url, null, 1200, 1000));
            showDivDialog(url, null, 610, 330, resetList);
            return false;
        }

        //新建、编辑弹出层callback方法
        function resetList() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnResetList,"") %>
        }
    </script>
</asp:Content>
