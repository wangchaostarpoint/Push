<%@ Page Title="项目进度确认详细信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ProjectValueConfirmDetail.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjectValueConfirmDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                年份
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPlanYear" field="PlanYear" tablename="EPMS_ThisProjectValue"
                    ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                月份
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPlanMonth" tablename="EPMS_ThisProjectValue"
                    field="PlanMonth" ReadOnly="true"></zhongsoft:LightTextBox>
                <input runat="server" type="hidden" id="hiPlanQuarter" tablename="EPMS_ThisProjectValue"
                    field="PlanQuarter" />
            </td>
            <td class="td-l">
                设总
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbManagerUserName" tablename="EPMS_ThisProjectValue"
                    field="ManagerUserName" ReadOnly="true"></zhongsoft:LightTextBox>
                <input runat="server" type="hidden" id="hiManagerUserID" tablename="EPMS_ThisProjectValue"
                    field="ManagerUserID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                项目名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectName" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工程类型
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectType" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPhaseName" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                设计规模
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectScale" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                立项日期
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFormDate" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                项目状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectState" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input runat="server" type="hidden" id="hiProjectState" tablename="EPMS_ThisProjectValue"
                    field="ProjectState" />
            </td>
            <td class="td-l">
                项目完成日期<span id="reqSp" style="display: none" class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtCompleteDate" tablename="EPMS_ThisProjectValue"
                    readonly="readonly" class="kpms-textbox-date" field="FactCompleteDate" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                确认状态
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbtnlIsConfirm" RepeatDirection="Horizontal"
                    flag="update" tablename="EPMS_ThisProjectValue" field="IsConfirm">
                    <asp:ListItem Value="0" Text="未确认"></asp:ListItem>
                    <asp:ListItem Value="1" Text="已确认"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-m" colspan="4">
                <asp:LinkButton runat="server" ID="lbtnRoll" CssClass="btn-query" Text="按卷册核定" OnClick="lbtnRoll_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnWorkDay" CssClass="btn-query" Text="按卷册工日核定"
                    OnClick="lbtnWorkDay_Click"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" style="text-align: center">
                确认完成进度
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
                    PageSize="30" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    ShowHeader="true" ShowFooter="false" DataKeyNames="ThisSpecialtyValueID" UseDefaultDataSource="true"
                    OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="类别" DataField="WorkType" Width="10%" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="专业" DataField="SpecialtyName" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="专业<br/>占比例<br/>(%)" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="9%">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpeRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%-- <zhongsoft:LightBoundField HeaderText="专业编号" DataField="SpecialtyCode" ItemStyle-Width="6%"
                            Visible="false">
                        </zhongsoft:LightBoundField>--%>
                        <%-- <zhongsoft:LightBoundField HeaderText="卷册总数" DataField="SumRollNum" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightTemplateField HeaderText="卷册数" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbSumRollNum" ForeColor="Blue" Text='<%#Eval("SumRollNum") %>'
                                    Style="text-decoration: underline" EnableTheming="false" OnClientClick='<%# String.Format("return openRollList(\"{0}\",\"{1}\",\"0\",\"{2}\")", Eval("ProjId"), Eval("SpeId"), Eval("WorkType"))  %>'></asp:LinkButton>
                                <%-- <asp:Label runat="server" ID="lbSumRollNum" Text='<%#Eval("SumRollNum") %>' Style="color: Blue;
                                    text-decoration: underline; cursor: pointer" OnClientClick='<%# String.Format("return openRollList(\"{0}\",\"{1}\",\"0\",\"{2}\")", Eval("ProjId"), Eval("SpeId"), Eval("WorkType"))  %>'></asp:Label>--%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br/>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="SumFinishedRollNum" ItemStyle-Width="6%" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本月完成<br/>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="FinishedRollNum" HtmlEncode="false" ItemStyle-Width="8%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="按卷册统计<br/>完成比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbRollRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="设总分配<br/>定额工日" DataField="TotalRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br/>定额工日" DataField="SumFinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本月完成<br/>工日" DataField="FinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="按定额工日<br/>完成比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbWorkDayRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightBoundField HeaderText="上月确认<br/>比例(%)" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalRate" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightTemplateField HeaderText="上月确认<br/>比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbLastTotalRate" content="lastRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightBoundField HeaderText="上期累计<br/>完成产值" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalValue" HtmlEncode="false" ItemStyle-Width="10%" Visible="false">
                        </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightTemplateField HeaderText="部门核定<br/>比例(%)">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiLastTotalRate" value='<%#Eval("LastTotalRate") %>' />
                                <input runat="server" type="hidden" id="hiSumFinishedRollNum" value='<%#Eval("SumFinishedRollNum") %>' />
                                <input runat="server" type="hidden" id="hiLastTotalValue" value='<%#Eval("LastTotalValue") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("WorkType") %>' />
                                <input runat="server" type="hidden" id="hiThisSpecialtyValueID" value='<%#Eval("ThisSpecialtyValueID") %>' />
                                <input runat="server" type="hidden" id="hiThisApproveValue" value='<%#Eval("ThisApproveValue") %>' />
                                <input runat="server" type="hidden" id="hiApproveCompleteRate" value='<%#Eval("ApproveCompleteRate") %>' />
                                <zhongsoft:LightTextBox runat="server" ID="tbThisDeptApproveTotalValue" Text='<%#Eval("ThisDeptApproveTotalValue") %>'
                                    content="deptValue" onblur="CalValues(this)" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    Style="text-align: right;" spe='<%#Eval("SpecialtyName") %>' sumRoll='<%#Eval("SumRollNum") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="确认比例<br/>(%)">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbThisApproveTotalValue" Text='<%#Eval("ThisApproveTotalValue") %>'
                                    onblur="CalTotalValues(this)" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    content="managerValue" Style="text-align: right;" sumRoll='<%#Eval("SumRollNum") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br/>产值" ItemStyle-HorizontalAlign="Right"
                            Visible="false">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbThisApproveValue" Text='<%#Eval("ThisApproveValue") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br/>比例(%)" Visible="false">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbApproveCompleteRate" Text='<%#Eval("ApproveCompleteRate") %>'
                                    regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）" Style="text-align: right;"
                                    onblur="CalValues(this)"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvDesignList" AllowPaging="false"
                    PageSize="30" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    ShowHeader="true" ShowFooter="false" DataKeyNames="ThisSpecialtyValueID" UseDefaultDataSource="true"
                    OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="类别" DataField="WorkType" Width="10%" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="专业" DataField="SpecialtyName" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="专业<br/>占比例<br/>(%)" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="9%">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpeRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightBoundField HeaderText="专业编号" DataField="SpecialtyCode" ItemStyle-Width="6%"
                            Visible="false">
                        </zhongsoft:LightBoundField>--%>
                        <%--<zhongsoft:LightBoundField HeaderText="卷册总数" DataField="SumRollNum" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightTemplateField HeaderText="卷册数" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbSumRollNum" ForeColor="Blue" Text='<%#Eval("SumRollNum") %>'
                                    Style="text-decoration: underline" EnableTheming="false" OnClientClick='<%# String.Format("return openRollList(\"{0}\",\"{1}\",\"0\",\"{2}\")", Eval("ProjId"), Eval("SpeId"), Eval("WorkType"))  %>'></asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br/>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="SumFinishedRollNum" ItemStyle-Width="6%" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本月完成<br/>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="FinishedRollNum" HtmlEncode="false" ItemStyle-Width="8%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="按卷册统计<br/>完成比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbRollRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="设总分配<br/>定额工日" DataField="TotalRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br/>定额工日" DataField="SumFinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本月完成<br/>工日" DataField="FinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="按定额工日<br/>完成比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbWorkDayRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightBoundField HeaderText="上期累计<br/>完成产值" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalValue" HtmlEncode="false" ItemStyle-Width="10%" Visible="false">
                        </zhongsoft:LightBoundField>--%>
                        <%-- <zhongsoft:LightBoundField HeaderText="上月确认<br/>比例(%)" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalRate" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightTemplateField HeaderText="上月确认<br/>比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbLastTotalRate" content="lastRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="部门核定<br/>比例(%)">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiLastTotalRate" value='<%#Eval("LastTotalRate") %>' />
                                <input runat="server" type="hidden" id="hiSumFinishedRollNum" value='<%#Eval("SumFinishedRollNum") %>' />
                                <input runat="server" type="hidden" id="hiLastTotalValue" value='<%#Eval("LastTotalValue") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("WorkType") %>' />
                                <input runat="server" type="hidden" id="hiThisSpecialtyValueID" value='<%#Eval("ThisSpecialtyValueID") %>' />
                                <input runat="server" type="hidden" id="hiThisApproveValue" value='<%#Eval("ThisApproveValue") %>' />
                                <input runat="server" type="hidden" id="hiApproveCompleteRate" value='<%#Eval("ApproveCompleteRate") %>' />
                                <zhongsoft:LightTextBox runat="server" ID="tbThisDeptApproveTotalValue" Text='<%#Eval("ThisDeptApproveTotalValue") %>'
                                    content="deptValue" onblur="CalValues(this)" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    Style="text-align: right;" spe='<%#Eval("SpecialtyName") %>' sumRoll='<%#Eval("SumRollNum") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="确认比例<br/>(%)">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbThisApproveTotalValue" Text='<%#Eval("ThisApproveTotalValue") %>'
                                    onblur="CalTotalValues(this)" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    content="managerValue" Style="text-align: right;" sumRoll='<%#Eval("SumRollNum") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br/>产值" ItemStyle-HorizontalAlign="Right"
                            Visible="false">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbThisApproveValue" Text='<%#Eval("ThisApproveValue") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br/>比例(%)" Visible="false">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbApproveCompleteRate" Text='<%#Eval("ApproveCompleteRate") %>'
                                    regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）" Style="text-align: right;"
                                    onblur="CalValues(this)"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvBiaoShuList" AllowPaging="false"
                    PageSize="30" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    ShowHeader="true" ShowFooter="false" DataKeyNames="ThisSpecialtyValueID" UseDefaultDataSource="true"
                    OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="类别" DataField="WorkType" Width="10%" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="专业" DataField="SpecialtyName" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="专业<br/>占比例<br/>(%)" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="9%">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpeRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightBoundField HeaderText="专业编号" DataField="SpecialtyCode" ItemStyle-Width="6%"
                            Visible="false">
                        </zhongsoft:LightBoundField>--%>
                        <%--<zhongsoft:LightBoundField HeaderText="卷册总数" DataField="SumRollNum" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightTemplateField HeaderText="卷册数" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbSumRollNum" ForeColor="Blue" Text='<%#Eval("SumRollNum") %>'
                                    Style="text-decoration: underline" EnableTheming="false" OnClientClick='<%# String.Format("return openRollList(\"{0}\",\"{1}\",\"0\",\"{2}\")", Eval("ProjId"), Eval("SpeId"), Eval("WorkType"))  %>'></asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br/>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="SumFinishedRollNum" ItemStyle-Width="6%" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本月完成<br/>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="FinishedRollNum" HtmlEncode="false" ItemStyle-Width="8%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="按卷册统计<br/>完成比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbRollRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="设总分配<br/>定额工日" DataField="TotalRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br/>定额工日" DataField="SumFinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本月完成<br/>工日" DataField="FinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="按定额工日<br/>完成比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbWorkDayRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightBoundField HeaderText="上期累计<br/>完成产值" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalValue" HtmlEncode="false" ItemStyle-Width="10%" Visible="false">
                        </zhongsoft:LightBoundField>--%>
                        <%-- <zhongsoft:LightBoundField HeaderText="上月确认<br/>比例(%)" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalRate" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightTemplateField HeaderText="上月确认<br/>比例(%)" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbLastTotalRate" content="lastRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="部门核定<br/>比例(%)">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiLastTotalRate" value='<%#Eval("LastTotalRate") %>' />
                                <input runat="server" type="hidden" id="hiSumFinishedRollNum" value='<%#Eval("SumFinishedRollNum") %>' />
                                <input runat="server" type="hidden" id="hiLastTotalValue" value='<%#Eval("LastTotalValue") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("WorkType") %>' />
                                <input runat="server" type="hidden" id="hiThisSpecialtyValueID" value='<%#Eval("ThisSpecialtyValueID") %>' />
                                <input runat="server" type="hidden" id="hiThisApproveValue" value='<%#Eval("ThisApproveValue") %>' />
                                <input runat="server" type="hidden" id="hiApproveCompleteRate" value='<%#Eval("ApproveCompleteRate") %>' />
                                <zhongsoft:LightTextBox runat="server" ID="tbThisDeptApproveTotalValue" Text='<%#Eval("ThisDeptApproveTotalValue") %>'
                                    content="deptValue" onblur="CalValues(this)" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    Style="text-align: right;" spe='<%#Eval("SpecialtyName") %>' sumRoll='<%#Eval("SumRollNum") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="确认比例<br/>(%)">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbThisApproveTotalValue" Text='<%#Eval("ThisApproveTotalValue") %>'
                                    onblur="CalTotalValues(this)" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    content="managerValue" Style="text-align: right;" sumRoll='<%#Eval("SumRollNum") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br/>产值" ItemStyle-HorizontalAlign="Right"
                            Visible="false">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbThisApproveValue" Text='<%#Eval("ThisApproveValue") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br/>比例(%)" Visible="false">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbApproveCompleteRate" Text='<%#Eval("ApproveCompleteRate") %>'
                                    onblur="CalValues(this)" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）" Style="text-align: right;"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input runat="server" id="hiThisProjectValueID" type="hidden" tablename="EPMS_ThisProjectValue"
        field="ThisProjectValueID" />
    <input runat="server" id="hiOrganizationID" type="hidden" tablename="EPMS_ThisProjectValue"
        field="OrganizationID" />
    <input runat="server" id="hiKCValue" type="hidden" />
    <input runat="server" id="hiSJValue" type="hidden" />
    <input runat="server" id="hiBSValue" type="hidden" />
    <input runat="server" id="hiCalType" type="hidden" />
    <script type="text/javascript" language="javascript">
        function initCustomerPlugin() {
            //对需要刷新的按钮注册返回值
            $('[flag="update"]').each(function () {
                $(this).bind('click', function () {
                    setReturnVal();
                });
            });
            checkDate();
            $("#<%=ddlProjectState.ClientID %> ").live("change", function () { checkDate(); });
        }

        function checkDate() {
            //如果项目状态选择为“设计完成”，则“项目完成日期”为必填项
            var state = $("#<%=ddlProjectState.ClientID %> :selected").val();
            if (state == "7") {
                $("#<%=txtCompleteDate.ClientID %>").attr("req", "1");
                $("#reqSp").show();
            }
            else {
                $("#<%=txtCompleteDate.ClientID %>").removeAttr("req");
                $("#<%=txtCompleteDate.ClientID %>").val("");
                $("#reqSp").hide();
            }
        }

        function checkForm() {
            var state = $("#<%=ddlProjectState.ClientID %> :selected").val();
            //如果项目状态改为“设计完成”，则部门核定比例必须全部为100%
            if (state == "7") {
                if ('<%=ActivityName %>' == "处理") {
                    if (!checkValue("dept")) {
                        alert("项目状态为“设计完成”，各专业完成比例必须为100%，请修改专业比例或项目状态后再保存。");
                        return false;
                    }
                }
                else if ('<%=ActivityName %>' == "接收确认") {
                    if (!checkValue("manager")) {
                        alert("项目状态为“设计完成”，各专业完成比例必须为100%，请修改专业比例或项目状态后再保存。");
                        return false;
                    }
                }
            }
            //如果部门核定比例全部为100%，则必须改为“设计完成”，必须选择设计完成日期
            else {
                if ('<%=ActivityName %>' == "处理") {
                    if (checkValue("dept")) {
                        alert("各专业完成比例均为100%，项目状态应该为“设计完成”，请修改专业比例或项目状态后再保存。");
                        return false;
                    }
                }
                else if ('<%=ActivityName %>' == "接收确认") {
                    if (checkValue("manager")) {
                        alert("各专业完成比例均为100%，项目状态应该为“设计完成”，请修改专业比例或项目状态后再保存。");
                        return false;
                    }
                }
            }
            //如果部门核定比例都为空或为零则提醒填写比例
            if (!checkRateValueAll()) {
                alert("您还未核定本月进度或部门核定比例小于上月确认比例，请核定后保存。");
                return false;
            }

            return true;
        }

        //验证是否填写核定比例且是否大于等于上月比例
        function checkRateValueAll() {
            var value;
            var $deptValue1;
            var $deptValue2;
            var $deptValue3;
            var isReasonable = true;

            $deptValue1 = $('#<%=gvList.ClientID %> [content="deptValue"]');
            $deptValue2 = $('#<%=gvDesignList.ClientID %> [content="deptValue"]');
            $deptValue3 = $('#<%=gvBiaoShuList.ClientID %> [content="deptValue"]');
            var $LastRate1 = $('#<%=gvList.ClientID %> [content="lastRate"]');
            var $LastRate2 = $('#<%=gvDesignList.ClientID %> [content="lastRate"]');
            var $LastRate3 = $('#<%=gvBiaoShuList.ClientID %> [content="lastRate"]');

            var len1 = $deptValue1.length;
            var len2 = $deptValue2.length;
            var len3 = $deptValue3.length;

            for (var i = 0; i < len1 - 1; i++) {
                if ($deptValue1.eq(i).val() == '' //|| parseFloat($deptValue1.eq(i).val()).toFixed(2) == 0.00 //允许为0 tianhl 20161009
                || parseFloat($deptValue1.eq(i).val()).toFixed(2) < parseFloat($LastRate1.eq(i).text()).toFixed(2)) {
                    isReasonable = false;
                    break;
                }
            }
            if (isReasonable) {
                for (var i = 0; i < len2 - 1; i++) {
                    if ($deptValue2.eq(i).val() == '' //|| parseFloat($deptValue2.eq(i).val()).toFixed(2) == 0.00 //允许为0 tianhl 20161009
                    || parseFloat($deptValue2.eq(i).val()).toFixed(2) < parseFloat($LastRate2.eq(i).text()).toFixed(2)) {
                        isReasonable = false;
                        break;
                    }
                }
            }
            if (isReasonable) {
                for (var i = 0; i < len3 - 1; i++) {
                    if ($deptValue3.eq(i).val() == '' //|| parseFloat($deptValue3.eq(i).val()).toFixed(2) == 0.00 //允许为0 tianhl 20161009
                     || parseFloat($deptValue3.eq(i).val()).toFixed(2) < parseFloat($LastRate3.eq(i).text()).toFixed(2)) {
                        isReasonable = false;
                        break;
                    }
                }
            }
            return isReasonable;
        }

        //验证核定比例
        function checkValue(type) {
            var value;
            var $deptValue1;
            var $deptValue2;
            var $deptValue3;
            var isAllWrite = true;
            if (type == "dept") {
                $deptValue1 = $('#<%=gvList.ClientID %> [content="deptValue"]');
                $deptValue2 = $('#<%=gvDesignList.ClientID %> [content="deptValue"]');
                $deptValue3 = $('#<%=gvBiaoShuList.ClientID %> [content="deptValue"]');
            }
            else {
                $deptValue1 = $('#<%=gvList.ClientID %> [content="managerValue"]');
                $deptValue2 = $('#<%=gvDesignList.ClientID %> [content="managerValue"]');
                $deptValue3 = $('#<%=gvBiaoShuList.ClientID %> [content="managerValue"]');
            }
            var len1 = $deptValue1.length;
            var len2 = $deptValue2.length;
            var len3 = $deptValue3.length;

            //如果列表没有数据，不应该是完成100% tianhl 20161222
            if (len1 == 0 && len2 == 0 && len3 == 0) {
                isAllWrite = false;
            }
            //<len改为< len1 - 1，排序最后的合计行 tianhl 20161226
            if (isAllWrite) {
                for (var i = 0; i < len1 - 1; i++) {
                    //只判断专业下卷册数不为0 的专业
                    if ($deptValue1.eq(i).attr('sumRoll') == '0')
                        continue;
                    if ($deptValue1.eq(i).val() == '' || parseFloat($deptValue1.eq(i).val()) < 100) {
                        isAllWrite = false;
                        break;
                    }
                }
            }
            if (isAllWrite) {
                for (var i = 0; i < len2 - 1; i++) {
                    //只判断专业下卷册数不为0 的专业
                    if ($deptValue2.eq(i).attr('sumRoll') == '0')
                        continue;
                    if ($deptValue2.eq(i).val() == '' || parseFloat($deptValue2.eq(i).val()) < 100) {
                        isAllWrite = false;
                        break;
                    }
                }
            }
            if (isAllWrite) {
                for (var i = 0; i < len3 - 1; i++) {
                    //只判断专业下卷册数不为0 的专业
                    if ($deptValue3.eq(i).attr('sumRoll') == '0')
                        continue;
                    if ($deptValue3.eq(i).val() == '' || parseFloat($deptValue3.eq(i).val()) < 100) {
                        isAllWrite = false;
                        break;
                    }
                }
            }
            return isAllWrite;
        }

        //本期完成产值计算公式：分项合同额 * 本期累计比例 - 上期末累计完成产值
        //分项合同额：实际分项合同额或预估分项合同额
        //本期累计比例=上期末累计比例 + 本期完成比例
        function CalValues(obj) {
            if ($(obj).val() != "") {
                var spr = parseFloat($(obj).val());
                var sumFinishedRollNumId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "hiSumFinishedRollNum");
                //上期末累计完成产值
                var lastValueId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "hiLastTotalValue");
                var lastValue = parseFloat($("#" + lastValueId).val());
                //类别
                var typeId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "hiWorkType");
                var type = $("#" + typeId).val();
                //分项合同额
                var contractValue = 0;
                if (type == "勘测") {
                    contractValue = $("#<%=hiKCValue.ClientID %>").val();
                }
                else if (type == "设计") {
                    contractValue = $("#<%=hiSJValue.ClientID %>").val();
                }
                else if (type == "标书编制") {
                    contractValue = $("#<%=hiBSValue.ClientID %>").val();
                }
                //上期累计完成比例(上月确认比例)
                var lastRate = 0;
                if (contractValue != 0) {
                    lastRate = (parseFloat(lastValue) / parseFloat(contractValue)) * 100;
                }

                var num = $("#" + sumFinishedRollNumId).val();
                if (parseFloat(spr) > 100) {
                    alert("完成比例不能大于100");
                    $(obj).val("");
                }
                else if (type == "勘测" && parseFloat(num) == 0 && parseFloat(spr) > 50) {
                    //如果是勘测的列表，才做如下判断，其他列表不做控制 tianhl 20170110
                    var phaseName = $("#<%=tbPhaseName.ClientID %> ").val();
                    var spe = $(obj).attr('spe');
                    var sumRoll = $(obj).attr('sumRoll');
                    //如果是投标阶段的项目，可以在没有交出卷册的情况下填写的专业完成比例>50% add by weihc on 2016-11-26
                    //投标阶段、或者卷册数为0测量专业，完成比例可以>50 tianhl 20161222
                    if (phaseName != "投标阶段" && !(spe == '测量专业' && sumRoll == '0')) {
                        alert("累计完成卷册数为0时，完成比例不能大于50");
                        $(obj).val("");
                    }
                }
                else if (parseFloat(lastRate) > parseFloat(spr)) {
                    alert("“部门核定比例”必须要大于等于“上月确认比例”");
                    $(obj).val("");
                }
                else {
                    var thisTotalRateId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "tbThisApproveTotalValue");
                    $("#" + thisTotalRateId).val(spr);
                    //                if (parseFloat(spr) + parseFloat(lastRateValue) > 100) {
                    //                    alert("累计完成比例不能大于100");
                    //                    $(obj).val("");
                    //                }
                    //本期完成产值
                    var thisValue = parseFloat(contractValue) * parseFloat(spr) / 100 - lastValue;
                    var lbId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "lbThisApproveValue");
                    var hiId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "hiThisApproveValue");
                    if (!isNaN(thisValue)) {
                        $("#" + lbId).html(thisValue.toFixed(2));
                        $("#" + hiId).val(thisValue.toFixed(2));
                    }
                    //本期完成比例
                    var thisRateId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "hiApproveCompleteRate");
                    var thisRate = (parseFloat(thisValue) / parseFloat(contractValue)) * 100;
                    if (!isNaN(thisRate)) {
                        $("#" + thisRateId).val(thisRate.toFixed(2));
                    }
                }
            }
        }
        function CalTotalValues(obj) {
            if ($(obj).val() != "") {
                var spr = parseFloat($(obj).val());
                var sumFinishedRollNumId = $(obj).attr("id").replace("tbThisApproveTotalValue", "hiSumFinishedRollNum");
                var num = $("#" + sumFinishedRollNumId).val();

                //上期末累计完成产值
                var lastValueId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "hiLastTotalValue");
                var lastValue = parseFloat($("#" + lastValueId).val());
                //类别
                var typeId = $(obj).attr("id").replace("tbThisDeptApproveTotalValue", "hiWorkType");
                var type = $("#" + typeId).val();
                //分项合同额
                var contractValue = 0;
                if (type == "勘测") {
                    contractValue = $("#<%=hiKCValue.ClientID %>").val();
                }
                else if (type == "设计") {
                    contractValue = $("#<%=hiSJValue.ClientID %>").val();
                }
                else if (type == "标书编制") {
                    contractValue = $("#<%=hiBSValue.ClientID %>").val();
                }
                //上期累计完成比例(上月确认比例)
                var lastRate = 0;
                if (contractValue != 0) {
                    lastRate = (parseFloat(lastValue) / parseFloat(contractValue)) * 100;
                }

                if (parseFloat(spr) > 100) {
                    alert("完成比例不能大于100");
                    $(obj).val("");
                }
                else if (parseFloat(num) == 0 && parseFloat(spr) > 50) {
                    var phaseName = $("#<%=tbPhaseName.ClientID %> ").val();
                    var spe = $(this).attr('spe');
                    var sumRoll = $(this).attr('sumRoll');
                    //如果是投标阶段的项目，可以在没有交出卷册的情况下填写的专业完成比例>50% add by weihc on 2016-11-26
                    //投标阶段、或者卷册数为0测量专业，完成比例可以>50 tianhl 20161222
                    if (phaseName != "投标阶段" && !(spe == '测量专业' && sumRoll == '0')) {
                        alert("累计完成卷册数为0时，完成比例不能大于50");
                        $(obj).val("");
                    }
                }
                else if (parseFloat(lastRate) > parseFloat(spr)) {
                    alert("“确认比例”必须要大于等于“上月确认比例”");
                    $(obj).val("");
                }
                else {
                    //本期完成产值
                    var thisValue = parseFloat(contractValue) * parseFloat(spr) / 100 - lastValue;
                    var lbId = $(obj).attr("id").replace("tbThisApproveTotalValue", "lbThisApproveValue");
                    var hiId = $(obj).attr("id").replace("tbThisApproveTotalValue", "hiThisApproveValue");
                    if (!isNaN(thisValue)) {
                        $("#" + lbId).html(thisValue.toFixed(2));
                        $("#" + hiId).val(thisValue.toFixed(2));
                    }
                    //本期完成比例
                    var thisRateId = $(obj).attr("id").replace("tbThisApproveTotalValue", "hiApproveCompleteRate");
                    var thisRate = (parseFloat(thisValue) / parseFloat(contractValue)) * 100;
                    if (!isNaN(thisRate)) {
                        $("#" + thisRateId).val(thisRate.toFixed(2));
                    }
                }
            }
        }

        //打开卷册目录 项目ID、专业ID
        function openRollList(orgID, SpeID, showWaringRow, rollType) {
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: orgID, SpecialtyID: SpeID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowWorkDay: 'true', IsShowRollEdit: 'false', IsShowLbtnApprove: "false", IsShowBtnAdd: "false", RollType: rollType });
            showDivDialog(encodeURI(url), null, 1020, 600, null);

            return false;
        }

        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = "saved";
        }
    </script>
</asp:Content>
