<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="质量预警" CodeBehind="ProjectQualityInfoList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.ProjectQualityInfoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery">
            <span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span><span>
                <asp:TextBox ID="tbRollInfo" search="1" runat="server" MaxLength="64"></asp:TextBox></span>
            </span><span class="filter-block"><span class="filter-block-lb">预警日期</span><span>
                <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate"
                    compare="1" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate"
                    compare="1" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span></span>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjQuality" AutoGenerateColumns="false"
        PageSize="15" runat="server" ShowPageSizeChange="true" UseDefaultDataSource="true"
        AllowSorting="true" Width="100%" ShowExport="true" BindGridViewMethod="BindDataGrid"
        OnSorting="gvProjQuality_Sorting" OnRowDataBound="gvProjQuality_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="名称">
                <ItemTemplate>
                    <a onclick="return viewTask('<%#Eval("WBSID") %>')">
                        <%#string.Format("卷册:{0}/{1}", Eval("WBSCode"), Eval("WBSName"))%>
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Reason" HeaderText="预警原因" SortExpression="Reason" />
            <zhongsoft:LightBoundField DataField="AlertTime" HeaderText="预警日期" DataFormatString="{0:yyyy-MM-dd}"
                SortExpression="AlertTime" />
            <zhongsoft:LightBoundField HeaderText="负责人" DataField="UserName" SortExpression="UserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongSpecialtyCode" HeaderText="专业代字" SortExpression="BelongSpecialtyCode" />
            <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业名称" SortExpression="BelongSpecialtyName" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function viewTask(wbsId) {
            var json = { actionType: 1, bizId: wbsId };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            var callBack = null;
            showDivDialog(url, "", 1050, 600, callBack);
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <span class="req-star">展示综合评审、专业设计评审、原则性错误、交出后返回设计修改、发生设计变更、输入资料缺少等卷册信息</span>
</asp:Content>
