<%@ Page Title="添加关键路径" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="KeyWorkFlowEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.KeyWorkFlowEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                业务板块<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlate" TableName="EPMS_KeyWorkFlow"
                    Field="ParamBusinessPlateID" activestatus="(2.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                是否关键路径
            </td>
            <td class="td-r" colspan="2">
                <asp:RadioButtonList runat="server" ID="rbtnlIsKey" TableName="EPMS_KeyWorkFlow"
                    Field="IsKey" RepeatDirection="Horizontal" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                流程表单<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="2">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectForm" IsMutiple="false"
                    req="1" SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" EnableTheming="false" ShowAttrs="name,FormCode"
                    ResultForControls="{'hiFormObjectId':'id'}" PageUrl="~/Sys/UserComFunction/UserFormSelector.aspx"
                    activestatus="(2.*)" />
                <input runat="server" id="hiFormObjectId" type="hidden" tablename="EPMS_KeyWorkFlow"
                    field="ObjectId" />
            </td>
            <td class="td-l">
                显示流程名称
            </td>
            <td class="td-r" colspan="2">
                <zhongsoft:LightTextBox runat="server" ID="tbFromDisplayName" TableName="EPMS_KeyWorkFlow"
                    Field="FormDisplayName" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <%--<td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_KeyWorkFlow"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>

            </td>--%>
        </tr>
        <tr runat="server" id="trProjectType">
            <td class="td-l">
                工程类型
            </td>
            <td class="td-r" colspan="5">
                <asp:CheckBox runat="server" ID="cbProjectTypeAll" Text="全选" AutoPostBack="true"
                    OnCheckedChanged="cbProjectTypeAll_CheckedChanged" />
                <asp:CheckBoxList runat="server" ID="cblProjectType" RepeatDirection="Horizontal"
                    RepeatColumns="5">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr runat="server" id="trProjectPhase">
            <td class="td-l">
                项目阶段
            </td>
            <td class="td-r" colspan="5">
                <asp:CheckBox runat="server" ID="cbProjectPhaseAll" Text="全选" AutoPostBack="true"
                    OnCheckedChanged="cbProjectPhaseAll_CheckedChanged" />
                <asp:CheckBoxList runat="server" ID="cblProjectPhase" RepeatDirection="Horizontal"
                    RepeatColumns="5">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td colspan="4" style="text-align: center;">
                <b>辅助流程列表</b>
            </td>
            <td style="text-align: right;">
                <asp:Button runat="server" ID="btnAddAssWorkflow" Text="添加辅助流程" OnClientClick="return batchAddForms();"
                    displaystatus="(3.*)" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvAssList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="KeyWorkFlowID" UseDefaultDataSource="true" BindGridViewMethod="BindAssWorkform"
                    OnRowDataBound="gvAssList_RowDataBound" OnRowCommand="gvAssList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="流程名称">
                            <ItemTemplate>
                                <input runat="server" id="hiKeyId" type="hidden" value='<%#Eval("ObjectId") %>' />
                                <asp:Label runat="server" ID="lbFormName"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="显示名称">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbDisplayName" Text='<%#Eval("FormDisplayName") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除">
                            <ItemTemplate>
                                <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                    CommandName="Del" CausesValidation="false" OnClientClick="return checkBeforeDel(this);"
                                    CommandArgument='<%#DataBinder.Eval(Container.DataItem,"KeyWorkFlowID") %>'>
                                </asp:ImageButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td colspan="4" style="text-align: center;">
                <b>关键路径表单列表</b>
            </td>
            <td style="text-align: right;">
                <asp:Button runat="server" ID="btnAddKeyWorkflow" Text="添加记录" OnClick="btnAddKeyWorkflow_Click"
                    displaystatus="(3.*)" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="KeyWorkFlowOfProjectID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="项目类型">
                            <ItemTemplate>
                                <input runat="server" id="hiKeyId" type="hidden" value='<%#Eval("KeyWorkFlowOfProjectID") %>' />
                                <asp:Label runat="server" ID="lbProjectType"></asp:Label>
                                <input runat="server" id="hiProjectTypeId" type="hidden" value='<%#Eval("ParamProjectTypeID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目阶段">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbProjectPhaseName"></asp:Label>
                                <input runat="server" id="hiProjectPhaseId" type="hidden" value='<%#Eval("ParamPhaseID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="计划执行数">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbPlanRunNum" Text='<%#Eval("PlanRunNum") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否强制执行<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbtnlIsControl" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Text="是"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="否"></asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否关键路径<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbtnlIsKey" RepeatDirection="Horizontal"
                                    req="1">
                                    <asp:ListItem Value="1" Text="是"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="否"></asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbtnlFlag" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Text="是"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="否"></asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除">
                            <ItemTemplate>
                                <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                    CommandName="Del" CausesValidation="false" OnClientClick="return checkBeforeDel(this);"
                                    CommandArgument='<%#DataBinder.Eval(Container.DataItem,"KeyWorkFlowOfProjectID") %>'>
                                </asp:ImageButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <asp:Button runat="server" ID="btnAddAssForms" OnClick="btnAddAssForms_Click" Visible="false" />
    <input runat="server" id="hiddenFlag" value="1" tablename="EPMS_KeyWorkFlow" type="hidden"
        field="Flag" />
    <input runat="server" id="hiBusinessPlateId" type="hidden" tablename="EPMS_KeyWorkFlow"
        field="KeyWorkFlowID" />
    <input type="hidden" runat="server" id="hiFormsXML" />
    <script type="text/javascript" language="javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

        function checkBeforeDel(obj) {
            return confirm("您确定要删除吗？");
        }

        //添加辅助流程
        function batchAddForms() {
            var param = new InputParamObject("m");
            var filter = "";
            return buildDivSelector('<%=hiFormsXML.ClientID %>', param, filter, buildQueryUrl("/Sys/UserComFunction/UserFormSelector.aspx", null), 850, 550, addForms);
        }

        function addForms() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddAssForms,"")%>;
        }
    </script>
</asp:Content>
