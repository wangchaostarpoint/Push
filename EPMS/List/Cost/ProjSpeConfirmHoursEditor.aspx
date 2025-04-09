<%@ Page Title="定额工日确认编辑" Language="C#" AutoEventWireup="true" CodeBehind="ProjSpeConfirmHoursEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjSpeConfirmHoursEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName','hiParamPhaseID':'ParamPhaseID','txtPhaseName':'PhaseName','txtProjectType':'ProjectType'}"
                    TableName="EPMS_ConfirmSpeQuotaForm" Field="ProjectName" activestatus="(2.*)"
                    req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ConfirmSpeQuotaForm"
                    Field="ProjectCode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目设总
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(2.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ConfirmSpeQuotaForm"
                    Field="ManagerUserName" />
                <input runat="server" type="hidden" id="hiManagerUserID" tablename="EPMS_ConfirmSpeQuotaForm"
                    field="ManagerUserID" />
            </td>
            <td class="td-l">
                项目类别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectType" runat="server" readonly="readonly"
                    class="kpms-textbox" activestatus="(2.*)" />
            </td>
            <td class="td-l">
                项目阶段
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" activestatus="(2.*)" readonly="readonly"
                    class="kpms-textbox" TableName="EPMS_ConfirmSpeQuotaForm" Field="PhaseName" />
                <input runat="server" type="hidden" id="hiParamPhaseID" tablename="EPMS_ConfirmSpeQuotaForm"
                    field="ParamPhaseID" />
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
                <asp:Button runat="server" ID="btnCal" Text="计算器" OnClientClick="ShowCal();return false;" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvSurveyList" AllowPaging="false"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    OnRowCreated="gvSurveyList_RowCreated" OnRowDataBound="gvSurveyList_RowDataBound"
                    ShowHeader="true" ShowFooter="false" UseDefaultDataSource="true">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="RowNum" HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="工作类别" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="10%">
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiSpecialtyHourAdjustDetailId" value='<%#Eval("ID") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("RollType") %>' />
                                <asp:Label runat="server" ID="lbWorkType" Text='<%#Eval("RollType") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="专业名称(编号)" DataField="SpecialtyName" ItemStyle-Width="15%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="工日" DataField="StandWorkDay" ItemStyle-Width="80">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="比率(%)" DataField="StandWorkDaySpare" ItemStyle-Width="80">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="工日" ItemStyle-Width="80">
                            <ItemTemplate>
                                <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" Text='<%#Eval("WorkDay") %>'
                                    SpeName='<%#Eval("SpecialtyName") %>' regex="^[0-9]{0,6}$" errmsg="请输入数字" Style="text-align: right;"
                                    onblur="CalSpeProportion(this,'KC')"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="比率(%)" ItemStyle-Width="80">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                    Text='<%#Eval("WorkDaySpare") %>' regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    Style="text-align: right;" onblur="CalSpeWorkDay(this,'KC')"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="调整记录">
                            <ItemStyle Width="25%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbModifyRecord"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="专业卷册工日" DataField="RollWorkDay" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvDesign" AllowPaging="false"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    ShowHeader="false" ShowFooter="false" OnRowDataBound="gvDesign_RowDataBound"
                    UseDefaultDataSource="true">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="RowNum" HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="工作类别" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="10%">
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiSpecialtyHourAdjustDetailId" value='<%#Eval("ID") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("RollType") %>' />
                                <asp:Label runat="server" ID="lbWorkType" Text='<%#Eval("RollType") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="专业名称(编号)" DataField="SpecialtyName" ItemStyle-Width="15%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="工日" DataField="StandWorkDay" ItemStyle-Width="80">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="比率(%)" DataField="StandWorkDaySpare" ItemStyle-Width="80">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="工日" ItemStyle-Width="80">
                            <ItemTemplate>
                                <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" Text='<%#Eval("WorkDay") %>'
                                    SpeName='<%#Eval("SpecialtyName") %>' regex="^[0-9]{0,6}$" errmsg="请输入数字" Style="text-align: right;"
                                    onblur="CalSpeProportion(this,'SJ')"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="比率(%)" ItemStyle-Width="80">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                    Text='<%#Eval("WorkDaySpare") %>' regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    Style="text-align: right;" onblur="CalSpeWorkDay(this,'SJ')"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="调整记录">
                            <ItemStyle Width="25%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbModifyRecord"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="专业卷册工日" DataField="RollWorkDay" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvBiaoShu" AllowPaging="false"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                    ShowHeader="false" ShowFooter="false" OnRowDataBound="gvBiaoShu_RowDataBound"
                    UseDefaultDataSource="true">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="RowNum" HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="5%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="工作类别" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="10%">
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiSpecialtyHourAdjustDetailId" value='<%#Eval("ID") %>' />
                                <input runat="server" type="hidden" id="hiWorkType" value='<%#Eval("RollType") %>' />
                                <asp:Label runat="server" ID="lbWorkType" Text='<%#Eval("RollType") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="专业名称(编号)" DataField="SpecialtyName" ItemStyle-Width="15%">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="工日" DataField="StandWorkDay" ItemStyle-Width="80">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="比率(%)" DataField="StandWorkDaySpare" ItemStyle-Width="80">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="工日" ItemStyle-Width="80">
                            <ItemTemplate>
                                <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" Text='<%#Eval("WorkDay") %>'
                                    SpeName='<%#Eval("SpecialtyName") %>' regex="^[0-9]{0,6}$" errmsg="请输入数字" Style="text-align: right;"
                                    onblur="CalSpeProportion(this,'BS')"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="比率(%)" ItemStyle-Width="80">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                    Text='<%#Eval("WorkDaySpare") %>' regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）"
                                    Style="text-align: right;" onblur="CalSpeWorkDay(this,'BS')"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="调整记录">
                            <ItemStyle Width="25%" />
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbModifyRecord"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="专业卷册工日" DataField="RollWorkDay" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input runat="server" id="hiFormID" type="hidden" tablename="EPMS_ConfirmSpeQuotaForm"
        field="ConfirmSpeQuotaFormID" />
    <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ConfirmSpeQuotaForm"
        field="OrganizationID" />
    <%--flag=3，将数据与流程数据区分开--%>
    <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_ConfirmSpeQuotaForm"
        field="Flag" value="3" />
    <input runat="server" id="hiKCSumWorkDay" type="hidden" />
    <input runat="server" id="hiSJSumWorkDay" type="hidden" />
    <input runat="server" id="hiBSSumWorkDay" type="hidden" />
    <script type="text/javascript">
        function ShowCal() {
            var url = "http://oa.hbed.com.cn/HR/(S(rl4ytr55j4xcu355d2wbji55))/HRSoft/help/caculator.htm";
            var sFeature = "dialogHeight:500px;dialogWidth:400px;";
            window.showModalDialog(url, '', sFeature);
        }

        //根据所填工日计算比例
        function CalSpeProportion(obj, type) {
            if ($(obj).attr("readonly") != "readonly") {
                var thisNum = parseInt($(obj).val());
                if (!isNaN(thisNum)) {
                    if ($(obj).attr("SpeName") == "合计") {
                        switch (type) {
                            case ("KC"):
                                $("#<%=hiKCSumWorkDay.ClientID %>").val(thisNum);
                                break;
                            case ("SJ"):
                                $("#<%=hiSJSumWorkDay.ClientID %>").val(thisNum);
                                break;
                            case ("BS"):
                                $("#<%=hiBSSumWorkDay.ClientID %>").val(thisNum);
                                break;
                        }
                    }
                    else {
                        var sumId = '';
                        var typeName = '';
                        var gvId = '';
                        switch (type) {
                            case ("KC"):
                                sumId = "<%=hiKCSumWorkDay.ClientID %>";
                                typeName = "勘测";
                                gvId = "<%=gvSurveyList.ClientID %>";
                                break;
                            case ("SJ"):
                                sumId = "<%=hiSJSumWorkDay.ClientID %>";
                                typeName = "设计";
                                gvId = "<%=gvDesign.ClientID %>";
                                break;
                            case ("BS"):
                                sumId = "<%=hiBSSumWorkDay.ClientID %>";
                                typeName = "标书编制";
                                gvId = "<%=gvBiaoShu.ClientID %>";
                                break;
                        }
                        if ($("#" + sumId).val() == '') {
                            $(obj).val('');
                            alert("请填写" + typeName + "合计值！");
                        }
                        else {
                            var sum = parseInt($("#" + sumId).val());
                            //计算备用工日，判断是否超过合计
                            var nowSum = 0;
                            $("#" + gvId).find("[id$='tbWorkQuota']").each(function (index) {
                                if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
                                    var num = 0;
                                    if ($(this).val() != "") {
                                        num = parseInt($(this).val());
                                        nowSum = nowSum + num;
                                    }
                                }
                            });
                            if (nowSum > sum) {
                                $(obj).val('');
                                alert("各专业工日之和不能大于合计工日!");
                            }
                            else {
                                //计算比率
                                if (sum != 0) {
                                    var proportionId = $(obj).attr("id").replace("tbWorkQuota", "tbSpeProportion");
                                    var proportion = ((thisNum / sum) * 100).toFixed(2);
                                    $("#" + proportionId).val(proportion);
                                }
                                //计算备用工日及比率
                                $("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val(sum - nowSum);
                                $("#" + gvId).find("[id$='tbSpeProportion'][spename$='备用工日']").val(((sum - nowSum) / sum * 100).toFixed(2));
                            }
                        }
                    }
                }
            }
        }

        //根据所填比例计算工日
        function CalSpeWorkDay(obj, type) {
            if ($(obj).attr("readonly") != "readonly") {
                var thisNum = parseFloat($(obj).val());
                if (!isNaN(thisNum)) {
                    if ($(obj).attr("SpeName") == "合计") {
                        switch (type) {
                            case ("KC"):
                                $("#<%=hiKCSumWorkDay.ClientID %>").val(thisNum);
                                break;
                            case ("SJ"):
                                $("#<%=hiSJSumWorkDay.ClientID %>").val(thisNum);
                                break;
                            case ("BS"):
                                $("#<%=hiBSSumWorkDay.ClientID %>").val(thisNum);
                                break;
                        }
                    }
                    else {
                        var sumId = '';
                        var typeName = '';
                        var gvId = '';
                        switch (type) {
                            case ("KC"):
                                sumId = "<%=hiKCSumWorkDay.ClientID %>";
                                typeName = "勘测";
                                gvId = "<%=gvSurveyList.ClientID %>";
                                break;
                            case ("SJ"):
                                sumId = "<%=hiSJSumWorkDay.ClientID %>";
                                typeName = "设计";
                                gvId = "<%=gvDesign.ClientID %>";
                                break;
                            case ("BS"):
                                sumId = "<%=hiBSSumWorkDay.ClientID %>";
                                typeName = "标书编制";
                                gvId = "<%=gvBiaoShu.ClientID %>";
                                break;
                        }
                        if ($("#" + sumId).val() == '') {
                            $(obj).val('');
                            alert("请填写" + typeName + "合计值！");
                        }
                        else {
                            var sum = parseInt($("#" + sumId).val());
                            //计算备用工日，判断是否超过合计
                            var nowSum = 0;
                            $("#" + gvId).find("[id$='tbSpeProportion']").each(function (index) {
                                if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
                                    var num = 0;
                                    if ($(this).val() != "") {
                                        num = parseInt($(this).val());
                                        nowSum = nowSum + num;
                                    }
                                }
                            });
                            if (nowSum > 100) {
                                $(obj).val('');
                                alert("各专业占比之和不能大于100!");
                            }
                            else {
                                //计算工日
                                if (sum != 0) {
                                    var workDayId = $(obj).attr("id").replace("tbSpeProportion", "tbWorkQuota");
                                    var workDay = (thisNum * sum / 100).toFixed(0);
                                    $("#" + workDayId).val(workDay);
                                }
                                //计算备用工日及比率
                                $("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val(sum - workDay);
                                $("#" + gvId).find("[id$='tbSpeProportion'][spename$='备用工日']").val(thisNum);
                            }
                        }
                    }
                }
            }
        }
    </script>
</asp:Content>
