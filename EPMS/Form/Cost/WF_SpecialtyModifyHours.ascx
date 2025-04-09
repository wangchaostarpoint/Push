<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SpecialtyModifyHours.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Cost.WF_SpecialtyModifyHours" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            项目名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName','hiParamPhaseID':'ParamPhaseID','txtPhaseName':'PhaseName','txtProjectType':'ProjectType'}"
                TableName="EPMS_ModifySpeQuotaForm" Field="ProjectName" activestatus="(2.调整专业定额工日)"
                req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ModifySpeQuotaForm"
                field="OrganizationID" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.调整专业定额工日)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_ModifySpeQuotaForm"
                Field="ProjectCode" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(2.调整专业定额工日)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_ModifySpeQuotaForm"
                Field="ManagerUserName" req="1" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="EPMS_ModifySpeQuotaForm"
                field="ManagerUserID" />
        </td>
        <td class="td-l">
            项目类别
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectType" runat="server" readonly="readonly"
                maxlength="16" class="kpms-textbox" activestatus="(2.调整专业定额工日)" />
        </td>
        <td class="td-l">
            项目阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" activestatus="(2.调整专业定额工日)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_ModifySpeQuotaForm"
                Field="PhaseName" req="1" />
            <input runat="server" type="hidden" id="hiParamPhaseID" tablename="EPMS_ModifySpeQuotaForm"
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
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
                PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                OnRowDataBound="gvList_RowDataBound" ShowHeader="true" ShowFooter="false" UseDefaultDataSource="true">
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
                    <zhongsoft:LightTemplateField HeaderText="调整前工日" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectManHourSumPer" Text='<%#Eval("WorkDayPer") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整前比率(%)" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectManHourSumPerProportion" Text='<%#Eval("WorkDaySparePer") %>'></asp:Label>%
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整工日" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbAdjustHour" regex="^[-+]?[0-9]+(\.[0-9]{1})?$"
                                errmsg="请输入数字（最多一位小数）" Style="text-align: right;" onblur="CalSpeProportion(this,'KC')"
                                Text='<%#Eval("WorkDayAdjust") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整后工日" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" SpeName='<%#Eval("SpecialtyName") %>'
                                onblur="CalNewSpeProportion(this,'KC')" regex="^[0-9]+(\.[0-9]{1})?$" errmsg="请输入数字（最多一位小数）"
                                Style="text-align: right;" Text='<%#Eval("WorkDay") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整后比率(%)" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                regex="^[0-9]+(\.[0-9]{1,2})?$" errmsg="请输入数字（最多两位小数）" Style="text-align: right;
                                width: 60px" Text='<%#Eval("WorkDaySpare") %>'></zhongsoft:LightTextBox>%
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整记录">
                        <ItemStyle Width="25%" />
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important;" title='<%#Eval("ModifyRecord")%>'>
                                <%# gvList.GetSubString(Eval("ModifyRecord"), 30)%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="专业卷册<br>工日" HtmlEncode="false" DataField="RollWorkDay"
                        ItemStyle-Width="10%">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvDesgin" AllowPaging="false"
                PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                OnRowDataBound="gvList_RowDataBound" ShowHeader="false" ShowFooter="false" UseDefaultDataSource="true">
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
                    <zhongsoft:LightTemplateField HeaderText="调整前工日" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectManHourSumPer" Text='<%#Eval("WorkDayPer") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整前比率(%)" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectManHourSumPerProportion" Text='<%#Eval("WorkDaySparePer") %>'></asp:Label>%
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整工日" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbAdjustHour" regex="^[-+]?[0-9]+(\.[0-9]{1})?$"
                                errmsg="请输入数字（最多一位小数）" Style="text-align: right;" onblur="CalSpeProportion(this,'SJ')"
                                Text='<%#Eval("WorkDayAdjust") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整后工日" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" SpeName='<%#Eval("SpecialtyName") %>'
                                onblur="CalNewSpeProportion(this,'SJ')" regex="^[0-9]+(\.[0-9]{1})?$" errmsg="请输入数字（最多一位小数）"
                                Style="text-align: right;" Text='<%#Eval("WorkDay") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整后比率(%)" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                regex="^[0-9]+(\.[0-9]{1,2})?$" errmsg="请输入数字（最多两位小数）" Style="text-align: right;
                                width: 60px" Text='<%#Eval("WorkDaySpare") %>'></zhongsoft:LightTextBox>%
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整记录">
                        <ItemStyle Width="25%" />
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important;" title='<%#Eval("ModifyRecord")%>'>
                                <%# gvDesgin.GetSubString(Eval("ModifyRecord"), 30)%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="专业卷册工日" DataField="RollWorkDay" ItemStyle-Width="10%">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvBiaoShu" AllowPaging="false"
                Visible="false" PageSize="10" AutoGenerateColumns="false" ShowExport="false"
                AllowSorting="false" OnRowDataBound="gvList_RowDataBound" ShowHeader="false"
                ShowFooter="false" UseDefaultDataSource="true">
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
                    <zhongsoft:LightTemplateField HeaderText="调整前工日" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectManHourSumPer" Text='<%#Eval("WorkDayPer") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整前比率(%)" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectManHourSumPerProportion" Text='<%#Eval("WorkDaySparePer") %>'></asp:Label>%
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整工日" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbAdjustHour" regex="^[-+]?[0-9]+(\.[0-9]{1})?$"
                                errmsg="请输入数字（最多一位小数）" Style="text-align: right;" onblur="CalSpeProportion(this,'BS')"
                                Text='<%#Eval("WorkDayAdjust") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整后工日" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <input runat="server" id="hiWorkType2" type="hidden" value='<%#Eval("RollType") %>' />
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkQuota" SpeName='<%#Eval("SpecialtyName") %>'
                                onblur="CalNewSpeProportion(this,'BS')" regex="^[0-9]+(\.[0-9]{1})?$" errmsg="请输入数字（最多一位小数）"
                                Style="text-align: right; width: 60px" Text='<%#Eval("WorkDay") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整后比率(%)" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" SpeName='<%#Eval("SpecialtyName") %>'
                                regex="^[0-9]+(\.[0-9]{1,2})?$" errmsg="请输入数字（最多两位小数）" Style="text-align: right;
                                width: 60px" Text='<%#Eval("WorkDaySpare") %>'></zhongsoft:LightTextBox>%
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="调整记录">
                        <ItemStyle Width="25%" />
                        <ItemTemplate>
                            <%--  <div style="word-break: break-all !important; white-space: normal !important;">
                                <zhongsoft:LightTextBox runat="server" ID="tbModifyRecord" Text='<%#Eval("ModifyRecord") %>'></zhongsoft:LightTextBox></div>--%>
                            <div style="word-break: break-all !important; white-space: normal !important;" title='<%#Eval("ModifyRecord")%>'>
                                <%# gvBiaoShu.GetSubString(Eval("ModifyRecord"), 30)%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="专业卷册<br>工日" DataField="RollWorkDay" ItemStyle-Width="10%">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input runat="server" id="hiFormID" type="hidden" tablename="EPMS_ModifySpeQuotaForm"
    field="ModifySpeQuotaFormID" />
<input runat="server" type="hidden" id="hiSpecialtyHourAdjustId" tablename="EPMS_ModifySpeQuotaForm"
    field="SpecialtyHourAdjustId" />
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
        var addNum = parseFloat($(obj).val());
        if (isNaN(addNum)) {
            addNum = 0;
        }

        var newWorkQuotaId = $(obj).attr("id").replace("tbAdjustHour", "tbWorkQuota");
        var oldWorkQuotaId = $(obj).attr("id").replace("tbAdjustHour", "lbProjectManHourSumPer");
        var oldWorkQuota = parseFloat($("#" + oldWorkQuotaId).html());

        if ($(obj).attr("readonly") != "readonly") {
            if (isNaN(oldWorkQuota)) {
                oldWorkQuota = 0;
            }
            if (isNaN(addNum)) {
                addNum = 0;
            }
            var thisNum = oldWorkQuota + addNum;
            if (!isNaN(thisNum)) {
                if ($(obj).attr("SpeName") == "合计") {
                    switch (type) {
                        case ("KC"):
                            CalNewSpeProportion(obj, "<%=gvList.ClientID %>", "<%=hiKCSumWorkDay.ClientID %>")
                            $("#<%=hiKCSumWorkDay.ClientID %>").val(thisNum);
                            break;
                        case ("SJ"):
                            CalNewSpeProportion(obj, "<%=gvDesgin.ClientID %>", "<%=hiSJSumWorkDay.ClientID %>")
                            $("#<%=hiSJSumWorkDay.ClientID %>").val(thisNum);
                            break;
                        case ("BS"):
                            CalNewSpeProportion(obj, "<%=gvBiaoShu.ClientID %>", "<%=hiBSSumWorkDay.ClientID %>")
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
                            gvId = "<%=gvList.ClientID %>";
                            break;
                        case ("SJ"):
                            sumId = "<%=hiSJSumWorkDay.ClientID %>";
                            typeName = "设计";
                            gvId = "<%=gvDesgin.ClientID %>";
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
                        //                        $("#" + gvId).find("[id$='tbWorkQuota']").each(function (index) {
                        //                            if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
                        //                                var num = 0;
                        //                                if ($(this).val() != "") {
                        //                                    num = parseFloat($(this).val());
                        //                                    nowSum = nowSum + num;
                        //                                }
                        //                            }
                        //                        });
//                        var oldSum = 0;
//                        $("#" + gvId).find("[id$='lbProjectManHourSumPer']").each(function (index) {
//                            if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
//                                var num = 0;
//                                if ($(this).val() != "") {
//                                    num = parseFloat($(this).val());
//                                    oldSum = oldSum + num;
//                                }
//                            }
//                        });
                        var addNumSum = 0;
                        $("#" + gvId).find("[id$='tbAdjustHour']").each(function (index) {
                            if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
                                var num = 0;
                                if ($(this).val() != "") {
                                    num = parseFloat($(this).val());
                                    addNumSum = addNumSum + num;
                                }
                            }
                        });
                        //nowSum = oldSum + addNumSum;
                        //                        if (nowSum > sum) {
                        //                            $(obj).val('');
                        //                            alert("各专业工日之和不能大于合计工日!");
                        //                        }
                        //                        else {
                        //计算比率
                        if (sum != 0) {
                            $("#" + newWorkQuotaId).val(oldWorkQuota + addNum);
                            var proportionId = $(obj).attr("id").replace("tbAdjustHour", "tbSpeProportion");
                            var proportion = ((thisNum / sum) * 100).toFixed(2);
                            $("#" + proportionId).val(proportion);
                        }
                        //计算当前调整后工日总和
                        $("#" + gvId).find("[id$='tbWorkQuota']").each(function (index) {
                            if ($(this).attr("spename") != '合计' && $(this).attr("spename") != '备用工日') {
                                var num = 0;
                                if ($(this).val() != "") {
                                    num = parseFloat($(this).val());
                                    nowSum = nowSum + num;
                                }
                            }
                        });
                        //计算备用工日及比率
                        $("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val((sum - nowSum).toFixed(1));
                        $("#" + gvId).find("[id$='tbSpeProportion'][spename$='备用工日']").val(((sum - nowSum) / sum * 100).toFixed(2));
                        //                        }
                    }
                }
            }
        }
    }

    function CalNewSpeProportion(obj, type) {
        if ($(obj).attr("SpeName") == "合计") {
            var thisNum = parseFloat($(obj).val());
            if (isNaN(thisNum)) {
                thisNum = 0;
            }
            switch (type) {
                case ("KC"):
                    CalAllSpeProportion(obj, "<%=gvList.ClientID %>", "<%=hiKCSumWorkDay.ClientID %>")
                    $("#<%=hiKCSumWorkDay.ClientID %>").val(thisNum);
                    break;
                case ("SJ"):
                    CalAllSpeProportion(obj, "<%=gvDesgin.ClientID %>", "<%=hiSJSumWorkDay.ClientID %>")
                    $("#<%=hiSJSumWorkDay.ClientID %>").val(thisNum);
                    break;
                case ("BS"):
                    CalAllSpeProportion(obj, "<%=gvBiaoShu.ClientID %>", "<%=hiBSSumWorkDay.ClientID %>")
                    $("#<%=hiBSSumWorkDay.ClientID %>").val(thisNum);
                    break;
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
        $("#" + gvId).find("[id$='tbWorkQuota'][spename$='备用工日']").val(newBy.toFixed(1));

        $("#" + gvId).find("[id$='tbWorkQuota'][spename$!='备用工日'][spename$!='合计']").each(function (index) {
            var nowWorkDay = $(this).val();
            var nowProportion = (nowWorkDay / nowSum * 100).toFixed(2);
            var proportionId = $(this).attr("id").replace("tbWorkQuota", "tbSpeProportion");
            if (isNaN(nowProportion)) {
                nowProportion = 0;
            }
            $("#" + proportionId).val(nowProportion);

        });
    }

</script>
