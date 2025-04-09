<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectValueAllotForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectValueAllotForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectDeptValueOfProject.ascx" TagName="ProjectDeptValueOfProject"
    TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            标题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbTitle" req="1" MaxLength="64" TableName="BusinessCommon"
                field="Title" activestatus="(23.提出产值分配比例)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            发起人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" readonly="readonly"
                class="kpms-textbox" tablename="BusinessCommon" field="ApplyUserName" activestatus="(23.提出产值分配比例)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiApplyUserID" runat="server" tablename="BusinessCommon"
                field="ApplyUserID" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDept" readonly="readonly" class="kpms-textbox"
                tablename="BusinessCommon" field="ApplyDeptName" activestatus="(23.提出产值分配比例)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiApplyDeptID" tablename="BusinessCommon"
                field="ApplyDeptID" />
        </td>
        <td class="td-l">
            创建时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" type="text" class="kpms-textbox-date"
                req="1" tablename="BusinessCommon" field="ApplyDate" readonly="readonly" activestatus="(23.提出产值分配比例)" />
        </td>
    </tr>
    <uc1:ProjectDeptValueOfProject ID="ucProjectDeptValueOfProject" runat="server" onAfterGridBind="AfterGridViewBind" />
    <tr>
        <td colspan="6" class="flexible">
            部门产值
        </td>
    </tr>
    <tr>
        <td colspan="6">
            业务板块<zhongsoft:LightDropDownList ID="ddlPlate" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="ddlPlate_SelectedIndexChanged" Width="120px">
            </zhongsoft:LightDropDownList>
            <input id="hiFdDeptCode" type="hidden" runat="server" value="0376-44" />
            <input id="hiDWDeptCode" type="hidden" runat="server" value="0376-43" />
            <span style="float: right; padding-top:5px;">产值单位：万元</span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <table width="100%" id="customerInfo">
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                            PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                            DataKeyNames="DeptID" UseDefaultDataSource="true" EmptyDataText="没有要查找的数据" OnRowDataBound="gvList_RowDataBound">
                            <PagerStyle HorizontalAlign="Right"></PagerStyle>
                            <Columns>
                                <zhongsoft:LightTemplateField HeaderText="部门" ItemStyle-Width="100px">
                                    <ItemTemplate>
                                        <%#Eval("DeptName").ToString().Length > 25 ? Eval("DeptName").ToString().Substring(0, 24) + "..." : Eval("DeptName")%>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="SingleName" HeaderText="单项" Width="90px">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="已分配产值">
                                    <ItemTemplate>
                                        <%#Eval("AllotValue")%>
                                    </ItemTemplate>
                                    <ItemStyle Width="60px" HorizontalAlign="Right" />
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="明细">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lkbDetail" runat="server" EnableTheming="false" OnClientClick='<%# String.Format("return viewDetailValue(\"{0}\")", Eval("DeptID")) %>'>
                                <img alt="查看" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="60px" HorizontalAlign="Center" />
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input type="hidden" id="hiBusinessCommonID" runat="server" tablename="BusinessCommon"
    field="BusinessCommonID" />
<script type="text/javascript">
    function viewDetailValue(deptID) {
        var url = buildQueryUrl("/EPMS/List/Project/DeptProjectValueList.aspx", { DeptID: deptID, BusinessID: "<%=BusinessObjectId %>" });
        showDivDialog(url, null, 800, 500, null);
        return false;
    }    
</script>
