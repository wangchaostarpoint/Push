<%@ Page Title="工程投运台帐" Language="C#" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    AutoEventWireup="true" CodeBehind="RunningProjects.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.RunningProjects" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="lbtnNewActivity" OnClientClick="return newDetail()"
        OnClick="lbtnNewActivity_Click" EnableTheming="false" CssClass="btn-query">
        <span>
            <img runat="server" id="img2" src="~/Themes/Images/btn_new.gif" alt="新建" height="16" />新建
        </span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">业务板块</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">投运时间</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtRunningStartDate"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtRunningEndDate"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvRunningProjects" AutoGenerateColumns="false"
        AllowFrozing="true" FrozenColNum="6" FrozenHeight="450px" ShowExport="true" HideFieldOnExport="全部"
        runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowDataBound="gvRunningProjects_RowDataBound"
        UseDefaultDataSource="true" PageSize="10" OnRowCommand="gvRunningProjects_RowCommand"
        DataKeyNames="RUNNINGPROJECTID">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="RUNNINGPROJECTID" DataField="RUNNINGPROJECTID"
                Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="PARAMPROJECTSCALEID" DataField="PARAMPROJECTSCALEID"
                Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="CUSTOMERID" DataField="CUSTOMERID" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="PROJECTID" DataField="PROJECTID" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditData" DataParamFields="RUNNINGPROJECTID"
                EditItemClick="editDetail" ItemStyle-Width="40px" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" DataParamFields="RUNNINGPROJECTID"
                EditItemClick="deleteDetail" ItemStyle-Width="40px" HeaderStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightBoundField HeaderText="工程编号" DataField="PROJECTCODE" ItemStyle-Width="100px"
                HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="PROJECTNAME" MaxLength="15"
                HeaderStyle-Width="300px" ItemStyle-Width="300px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="投运时间" DataField="STARTDATE" DataFormatString="{0:yyyy-MM-dd}"
                ItemStyle-Width="100px" HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目类型" DataField="PROJECTTYPE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="业务板块" DataField="BUSINESSPLATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="机组号" DataField="GENERATORCODE" MaxLength="15"
                ItemStyle-Width="100px" HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计规模" DataField="PROJECTSCALE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="容量等级" DataField="CapacityLevel">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="规模容量（长度）" DataField="PARAMSCALECAPACITY">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计量单位" DataField="PARAMMEASUREUNIT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="业主单位" DataField="CUSTOMERNAME" MaxLength="15"
                ItemStyle-Width="200px" HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="REMARK" MaxLength="15" ItemStyle-Width="100px"
                HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //新建 传参2
        function newDetail() {
            var url = buildBizUrl(2, null, "EPMS/List/Project/RunningProjectsEditor.aspx", null);
            var callBack = refreshInfo();
            showDivDialog(url, null, 900, 350, refreshInfo);
            return false;
        }
        //刷新页面
        function refreshInfo() {
           <%=Page.ClientScript.GetPostBackEventReference(this.lbtnNewActivity,"") %>
        }
        //编辑 传参3
        function editDetail(RUNNINGPROJECTID) {
            var url = buildBizUrl(3, RUNNINGPROJECTID, "EPMS/List/Project/RunningProjectsEditor.aspx", null);
            showDivDialog(url, null, 900, 350, refreshInfo);
            return false;
        }
        //删除
        
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
