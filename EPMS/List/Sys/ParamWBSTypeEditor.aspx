<%@ Page Language="C#" AutoEventWireup="true" Title="WBS任务类别参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamWBSTypeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamWBSTypeEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                任务管理方式<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMode" T activestatus="(23.*)"
                    req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiWBSMode" ablename="EPMS_ParamWBSType" field="WBSMode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                任务类别<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbType" TableName="EPMS_ParamWBSType"
                    Field="WBSType" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_ParamWBSType"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                适用的项目类型
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAllProjType" Text="选择全部项目类型" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                关联的任务节点
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAllNode" Text="选择全部任务节点" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cblNode" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamWBSType" Field="SORT" Style="text-align: right;
                    width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamWBSType"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>任务等级</b> <span runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button runat="server" ID="btnAddLevel" Text="添加" OnClick="btnAddLevelClick" />
                    <zhongsoft:LightTextBox runat="server" ID="tbLevelNum" Style="text-align: right;
                        width: 70px;" regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <!--增加permissionstatus="true"会导致保存后列表没有了！-->
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvLevelList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ParamWBSLevelID" UseDefaultDataSource="true" BindGridViewMethod="BindWBSLevel"
                    OnRowDataBound="gvLevelList_RowDataBound" OnRowCommand="gvLevelList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="任务等级">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbWBSLevel" activestatus="(23.*)" Text='<%#Eval("WBSLevel") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="描述">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbDescription" activestatus="(23.*)" Text='<%#Eval("DESCRIPTION") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="排序号">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbSort" Style="text-align: right; width: 70px;" activestatus="(23.*)"
                                    regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数" runat="server" Text='<%#Eval("SORT") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rblLevel" RepeatDirection="Horizontal" key='<%#Eval("ParamWBSLevelID") %>'
                                    OnSelectedIndexChanged="rblLevel_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%#Eval("ParamWBSLevelID") %>'>
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamWBSLevelID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>下级任务类别</b> <span runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                    <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                        regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行 </span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ParamWBSTypeID" UseDefaultDataSource="true" BindGridViewMethod="BindChildWBSType"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="任务类别<span class='req-star'></span>">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbType" Text='<%#Eval("WBSType") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="描述">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbDescription" Text='<%#Eval("DESCRIPTION") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="排序号">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbSort" Style="text-align: right; width: 70px;" regex="^[1-9]{0,2}$"
                                    errmsg="请输入最多2位整数" runat="server" Text='<%#Eval("SORT") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamWBSTypeID") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%#Eval("ParamWBSTypeID") %>'>
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamWBSTypeID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ParamWBSType" field="ParamWBSTypeID"
        runat="server" />
    <!-- 任务分类级别，默认新建为1-->
    <input id="hiClassLevel" type="hidden" tablename="EPMS_ParamWBSType" field="ClassLevel"
        runat="server" value="1" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            //关联的任务节点
            initCBoxAll('<%=cblNode.ClientID %>', '<%=cbAllNode.ClientID %>');
            $('#<%=cblNode.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cblNode.ClientID %>', '<%=cbAllNode.ClientID %>');
            });

            $('#<%=cbAllNode.ClientID %>').live('change', function () {
                initCBoxList('<%=cblNode.ClientID %>', '<%=cbAllNode.ClientID %>');
            });

            //适用的项目类型
            initCBoxAll('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            $('#<%=cblProjType.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            });

            $('#<%=cbAllProjType.ClientID %>').live('change', function () {
                initCBoxList('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            });
        }
    </script>
</asp:Content>
