<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectAlertList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectAlertList" Title="项目进度警报"
    MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
            <span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span><span>
                <asp:TextBox ID="tbRollInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox></span>
            </span><span class="filter-block"><span class="filter-block-lb">预警日期</span><span>
                <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate"
                    compare="1" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate"
                    compare="1" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvProjAlert" AutoGenerateColumns="false" AllowFrozing="true"
        FrozenColNum="2" runat="server" BindGridViewMethod="BindDataGrid" AllowPaging="true"
        PageSize="15" ShowPageSizeChange="true" UseDefaultDataSource="true" AllowSorting="true"
        OnSorting="gvProjAlert_Sorting" Width="100%" OnRowDataBound="gvProjAlert_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="名称" SortExpression="WBSName">
                <ItemTemplate>
                    <a onclick="return viewTask('<%#Eval("WBSID") %>')">
                        <%#string.Format("{0}:{1}/{2}", Eval("RecordType"), Eval("WBSCode"), Eval("WBSName"))%>
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PlanDate" HeaderText="预警日期" DataFormatString="{0:yyyy-MM-dd}"
                SortExpression="PlanDate" />
            <zhongsoft:LightBoundField DataField="AlertReason" HeaderText="预警原因" SortExpression="AlertReason" />
            <zhongsoft:LightTemplateField HeaderText="负责人" SortExpression="UserName">
                <ItemTemplate>
                    <%#string.Format("{0}", Eval("UserName"))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="影响" SortExpression="RelateRollCount">
                <ItemTemplate>
                    <a>&nbsp;<asp:Label ID="lbNum" runat="server" Text='<%#string.Format("影响设计{0}卷", Eval("RelateRollCount"))%>'></asp:Label></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="BelongSpecialtyCode" HeaderText="专业代字" SortExpression="BelongSpecialtyCode" />
            <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业" MaxLength="25"
                SortExpression="BelongSpecialtyName" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvProjAlert.CheckedClientID %>";

        function viewTask(wbsId) {
            var json = { actionType: 1, bizId: wbsId };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            var callBack = null;
            showDivDialog(url, "", 1050, 600, callBack);
        }

        //查看卷册
        function viewDetail(rollID) {
            var url = "/EPMS/List/WBS/C_RollList.aspx";
            var json = { RollIds: rollID, secid: "9dd62921-edc5-4767-b46a-817756ea5ca7" };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1050, 600);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <span class="req-star">展示延期未交出的卷册、延期未提交的资料信息</span>
</asp:Content>
