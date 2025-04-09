<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectScheduleList.aspx.cs"
    Title="项目进度" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectScheduleList"
    MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年&nbsp;份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">月&nbsp;份</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">专&nbsp;业</span>
            <span>
                <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        BindGridViewMethod="BindDataGrid" DataKeyNames="OrganizationId" UseDefaultDataSource="true"
        EmptyDataText="没有要查找的数据">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" EditItemClick="viewSchedule"
                DataParamFields="ID,SpecialtyName,OrganizationId">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="editData" DataParamFields="ID,SpecialtyName,OrganizationId"
                EditItemClick="editSchedule">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightBoundField DataField="FillCycle" HeaderText="周期" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillYear" HeaderText="年份" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FillMonth" HeaderText="月份" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CompleteRate" HeaderText="进度" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExistProblems" HeaderText="存在问题" ShowToolTip="true"
                Width="120px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Measures" HeaderText="解决措施" ShowToolTip="true"
                Width="120px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Memo" HeaderText="备注" ShowToolTip="true" Width="120px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <script type="text/javascript">

        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        $('#trleader').hide();

        function editSchedule(bizid, specialtyName, organizationId) {
            var url;
            if (specialtyName == "") {
                //项目进度
                url = buildQueryUrl("/EPMS/List/Project/ProjectStateEditor.aspx", { actionType: 3, bizid: bizid, OrganizationId: organizationId });
            } else {
                //专业进度
                url = buildQueryUrl("/EPMS/List/Project/SpecialtyStateEditor.aspx", { actionType: 3, bizid: bizid, OrganizationId: organizationId });
            }
            showDivDialog(url, null, 800, 500, editCallBack);
            return false;
        }

        function viewSchedule(bizid, specialtyName, organizationId) {
            var url;
            if (specialtyName == "") {
                //项目进度
                url = buildQueryUrl("/EPMS/List/Project/ProjectStateEditor.aspx", { actionType: 1, bizid: bizid, OrganizationId: organizationId });
            } else {
                //专业进度
                url = buildQueryUrl("/EPMS/List/Project/SpecialtyStateEditor.aspx", { actionType: 1, bizid: bizid, OrganizationId: organizationId });
            }
            showDivDialog(url, null, 800, 500, null);
            return false;
        }

        function editCallBack() {
            //<%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="treeView">
</asp:Content>
