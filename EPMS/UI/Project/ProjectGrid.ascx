<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectGrid.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectGrid" %>
<tr>
    <td colspan="6" class="td-m flexible">
        关联项目 <span id="Span1" runat="server" style="float: right; color: Red">先保存再添加记录</span>
        <span id="Span2" runat="server" style="float: right">
            <asp:Button ID="btnSelProject" runat="server" Text="添加项目" OnClientClick="return selProject()"
                class="btn" />
        </span>
    </td>
</tr>
<tr>
    <td colspan="6">
        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvProjectInfo" AutoGenerateColumns="false"
            AllowSorting="true" DataKeyNames="OrganizationID,IsMajorProj" UseDefaultDataSource="true"
            BindGridViewMethod="UserControl.BindGridData" EmptyDataText="请添加项目信息" OnRowCommand="gvProjectInfo_RowCommand"
            ShowExport="true" HideFieldOnExport="删除" ShowPageSizeChange="true" AllowPaging="true"
            PageSize="10" OnRowDataBound="gvProjectInfo_RowDataBound">
            <Columns>
                <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="主项目" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:RadioButton ID="rdbMajorProj" runat="server" OnCheckedChanged="rdbMajorProj_CheckedChanged"
                            AutoPostBack="true" content="majorProj" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="设总">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" Width="250px" ShowToolTip="True">
                    <HeaderStyle Width="250px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ProjectScale" HeaderText="设计规模" Width="100px" ShowToolTip="True">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="项目类别">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段">
                    <HeaderStyle Width="100px"></HeaderStyle>
                </zhongsoft:LightBoundField>
                <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px"
                    Visible="false">
                    <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                </zhongsoft:LightButtonField>
            </Columns>
            <PagerStyle HorizontalAlign="Right"></PagerStyle>
        </zhongsoft:LightPowerGridView>
    </td>
</tr>
<asp:LinkButton runat="server" ID="btnAddProject" OnClick="btnAddProject_Click" Visible="false"></asp:LinkButton>
<input type="hidden" id="hiProjectXml" runat="server" />
<script type="text/javascript">

    function initProjectGrid() {
        var majorPorjectEnable = "<%=MajorPorjectEnable %>";
        if (majorPorjectEnable == "enable") {
            //可用
            $("[id$='rdbMajorProj']").removeAttr("disabled");
        } else {
            //禁用
            $("[id$='rdbMajorProj']").attr("disabled", "disabled");
        }
    }

    function selProject() {
        var param = new InputParamObject("m");
        //低值易耗品选择页面
        getProject("<%=hiProjectXml.ClientID %>", param, null, afterSelect);

        return false;
    }

    //选择项目页面 add by xuning 20150723
    function getProject(reid, param, filter, callback) {
        return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjectEntitySelector.aspx", null), 850, 550, callback);
    }

    function afterSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAddProject, "")%>;
    }
    
</script>
