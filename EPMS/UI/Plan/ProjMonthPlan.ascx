<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjMonthPlan.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.ProjMonthPlan" %>
<%@ Register Src="../../UI/Plan/PlanWBSOfRoll.ascx" TagName="PlanWBSOfRoll" TagPrefix="uc1" %>
<link href="../../../Themes/Styles/objectlist.css" rel="stylesheet" type="text/css" />
<div style="overflow-y: auto; overflow-x: auto;">
    <table class="tz-table" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td class="list-content" valign="top">
                <div id="div2">
                    <table class="tz-table">
                        <tr>
                            <td style="width: 20%; vertical-align: top;" class="list-tree">
                                <asp:TreeView ID="tvWBSTree" runat="server" ShowLines="True" Height="100%" OnSelectedNodeChanged="tvWBSTree_SelectedNodeChanged">
                                    <SelectedNodeStyle BackColor="#F7F7F7" />
                                </asp:TreeView>
                            </td>
                            <td colspan="5" style="width: 80%; vertical-align: top;" valign="top" style="padding-left: 3px;">
                                <div style="margin-bottom: 4px;">
                                    <span id="spanAlter" class="req-star">&nbsp;&nbsp;添加计划卷册或者互提资料后直接列入计划，不需保存</span>
                                    <uc1:PlanWBSOfRoll ID="ucPlanWBSOfRoll" runat="server" OnAfterDelPlanWBS="RefreshWBSTypeTree" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</div>
<input type="hidden" runat="server" id="hiWBSXml" />
<asp:LinkButton runat="server" ID="lbtnRefresh" OnClick="lbtnRefresh_Click" Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiIsImportant" />
<script>

    function ucProjectMonthPlan_Init()
    {
        inExportEvent();
        rollXmlDoc.loadXML("<root></root>");
        $("[wbsID]").live("blur", function () {
            $("#" + $(this).attr("id")).val($(this).val());
            saveChangeWBSInfo(this)
        });
        if(!parseBool("<%=Enabled %>"))
        {
           $("#spanAlter").hide();
        }
    }

    function selWBSInfo() {
        var param = new InputParamObject("m");
        var filter ;
        if(parseBool("<%=IsPlanDesignChoose %>"))
            filter = { OrganizationID: '<% =OrganizationID%>',IsMonthPlan:1,IsPlanDesignChoose:1 };
        else
            filter = { OrganizationID: '<% =OrganizationID%>',IsMonthPlan:1 };
        getWBS("<%=hiWBSXml.ClientID %>", param, filter, refreshData);
    }

     function selFileInfo() {
        var param = new InputParamObject("m");
        var filter = { OrganizationID: '<% =OrganizationID%>' };
        getFileItem("<%=hiWBSXml.ClientID %>", param, filter, refreshData);
    }

    function refreshData() {
      <%=Page.ClientScript.GetPostBackEventReference(this.lbtnRefresh,"")%>;
    }
</script>
