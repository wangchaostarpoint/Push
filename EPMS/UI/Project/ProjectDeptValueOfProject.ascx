<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectDeptValueOfProject.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectDeptValueOfProject" %>
<tr>
    <td colspan="6" class="td-m flexible">
        项目产值
    </td>
</tr>
<tr>
    <td colspan="6">
        业务板块<zhongsoft:LightDropDownList ID="ddlBusinessPlate" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddlBusinessPlate_SelectedIndexChanged" Width="120px">
        </zhongsoft:LightDropDownList>
        <input id="hiFdDeptCode" type="hidden" runat="server" value="0376-44" />
            <input id="hiDWDeptCode" type="hidden" runat="server" value="0376-43" />
        <span id="Span1" runat="server" activestatus="(23.提出产值分配比例)" displaystatus="(3.提出产值分配比例)">
            <asp:Button ID="btnAddProject" runat="server" Text="添加项目" OnClientClick="return addProject()" />
            <asp:Button ID="btnAddAllProject" runat="server" Text="批量分配" OnClientClick="return allotProjectValue()" /></span>
        <span style="float: right; padding-top:5px;">产值单位：万元</span>
    </td>
</tr>
<tr>
    <td colspan="6">
        <table width="100%" id="projectValue">
            <tr>
                <td colspan="6">
                    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                        DataKeyNames="OrganizationId" UseDefaultDataSource="true" EmptyDataText="没有要查找的数据" OnRowDataBound="gvList_RowDataBound">
                        <PagerStyle HorizontalAlign="Right"></PagerStyle>
                        <Columns>
                            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px">
                            </zhongsoft:LightCheckField>
                            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="100px">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="300px">
                                <ItemTemplate>
                                    <%#Eval("ProjectName").ToString().Length > 25 ? Eval("ProjectName").ToString().Substring(0, 24) + "..." : Eval("ProjectName")%>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="FormDate" HeaderText="立项日期" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="SingleName" HeaderText="单项">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="ValueOfTotal" HeaderText="项目产值">
                                <ItemStyle Width="60px" HorizontalAlign="Right" />
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightTemplateField HeaderText="已分配产值">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkbAllotValue" runat="server" EnableTheming="false" OnClientClick='<%# String.Format("return viewProjectValue(\"{0}\")", Eval("OrganizationId")) %>'>
                                <span style="color:Blue"><%#Eval("AllotValue")%> </span>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField DataField="ValueOfSpare" HeaderText="预留产值">
                                <ItemStyle Width="60px" HorizontalAlign="Right" />
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightTemplateField HeaderText="修改记录">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lkbProjectValue" runat="server" EnableTheming="false" OnClientClick='<%# String.Format("return viewProjectSingleValue(\"{0}\")", Eval("OrganizationId")) %>'>
                                <img alt="查看" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </zhongsoft:LightTemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </td>
            </tr>
        </table>
    </td>
</tr>
<asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
<script type="text/javascript">
    $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    function addProject() {
        var businessPlate = $("#<%=ddlBusinessPlate.ClientID %>").val();
        if (businessPlate == "") {
            alert("请选择业务板块");
        } else {
            var url = buildQueryUrl("/EPMS/List/Project/ProjectValueAllotEditor.aspx", { actionType: 2, BusinessPlateID: businessPlate, BusinessId: "<%=BusinessId %>" });
            showDivDialog(url, null, 800, 500, addProjectCallBack);
        }
        return false;
    }

    function allotProjectValue() {
        var ids = $("#" + $gridCheckedClientID).val();
        if (ids.length < 36) {
            alert("请勾选要分配的项目");
            return false;
        }
        var businessPlate = $("#<%=ddlBusinessPlate.ClientID %>").val();

        var url = buildQueryUrl("/EPMS/List/Project/ProjectValueAllotEditor.aspx", { actionType: 3, BusinessPlateID: businessPlate, OrganizationIDs: ids });
        showDivDialog(url, null, 800, 500, addProjectCallBack);
        return false;
    }

    function viewProjectValue(orgID) {
        var url = buildQueryUrl("/EPMS/List/Project/ProjectValueAllotEditor.aspx", { actionType: 1, OrganizationID: orgID, BusinessId: "<%=BusinessId %>" });
        showDivDialog(url, null, 800, 500, null);
        return false;
    }

    function viewProjectSingleValue(orgID) {
        var url = buildQueryUrl("/EPMS/List/Project/ProjectSingleValueList.aspx", { OrganizationID: orgID, secid: '70B99AC1-18B1-4218-929D-E96C0D8BABEE' });
        showDivDialog(url, null, 800, 500, null);
        return false;
    }

    function addProjectCallBack() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
    }
</script>
