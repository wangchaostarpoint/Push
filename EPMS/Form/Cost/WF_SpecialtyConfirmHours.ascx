<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SpecialtyConfirmHours.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Cost.WF_SpecialtyConfirmHours" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName','hiParamPhaseID':'ParamPhaseID','txtPhaseName':'PhaseName','txtProjectType':'ProjectType'}"
                TableName="EPMS_ConfirmSpeQuotaForm" Field="ProjectName" activestatus="(2.分配专业定额工日)"
                req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.分配专业定额工日)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_ConfirmSpeQuotaForm"
                Field="ProjectCode" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(2.分配专业定额工日)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_ConfirmSpeQuotaForm"
                Field="ManagerUserName" req="1" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="EPMS_ConfirmSpeQuotaForm"
                field="ManagerUserID" />
        </td>
        <td class="td-l">
            项目类别
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectType" runat="server" readonly="readonly"
                maxlength="16" class="kpms-textbox" activestatus="(2.分配专业定额工日)" />
        </td>
        <td class="td-l">
            项目阶段
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" activestatus="(2.分配专业定额工日)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_ConfirmSpeQuotaForm"
                Field="PhaseName" />
            <input runat="server" type="hidden" id="hiParamPhaseID" tablename="EPMS_ConfirmSpeQuotaForm"
                field="ParamPhaseID" />
        </td>
    </tr>
    <%--<uc1:ProjectCommon ID="ProjectCommon1" runat="server" />--%>
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
                    <zhongsoft:LightBoundField HeaderText="专业名称(编号)" DataField="SpecialtyName" ItemStyle-Width="25%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="工日" DataField="StandWorkDay" ItemStyle-Width="80">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="比率(%)" DataField="StandWorkDaySpare" ItemStyle-Width="80">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="工日" ItemStyle-Width="80">
                        <ItemTemplate>
                            <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" Text='<%#Eval("WorkDay") %>'
                                SpeName='<%#Eval("SpecialtyName") %>' regex="^[0-9]+(\.[0-9]{1})?$" errmsg="请输入数字（最多一位小数）"
                                Style="text-align: right;" onblur="CalSpeProportion(this,'KC')"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="比率(%)" ItemStyle-Width="80">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                Text='<%#Eval("WorkDaySpare") %>' regex="^[0-9]+(\.[0-9]{1,2})?$" errmsg="请输入数字（最多两位小数）"
                                Style="text-align: right; width: 78px" onblur="CalSpeWorkDay(this,'KC')"></zhongsoft:LightTextBox><asp:Label
                                    ID="lbEx" runat="server" Text="%" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整记录" Visible="false">
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
                    <zhongsoft:LightBoundField HeaderText="专业名称(编号)" DataField="SpecialtyName" ItemStyle-Width="25%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="工日" DataField="StandWorkDay" ItemStyle-Width="80">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="比率(%)" DataField="StandWorkDaySpare" ItemStyle-Width="80">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="工日" ItemStyle-Width="80">
                        <ItemTemplate>
                            <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" Text='<%#Eval("WorkDay") %>'
                                SpeName='<%#Eval("SpecialtyName") %>' regex="^[0-9]+(\.[0-9]{1})?$" errmsg="请输入数字（最多一位小数）"
                                Style="text-align: right;" onblur="CalSpeProportion(this,'SJ')"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="比率(%)" ItemStyle-Width="80">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                Text='<%#Eval("WorkDaySpare") %>' regex="^[0-9]+(\.[0-9]{1,2})?$" errmsg="请输入数字（最多两位小数）"
                                Style="text-align: right; width: 78px" onblur="CalSpeWorkDay(this,'SJ')"></zhongsoft:LightTextBox><asp:Label
                                    ID="lbEx" runat="server" Text="%" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整记录" Visible="false">
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
                    <zhongsoft:LightBoundField HeaderText="专业名称(编号)" DataField="SpecialtyName" ItemStyle-Width="25%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="工日" DataField="StandWorkDay" ItemStyle-Width="80">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="比率(%)" DataField="StandWorkDaySpare" ItemStyle-Width="80">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="工日" ItemStyle-Width="80">
                        <ItemTemplate>
                            <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" Text='<%#Eval("WorkDay") %>'
                                SpeName='<%#Eval("SpecialtyName") %>' regex="^[0-9]+(\.[0-9]{1})?$" errmsg="请输入数字（最多一位小数）"
                                Style="text-align: right;" onblur="CalSpeProportion(this,'BS')"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="比率(%)" ItemStyle-Width="80">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                Text='<%#Eval("WorkDaySpare") %>' regex="^[0-9]+(\.[0-9]{1,2})?$" errmsg="请输入数字（最多两位小数）"
                                Style="text-align: right; width: 78px" onblur="CalSpeWorkDay(this,'BS')"></zhongsoft:LightTextBox><asp:Label
                                    ID="lbEx" runat="server" Text="%" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整记录" Visible="false">
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
<input runat="server" id="hiProjectTotleWorkQuota" type="hidden" />
<input runat="server" id="hiSpecailtySumWorkQuota" type="hidden" />
<input runat="server" id="hiKCSumWorkDay" type="hidden" />
<input runat="server" id="hiSJSumWorkDay" type="hidden" />
<input runat="server" id="hiBSSumWorkDay" type="hidden" />
<script type="text/javascript">
    function ShowCal() {
        var url = "http://oa.hbed.com.cn/HR/(S(rl4ytr55j4xcu355d2wbji55))/HRSoft/help/caculator.htm";
        var sFeature = "dialogHeight:500px;dialogWidth:400px;";
        window.showModalDialog(url, '', sFeature);
        //showDivDialog(encodeURI(url), null, 400, 400, null);
    }

    //根据所填工日计算比例
    function CalSpeProportion(obj, type) {
        //        var thisNum = parseInt($(obj).val());
        //        if (!isNaN(thisNum)) {
        //            var proportionId = $(obj).attr("id").replace("tbWorkQuota", "tbSpeProportion");
        //            var totleNum = parseInt($("#<%=hiProjectTotleWorkQuota.ClientID %>").val());
        //            //alert(proportionId);
        //            var proportion = ((thisNum / totleNum).toFixed(4) * 100).toFixed(2);
        //            $("#" + proportionId).val(proportion);
        //        }
        //        CalSumWorkQuota(obj);
        if ($(obj).attr("readonly") != "readonly") {
            var thisNum = parseFloat($(obj).val());
            if (!isNaN(thisNum)) {
                if ($(obj).attr("SpeName") == "合计") {
                    switch (type) {
                        case ("KC"):
                            CalAllSpeProportion(obj, "<%=gvSurveyList.ClientID %>", "<%=hiKCSumWorkDay.ClientID %>")
                            $("#<%=hiKCSumWorkDay.ClientID %>").val(thisNum);
                            break;
                        case ("SJ"):
                            CalAllSpeProportion(obj, "<%=gvDesign.ClientID %>", "<%=hiSJSumWorkDay.ClientID %>")
                            $("#<%=hiSJSumWorkDay.ClientID %>").val(thisNum);
                            break;
                        case ("BS"):
                            CalAllSpeProportion(obj, "<%=gvBiaoShu.ClientID %>", "<%=hiBSSumWorkDay.ClientID %>")
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
                        var sum = parseFloat($("#" + sumId).val());
                        //计算备用工日，判断是否超过合计
                        var nowSum = 0;
                        $("#" + gvId).find("[id$='tbWorkQuota']").each(function (index) {
                            if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
                                var num = 0;
                                if ($(this).val() != "") {
                                    num = parseFloat($(this).val());
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
                            $("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val((sum - nowSum).toFixed(1));
                            $("#" + gvId).find("[id$='tbSpeProportion'][spename$='备用工日']").val(((sum - nowSum) / sum * 100).toFixed(2));
                        }
                    }
                }
            }
        }
    }

    //填写合计后重新计算当前各专业占比
    function CalAllSpeProportion(obj, gvId, hiSumId) {
        var nowSum = parseFloat($(obj).val());
        var addNum = nowSum - parseFloat($("#" + hiSumId).val());
        var nowBy = parseFloat($("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val());
        var newBy = nowBy + addNum;
        if (isNaN(newBy)) {
            newBy = 0;
        }

        var all = 0;
        //计算备用工日，判断是否超过合计
        $("#" + gvId).find("[id$='tbWorkQuota']").each(function (index) {
            if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
                var num = 0;
                if ($(this).val() != "") {
                    num = parseFloat($(this).val());
                    all = all + num;
                }
            }
        });
        if (all > nowSum) {
            $(obj).val('');
            alert("各专业工日之和不能大于合计工日!");
        }
        else {
            $("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val(newBy.toFixed(1));
            $("#" + gvId).find("[id$='tbWorkQuota'][spename$!='备用工日'][spename$!='合计']").each(function (index) {
                var nowWorkDay = $(this).val();
                var proportionId = $(this).attr("id").replace("tbWorkQuota", "tbSpeProportion");
                if (nowSum > 0) {
                    var nowProportion = (nowWorkDay / nowSum * 100).toFixed(2);
                    if (isNaN(nowProportion)) {
                        nowProportion = 0;
                    }
                    $("#" + proportionId).val(nowProportion);
                }
                else {
                    $("#" + proportionId).val(0);
                    $(this).val(0);
                }
            });
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
                        var sum = parseFloat($("#" + sumId).val());
                        //计算备用工日，判断是否超过合计
                        var nowSum = 0;
                        $("#" + gvId).find("[id$='tbSpeProportion']").each(function (index) {
                            if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
                                var num = 0;
                                if ($(this).val() != "") {
                                    num = parseFloat($(this).val());
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
                                var workDay = (thisNum * sum / 100).toFixed(1);
                                $("#" + workDayId).val(workDay);
                            }
                            //计算备用工日及比率
                            //$("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val(sum - workDay);
                            var rate = (100 - nowSum).toFixed(2);
                            $("#" + gvId).find("[id$='tbSpeProportion'][spename$='备用工日']").val(rate);
                            $("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val((sum * rate / 100).toFixed(1));
                        }
                    }
                }
            }
        }
    }
</script>
