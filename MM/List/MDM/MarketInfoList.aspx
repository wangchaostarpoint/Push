<%@ Page Language="C#" AutoEventWireup="true" Title="跟踪项目信息"
    CodeBehind="MarketInfoList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MDM.MarketInfoList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务版块</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlat" CssClass="kpms-ddlsearch" EnableTheming="False"/>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">所属工程包/工程名称</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">跟踪状态</span> <span>
        <zhongsoft:LightDropDownList ID="ddlTrackingState" runat="server" CssClass="kpms-ddlsearch" EnableTheming="False">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">计划完成日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtStart"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtEnd"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" HideFieldOnExport="全选,新增跟踪记录,发起市场开发评审"
        DataKeyNames="MarketInfoID" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_OnRowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" >
            </zhongsoft:LightCheckField>
            <asp:TemplateField HeaderText="新增跟踪记录" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnAdd" runat="server" EnableTheming="false" OnClientClick="return false" ToolTip="新增跟踪记录">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_add.gif" 
                                    onclick="addItem('2','<%# Eval("MarketInfoID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightTemplateField HeaderText="发起市场开发评审" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnStartWF" EnableTheming="False" OnClientClick="return false" ToolTip="发起市场开发评审">
                        <img alt="img" src="../../../Themes/Images/btn_submit.gif" onclick="return startWF('<%# Eval("MarketInfoID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="业务版块" DataField="BusinessPlate" />
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="BelongProjectPackage" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade" HeaderStyle-Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划开始日期" DataField="PlanStartTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成日期" DataField="PlanFinishTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="评审状态" DataField="ReviewState" />
            <zhongsoft:LightBoundField HeaderText="跟踪状态" DataField="TrackingState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="跟踪执行人" DataField="TrackingExecutor">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程规模" DataField="ProjectScale" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程情况说明" DataField="ProjectDescription" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiWFName" value="市场项目开发评审" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        //新增跟踪记录
        function addItem(actionType, marketInfoID) {
            var json = { actionType: actionType, MarketInfoID: marketInfoID };
            var url = buildQueryUrl('/MM/List/MDM/TrackingRecordEditor.aspx', json);
            showDivDialog(url, "", 650, 400, null);
            return false;
        }

        //发起流程
        function startWF(marketProjectID) {
            var packageName ='<%=DtWorkflowFormDefinition.Rows.Count>0?DtWorkflowFormDefinition.Rows[0]["PackageName"].ToString():""%>';
            var xpdlId ='<%=DtWorkflowFormDefinition.Rows.Count>0?DtWorkflowFormDefinition.Rows[0]["XPDLID"].ToString():""%>';
            var formId ='<%=DtWorkflowFormDefinition.Rows.Count>0?DtWorkflowFormDefinition.Rows[0]["FormID"].ToString():""%>';
            var url = '<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=2';
            var json = { marketProjectID: marketProjectID, packageName: packageName, xpdlId: xpdlId, formId: formId, ver: "|" };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

