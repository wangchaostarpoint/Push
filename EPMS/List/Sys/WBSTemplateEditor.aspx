<%@ Page Language="C#" AutoEventWireup="true" Title="WBS任务模板详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="WBSTemplateEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.WBSTemplateEditor" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="toolBtn">
    <asp:LinkButton runat="server" ID="btnAddMutual" OnClientClick="return false" CssClass="subtoolbarlink"
        EnableTheming="false" displaystatus="(3.*)" Visible="false">
        <span>添加互提资料</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnAddExternal" OnClientClick="return false" CssClass="subtoolbarlink"
        EnableTheming="false" displaystatus="(3.*)" Visible="false">
        <span>添加外部资料</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnAddTask" OnClientClick="return false" CssClass="subtoolbarlink"
        EnableTheming="false" displaystatus="(3.*)" Visible="false">
        <span>添加任务书</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnAddVerify" OnClientClick="return false" CssClass="subtoolbarlink"
        EnableTheming="false" displaystatus="(3.*)" Visible="false">
        <span>添加校审要点</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnAddMandatory" OnClientClick="return false"
        CssClass="subtoolbarlink" EnableTheming="false" displaystatus="(3.*)" Visible="false">>
        <span>添加强条模板</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目模板
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjTemp" readonly="readonly" activestatus="(23.*)"
                    class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                任务管理方式<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblWBSMode" activestatus="(2.*)" RepeatDirection="Horizontal"
                    AutoPostBack="true" OnSelectedIndexChanged="rblWBSMode_SelectedIndexChanged"
                    req="1">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr flag="parent">
            <td class="td-l">
                父级任务编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtParentCode" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="WBSCode"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSTemplateSelector.aspx"
                    activestatus="(23.*)" ResultForControls="{'txtParentName':'name','hiParentID':'id'}"
                    OnClick="txtParentCode_Click"></zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">
                父级任务名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtParentName" readonly="readonly" activestatus="(23.*)"
                    class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
                <%-- <zhongsoft:LightTextBox runat="server" ID="tbParentName" activestatus="(23.*)" ReadOnly="true"></zhongsoft:LightTextBox>--%>
                <input type="hidden" runat="server" id="hiParentID" tablename="EPMS_WBSTemplate"
                    field="ParentID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                任务类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" TableName="EPMS_WBSTemplate"
                    Field="ParamWBSTypeID" activestatus="(2.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_WBSTemplate" field="WBSType" />
            </td>
            <td class="td-l">
                编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWBSCode" TableName="EPMS_WBSTemplate"
                    Field="WBSCode" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbWBSName" TableName="EPMS_WBSTemplate"
                    Field="WBSName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" nowrap>
                成品号（校验号）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSerialCode" TableName="EPMS_WBSTemplate"
                    Field="SerialCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l" style="white-space: nowrap;">
                任务作业（系统）方式
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSWay" TableName="EPMS_WBSTemplate"
                    Field="WBSWay" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr id="wbsFlag">
            <td class="td-l">
                任务标识<%--<span class="req-star">*</span>--%>
            </td>
            <td class="td-r">
                <asp:CheckBoxList runat="server" ID="cblWBFFlag" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiWBSFlag" tablename="EPMS_WBSTemplate" field="WBSFlag" />
            </td>
            <td class="td-l">
                所属模块<br />
                （系统、区域）<%--<span class="req-star">*</span> req="1"--%>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlModule" TableName="EPMS_WBSTemplate"
                    Field="BelongModuleID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiModuleName" tablename="EPMS_WBSTemplate"
                    field="BelongModule" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属专业
                <!-- 大专业-->
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" TableName="EPMS_WBSTemplate"
                    Field="BelongSpecialtyID" activestatus="(23.*)" OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged"
                    AutoPostBack="true">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiSpecialtyCode" tablename="EPMS_WBSTemplate"
                    field="BelongSpecialtyCode" />
                <input type="hidden" runat="server" id="hiSpecialtyName" tablename="EPMS_WBSTemplate"
                    field="BelongSpecialtyName" />
            </td>
            <td class="td-l">
                执行专业
                <!-- 小专业-->
            </td>
            <td class="td-r">
                <%--<zhongsoft:LightDropDownList runat="server" ID="ddlExecSpecialty" TableName="EPMS_WBSTemplate"
                    Field="ExecSpecialtyID" activestatus="(23.*)" OnSelectedIndexChanged="ddlExecSpecialty_SelectedIndexChanged"
                    AutoPostBack="true">
                </zhongsoft:LightDropDownList>--%>
                <zhongsoft:XHtmlInputText runat="server" ID="txtSpe" readonly="readonly" TableName="EPMS_WBSTemplate"
                    Field="ExecSpecialtyName" activestatus="(23.*)" class="kpms-textbox" style="width: 50%;">
                </zhongsoft:XHtmlInputText>
                <asp:ImageButton runat="server" ID="ibtnSelectSpe" ImageUrl="~/Themes/Images/look-up.gif"
                    OnClientClick="return selectSpe()" displaystatus="(23.*)" />
                <input type="hidden" runat="server" id="hiExecSpecialtyID" tablename="EPMS_WBSTemplate"
                    field="ExecSpecialtyID" />
                <input type="hidden" runat="server" id="hiExecSpecialtyCode" tablename="EPMS_WBSTemplate"
                    field="ExecSpecialtyCode" />
            </td>
        </tr>
        <tr id="notShowInCalculate">
            <td class="td-l">
                行业定额
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfTrade" TableName="EPMS_WBSTemplate"
                    Field="WorkDayOfTrade" activestatus="(23.*)" Style="text-align: right; width: 70px;"
                    regex="^\d{0,2}.[0-9]{0,2}$" errmsg="请输入最多2位整数2位小数"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                企业定额
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfEnterprise" TableName="EPMS_WBSTemplate"
                    Field="WorkDayOfEnterprise" activestatus="(23.*)" Style="text-align: right; width: 70px;"
                    regex="^\d{0,2}.[0-9]{0,2}$" errmsg="请输入最多2位整数2位小数"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr id="showInCalculate" style="display: none">
            <td class="td-l">
                预计工期(小时)
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbWorkDayOfConfirm" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" activestatus="(23.*)" field="PlanTerm" tablename="EPMS_WBSEntity"
                    Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多12位整数，2位小数">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                任务等级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSLevel" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiWBSLevel" tablename="EPMS_WBSTemplate"
                    field="WBSLevel" />
            </td>
            <td class="td-l">
                任务来源
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSSource" TableName="EPMS_WBSTemplate"
                    Field="WBSSource" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <span id="idContent">任务内容</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbWBSContent" TableName="EPMS_WBSTemplate"
                    Field="WBSContent" activestatus="(23.*)" maxText="2048"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">
                适用范围
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUseRange" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/TemplateUsingRangeSelector.aspx"
                    TableName="EPMS_WBSTemplate" Field="UsingRange" activestatus="(23.*)"></zhongsoft:LightObjectSelector>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_WBSTemplate"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_WBSTemplate"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="trMutualTitle" runat="server">
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>互提资料</b>
            </td>
        </tr>
        <tr id="trMutualData" runat="server">
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvMutual" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="WBSTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindMutual"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料项编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料项名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WBSType" HeaderText="资料类别">
                        </zhongsoft:LightBoundField>
                        <%-- <zhongsoft:LightBoundField DataField="FileImportance" HeaderText="资料重要性">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileSource" HeaderText="资料来源">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="DelayDays" HeaderText="延迟（开工起）" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="所属专业">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块（系统、区域）">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("FileItemTemplateID") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="fileItem('0','3','<%# Eval("WBSTemplateID") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("WBSTemplateID")+",0" %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr flag="hide">
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>外部资料</b>
            </td>
        </tr>
        <tr flag="hide">
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvExternal" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="FileItemTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindExternal"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="FileItemCode" HeaderText="资料项编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileItemName" HeaderText="资料项名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileType" HeaderText="资料类别">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileImportance" HeaderText="资料重要性">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileSource" HeaderText="资料来源">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="DelayDays" HeaderText="延迟（开工起）" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="所属专业">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块（系统、区域）">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("FileItemTemplateID") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="fileItem('1','3','<%# Eval("FileItemTemplateID") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("FileItemTemplateID")+",1" %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr flag="hide">
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>任务书</b>
            </td>
        </tr>
        <tr flag="hide">
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvTask" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="WBSBookTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindTask"
                    OnRowDataBound="gvTask_RowDataBound" OnRowCommand="gvTask_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="ContentOrRange" HeaderText="任务内容、范围、分工">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="BasisOrConditions" HeaderText="任务依据及条件">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="PrincipleOrRequire" HeaderText="任务原则及要求">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ReleParam" HeaderText="任务相关参数">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="TechMeasure" HeaderText="技术组织措施（技术指导书）">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="Description" HeaderText="描述">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rblTask" RepeatDirection="Horizontal" key='<%#Eval("WBSBookTemplateID") %>'
                                    OnSelectedIndexChanged="rblTask_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="taskItem('3','<%# Eval("WBSBookTemplateID") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("WBSBookTemplateID")%>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr flag="hide">
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>校审要点</b>
            </td>
        </tr>
        <tr flag="hide">
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvVerify" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="VerifyPointTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindVerify"
                    OnRowDataBound="gvVerify_RowDataBound" OnRowCommand="gvVerify_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="VerifyPoint" HeaderText="校审要点">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="VerifyRole" HeaderText="校审角色">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="Description" HeaderText="描述">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rblVerify" RepeatDirection="Horizontal" key='<%#Eval("VerifyPointTemplateID") %>'
                                    OnSelectedIndexChanged="rblVerify_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="taskItem('3','<%# Eval("VerifyPointTemplateID") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("VerifyPointTemplateID")%>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr flag="hide">
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>强条模板</b>
            </td>
        </tr>
        <tr flag="hide">
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvMandatory" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="WBSTemplateID,MandatoryTemplateID" UseDefaultDataSource="true"
                    BindGridViewMethod="BindMandatory" OnRowDataBound="gvMandatory_RowDataBound"
                    OnRowCommand="gvMandatory_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="技术信息及处理意见">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbTechInfo"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="信息来源">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbTechSource"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="执行专业">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbExecuteSpecialty"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="描述">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbDescription"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("WBSTemplateID")+","+Eval("MandatoryTemplateID") %>'
                                    OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr flag="recspe" id="trrecspe" runat="server">
            <td class="td-l">
                <span flag="recSpeName">接受专业</span>
            </td>
            <td colspan="3" class="td-m">
                <span id="Span1" runat="server" style="float: right" class="req-star" displaystatus="(2.*)">
                    请先保存，再添加专业</span> <span style="float: right;" id="spAddSpe" runat="server" displaystatus="(3.*)">
                        <asp:LinkButton runat="server" ID="ibtnAddSpe" CssClass="subtoolbarlink" EnableTheming="false"
                            OnClientClick="return false">
                            <span>
                                <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="添加专业" width="16"
                                    height="16" />添加专业</span></asp:LinkButton></span>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvSpecialtyList" AllowPaging="false"
                    PageSize="5" AutoGenerateColumns="false" ShowExport="false" AllowSorting="true"
                    DataKeyNames="WBSTemplateID,ParamSpecialtyID" UseDefaultDataSource="true" BindGridViewMethod="BindSpecialtyList"
                    OnRowCommand="gvSpecialtyList_RowCommand" OnRowDataBound="gvSpecialtyList_RowDataBound"
                    EmptyDataText="没有专业信息">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="专业代字">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpeCode"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="专业名称">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpeName"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("WBSTemplateID")+","+Eval("ParamSpecialtyID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr flag="recroll" id="trrecroll" runat="server">
            <td class="td-l">
                <span flag="recRollName">接受卷册</span>
            </td>
            <td colspan="3" class="td-m">
                <span id="Span2" runat="server" style="float: right" class="req-star" displaystatus="(2.*)"
                    flag="rollPaper">请先保存，再添加卷册</span> <span style="float: right;" id="spAddWbs" runat="server"
                        displaystatus="(3.*)">
                        <asp:LinkButton runat="server" ID="ibtnAddWbs" CssClass="subtoolbarlink" EnableTheming="false"
                            OnClientClick="return false">
                            <span>
                                <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="添加接受卷册" width="16"
                                    height="16" />添加接受卷册</span></asp:LinkButton></span>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvWBSList" AllowPaging="false"
                    PageSize="5" DataKeyNames="WBSTemplateID,ReleWBSTemplateID" AutoGenerateColumns="false"
                    ShowExport="false" AllowSorting="true" UseDefaultDataSource="true" BindGridViewMethod="BindWBSList"
                    OnRowCommand="gvWBSList_RowCommand">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("WBSTemplateID")+","+Eval("ReleWBSTemplateID") %>'
                                    OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr flag="relwbs" id="trrelwbs" runat="server">
            <td class="td-l">
                <span flag="recRollName">关联卷册</span>
            </td>
            <td colspan="3" class="td-m">
                <span id="Span3" runat="server" style="float: right" class="req-star" displaystatus="(2.*)">
                    请先保存，再添加关联卷册</span> <span style="float: right;" id="Span4" runat="server" displaystatus="(3.*)">
                        <asp:LinkButton runat="server" ID="lkbAddRelWBS" CssClass="subtoolbarlink" EnableTheming="false"
                            OnClientClick="return false">
                            <span>
                                <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="添加关联卷册" width="16"
                                    height="16" />添加关联卷册</span></asp:LinkButton></span>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvRelWBS" AllowPaging="false"
                    PageSize="5" DataKeyNames="WBSTemplateID,ReleWBSTemplateID" AutoGenerateColumns="false"
                    ShowExport="false" AllowSorting="true" UseDefaultDataSource="true" BindGridViewMethod="BindRelWBSList"
                    OnRowCommand="gvRelWBS_RowCommand">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册模板编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册模板名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("WBSTemplateID")+","+Eval("ReleWBSTemplateID") %>'
                                    OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_WBSTemplate" field="WBSTemplateID"
        runat="server" />
    <input type="hidden" runat="server" id="hiMandatoryXML" />
    <input type="hidden" runat="server" id="hiExeSpeXML" />
    <asp:Button runat="server" ID="btnBindMutual" Visible="false" OnClick="btnBindMutual_Click" />
    <asp:Button runat="server" ID="btnBindExternal" Visible="false" OnClick="btnBindExternal_Click" />
    <asp:Button runat="server" ID="btnBindTask" Visible="false" OnClick="btnBindTask_Click" />
    <asp:Button runat="server" ID="btnBindVerify" Visible="false" OnClick="btnBindVerify_Click" />
    <asp:Button runat="server" ID="btnBindMandatory" Visible="false" OnClick="btnBindMandatory_Click" />
    <asp:Button runat="server" ID="btnAddSpe" OnClick="btnAddSpe_Click" Style="display: none" />
    <input runat="server" id="hiSpeXML" type="hidden" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            $('[flag="hide"]').hide();

            initParent();

            $('#<%=rblWBSMode.ClientID %>').live('change',function(){
                initParent();
            });

            $('#<%=btnAddMutual.ClientID %>').live('click',function(){
                fileItem("0","2","");
            });
            $('#<%=btnAddExternal.ClientID %>').live('click',function(){
                fileItem("1","2","");
            });

            $('#<%=btnAddTask.ClientID %>').live('click',function(){
                taskItem("2","");
            });

            $('#<%=btnAddVerify.ClientID %>').live('click',function(){
                verifyItem("2","");
            });

            $('#<%=btnAddMandatory.ClientID %>').live('click',function(){
                mandatoryItem();
            });
            var modeID=$('#<%=rblWBSMode.ClientID %>').find("[checked]").val();
            if(modeID==4||modeID==2){
               //隐藏：任务标识、所属模块（系统，区域）、行业定额、企业定额、适用范围
               $("#notShowInCalculate").hide();
               //wbsFlag
               $("#wbsFlag").hide();
            }

            $('#<%=ibtnAddSpe.ClientID %>').bind('click', function () {
                templateAddSpe();
            });

            $('#<%=ibtnAddWbs.ClientID %>').bind('click', function () {
                templateseldWbs();
            });
            //lkbAddRelWBS
            $('#<%=lkbAddRelWBS.ClientID %>').bind('click', function () {
                templateseldWbs();
            });
        }

        function initParent() {
             var mode = $('#<%=rblWBSMode.ClientID %> input[type=radio]:checked').val();
             var wbsType = $('#<%=hiWBSType.ClientID %>').val();
             var dlWBSType = $('#<%=ddlWBSType.ClientID %> option:selected').text();
             $("#notShowInCalculate").show();
             $("#showInCalculate").hide();
             //设计接口资料、计算书必须选择卷册模板信息
             if(mode=='<%=(int)WBSMode.设计接口资料 %>'||
             (dlWBSType=="<%=WBSType.计算书 %>"||(dlWBSType==""&&wbsType=="<%=WBSType.计算书 %>"))) {
                $('[flag="parent"]').show();
            
                $('#<%=txtParentCode.ClientID %>').attr('req', '1');
                $('#<%=txtParentName.ClientID %>').attr('req', '1');
                //计算书需要修改某些提示词
                if(mode!='<%=(int)WBSMode.设计接口资料 %>'){
                  $("#idContent").text("程序");
                  $("#notShowInCalculate").hide();
                  $("#showInCalculate").show();
                }
             }
             else {
                $('[flag="parent"]').hide();

                $('#<%=txtParentCode.ClientID %>').removeAttr('req');
                $('#<%=txtParentName.ClientID %>').removeAttr('req');
             }
        }

        //资料项
        function fileItem(fileType,actionType, bizId) {
            var url = "/EPMS/List/Sys/FileItemTemplateEditor.aspx?actionType=" + actionType + "&FileType=" + fileType;
            url += "&WBSTemplateID=<%=BusinessObjectId %>";
            if (bizId != '') {
                url += "&bizid=" + bizId;
            }
            url=buildQueryUrl(url,null);
            var callBack=null;
            if(actionType != "1") {
                if(fileType=="0"){
                    callBack = bindMutual;
                }
                else if(fileType=="1"){
                    callBack = bindExternal;
                }
            }

            //需要屏蔽掉服务器控件的回发，否则无法回调
            showDivDialog(url,"",800,500,callBack);
        }

        //执行后台绑定互提资料
        function bindMutual() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindMutual,"")%>;
        }

         //执行后台绑定外部资料
        function bindExternal() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindExternal,"")%>;
        }

        //任务书
        function taskItem(actionType, bizId) {
            var url = "/EPMS/List/Sys/TaskBookTemplateEditor.aspx?actionType=" + actionType;
            url += "&WBSTemplateID=<%=BusinessObjectId %>";
            if (bizId != '') {
                url += "&bizid=" + bizId;
            }
            url=buildQueryUrl(url,null);
            var callBack=null;
            if(actionType != "1") {
                callBack = bindTask;
            }

            //需要屏蔽掉服务器控件的回发，否则无法回调
            showDivDialog(url,"",800,500,callBack);
        }

        //执行后台绑定任务书
        function bindTask(){
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindTask,"")%>;
        }

        //校审要点
        function verifyItem(actionType, bizId) {
            var url = "/EPMS/List/Sys/VerifyPointTemplateEditor.aspx?actionType=" + actionType;
            url += "&WBSTemplateID=<%=BusinessObjectId %>";
            if (bizId != '') {
                url += "&bizid=" + bizId;
            }
            url=buildQueryUrl(url,null);
            var callBack=null;
            if(actionType != "1") {
                callBack = bindVerify;
            }

            //需要屏蔽掉服务器控件的回发，否则无法回调
            showDivDialog(url,"",800,500,callBack);
        }

        //后台执行绑定校审要点
        function bindVerify(){
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindVerify,"")%>;
        }

        //批量添加强条
        function mandatoryItem() {
            var param = new InputParamObject("m");
            getMandatoryTemplate('<%=hiMandatoryXML.ClientID %>', param, '', bindMandatory);
        }

        //执行后台添加强条数据
        function bindMandatory(){
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindMandatory,"")%>;
        }

        //选择执行专业
        function selectSpe() {
            var xml = $("#<%=hiExeSpeXML.ClientID %>").val();
            var json={ActionFlag:1,SelectFlag:0,ParamSpecialtyTypeID:$('#<%=ddlSpecialty.ClientID %>').val()};
            var url = buildQueryUrl("EPMS/Obsolete/SpeSelector.aspx", null);
            var param = new InputParamObject("s");
            buildDivSelector('', param, json, url, 550, 400, setSpeVal)
            return false;
        }

        //根据返回值，设置控件值
        function setSpeVal(re) {
          
        }

        function templateAddSpe() { 
            var param = new InputParamObject("m");
            var json = { FileItemTemplateID:'<%=BusinessObjectId %>',SelectedProjTempID:"<%=ProjTempID %>" };
            getDivSpecialty('<%=hiSpeXML.ClientID %>', param, json, addSpes);
            return false;
        }

        function templateseldWbs(){
            var json={WBSModeID:3,FileItemTemplateID:"<%=BusinessObjectId %>",SelectedProjTempID:"<%=ProjTempID %>"};
            var url = buildQueryUrl("EPMS/List/Sys/RelateWBSTemplate.aspx", json);
            showDivDialog(url,"",1100,650,addSpes);
            return false;
        }


        //执行后台添加专业数据
        function addSpes() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddSpe,"")%>;
        }

    </script>
</asp:Content>
