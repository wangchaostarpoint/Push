<%@ Page Language="C#" AutoEventWireup="true" Title="成品类别参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamProductTypeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProductEditor" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                成品类别<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbRule" TableName="EPMS_ParamProductType"
                    Field="ProductType" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                简称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProductTypeForShort" TableName="EPMS_ParamProductType"
                    Field="ProductTypeForShort" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否压力管道
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" TableName="EPMS_ParamProductType" Field="Memo"
                    activestatus="(23.*)" ID="ddlType">
                    <asp:ListItem Value="0">非压力管道</asp:ListItem>
                    <asp:ListItem Value="1">压力管道</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目类型
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" activestatus="(23.*)"
                    field="ParamProjectTypeID" tablename="EPMS_ParamProductType">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                项目级别
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList ID="ddlProjectLevel" runat="server" activestatus="(23.*)"
                    Width="100px" Field="ProjectLevel" TableName="EPMS_ParamProductType">
                </zhongsoft:LightDropDownList>
                <asp:LinkButton class="subtoolbarlink" flag="addProjectLevel" ID="addProjecLevel"
                    runat="server" EnableTheming="false" CssClass="subtoolbarlink" displaystatus="(23.*)">
                    <span>
                        <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新建项目级别" width="16"
                            height="16" /></span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目阶段
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiParamPhaseID" field="ParamPhaseID" tablename="EPMS_ParamProductType" />
            </td>
            <td class="td-l">
                任务类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" TableName="EPMS_ParamProductType"
                    Width="100px" Field="ParamWBSTypeID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                适用的流程
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlForm" TableName="EPMS_ParamProductType"
                    Field="ExtendedAttribute" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td colspan="2" class="td-M">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_ParamProductType"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否选用校审规则<span class="req-star">*</span>
            </td>
            <td>
                <asp:RadioButtonList runat="server" ID="rbIsUseVerifyRule" field="IsUseVerifyRule"
                    RepeatDirection="Horizontal" AutoPostBack="true" tablename="EPMS_ParamProductType"
                    req="1" activestatus="(23.*)" OnSelectedIndexChanged="rbIsUseVerifyRule_SelectedIndexChanged">
                </asp:RadioButtonList>
            </td>
            <td class="td-l" flag="rule">
                校审规则
            </td>
            <td class="td-r" flag="rule">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRule" TableName="EPMS_ParamProductType"
                    Field="ParamVerifyRuleID" activestatus="(23.*)" OnSelectedIndexChanged="ddlRule_SelectedIndexChanged"
                    AutoPostBack="true">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamProductType" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,2}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamProductType"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>对应的校审岗位及角色</b> <span id="spanAdd" runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                    <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                        regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行 </span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ParamVerifyRoleID" UseDefaultDataSource="true" BindGridViewMethod="BindVerify"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="校审角色">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlRole">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="校审岗位">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPost">
                                </zhongsoft:LightDropDownList>
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
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamVerifyRoleID") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamVerifyRoleID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    OnClientClick="return confirm('确定要删除吗？')" CommandArgument='<%#Eval("ParamVerifyRoleID") %>'>
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <%--  <tr>
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>对应的校审岗位及角色</b>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ParamVerifyRoleID" UseDefaultDataSource="true" BindGridViewMethod="BindVerify"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="VerifyRole" HeaderText="校审角色">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="校审岗位">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="Sort" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>

            </td>
        </tr>--%>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ParamProductType" field="ParamProductTypeID"
        runat="server" />
    <asp:Button runat="server" ID="btnRebindLevel" OnClick="btnRebindLevel_Click" Style="display: none" />
    <input type="hidden" runat="server" id="hiProjectLevel" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
            disPlayVerifyRule();
            //新建项目级别
            $('[flag="addProjectLevel"]').each(function () {
                $(this).bind('click', function () {
                    return addProjectLevel();
                });
            });
            //选择是否项目报销
            $('#<%=rbIsUseVerifyRule.ClientID %>').live("change", function () {
                disPlayVerifyRule(true);
            });
        }

        //是否冲借款改变时，控制 选择借款单按钮的显隐
        function disPlayVerifyRule() {
            var isUseVerifyRule = $("#<%=rbIsUseVerifyRule.ClientID %> input[type=radio]:checked").val();
            if (isUseVerifyRule == "<%=(int)BoolType.是 %>") {
                $("[flag=rule]").show();
            }
            else {
                $("[flag=rule]").hide();
            }
        }

        function afterAddLevel() {
             <%=Page.ClientScript.GetPostBackEventReference(this.btnRebindLevel,"")%>;
        }

        //添加项目级别
        function addProjectLevel() {
            var projectLevel=$("#<%=hiProjectLevel.ClientID %>").val();
            var json={paramGeneralName:escape(projectLevel)};
            var url = buildBizUrl(2, null, "EPMS/List/Sys/ParamProjectGeneralEditor.aspx", json);
            var callBack = null;
            callBack = afterAddLevel;
            showDivDialog(url, null, 850, 550, callBack);
            return false;
        }
    </script>
</asp:Content>
