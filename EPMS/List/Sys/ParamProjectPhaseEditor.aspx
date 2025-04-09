<%@ Page Language="C#" AutoEventWireup="true" Title="项目阶段参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamProjectPhaseEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectPhaseEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">项目阶段代字<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCode" TableName="EPMS_PARAMPROJECTPHASE"
                    Field="PHASECODE" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">项目阶段名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbName" TableName="EPMS_PARAMPROJECTPHASE"
                    Field="PHASENAME" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">项目阶段简称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbShort" TableName="EPMS_PARAMPROJECTPHASE"
                    Field="PHASENAMEFORSHORT" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">阶段简称编码
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPhaseDrawCode" TableName="EPMS_PARAMPROJECTPHASE"
                    Field="PhaseDrawCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMPROJECTPHASE"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMPROJECTPHASE" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" runat="server"
                    regex="^([1-9]\d{0,1}|0)$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMPROJECTPHASE"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>下级项目阶段</b> <span runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                    <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                        regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行 </span>
            </td>
        </tr>
        <tr style="display: none">
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ParamPhaseId" UseDefaultDataSource="true" BindGridViewMethod="BindChildPhase"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目阶段代字">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbCode" activestatus="(23.*)" Text='<%#Eval("PhaseCode") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目阶段名称">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbName" activestatus="(23.*)" Text='<%#Eval("PhaseName") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目阶段简称">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbShort" activestatus="(23.*)" Text='<%#Eval("PhaseNameForShort") %>'></zhongsoft:LightTextBox>
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
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamPhaseId") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%#Eval("ParamPhaseId") %>'>
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamPhaseId") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMPROJECTPHASE" field="PARAMPHASEID"
        runat="server" />
    <!-- 项目级别，默认新建为1-->
    <input id="hiPhaseLevel" type="hidden" tablename="EPMS_PARAMPROJECTPHASE" field="PhaseLevel"
        runat="server" value="1" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

    </script>
</asp:Content>
