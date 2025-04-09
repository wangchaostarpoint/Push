<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectPlanBookForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Plan.WF_ProjectPlanBookForm" %>
<%@ Register Src="~/EPMS/UI/Plan/ProjPlanBook.ascx" TagName="ProjPlanBook" TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/Plan/IntegrateProjItemList.ascx" TagName="IntegrateProjItemList"
    TagPrefix="uc2" %>
<%@ Import Namespace="DAL.EPMS" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<table class="tz-table">
    <tr id="projectInfo">
        <td>
            <uc1:ProjPlanBook ID="ucProjPlanBook" runat="server" />
        </td>
    </tr>
    <tr runat="server" id="trSpecialty1">
        <td colspan="6" class="flexible">
            专业设计输入收资和踏勘提纲
        </td>
    </tr>
    <tr runat="server" id="trSpecialty2">
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AutoGenerateColumns="false"
                AllowSorting="true" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindGridData"
                EmptyDataText="无专业设计输入收资和踏勘提纲" ShowExport="true" ShowPageSizeChange="true" AllowPaging="true"
                PageSize="10">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业名称">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PlanBookTheme" HeaderText="主题">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField HeaderText="详细" CommandName="ViewData" ItemStyle-Width="40px"
                        EditItemClick="viewFormDetail" DataParamFields="ProjectPlanBookID">
                    </zhongsoft:LightButtonField>
                </Columns>
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td>
            <uc2:IntegrateProjItemList ID="ucIntegrateProjItemList" runat="server" />
        </td>
    </tr>
</table>
<!----项目计划书ID--->
<input type="hidden" id="hiProjectPlanBookID" name="hiProjectPlanBookID" runat="server"
    tablename="EPMS_ProjectPlanBook" field="ProjectPlanBookID" />
<input type="hidden" id="hiOutLineFormName" value="现场踏勘工作大纲" runat="server" />
<script type="text/javascript">
    function initCustomerPlugin() {
        projPlanBook_Init();
        integrateProjItem_Init();
    }

    function viewFormDetail(bizId) {
        var url = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizId, IsOld: 0 });
        window.open(url);
        return false;
    }

    //获取最新的版本号信息
    function getNewVerionNum() {
        var json = { "organizationID": getOrganizationID() };
        var newVersionNum = formCallback("GetUpgradeVersionNum", json);
        return newVersionNum;
    }

    function checkForm() {
        if (($actName == "编制项目策划" || $actName == "修改策划" || $actName == "修改" || $actName == "编写项目计划书" || $actName == "编制计划") && $formAction == 0) {
            if ($actName == "编制计划") {
                if (!checkHasChooseLawRegular())
                    return false;
            }
            if (getProjBookNum() > 1) {
                alert("请保留一个项目策划书，删除其它文件后再发送");
                return false;
            }
        }
        return true;
    }

    function checkHasChooseLawRegular() {
        var chooseLaw = getLawRowCount();
        var chooseRegular = getRegularCount();
        var chooseEnvironmental = getEnvironmentalCount();
        var chooseDanger = getDangerRowCount();
        var chooseEmergency = getEmergencyCount();
        var chooseRiskItems = getRiskItemCount();

        if (chooseLaw == 2) {
            alert("请添加法律法规信息");
            return false;
        }
        else if (chooseRegular == 2) {
            alert("请添加规程规范信息");
            return false;
        }
        else if (chooseEnvironmental == 2) {
            alert("请添加环境因素识别信息");
            return false;
        }
        else if (chooseDanger == 2) {
            alert("请添加危险源辨识表信息");
            return false;
        }
        else if (chooseEmergency == 2) {
            alert("请添加应急预案信息");
            return false;
        }

        else if (chooseRiskItems == 2) {
            alert("请添加项目风险辨识信息");
            return false;
        }

        return true;
    }

</script>
