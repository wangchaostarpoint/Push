<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSWorkDaysList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSWorkDaysList" %>
<tr>
    <td colspan="6" class="td-m">
        计算默认值说明：<br />
        1)设计工天默认等于标准定额，默认难度系数为<asp:Label ID="lbDesignHardRatio" runat="server"></asp:Label>，专业主任/主任工再调整后，系统不会再重新计算默认值<br />
        2)校核工天默认等于设计工天*工作比例<asp:Label ID="lbCheckWorkRatio" runat="server"></asp:Label>%*默认难度系数<asp:Label
            ID="lbCheckHardRatio" runat="server"></asp:Label>，专业主任/主任工再调整后，系统不会再重新计算默认值<br />
        3)审核、批准工天默认值为0，专业主任/主任工必要时再调整
    </td>
</tr>
<tr>
    <td colspan="6" class="td-m flexible">
        任务信息 <span id="Span2" runat="server" style="float: right">
            <asp:Button runat="server" ID="btnInport" class="btn" OnClientClick="return inExport()"
                Text="从Excel导入"></asp:Button>
            <asp:Button ID="btnEditorDesginWork" runat="server" Text="同步设计工天" OnClientClick="return confirm('是否同步标准定额为设计工天')"
                class="btn" OnClick="btnEditorDesginWork_Click" />
            <asp:Button ID="btnEditor" runat="server" Text="计算校审批工天" OnClientClick="return confirm('是否确认更新为默认计算值')"
                class="btn" OnClick="btnEditor_Click" />
        </span>
    </td>
</tr>
<tr>
    <td class="td-l">
        默认校核工作比例%
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox ID="tbCheckWorkRatio" runat="server" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$"
            errmsg="请输入正数，最多12位整数，2位小数" EnableTheming="false" CssClass="kpms-textbox-money">
        </zhongsoft:LightTextBox>
    </td>
    <td class="td-l">
        默认设计难度系数
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox ID="tbDesignHardRatio" runat="server" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$"
            errmsg="请输入正数，最多12位整数，2位小数" EnableTheming="false" CssClass="kpms-textbox-money">
        </zhongsoft:LightTextBox>
    </td>
    <td class="td-l">
        默认校核难度系数
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox ID="tbCheckHardRatio" runat="server" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$"
            errmsg="请输入正数，最多12位整数，2位小数" EnableTheming="false" CssClass="kpms-textbox-money">
        </zhongsoft:LightTextBox>
    </td>
</tr>
<tr>
    <td colspan="6">
        <zhongsoft:LightPowerGridView runat="server" ID="gvWbsInfo" AutoGenerateColumns="false"
            AllowSorting="true" DataKeyNames="WBSID" UseDefaultDataSource="true" AllowPaging="true"
            PageSize="6" OnRowCommand="gvWbsInfo_RowCommand" ShowExport="true" ShowPageSizeChange="false"
            OnRowDataBound="gvWbsInfo_RowDataBound" AllowFrozing="true" FrozenColNum="8"
            Width="200px" OnExport="gvWbsInfo_Export">
            <Columns>
                <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号（必填）" Visible="false">
                    <ItemStyle Width="100px" />
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称（必填）" Visible="false">
                    <ItemStyle Width="100px" />
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                    <ItemStyle Width="100px" />
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="任务名称">
                    <ItemTemplate>
                        <asp:LinkButton ID="lkbFlieInfo" runat="server" OnClientClick='<%# String.Format("return openWbsDetail(\"{0}\")", Eval("WBSID")) %>'
                            EnableTheming="false" ForeColor="Blue" Text=''>
                       <%-- <span title='<%#Eval("WBSName") %>'>
                        <%#Eval("WBSName").ToString().Length > 6 ? Eval("WBSName").ToString().Substring(0, 5) + "..." : Eval("WBSName")%></span>--%>
                        <div tip="1" style="width:100px" class="autoskip" title='<%#Eval("WBSName") %>'>  <%#Eval("WBSName")%></div>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="WorkDayOfEnterprise" HeaderText="标准定额">
                    <ItemStyle Width="100px" />
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="任务负责人">
                    <ItemStyle Width="100px" />
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="设计工天">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbWorkDayOfDesign" runat="server">
                        </zhongsoft:LightTextBox>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="校核工天">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbWorkDayOfCheck" runat="server">
                        </zhongsoft:LightTextBox>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="审核工天">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbWorkDayOfRecheck" runat="server">
                        </zhongsoft:LightTextBox>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="批准工天">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbWorkDayOfConfirm" runat="server">
                        </zhongsoft:LightTextBox>
                    </ItemTemplate>
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="备注">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbMemo" runat="server" Width="120" onmouseover="this.title=this.value"
                            MaxLength="512">
                        </zhongsoft:LightTextBox>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业名称">
                    <ItemStyle Width="100px" />
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="主设人">
                    <ItemTemplate>
                        <span zsr='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="校核人">
                    <ItemTemplate>
                        <span wbsid='<%#Eval("WBSID") %>'></span>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始时间" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanHandTime" HeaderText="计划个人交出" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanRecheckTime1" HeaderText="计划室交出" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成时间" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanCheckTime" HeaderText="计划校核完成时间" DataFormatString="{0:yyyy-MM-dd}"
                    Visible="false">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanApprovalTime" HeaderText="计划批准完成时间" DataFormatString="{0:yyyy-MM-dd}"
                    Visible="false">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
            </Columns>
            <PagerStyle HorizontalAlign="Right"></PagerStyle>
        </zhongsoft:LightPowerGridView>
    </td>
</tr>
<asp:Button ID="btnBindGird" runat="server" Visible="false" OnClick="btnBindGird_Click" />
<script type="text/javascript">

    //导入计划WBS事件
    function inExport() {
        var url = buildQueryUrl(encodeURI("EPMS/List/Plan/PlanWBSImport.aspx"), null);
        showDivDialog(url, null, 300, 300, exportCallBack);
        return false;
    }

    function exportCallBack(re) {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindGird,"") %>
        return true;
    }

    function getWBSChecker() {
        var $ids = "";
        $("#<%=gvWbsInfo.ClientID %> span[wbsid]").each(function () {
            $ids += $(this).attr("wbsid") + "|";
        });
        //绑定校核人
        $.post("/Portal/EPMS/List/WBS/C_RollList.aspx",
                 { asyfunc: "GetWBSChecker", wbsIdList: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     $("#<%=gvWbsInfo.ClientID %> span[wbsid]").each(function () {
                         var $wbsid = $(this).attr("wbsid");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][1];
                             if ($wbsid == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                 }
                );
        //绑定主设人
    }

    function openWbsDetail(wbsid) {
        var url = buildQueryUrl("/EPMS/List/WBS/WBSEditor.aspx", { actionType: 1, bizid: wbsid });
        showDivDialog(url, null, 900, 600, null);
        return false
    }

</script>
