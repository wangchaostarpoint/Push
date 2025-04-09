<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeptValueProjectDetail.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.DeptValueProjectDetail" %>
<tr>
    <td colspan="6" class="flexible">
        项目明细<span style="float: right"><asp:Button ID="btnSelectProject" runat="server" CssClass="btn"
            Text="选择项目" OnClientClick="return selProject()" /></span>
    </td>
</tr>
<tr>
    <td colspan="6">
        <table width="100%" id="projectValue">
            <tr>
                <td colspan="6">
                    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                        DataKeyNames="ValueSourceID" UseDefaultDataSource="true" EmptyDataText="没有要查找的数据"
                        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                        <PagerStyle HorizontalAlign="Right"></PagerStyle>
                        <Columns>
                            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="100px">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="300px">
                                <ItemTemplate>
                                    <%#Eval("ProjectName").ToString().Length > 25 ? Eval("ProjectName").ToString().Substring(0, 24) + "..." : Eval("ProjectName")%>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="项目设总">
                                <ItemTemplate>
                                    <span projectmanager='<%#Eval("ProjectDeptValueID") %>'></span>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="部门">
                                <ItemTemplate>
                                    <span deptname='<%#Eval("ProjectDeptValueID") %>'></span>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="单项">
                                <ItemTemplate>
                                    <span paramsingle='<%#Eval("ProjectDeptValueID") %>'></span>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="已分配产值">
                                <ItemTemplate>
                                    <span allotvalue='<%#Eval("ProjectDeptValueID") %>'></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="已核发产值">
                                <ItemTemplate>
                                    <span chackvalue='<%#Eval("ProjectDeptValueID") %>'></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="剩余产值">
                                <ItemTemplate>
                                    <span syvalue='<%#Eval("ProjectDeptValueID") %>'></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="本期申报产值">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbThisApplyValue" EnableTheming="false" CssClass="kpms-textbox-money"
                                        runat="server" Text='<%#Eval("ThisApplyValue") %>' Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$"
                                        errmsg="请输入正数，最多12位整数，2位小数">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightTemplateField HeaderText="备注">
                                <ItemTemplate>
                                    <zhongsoft:LightTextBox ID="tbMemo" runat="server" Width="200" Text='<%#Eval("Memo") %>'
                                        MaxLength="64">
                                    </zhongsoft:LightTextBox>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData">
                            </zhongsoft:LightButtonField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </td>
            </tr>
        </table>
    </td>
</tr>
<asp:Button ID="btnAddProject" runat="server" Visible="false" OnClick="btnAddProject_Click" />
<input type="hidden" id="hiXml" runat="server" />
<script type="text/javascript">

    function loadFormControl() {
        getProjectValue();
    }

    function selProject() {
        var param = new InputParamObject("m");
        var josn = { 'DeptID': "<%=DeptID %>" };
        var rel = getProjectDeptValue("<%=hiXml.ClientID %>", param, josn, selProjectCallBack);
        return false;
    }

    function selProjectCallBack(re) {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddProject,"") %>
        return true;
    }


    //异步加载列表信息
    function getProjectValue() {
        var $ids = "";
        $("#<%=gvList.ClientID %> span[projectmanager]").each(function () {

            $ids += $(this).attr("projectmanager") + "|";
        });
        $.post("/Portal/EPMS/List/Project/DeptProjectValueList.aspx",
                 { asyfunc: "GetProjectValueInfo", IdList: $ids,BusinessID:"<%=BusinessID %>" },
                 function (res) {
                     if(res==""||res==undefined){
                        return false;
                     }
                     var $l = eval('(' + res + ')');
                     //项目经理
                     $("#<%=gvList.ClientID %> span[projectmanager]").each(function () {
                         var $ID = $(this).attr("projectmanager");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $projectmanager = $l[i][1];
                             if ($ID == $id) {
                                 $(this).html($projectmanager);
                             }
                         }
                     });
                     //部门
                     $("#<%=gvList.ClientID %> span[deptname]").each(function () {
                         var $ID = $(this).attr("deptname");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $deptname = $l[i][2];
                             if ($ID == $id) {
                                 $(this).html($deptname);

                             }
                         }
                     });
                     //单项--默认为“设计”
                     $("#<%=gvList.ClientID %> span[paramsingle]").each(function () {
                         var $ID = $(this).attr("paramsingle");
                         for (var i = 0; i < $l.length; i++) {
                             $(this).html("设计");
                         }
                     });
                     //已分配产值
                     $("#<%=gvList.ClientID %> span[allotvalue]").each(function () {
                         var $ID = $(this).attr("allotvalue");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $allotvalue = $l[i][3];
                             if ($ID == $id) {
                                 $(this).html($allotvalue);

                             }
                         }
                     });
                     //已核发产值
                     $("#<%=gvList.ClientID %> span[chackvalue]").each(function () {
                         var $ID = $(this).attr("chackvalue");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $chackvalue = $l[i][4];
                             if ($ID == $id) {
                                 $(this).html($chackvalue);

                             }
                         }
                     });
                     //剩余产值
                     $("#<%=gvList.ClientID %> span[syvalue]").each(function () {
                         var $ID = $(this).attr("syvalue");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $syvalue = $l[i][5];
                             if ($ID == $id) {
                                 $(this).html($syvalue);

                             }
                         }
                     });
                 }
                );
    }

</script>
