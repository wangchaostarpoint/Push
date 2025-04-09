<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HBPlanProj.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.HBPlanProj" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table">
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
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvHBProjList" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                DataKeyNames="OrganizationID" UseDefaultDataSource="true" OnRowDataBound="gvHBProjList_RowDataBound"
                BindGridViewMethod="UserControl.BindPlanProj">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="300px">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("ProjectName")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%-- <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="设总" ItemStyle-Width="60px">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="设总" ItemStyle-Width="90px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbManagerUserName" organizationid='<%#Eval("OrganizationID") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划专业">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="imgViewProjSpe" class="subtoolbarlink" organizationid='<%#Eval("OrganizationID") %>'
                                flag="viewAllSpe">
                                <img id="Img3" runat="server" src='<%# SpeEnabled?"~/Themes/Images/btn_add.gif":"~/Themes/Images/btn_chakan.gif"%>'
                                    alt="查看全部项目专业" width="16" height="16" /></asp:HyperLink>
                            <asp:Label runat="server" ID="lbProjSpe"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="添加卷册">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnAddTask" runat="server" EnableTheming="false" class="subtoolbarlink">
                                <img id="imgAddTask" runat="server" src="~/Themes/Images/btn_add.gif" alt="添加卷册"
                                    width="16" height="16" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="添加资料">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnAddFile" runat="server" EnableTheming="false" class="subtoolbarlink">
                                <img id="img4" runat="server" src="~/Themes/Images/btn_add.gif" alt="添加资料" width="16"
                                    height="16" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="设总是否<br/>处理">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbHasHandle"></asp:Label>
                            <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("OrganizationID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="AddUserName" HeaderText="添加人" Width="60">
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
<input type="hidden" runat="server" id="hiPlanSpe" />
<asp:LinkButton runat="server" ID="lbtnRefresh" OnClick="btnQuery_Click" Style="display: none"></asp:LinkButton>
<script>

          $gridCheckedClientID1 = "<%=this.gvHBProjList.CheckedClientID %>";
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
              
             var $idProjs = "";
             $("#<%=gvHBProjList.ClientID %> [id$='hiOrganizationID']").each(function () {
                var organizationID=$(this).val();
                $idProjs +=organizationID + ",";
             }); 
             
              $.post("<%=this.WebAppPath %>/EPMS/List/Plan/PlanWBSDetail.aspx",
                 { asyfunc: "GetOrgMasterInfo", organizationID: $idProjs},
                 function (res) {
                     if (res == "") { return; }
                     var $l = eval('(' + res + ')');
                     $("#<%=gvHBProjList.ClientID %> [id$='lbManagerUserName']").each(function () {
                         var $organizationid = $(this).attr("organizationid");
                         for (var i = 0; i < $l.length; i++) {
                             var $id=$l[i][0];
                             var $master = $l[i][1];
                             if ($organizationid == $id) {
                                 $(this).text($master);
                             }
                         }
                     });
                   }
              );
          }
          //查看项目计划专业
          function initViewProjSpe<%=this.ClientID %>(){
              $("#<%=gvHBProjList.ClientID %> [flag='viewAllSpe']").each(function () {
                var organizationID=$(this).attr("organizationid");
                $(this).bind('click', function () {
                      return viewAllProjSpe<%=this.ClientID %>(organizationID) ;
                 });
              }); 
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
            if(projectTypeIDs==""){
             alert("请先选择工程类别，再选择项目！");
            }
            else{
                var projectState="<%=(int)ProjectState.正在进行 %>";
                var planUserID="<%=KPMSUser.UserId %>";
                var isWriteUser = "<%=IsWriteUser %>";
                var json;
                if(parseInt("<%=FomrType %>")== "<%=(int)PlanActivityType.项目月度计划编制%>"){
                    if("<%=CurrActName %>"=="编制计划安排"){
                         json={ProjectTypeIDs:projectTypeIDs,ProjectState:projectState,IsShowMore:1};
                    }
                    else if("<%=CurrActName %>"=="计划工程师编制计划安排"){
                         json={ProjectTypeIDs:projectTypeIDs,ProjectState:projectState,PlanUserID:planUserID,IsShowMore:1};
                    }
                    else if("<%=CurrActName %>"=="项目月度计划安排"){
                         json={ProjectTypeIDs:projectTypeIDs,ProjectState:projectState,IsShowMore:1,ProjManagerId:planUserID,IsWriteUser:isWriteUser};
                    }
                }
                else{
                    json={ProjectTypeIDs:projectTypeIDs,ProjectState:projectState,PlanUserID:planUserID,IsShowMore:1};
                }

                 if(parseInt("<%=FomrType %>")== "<%=(int)PlanActivityType.项目月度计划编制%>" || parseInt("<%=FomrType %>")== "<%=(int)PlanActivityType.专业月度计划安排%>"){
                    //IsEnterShow: 1，换行显示选中项
                    json = $.extend(json, { IsEnterShow: 1 });
                }
                getDivProjectNew('<%=hiProjIds.ClientID %>', param, json, refreshProj<%=this.ClientID %>);
            }
            return false;
        }
      
        //批量删除项目信息
        function batchDelProj<%=this.ClientID %>() {
            var delProjID = $("#" + $gridCheckedClientID1).val();
            if (delProjID.length < 36) {
                alert("请勾选要删除的计划项目信息");
                return false;
            }
            else { if (!confirm("确定要删除吗？")) return false; }
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
            showDivDialog(url, null,600, 300, callBack);
            return false;
        }

       //执行后台添加项目数据
       function refreshProj<%=this.ClientID %>() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddProj,"")%>;
       }
 
      //选择卷册成品信息
     function selWBSInfo<%=this.ClientID %>(organizationId) {
        var param = new InputParamObject("m");
        var filter ;
        var spe=$("#<%=hiPlanSpe.ClientID %>").val();
        //IsEnterShow:1选中项换行显示，IsShowCheck:1check选择
        filter = { OrganizationID:organizationId,IsMonthPlan:1 ,ExeSpecialtyID:spe,IsShowMore:1,IsEnterShow:1,IsShowCheck:1};
//        if(parseBool("<%=IsPlanDesignChoose %>"))
//            filter = { OrganizationID: organizationId,IsMonthPlan:1,IsPlanDesignChoose:1,ExeSpecialtyID:spe };
//        else
//            filter = { OrganizationID:organizationId,IsMonthPlan:1 ,ExeSpecialtyID:spe };
        getWBS(getWBSXml(organizationId), param, filter, refreshWBSData);
        return false;
    }

    function selFileInfo<%=this.ClientID %>(organizationId) {
        var param = new InputParamObject("m");
        var filter = { OrganizationID: organizationId };
        getFileItem(getWBSXml(organizationId), param, filter, refreshWBSData);
        return false;
    }

    //判断计划项目列表中当前页是否选择了项目的计划专业信息
    function checkCurrPageHasSelProjSpe() {
        var hasSelProjSpe = true;
        var $projSpe = $("#<%=gvHBProjList.ClientID %> [id$='lbProjSpe']");
        if ($projSpe != null) {
            for (i = 0; i < $projSpe.length; i++) {
                if ($($projSpe[i]).text() == "") {
                    hasSelProjSpe = false;
                    break;
                }
            }
        }
        return hasSelProjSpe;
    }

    //判断是否选择了项目信息
    function checkHasSelProject() {
        return $("#<%=gvHBProjList.ClientID %> [id$='lbProjSpe']").length;
    }
</script>
