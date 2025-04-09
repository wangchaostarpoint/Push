<%@ Page Language="C#" AutoEventWireup="true" Title="项目类型参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamProjectTypeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectTypeEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">项目类型代字<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbTypeCode" TableName="EPMS_PARAMPROJECTTYPE"
                    Field="PROJECTTYPECODE" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">项目类型名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbType" TableName="EPMS_PARAMPROJECTTYPE"
                    Field="PROJECTTYPE" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">对应档案类型
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParamFileCategoryID" TableName="EPMS_PARAMPROJECTTYPE" Field="ParamFileCategoryID" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiParamFileCategoryName" tablename="EPMS_PARAMPROJECTTYPE" field="ParamFileCategoryName" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMPROJECTTYPE"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <%--<tr>
            <td class="td-l">
                归属的业务类型
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAllBizType" Text="选择全部业务类型" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cblBizType" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>--%>
        <tr style="display: none">
            <td class="td-l">包括的项目阶段
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAllPhase" Text="选择全部项目阶段" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cblPhase" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMPROJECTTYPE" Field="SORT"
                    Style="text-align: right; width: 70px;"
                    activestatus="(23.*)" regex="^([1-9]\d{0,1}|0)$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMPROJECTTYPE"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>包括的项目级别</b> <span runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                    <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                        regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行 </span>
            </td>
        </tr>
        <tr style="display: none">
            <td colspan="4">
                <!--增加permissionstatus="true"会导致保存后列表没有了！-->
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="PARAMPROJECTLEVELID" UseDefaultDataSource="true" BindGridViewMethod="BindProjectLevel"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目级别">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbLevel" activestatus="(23.*)" Text='<%#Eval("PROJECTLEVEL") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="描述">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbDescription" activestatus="(23.*)" Text='<%#Eval("DESCRIPTION") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="排序号">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbSort" Style="text-align: right; width: 70px;"
                                    activestatus="(23.*)"
                                    regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数" runat="server" Text='<%#Eval("SORT") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("PARAMPROJECTLEVELID") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%#Eval("PARAMPROJECTLEVELID") %>'>
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("PARAMPROJECTLEVELID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMPROJECTTYPE" field="PARAMPROJECTTYPEID"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            //包括的项目阶段
            initCBoxAll('<%=cblPhase.ClientID %>', '<%=cbAllPhase.ClientID %>');
            $('#<%=cblPhase.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cblPhase.ClientID %>', '<%=cbAllPhase.ClientID %>');
            });

            $('#<%=cbAllPhase.ClientID %>').live('change', function () {
                initCBoxList('<%=cblPhase.ClientID %>', '<%=cbAllPhase.ClientID %>');
            });
        }
    </script>
</asp:Content>
