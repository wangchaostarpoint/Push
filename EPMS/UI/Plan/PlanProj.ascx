<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlanProj.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Plan.PlanProj" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" width="100%">
    <tr runat="server" id="trOperate">
        <td colspan="6" nowrap="nowrap">
            <div id="divCustomBar" style="float: left;" class="subtoolbarbg">
                <asp:LinkButton runat="server" ID="lbtnAddProj" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="addProj" ToolTip="选择计划项目" OnClick="btnAddProj_Click">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="选择计划项目" width="16"
                            height="16" />选择计划项目</span>
                </asp:LinkButton>
                <input type="hidden" runat="server" id="hiProjIds" />
                <asp:LinkButton runat="server" ID="lbtnBatchDelProj" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="batchDelProj" ToolTip="删除计划项目" OnClick="lbtnBatchDelProj_Click">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_delete.gif" alt="取消计划项目" width="16"
                            height="16" />取消计划项目</span>
                </asp:LinkButton>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvProjList" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                DataKeyNames="OrganizationID" UseDefaultDataSource="true" OnRowDataBound="gvProjList_RowDataBound"
                OnBeforeExporting="gvProjList_BeforeExporting" BindGridViewMethod="UserControl.BindPlanProj">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="工程类型">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="项目名称">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("ProjectName")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%--  <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="设总" ItemStyle-Width="60px">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="计划专业">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="imgViewProjSpe" class="subtoolbarlink" organizationid='<%#Eval("OrganizationID") %>'
                                flag="viewAllSpe">
                                <img id="Img3" runat="server" src='<%# SpeEnabled?"~/Themes/Images/btn_add.gif":"~/Themes/Images/btn_chakan.gif"%>'
                                    alt="查看全部项目专业" width="16" height="16" />计划专业</span></asp:HyperLink>
                            <asp:Label runat="server" ID="lbProjSpe"></asp:Label>
                            <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("OrganizationID") %>'
                                attrorganization='1' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="添加计划<br/>卷册/资料">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnAddTask" runat="server" EnableTheming="false" class="subtoolbarlink">
                                <img id="imgAddTask" runat="server" src="~/Themes/Images/btn_add.gif" alt="添加卷册"
                                    width="16" height="16" />添加卷册</span>
                            </asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="lbtnAddFile" runat="server" EnableTheming="false" class="subtoolbarlink">
                                <img id="img4" runat="server" src="~/Themes/Images/btn_add.gif" alt="添加资料" width="16"
                                    height="16" />添加资料</span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="卷册</br>总数" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnRollNum" EnableTheming="false" flag="rollInfo"
                                Style="text-decoration: underline; color: Blue" special="true" attrorganization='1'
                                organizationid='<%#Eval("OrganizationID") %>' rollState="0" timePeriod="0"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="已完成" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnHadCompleteNum" EnableTheming="false" flag="rollInfo"
                                Style="text-decoration: underline; color: Blue" organizationid='<%#Eval("OrganizationID") %>'
                                rollState="1" timePeriod="0"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="本期<br/>计划数" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnThisPeriodPlanNum" EnableTheming="false" flag="rollInfo"
                                Style="text-decoration: underline; color: Blue" organizationid='<%#Eval("OrganizationID") %>'
                                rollState="0" timePeriod="1"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="本期<br/>已完成" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnThisPeriodComNum" EnableTheming="false" flag="rollInfo"
                                Style="text-decoration: underline; color: Blue" organizationid='<%#Eval("OrganizationID") %>'
                                rollState="1" timePeriod="1"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ProjectState" HeaderText="项目状态" HtmlEncode="false">
                        <ItemStyle Width="60px" />
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="总体<br/>计划" ItemStyle-HorizontalAlign="Right"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnViewAllPlan" runat="server" EnableTheming="false" class="subtoolbarlink">
                                <img id="img" runat="server" src='~/Themes/Images/btn_chakan.gif' alt="总体计划" width="16"
                                    height="16" />
                                </span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiPlanYear" />
<input type="hidden" runat="server" id="hiPlanPeriod" />
<input type="hidden" runat="server" id="hiPlanCycle" />
<input type="hidden" runat="server" id="hiPlanPeriodField" />
<%--<input type="hidden" runat="server" id="hiSpe" />
--%><div id="divBatchUpdate" style="display: none" title="批量更新计划时间">
</div>
<asp:LinkButton runat="server" ID="lbtnRefresh" OnClick="btnQuery_Click" Style="display: none"></asp:LinkButton>
<script>
       $gridCheckedClientID = "<%=this.gvProjList.CheckedClientID %>";
          function initClickEvent<%=this.ClientID %>(){
              //选择项目事件
              $('[flag="addProj"]').each(function () {
                 $(this).bind('click', function () {
                       return addProj<%=this.ClientID %>() ;
                   });
              });
              //批量删除项目事件
              $('[flag=batchDelProj]').each(function () {
                $(this).bind('click', function () {
                      return batchDelProj<%=this.ClientID %>() ;
                 });
              });       
          }
          //查看项目计划专业
          function initViewProjSpe<%=this.ClientID %>(){
              $("#<%=gvProjList.ClientID %> [flag='viewAllSpe']").each(function () {
                var organizationID=$(this).attr("organizationid");
                $(this).bind('click', function () {
                      return viewAllProjSpe<%=this.ClientID %>(organizationID) ;
                 });
              }); 
               var $ids = "";
               $("#<%=gvProjList.ClientID %> [flag='rollInfo']").each(function () {
                var organizationID=$(this).attr("organizationid");
                var rollState=$(this).attr("rollState");
                var timePeriod=$(this).attr("timePeriod");
                $(this).bind('click', function () {
                      return openRollList<%=this.ClientID %>(organizationID,rollState,timePeriod) ;
                 });
              }); 
            
               $("#<%=gvProjList.ClientID %> [attrorganization]").each(function () {
                var organizationID=$(this).attr("organizationid");
                $ids +=organizationID + ",";
              
              }); 
             
              var planCycle = "<%=PlanCycle %>";
              var planCycleField = $("#<%=hiPlanPeriodField.ClientID %>").val();
              var planFieldValue=$("#<%=hiPlanPeriod.ClientID %>").val();
              var planYear = $("#<%=hiPlanYear.ClientID %>").val();
                $.post("<%=this.WebAppPath %>/EPMS/List/Plan/PlanWBSDetail.aspx",
                 { asyfunc: "GetRollInfoNum", organizationID: $ids,planCycle:planCycle,planYear:planYear,planPeriod:planFieldValue,speIDs:"" },
                 function (res) {
                     if (res == "") { return; }
                     var $l = eval('(' + res + ')');
                     $("#<%=gvProjList.ClientID %> [special]").each(function () {
                         var $organizationid = $(this).attr("organizationid");
                         for (var i = 0; i < $l.length; i++) {
                             var $id=$l[i][0];
                             var $rollNum = $l[i][1];
                             var $hadCompleteNum = $l[i][2];
                             var $thisPeriodPlanNum = $l[i][3];
                              var $periodHadCompetetNum = $l[i][4];
                             if ($organizationid == $id) {
                                 $(this).html($rollNum);
                                 var lbtnhadCompleteNum=$(this).parent('td').next().find('[flag=rollInfo]');
                                 if(lbtnhadCompleteNum!=undefined) lbtnhadCompleteNum.html($hadCompleteNum);
                                 var lbtnThisPeriodPlanNum=$(this).parent('td').next('td').next('td').find('[flag=rollInfo]');
                                 if(lbtnThisPeriodPlanNum!=undefined) lbtnThisPeriodPlanNum.html($thisPeriodPlanNum);
                                 var lbtnThisPeriodComNum=$(this).parent('td').next('td').next('td').next('td').find('[flag=rollInfo]');
                                 if(lbtnThisPeriodComNum!=undefined) lbtnThisPeriodComNum.html($periodHadCompetetNum);
                             }
                         }
                     });
                   }
              );
         }
      
        //查看项目总体计划及项目月度计划页面
        function viewProjOverallPlan<%=this.ClientID %>(organizationID) {
            var json = { OrganizationID: organizationID,IsShowInExportWBS:false,IsHideToolBar:true};
            var url = buildBizUrl(1, organizationID, "EPMS/List/Plan/ProjOverallPlan.aspx", json);
            var callBack = null;
            showDivDialog(url, null, 900, 750, callBack);
            return false;
        }
        
        //绑定WBS列表
        function refreshPlanProj<%=this.ClientID %>() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnRefresh,"")%>;
        }
        //添加计划项目事件
        function addProj<%=this.ClientID %>() {
            var param = new InputParamObject("m");
            //根据项目类型（流程中选择的项目类型）、项目状态（正在进行）、担任计划工程师的项目 进行筛选
            var projectTypeIDs= getProjTypeIDs();
            var projectState="<%=(int)ProjectState.正在进行 %>";
            var planUserID="<%=KPMSUser.UserId %>";
            var json={ProjectTypeIDs:projectTypeIDs,ProjectState:projectState,PlanUserID:planUserID,IsShowMore:1};
            getDivProjectNew('<%=hiProjIds.ClientID %>', param, json, refreshProj<%=this.ClientID %>);
            return false;
        }
      
        //批量删除项目信息
        function batchDelProj<%=this.ClientID %>() {
            var delProjID = $("#" + $gridCheckedClientID).val();
            if (delProjID.length < 36) {
                alert("请勾选要删除的计划项目信息");
                return false;
            }
            else { 
                if (!confirm("确定要删除吗？")) return false;
            }
        }

      function openRollList<%=this.ClientID %>(orgID, rollState, traferTimeInfo) {
        var json = null;
        //查看项目的所有WBS卷册信息
        if (rollState == "0" && traferTimeInfo == "0") {
            json = { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'true', ShowWaringRow: 'false' };
        }
        //查看已完成的WBS卷册信息
        else if (rollState == "1" && traferTimeInfo == "0") {
            json = { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'true', ShowWaringRow: 'false', QueryWBSState: "<%=(int)WBSState.已完成 %>" };
        }
        //查看期间列入计划的所有WBS卷册信息
        else {
            var planYear = $("#<%=hiPlanYear.ClientID %>").val();
            var planCycle = escape("<%=PlanCycle %>");
            var planCycleField = $("#<%=hiPlanPeriodField.ClientID %>").val();
            var planFieldValue=$("#<%=hiPlanPeriod.ClientID %>").val();
            if (rollState == "0") {
                json = { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7',
                    IsShowAllButn: 'true', ShowWaringRow: 'false', PlanYear: planYear, PlanCycle: planCycle, PlanPeriodField: planCycleField,PlanPeriod:planFieldValue};
            }
            //查看期间列入计划并且已完成的WBS卷册信息
            else {
                json = { OrganizationID: orgID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'true', ShowWaringRow: 'false', QueryWBSState: "<%=(int)WBSState.已完成 %>",
                    PlanYear: planYear, PlanCycle: planCycle, PlanPeriodField: planCycleField,PlanPeriod:planFieldValue};
            }
        }
        var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", json);
        showDivDialog(url, null, 1200, 600, null);
        return false;
      }
       //查看项目计划专业信息
        function viewAllProjSpe<%=this.ClientID %>(organizationID)
        {
            var actType = parseBool("<%=SpeEnabled %>") ? "<%=(int)AccessLevel.Update %>" : "<%=(int)AccessLevel.Read %>";;
            var planYear = $("#<%=hiPlanYear.ClientID %>").val();
            var planPeriod = $("#<%=hiPlanPeriod.ClientID %>").val();
            var planCycle = "<%=PlanCycle %>";
            var json = { OrganizationID: organizationID, PlanYear: planYear, PlanPeriod: planPeriod, PlanCycle: escape( planCycle) };
            var url = buildBizUrl(actType, organizationID, "EPMS/List/Plan/PlanWBSDetail.aspx", json);

            var callBack = null;
            if (actType == "<%=(int)AccessLevel.Update %>") {
                callBack = refreshPlanProj<%=this.ClientID %>;
            }
            showDivDialog(url, null,500, 300, callBack);
            return false;
        }

       //执行后台添加项目数据
       function refreshProj<%=this.ClientID %>() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddProj,"")%>;
        }

        //获取计划项目数量
        function getPlanProjNum<%=this.ClientID %>(){
            return $("#<%=gvProjList.ClientID %>").find("[id$=lbtnRollNum]").length;
        }

       
      //选择卷册成品信息
     function selWBSInfo<%=this.ClientID %>(organizationId) {
        var param = new InputParamObject("m");
        var filter ;
        if(parseBool("<%=IsPlanDesignChoose %>"))
            filter = { OrganizationID: organizationId,IsMonthPlan:1,IsPlanDesignChoose:1 };
        else
            filter = { OrganizationID:organizationId,IsMonthPlan:1 };
        getWBS(getWBSXml(organizationId), param, filter, refreshWBSData);
        return false;
    }

    function selFileInfo<%=this.ClientID %>(organizationId) {
        var param = new InputParamObject("m");
        var filter = { OrganizationID: organizationId };
        getFileItem(getWBSXml(organizationId), param, filter, refreshWBSData);
        return false;
    }
</script>
