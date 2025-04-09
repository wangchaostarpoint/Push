<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeptPlanOfWBS.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.DeptPlanOfWBS" %>
<%@ Register Src="../../UI/Plan/DeptTreeListOfPlan.ascx" TagName="DeptTreeListOfPlan"
    TagPrefix="uc1" %>
<%@ Register Src="../../UI/Plan/PlanWBSOfRoll.ascx" TagName="PlanWBSOfRoll" TagPrefix="uc2" %>
<table class="tz-table">
    <tr>
        <td rowspan="2" style="width: 20%; vertical-align: top;" id="tdleftMenu">
            <div style="overflow: auto" class="treeInfo">
                <uc1:DeptTreeListOfPlan ID="ucDeptTreeListOfPlan" runat="server" OnNodeChanged="treeSelectedNodeChanged"
                    OnInitNodeNumDt="InitNodeNumDt" />
            </div>
        </td>
        <td rowspan="2" valign="top" onclick="showLeft()" style="background: #D9E8FC;">
            <div class="closeleft">
            </div>
        </td>
        <td style="display: none">
        </td>
    </tr>
    <tr>
        <td valign="top" id="right">
            <asp:Label ID="lbPrompt" flag="lbPrompt" Style="display: none" runat="server" ForeColor="Red"
                Text="加粗行为设总增加卷册,黄色行为自动带出的上月未完成卷册。"></asp:Label>
            <uc2:PlanWBSOfRoll ID="ucPlanWBSOfRoll" runat="server" />
        </td>
    </tr>
</table>
<style type="text/css">
    .fhome
    {
        color: #ceeaf6;
    }
    a.fhome:hover
    {
        color: #ecf7fb;
    }
    .closeleft
    {
        width: 5px;
        background: #22334d url(../../../Themes/custom/images/closeleftbg1.png) center no-repeat;
        cursor: pointer;
    }
</style>
<input type="hidden" runat="server" id="hiWBSXml" />
<input type="hidden" runat="server" id="hiSelOrganizationID" />
<input type="hidden" runat="server" id="hiDeptID" />
<input type="hidden" runat="server" id="hiSpeID" />
<input type="hidden" runat="server" id="hiParamWBSTypeID" />
<asp:LinkButton runat="server" ID="lbtnRefresh" OnClick="lbtnRefresh_Click" Style="display: none"></asp:LinkButton>
<script>
    function deptPlanOfWBS_Init(){
      $('.closeleft1').height($('.treeInfo').height() + 'px');
    }
    var pading = 6; //统一边框距离
     
    //选择要列入本期计划的WBS信息
    function selWBSInfo() {
        var organizationID = $("#<%=hiSelOrganizationID.ClientID %>").val();
        var speID= $("#<%=hiSpeID.ClientID %>").val();
        var deptID= $("#<%=hiDeptID.ClientID %>").val();
        if (organizationID == "") {
            alert("请先从左侧树形结构选择项目");
            return false;
        }
        var formType = '<%=Zhongsoft.Portal.EPMS.Obsolete.WBSFormTypeSelect.项目计划.ToString() %>';
        var param = new InputParamObject("m"); 
        var filter ;
        if (parseBool("<%=IsPlanDesignChoose %>"))
            filter={ OrganizationID:organizationID,ExeSpecialtyID:speID,BelongDeptID:deptID,IsMonthPlan:1,IsPlanDesignChoose:1 ,WBSFormTypeSelect: formType};
        else 
            filter={ OrganizationID:organizationID,ExeSpecialtyID:speID,BelongDeptID:deptID,IsMonthPlan:1,WBSFormTypeSelect: formType};
        getWBS("<%=hiWBSXml.ClientID %>", param, filter, refreshData);
    }

    //选择要列入本期计划的WBS信息
    function selFileInfo() {
        var organizationID = $("#<%=hiSelOrganizationID.ClientID %>").val();
        var speID= $("#<%=hiSpeID.ClientID %>").val();
        var deptID= $("#<%=hiDeptID.ClientID %>").val();
        if (organizationID == "") {
            alert("请先从左侧树形结构选择项目");
            return false;
        }
        var formType = '<%=Zhongsoft.Portal.EPMS.Obsolete.WBSFormTypeSelect.项目计划.ToString() %>';
        var param = new InputParamObject("m");
        var filter = { OrganizationID:organizationID,ExeSpecialtyID:speID,BelongDeptID:deptID,WBSFormTypeSelect: formType};
        getFileItem("<%=hiWBSXml.ClientID %>", param, filter, refreshData);
    }


    function refreshData() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnRefresh,"")%>;
         return false;
    }
    var isOpen = true;
    function showLeft() {
        $("#tdleftMenu").toggle(null, null, 500);
        if (isOpen) {
           $('#right').width(($(window).width() - pading) + 'px');
            isOpen = false;
        }
        else {
            var leftW = $('.treeInfo').width();
            $('#right').width(($(window).width() - leftW - pading) + 'px');
            isOpen = true;
        }
    }

    function getUpdateTimeJson(json){
        var jsonNew=json;
        //此页面用于室主任、主任工，室主任、主任工不能修改计划院交出时间
        if("<%=CurrActName %>"!="计划进度协商"){
           jsonNew=$.extend(jsonNew, { IsShowPlanComplete: 'false' });
       }
       return jsonNew;
    }
 
</script>
