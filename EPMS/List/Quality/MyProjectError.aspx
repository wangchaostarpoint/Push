<%@ Page Title="个人差错台账" Language="C#" AutoEventWireup="true" CodeBehind="MyProjectError.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Quality.MyProjectError" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery" style="display: none;">
            <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span><span>
                <zhongsoft:LightTextBox ID="tbProjectInfo" runat="server" MaxLength="64" Width="120px">
                </zhongsoft:LightTextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">部门</span><span>
                <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Style="width: 155px; margin: 3px 0px;">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">专业</span><span>
                <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" Style="width: 155px;
                    margin: 3px 0px;">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">工程类型 </span><span>
                <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server">
                </zhongsoft:LightDropDownList>
            </span></span>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">设计阶段 </span><span>
        <zhongsoft:LightDropDownList ID="ddlPhases" runat="server">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">卷册完成时间 </span>
        <span>
            <zhongsoft:XHtmlInputText runat="server" ID="tbBegin" compare="2" class="kpms-textbox-comparedate"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            至<zhongsoft:XHtmlInputText runat="server" ID="tbEnd" compare="2" class="kpms-textbox-comparedate"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid" ShowPageSizeChange="true"
        OnRowCreated="gvList_RowCreated" HideFieldOnExport="相关流程">
        <Columns>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="StandardPage" HeaderText="标准张" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="YZX" HeaderText="原则性" ItemStyle-HorizontalAlign="Right"
                HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="JSX" HeaderText="技术性" ItemStyle-HorizontalAlign="Right"
                HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="YBX" HeaderText="一般性" ItemStyle-HorizontalAlign="Right"
                HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="YBXError" HeaderText="一般性出错率" ItemStyle-HorizontalAlign="Right"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="相关流程" EditItemClick="viewFormDetailByID" DataParamFields="ProductVerifyFormID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <%--个人差错统计图表图表--%>
    <zhongsoft:EChart ID="EChartMyError" runat="server" Width="600" Height="250px" MainTitle="个人差错统计折线图">
    </zhongsoft:EChart>
    <script type="text/javascript">
        function viewFormDetailByID(id) {
            viewFormDetail(id, 0);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
