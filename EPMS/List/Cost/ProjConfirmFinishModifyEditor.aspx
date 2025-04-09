<%@ Page Title="项目进度确认修改编辑" Language="C#" AutoEventWireup="true" CodeBehind="ProjConfirmFinishModifyEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjConfirmFinishModifyEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                修改日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtModifyDate" tablename="EPMS_ProjValueConfirmModify"
                    readonly="readonly" class="kpms-textbox-date" field="ModifyDate" activestatus="(2.*)" />
            </td>
            <td class="td-l">
                修改人员
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtModifyUserName" runat="server" TableName="EPMS_ProjValueConfirmModify"
                    Field="ModifyUserName" activestatus="(2.*)" class="kpms-textbox-short" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input id="hiModifyUserCode" type="hidden" runat="server" tablename="EPMS_ProjValueConfirmModify"
                    field="ModifyUserCode" />
                <input id="hiModifyUserId" type="hidden" runat="server" tablename="EPMS_ProjValueConfirmModify"
                    field="ModifyUserId" />
            </td>
            <td class="td-l">
                修改部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtModifyDeptName" runat="server" TableName="EPMS_ProjValueConfirmModify"
                    Field="ModifyDeptName" activestatus="(2.*)" class="kpms-textbox-short" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input id="hiModifyDeptId" type="hidden" runat="server" tablename="EPMS_ProjValueConfirmModify"
                    field="ModifyDeptId" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                年份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear" tablename="EPMS_ProjValueConfirmModify"
                    class="kpms-ddlsearch" EnableTheming="false" field="year" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                月份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" tablename="EPMS_ProjValueConfirmModify"
                    class="kpms-ddlsearch" EnableTheming="false" field="month" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                设总
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbManagerUserName" ReadOnly="true" activestatus="(2.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','tbManagerUserName':'ManagerUserName','tbPhaseName':'PhaseName','tbProjectType':'ProjectType','tbProjectScale':'ProjectScale'}"
                    TableName="EPMS_ProjValueConfirmModify" Field="ProjectName" activestatus="(2.*)"
                    req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
                <input id="hiOrganizationID" type="hidden" runat="server" tablename="EPMS_ProjValueConfirmModify"
                    field="OrganizationID" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProjValueConfirmModify"
                    Field="ProjectCode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工程类型
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectType" ReadOnly="true" activestatus="(2.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPhaseName" ReadOnly="true" activestatus="(2.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                设计规模
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectScale" ReadOnly="true" activestatus="(2.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" style="text-align: right">
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
                        <zhongsoft:LightBoundField HeaderText="专业名称" DataField="SpecialtyName" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="专业编号" DataField="SpecialtyCode" ItemStyle-Width="6%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="卷册总数" DataField="SumRollNum" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="SumFinishedRollNum" ItemStyle-Width="6%" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本期完成<br>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="FinishedRollNum" HtmlEncode="false" ItemStyle-Width="8%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="上期累计<br>完成产值" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalValue" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="上期累计<br>完成比例" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalRate" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="专业占比<br>(%)" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="9%">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpeRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="总工日" DataField="TotalRollWorkDay" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br>总工日" DataField="SumFinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本期完<br>成工日" DataField="FinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br>产值" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiLastTotalRate" value='<%#Eval("LastTotalRate") %>' />
                                <input runat="server" type="hidden" id="hiLastTotalValue" value='<%#Eval("LastTotalValue") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("WorkType") %>' />
                                <input runat="server" type="hidden" id="hiThisSpecialtyValueID" value='<%#Eval("ThisSpecialtyValueID") %>' />
                                <input runat="server" type="hidden" id="hiThisApproveValue" value='<%#Eval("ThisApproveValue") %>' />
                                <asp:Label runat="server" ID="lbThisApproveValue" Text='<%#Eval("ThisApproveValue") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br>比例(%)">
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
                        <zhongsoft:LightBoundField HeaderText="专业名称" DataField="SpecialtyName" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="专业编号" DataField="SpecialtyCode" ItemStyle-Width="6%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="卷册总数" DataField="SumRollNum" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="SumFinishedRollNum" ItemStyle-Width="6%" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本期完成<br>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="FinishedRollNum" HtmlEncode="false" ItemStyle-Width="8%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="上期累计<br>完成产值" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalValue" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="上期累计<br>完成比例" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalRate" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="专业占比<br>(%)" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="9%">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpeRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="总工日" DataField="TotalRollWorkDay" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br>总工日" DataField="SumFinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本期完<br>成工日" DataField="FinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br>产值" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiLastTotalRate" value='<%#Eval("LastTotalRate") %>' />
                                <input runat="server" type="hidden" id="hiLastTotalValue" value='<%#Eval("LastTotalValue") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("WorkType") %>' />
                                <input runat="server" type="hidden" id="hiThisSpecialtyValueID" value='<%#Eval("ThisSpecialtyValueID") %>' />
                                <input runat="server" type="hidden" id="hiThisApproveValue" value='<%#Eval("ThisApproveValue") %>' />
                                <asp:Label runat="server" ID="lbThisApproveValue" Text='<%#Eval("ThisApproveValue") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br>比例(%)">
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
                        <zhongsoft:LightBoundField HeaderText="专业名称" DataField="SpecialtyName" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="专业编号" DataField="SpecialtyCode" ItemStyle-Width="6%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="卷册总数" DataField="SumRollNum" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="SumFinishedRollNum" ItemStyle-Width="6%" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本期完成<br>卷册数" ItemStyle-HorizontalAlign="Right"
                            DataField="FinishedRollNum" HtmlEncode="false" ItemStyle-Width="8%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="上期累计<br>完成产值" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalValue" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="上期累计<br>完成比例" ItemStyle-HorizontalAlign="Right"
                            DataField="LastTotalRate" HtmlEncode="false" ItemStyle-Width="10%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="专业占比<br>(%)" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="9%">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpeRate"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="总工日" DataField="TotalRollWorkDay" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="累计完成<br>总工日" DataField="SumFinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="本期完<br>成工日" DataField="FinishRollWorkDay"
                            ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br>产值" ItemStyle-HorizontalAlign="Right">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiLastTotalRate" value='<%#Eval("LastTotalRate") %>' />
                                <input runat="server" type="hidden" id="hiLastTotalValue" value='<%#Eval("LastTotalValue") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("WorkType") %>' />
                                <input runat="server" type="hidden" id="hiThisSpecialtyValueID" value='<%#Eval("ThisSpecialtyValueID") %>' />
                                <input runat="server" type="hidden" id="hiThisApproveValue" value='<%#Eval("ThisApproveValue") %>' />
                                <asp:Label runat="server" ID="lbThisApproveValue" Text='<%#Eval("ThisApproveValue") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="本期核定<br>比例(%)">
                            <ItemStyle Width="10%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbApproveCompleteRate" Text='<%#Eval("ApproveCompleteRate") %>'
                                    regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）" Style="text-align: right;"
                                    onblur="CalValues(this)"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ProjValueConfirmModify" field="ProjValueConfirmModifyId"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_ProjValueConfirmModify" field="Flag"
        runat="server" value="1" />
    <input runat="server" id="hiKCValue" type="hidden" />
    <input runat="server" id="hiSJValue" type="hidden" />
    <input runat="server" id="hiBSValue" type="hidden" />
    <input runat="server" id="hiCalType" type="hidden" />
    <script type="text/javascript" language="javascript">
        //本期完成产值计算公式：分项合同额 * 本期累计比例 - 上期末累计完成产值
        //分项合同额：实际分项合同额或预估分项合同额
        //本期累计比例=上期末累计比例 + 本期完成比例
        function CalValues(obj) {
            if ($(obj).val() != "") {
                var spr = parseFloat($(obj).val());

                //上期累计完成比例
                var lastRateId = $(obj).attr("id").replace("tbApproveCompleteRate", "hiLastTotalRate");
                var lastRateValue = parseFloat($("#" + lastRateId).val());
                if (parseFloat(spr) + parseFloat(lastRateValue) > 100) {
                    alert("累计完成比例不能大于100");
                    $(obj).val("");
                }
                else {
                    //类别
                    var typeId = $(obj).attr("id").replace("tbApproveCompleteRate", "hiWorkType");
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
                    //上期末累计完成产值
                    var lastValueId = $(obj).attr("id").replace("tbApproveCompleteRate", "hiLastTotalRate");
                    var lastValue = parseFloat($("#" + lastValueId).val());
                    //本期完成产值
                    var thisRate = parseFloat(contractValue) * (parseFloat(spr) + parseFloat(lastRateValue)) / 100 - lastValue;

                    var lbId = $(obj).attr("id").replace("tbApproveCompleteRate", "lbThisApproveValue");
                    var hiId = $(obj).attr("id").replace("tbApproveCompleteRate", "hiThisApproveValue");
                    if (!isNaN(thisRate)) {
                        $("#" + lbId).html(thisRate.toFixed(2));
                        $("#" + hiId).val(thisRate.toFixed(2));
                    }
                }
            }
        }
    </script>
</asp:Content>
