<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCContractRelProjectInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.UCContractRelProjectInfo" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<table class="tz-table" style="width: 100%">
    <tr id="Tr1" runat="server" class="trAddProject">
        <td style="text-align: right">
            <asp:Button ID="btnChooseProject" Text="添加关联工程" runat="server" EnableTheming="false"
                OnClientClick="return selMarketProject()" />
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvMarketProject" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="CONTRACTRELMAKRTID"
                BindGridViewMethod="UserControl.BindMarketProject" ShowExport="true" OnRowCommand="gvMarketProject_RowCommand"
                OnRowDataBound="gvMarketProject_RowDataBound" ShowPageSizeChange="true">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="工程编号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="工程名称" ShowToolTip="true"
                        Width="150" />
                    <zhongsoft:LightTemplateField HeaderText="拆分阶段">
                        <ItemTemplate>
                            <asp:CheckBoxList runat="server" ID="cbIssuePhases" RepeatDirection="Horizontal"
                                RepeatColumns="4" OnSelectedIndexChanged="cbIssuePhases_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:CheckBoxList>
                            <input type="hidden" runat="server" id="hiMarketProjectCode" value='<%#Eval("PROJECTCODE") %>' />
                            <input type="hidden" runat="server" id="hiContractSignTempID" value='<%#Eval("CONTRACTSIGNTEMPID") %>' />
                            <input type="hidden" runat="server" id="hiMarketProjectID" value='<%#Eval("PROJECTID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ITEMVALUE" HeaderText="拆分合同额（万元）" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightBoundField DataField="COMPLETEVALUE" HeaderText="完成合同额（万元）" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightBoundField DataField="SPLITVALUE" HeaderText="勘测拆分额（万元）" ItemStyle-HorizontalAlign="Right" />
                    <%--   <zhongsoft:LightTemplateField HeaderText="选择拆分项目" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnSelProject" runat="server" alt="" EnableTheming="false" OnClick="lbtnSelPhaseProject_Click"> <img title="选择项目" attr="select" src="../../Themes/Images/look-up.gif"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>--%>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                EnableTheming="false" CommandArgument='<%#Eval("CONTRACTSIGNTEMPID") %>'><img id="btDelete" title="删除" style="CURSOR: hand" attr="delete"  border="0"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="Tr2" runat="server" class="trProject">
        <td>
            <zhongsoft:LightPowerGridView ID="gvProjectPhaseList" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="CONTRACTRELPROJECTID"
                OnRowCommand="gvProjectPhaseList_RowCommand" ShowExport="true" OnExport="gvProjectPhaseList_Export"
                BindGridViewMethod="UserControl.BindProject" ShowPageSizeChange="true">
                <Columns>
                    <zhongsoft:LightBoundField DataField="TASKCODE" HeaderText="任务编号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightBoundField DataField="TASKNAME" HeaderText="任务名称" ShowToolTip="true"
                        Width="120" />
                    <zhongsoft:LightBoundField DataField="GPROJECTCODE" HeaderText="工程编号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightBoundField DataField="GPROJECTNAME" HeaderText="工程名称" ShowToolTip="true"
                        Width="120" />
                    <zhongsoft:LightBoundField DataField="PROJECTTYPENAME" HeaderText="工程类别" Width="80"
                        ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightBoundField DataField="PHASENAME" HeaderText="设计阶段" ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" ShowToolTip="true"
                        Width="120" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr class="trProject">
        <td height="25" style="font-weight: bold; text-align: center">
            项目统计信息
        </td>
    </tr>
    <tr class="trProject">
        <td>
            <zhongsoft:LightPowerGridView ID="gvStatistics" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" ShowExport="true" OnExport="gvStatistics_Export"
                BindGridViewMethod="UserControl.BindStatistics" OnRowCommand="gvStatistics_RowCommand"
                OnRowDataBound="gvStatistics_RowDataBound" ShowPageSizeChange="true">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" ShowToolTip="true"
                        Width="250" />
                    <zhongsoft:LightBoundField DataField="ITEMVALUE" HeaderText="合同额（万元）" ItemStyle-HorizontalAlign="Right"
                        Width="100" />
                    <zhongsoft:LightBoundField DataField="COMPLETEVALUE" HeaderText="完成合同额（万元）" ItemStyle-HorizontalAlign="Right"
                        Width="100" />
                    <zhongsoft:LightButtonField HeaderText="拆分" EditItemClick="editSplit" DataParamFields="PROJECTID,CONTRACTSIGNTEMPID"
                        ItemStyle-HorizontalAlign="Center" CommandName="EditData" />
                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" DataParamFields="PROJECTID,CONTRACTSIGNTEMPID"
                        ItemStyle-HorizontalAlign="Center" CommandName="ViewData" />
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("ORGANIZATIONID") %>' />
                            <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                EnableTheming="false" CommandArgument='<%#Eval("CONTRACTSIGNTEMPID") %>'><img id="btDelete" title="删除" style="CURSOR: hand" attr="delete"  border="0"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---存储市场项目XML-->
<input type="hidden" runat="server" id="hiMarketXML" />
<!---存储阶段项目XML-->
<input type="hidden" runat="server" id="hiPhaseProjectXml" />
<input type="hidden" runat="server" id="hiContractSignTempID" />
<input type="hidden" runat="server" id="hiEnabled" />
<%--<asp:LinkButton ID="lbtnSelProject" runat="server" alt="" EnableTheming="false" OnClick="lbtnSelPhaseProject_Click"
    Style="display: none"></asp:LinkButton>--%>
<asp:LinkButton ID="lbtnEditSplit" runat="server" alt="" EnableTheming="false" OnClick="lbtnEditSplit_Click"
    Style="display: none"></asp:LinkButton>
<asp:LinkButton ID="lbtnSelMarProject" runat="server" alt="" EnableTheming="false"
    OnClick="btnChooseProject_Click" Style="display: none"></asp:LinkButton>
<script>
    //页面加载事件
    function ucContractRelProject_Init() {
        $('[attr=delete]').attr('src', $appCtx.portalUrl + "/Themes/Images/btn_dg_delete.gif");
    }

    //获取关联阶段项目数量
    function getRelProjectNum() {
        return $("#<%=gvStatistics.ClientID %> [id$=hiOrganizationID]").length;
    }

    //控制添加项目是否可见
    function accessOfAddProDisplay() {
        if ($("#<%=hiEnabled.ClientID%>").val() != "<%=Boolean.TrueString %>" || "<%=IsAccount %>" == "<%=Boolean.TrueString %>") {
            $(".trAddProject").hide();
        }
    }

    //选择市场项目
    function selMarketProject() {
        var param = new InputParamObject("m");
        var reObj = null;
        if ("<%=Contract.IsTechContract %>" == "<%=Boolean.TrueString %>") {
            getDivTechProject('<%=hiMarketXML.ClientID %>', param, null,afterSelMarketProject);
        }
        else {
            var isGeneralContract = "<%=Contract.IsGeneralContract %>" == "<%=Boolean.TrueString %>" ? "1" : "0";
            var json = "{IsGeneralProject:'" + isGeneralContract + "'}";
            getMarketDivProjects('<%=hiMarketXML.ClientID %>', param, json,afterSelMarketProject);
        }
        
        return false;
    }

    function afterSelMarketProject(){
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnSelMarProject, "")%>;
    }

    function editSplit(projectID, contractSignTempID){
         showDetail(projectID,contractSignTempID,3);
    }

    //拆分详细
    function showDetail(projectID, contractSignTempID, actType) {
        var isAccount = ("<%=IsAccount %>" == "<%=Boolean.TrueString %>") || ("<%=Contract.IsGeneralContract %>" == "<%=Boolean.TrueString %>");
        var json;
        var isMidTable = "<%=TableType %>" == "中间表";
        if (!isAccount) {
            json = { contractSplitFormID: $bizCtx.bizId, projectID: projectID, contractID: "<%=ContractID %>", isMidTable: isMidTable, contractSignTempID: contractSignTempID };
        }
        else {
            json = { contractAccountFormID: $bizCtx.bizId, projectID: projectID, contractID: "<%=ContractID %>", isAccount: "<%=IsAccount %>" == "<%=Boolean.TrueString %>", isMidTable: isMidTable, contractSignTempID: contractSignTempID };
        }
//        var url = buildBizUrl(actType == null ? 3 : actType, projectID, isAccount ? "MM/List/MCM/ContractAccountDetail.aspx" : "MM/List/MCM/ContractSplitDetail.aspx", json);
          var url = buildBizUrl(actType == null ? 3 : actType, projectID, "MM/List/MCM/ContractSplitDetail.aspx", json);
        var callBack=null;
        if(actType==3)
           callBack = afterEditSplit;
        showDivDialog(encodeURI(url), "", 680, 600, callBack);
        return false;
    }

    function afterEditSplit(){
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnEditSplit, "")%>;
    }

    function viewDetail(projectID, contractSignTempID) {
        return showDetail(projectID, contractSignTempID, 1);
    }

   
</script>
