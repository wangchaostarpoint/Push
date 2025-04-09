<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkloadDetail.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Publish.WorkloadDetail" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="flexible" onclick="openDetail('workDetail')">
            <span>工作量填报</span>&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="workDetail">
    <tr>
        <td class="td-l">工作小组<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <div style="clear: both">
                <div style="float: left">
                    <input runat="server" type="radio" id="rbGroup1" />1组
                    <input runat="server" type="radio" id="rbGroup2" />2组    
                    <input id="hiGroupName" runat="server" type="hidden" tablename="EPMS_PublishConsign" field="GroupName" />
                </div>
                <div style="float: right">
                    <asp:Button ID="btnSingle" runat="server" ToolTip="单组作业" CssClass="btn" Visible="false" Text="单组作业" OnClick="btnSingle_Click" />
                    <asp:Button ID="btnShare" runat="server" ToolTip="小组分摊" CssClass="btn" Visible="false" Text="小组分摊" OnClick="btnShare_Click" />
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <div style="clear: both">
                <div style="float: left; width: 50%">
                    <zhongsoft:LightPowerGridView ID="gvListLeft" runat="server" UseDefaultDataSource="true" PermissionStatus="true"
                        DataKeyNames="PrintProjectID,PrintProjectName,Price" BindGridViewMethod="BindDataLeft">
                        <Columns>
                            <zhongsoft:LightBoundField DataField="PrintProjectName" HeaderText="项目">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightTemplateField HeaderText="工作量" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbWorkCount" runat="server" CssClass="kpms-textbox" DataType="Integer"
                                        Style="text-align: right; width: 90px" Text='<%#Eval("WorkCount") %>' activestatus="(3.统计工作量)">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="总工作量" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalCount" flag="totalCount" runat="server" Text='<%#Eval("TotalCount") %>'></asp:Label>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="1组" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbGroupCount1" flag="groupCount1" runat="server" CssClass="kpms-textbox" DataType="Integer"
                                        Style="text-align: right; width: 90px" Text='<%#Eval("GroupCount1") %>' activestatus="(3.统计工作量)">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="2组" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbGroupCount2" flag="groupCount2" runat="server" CssClass="kpms-textbox" DataType="Integer"
                                        Style="text-align: right; width: 90px" Text='<%#Eval("GroupCount2") %>' activestatus="(3.统计工作量)">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </div>
                <div style="float: left; width: 50%">
                    <zhongsoft:LightPowerGridView ID="gvListRight" runat="server" UseDefaultDataSource="true" PermissionStatus="true"
                        DataKeyNames="PrintProjectID,PrintProjectName,Price" BindGridViewMethod="BindDataRight">
                        <Columns>
                            <zhongsoft:LightBoundField DataField="PrintProjectName" HeaderText="项目">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightTemplateField HeaderText="工作量" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbWorkCount" runat="server" CssClass="kpms-textbox" DataType="Integer"
                                        Style="text-align: right; width: 90px" Text='<%#Eval("WorkCount") %>' activestatus="(3.统计工作量)">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="总工作量" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalCount" flag="totalCount" runat="server" Text='<%#Eval("TotalCount") %>'></asp:Label>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="1组" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbGroupCount1" flag="groupCount1" runat="server" CssClass="kpms-textbox" DataType="Integer"
                                        Style="text-align: right; width: 90px" Text='<%#Eval("GroupCount1") %>' activestatus="(3.统计工作量)">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="2组" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbGroupCount2" flag="groupCount2" runat="server" CssClass="kpms-textbox" DataType="Integer"
                                        Style="text-align: right; width: 90px" Text='<%#Eval("GroupCount2") %>' activestatus="(3.统计工作量)">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </div>
            </div>
        </td>
    </tr>
</table>
<div id="dialogDiv" style="display: none">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">单组作业<span class="req-star">*</span></td>
            <td class="td-r" colspan="5">
                <asp:RadioButtonList ID="cbSingleType" runat="server"  activestatus="(23.*)" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <asp:Button runat="server" ID="btnSave"  Visible="false"></asp:Button> 
</div>
<%--作业类型：小组分摊 1，单组作业 0--%>
<input type="hidden" id="hiWorkType" name="hiWorkType" runat="server" field="WorkType" tablename="EPMS_PublishConsign" />
<%--单组作业类型，只有在单组作业时才有，小组分摊时没有--%>
<input type="hidden" id="hiSingleType" name="hiSingleType" runat="server" field="SingleType" tablename="EPMS_PublishConsign" />
<asp:Button ID="btnLoad" runat="server" Visible="false" OnClick="btnLoad_Click" />
<script type="text/javascript"> 
    function initWorkloadPlugin() {
        $("#<%=gvListLeft.ClientID%> tfoot tr:eq(0) td:eq(0)").attr("colSpan", 99);
        $("#<%=gvListRight.ClientID%> tfoot tr:eq(0) td:eq(0)").attr("colSpan", 99);
        //计算总工作量
        $("#<%=gvListLeft.ClientID %>").find("[id$=tbGroupCount1]").live("blur", function () { total($(this)); });
        $("#<%=gvListLeft.ClientID %>").find("[id$=tbGroupCount2]").live("blur", function () { total($(this)); });
        $("#<%=gvListRight.ClientID %>").find("[id$=tbGroupCount1]").live("blur", function () { total($(this)); });
        $("#<%=gvListRight.ClientID %>").find("[id$=tbGroupCount2]").live("blur", function () { total($(this)); });
    }
    //计算合计
    function total(obj) {
        var $totalCount = $(obj).parent('td').parent('tr').find('[flag="totalCount"]');
        var $groupCount1 = $(obj).parent('td').parent('tr').find('input[flag="groupCount1"]');
        var $groupCount2 = $(obj).parent('td').parent('tr').find('input[flag="groupCount2"]');
        var totalcount = accAddFloat6($groupCount1.val(), $groupCount2.val());
        $totalCount.text(totalcount);
    }
    //打开单组工作类型
    function openItem() {
        $("#dialogDiv").dialog({
            autoOpen: true,   // 是否自动弹出窗口
            modal: true,    // 设置为模态对话框
            resizable: true,
            width: 500,   //弹出框宽度
            height: 150,   //弹出框高度  
            title: "单组作业",  //弹出框标题
            position: { my: "center top", at: "center center" },
            buttons: {
                '确定': function () {
                    var text = $("#<%=cbSingleType.ClientID%> :checked").val(); 
                    if (text == "" || text == undefined) {
                        alert("请先选择单组工作类型");
                        return;
                    } else {
                        $.ajax({
                            type: 'POST',
                            url: '/Portal/EPMS/List/Publish/WorkloadDetailEditor.aspx?PublishConsignID=<%=PublishConsignID%>',
                            dataType: 'text',
                            data: { asyfunc: "SaveSingleWorkload", SingleTypeText: text },
                            success: function (data) { 
                                if (data == "True") {
                                    bindData();
                                    $("#dialogDiv").dialog("close");
                                    $("#dialogDiv").hide();
                                  
                                } else {
                                    alert("保存数据异常！");
                                }
                            }
                        });
                    }
                },
                '关闭': function () {
                    $(this).dialog("close");
                    $("#dialogDiv").hide();
                }
            }
        });
    }
    //执行后台绑定列表
    function bindData() {
         <%=Page.ClientScript.GetPostBackEventReference(this.btnLoad ,"") %>;
    }
</script>
