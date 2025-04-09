<%@ Page Title="工程项目信息" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="FormalProjectList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.FormalProjectList" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <span class="filter-block">
        <span>
            <asp:LinkButton runat="server" ID="btnAdd" EnableTheming="false" CssClass="subtoolbarlink" Accesslevel="2"
                OnClientClick="return AddToFormalProject()"><span>
            <img  src="../../../Themes/Images/btn_add.gif" width="16" height="16"/>新增工程项目</span></asp:LinkButton>
        </span>
    </span>
     <span class="filter-block">
        <span>
            <asp:LinkButton runat="server" ID="btnImport" EnableTheming="false" CssClass="subtoolbarlink" 
                OnClientClick="return ImportFormalProject()" Visible="false"><span>
            <img  src="../../../Themes/Images/accessory_excel.gif" width="16" height="16"/>导入工程项目</span></asp:LinkButton>
        </span>
    </span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《勘测设计项目通知单》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务版块</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlat" CssClass="kpms-ddlsearch" EnableTheming="False" />
    </span></span>
    <span class="filter-block" style="display: none"><span class="filter-block-lb">所属工程包</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectPackage" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block" style="display: none"><span class="filter-block-lb">接受日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" class="kpms-textbox-comparedate" readonly="readonly" ID="txtStart" compare="1" />
        -
        <zhongsoft:XHtmlInputText runat="server" class="kpms-textbox-comparedate" readonly="readonly" ID="txtEnd" compare="1" />
    </span></span>
    <span class="filter-block">
        <span class="filter-block-lb">全字段查询</span><span>
            <span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlColumn" CssClass="kpms-ddlsearch" EnableTheming="False" />
                <zhongsoft:LightDropDownList runat="server" ID="ddlCondition" CssClass="kpms-ddlsearch" EnableTheming="False" onchange="conditionChange();" />
                <zhongsoft:LightTextBox runat="server" ID="tbCondition" CssClass="kpms-textboxsearch" EnableTheming="False" />
            </span>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="15" ShowExport="True" UseDefaultDataSource="False" BindGridViewMethod="BindData" OnRowDataBound="gvList_OnRowDataBound"
        AllowFrozing="True" FrozenColNum="7" AllowSorting="true" OnRowCommand="gvList_OnRowCommand" DataKeyNames="MarketProjectID">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%#Eval("RowNumber") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="50px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" ToolTip="查看" DataParamFields="MarketProjectID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif" />
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" ToolTip="编辑" DataParamFields="MarketProjectID"
                ImageUrl="../../../Themes/Images/btn_dg_edit.gif" />
            <zhongsoft:LightTemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" EnableTheming="false"
                        CommandArgument='<%#DataBinder.Eval(Container.DataItem,"MarketProjectID") %>'>
                                             <img alt="删除" id="Img2" onclick="return confirm('确定删除？');"  border="0" 
                                             src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand"  />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="MarketProjectCode" SortExpression="MPE.MarketProjectCode" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="MarketProjectName" HeaderStyle-Width="350px" ShowToolTip="true" SortExpression="MPE.MarketProjectName" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectPackage" HeaderStyle-Width="150px" ShowToolTip="true"
                SortExpression="ProjectPackage" />
            <zhongsoft:LightBoundField HeaderText="业务版块" DataField="BusinessPlate" SortExpression="MPE.BusinessPlate" />
            <zhongsoft:LightBoundField HeaderText="项目类别" DataField="ProjectType" SortExpression="ProjectType" />
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="ProjectPhaseNames" SortExpression="ProjectPhaseNames" />
            <zhongsoft:LightTemplateField HeaderText="设总" SortExpression="ProjectManagerName" Visible="false">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ProjectManagerDept")))?"":Eval("ProjectManagerDept")+"：" )+Eval("ProjectManagerName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="预计开始日期" DataField="PlanStartTime" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanStartTime" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="计划完成日期" DataField="PlanFinishTime" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanFinishTime" />
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" HeaderStyle-Width="150px" ShowToolTip="true"
                SortExpression="ProjectPackage" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="财务流水号" DataField="FinancialSerialNum" SortExpression="FinancialSerialNum" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="记录编号" DataField="RecordNoNew" SortExpression="RecordNoNew" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="接受日期" DataField="ReceiveDate" DataFormatString="{0:yyyy-MM-dd}"
                SortExpression="ReceiveDate" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="委托单位" DataField="EntrustUnitName" SortExpression="MPE.EntrustUnitName" />
            <zhongsoft:LightBoundField HeaderText="工程状态" DataField="ProjectState" SortExpression="ProjectState" />
            <zhongsoft:LightBoundField HeaderText="工程投产日期" DataField="ProductionDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ProductionDate" />
            <zhongsoft:LightBoundField HeaderText="承接方式" DataField="UnderTakeType" SortExpression="UnderTakeType" />
            <zhongsoft:LightBoundField HeaderText="建设地点" DataField="BuildPlace" SortExpression="MPE.BuildPlace" />
            <zhongsoft:LightBoundField HeaderText="绑定状态" DataField="BoundState" SortExpression="BoundState" Visible="false" />
            <zhongsoft:LightTemplateField HeaderText="合同编号" HeaderStyle-Width="80px">
                <ItemTemplate>
                    <div class="autoskip" style="width: 100px;">
                        <asp:Label runat="server" ID="lblContractCode"></asp:Label>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同名称" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <div class="autoskip" style="width: 200px;">
                        <asp:Label runat="server" ID="lblContractName"></asp:Label>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="合同签约状态" DataField="ContractSignState" SortExpression="ContractSignState" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="项目合同额（万元）" DataField="ContractValue" ItemStyle-HorizontalAlign="Right" SortExpression="MPE.ContractValue" />
            <zhongsoft:LightBoundField HeaderText="已收费金额（万元）" DataField="ChargedValue" ItemStyle-HorizontalAlign="Right" SortExpression="ChargedValue" />
            <zhongsoft:LightBoundField HeaderText="估算产值（万元）" DataField="EstimateContractVal" ItemStyle-HorizontalAlign="Right" SortExpression="EstimateContractVal" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="差值（万元）" ItemStyle-HorizontalAlign="Right" SortExpression="ISNULL(MPE.ContractValue,0)-ISNULL(EstimateContractVal,0)" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="工程情况说明" DataField="ProjectDescription" ShowToolTip="True" Width="300px" SortExpression="ProjectDescription" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="工程规模" DataField="ProjectScale" ShowToolTip="True" Width="300px" SortExpression="ProjectScale" />
            <zhongsoft:LightBoundField HeaderText="规模数字化" DataField="ScaleDigital" ItemStyle-HorizontalAlign="Right" SortExpression="ScaleDigital" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="跟踪执行人" DataField="TrackingExecutor" SortExpression="TrackingExecutor" Visible="false" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnCallBack" Visible="False" OnClick="btnCallBack_OnClick" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            conditionChange();
        }

        //新增正式工程
        function AddToFormalProject() {
            var json = { isFormalProject: 1 }
            var url = buildBizUrl(2, null, "MM/List/MM/AddToFormalProject.aspx", json);
            showDivDialog(url, null, 850, 500, editCallBack);
            return false;
        }
          //导入正式工程
        function ImportFormalProject() {
            var url = buildQueryUrl("MM/List/MM/FormalProjectImport.aspx");
            showDivDialog(url, null, 850, 500, editCallBack);
            return false;
        }

        //发起项目设总任  
        function startStateWF() {
            var orgids = eval($("#" + $gridCheckedClientID).val());
            if (orgids.length == 0) {
                alert("请先选择项目再发起勘测设计项目通知单流程");
                return false;
            }
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSProjectApproveForm.xpdl', xpdlId: 'EPMSProjectApproveForm_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProjectApproveForm.xpdl")%>', ver: '|', OrganizationID: orgids[0]
            });
            window.open(url);
            return false;
        }
        //新建、编辑申请设备弹出层callback方法
        function editCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnCallBack,"") %>
        }

        //查看详细信息
        function viewDetail(id) {
            var json = { isFormalProject: 1 }
            var url = buildBizUrl(1, id, "MM/List/MM/AddToFormalProject.aspx", json);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, null);
            return false;
        }

        //编辑详细信息
        function editDetail(id) {
            var json = { isFormalProject: 1 }
            var url = buildBizUrl(3, id, "MM/List/MM/AddToFormalProject.aspx", json);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, editCallBack);
            return false;
        }

        //查看合同信息
        function viewItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/MM/List/MCM/ContractEditorNew.aspx', json);
            var callBack = null;
            showDivDialog(url, "", 1000, 600, callBack);
            return false;
        }

        function conditionChange() {
            var checkText = $("#<%=ddlCondition.ClientID %>").find("option:selected").val();
            if (checkText.indexOf("NULL") > 0) {
                $("#<%=tbCondition.ClientID%>").val('');
                $("#<%=tbCondition.ClientID%>").attr("readonly", "readonly");
            } else {
                $("#<%=tbCondition.ClientID%>").removeAttr("readonly");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
