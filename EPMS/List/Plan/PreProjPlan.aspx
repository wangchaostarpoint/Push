<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreProjPlan.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.PreProjPlan"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="上期计划项目" %>

<%@ Register Src="../../UI/Plan/PlanProj.ascx" TagName="PlanProj" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table style="width: 100%" class="tz-table">
        <tr class="list-leader">
            <td style="font-weight: bold" class="td-l">
                设总
            </td>
            <td class="td-m">
                <asp:CheckBoxList runat="server" RepeatColumns="12" ID="cblMaster">
                </asp:CheckBoxList>
            </td>
            <td class="td-r">
                <a class="subtoolbarlink" enabletheming="false" relcontrolid="cblMaster" flag="viewMore"
                    shouldshowmore="1">更多</a>
                <input type="hidden" runat="server" id="hiCblMasterShowMore" value="0" />
            </td>
        </tr>
        <tr class="list-leader">
            <td style="font-weight: bold" class="td-l">
                计划人员
            </td>
            <td class="td-m">
                <asp:CheckBoxList runat="server" RepeatColumns="12" ID="cblPlanUser">
                </asp:CheckBoxList>
            </td>
            <td class="td-r">
                <a class="subtoolbarlink" enabletheming="false" relcontrolid="cblPlanUser" flag="viewMore"
                    shouldshowmore="1">更多</a>
                <input type="hidden" runat="server" id="hiCblPlanShowMore" value="0" />
            </td>
        </tr>
        <tr class="list-leader">
            <td style="font-weight: bold" class="td-l">
                专业
            </td>
            <td class="td-m">
                <asp:CheckBoxList runat="server" RepeatColumns="8" ID="cbSpecality">
                </asp:CheckBoxList>
            </td>
            <td class="td-r">
                <a class="subtoolbarlink" enabletheming="false" relcontrolid="cbSpecality" flag="viewMore"
                    shouldshowmore="1">更多</a>
                <input type="hidden" runat="server" id="hiCblSpecality" value="0" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click">
                      <span content='searchResult'>查询</span>
                </asp:LinkButton>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <uc1:PlanProj ID="ucPrePlanProj" runat="server" OnGetSelectedValue="GetSelectedValue" />
    <script>
        function initCustomerPlugin() {
             initViewProjSpe<%=ucPrePlanProj.ClientID %>();
            //设总、计划人员、专业 初次加载只显示1行数据
            $("[flag='viewMore']").each(function () {
                setCBLListShowInfo(this, false);
                $(this).bind('click', function () {
                    return setCBLListShowInfo(this, true);
                });
            });

        };

        function setCBLListShowInfo(obj, change) {
            var relControlID = $(obj).attr("relcontrolid");
            var shouldshowmore = $(obj).attr("shouldshowmore");
            var controlInfo = "";
            var relHiddenControlID = "";
            switch (relControlID) {
                case "cblMaster": { controlInfo = "<%=cblMaster.ClientID %>"; relHiddenControlID = "<%=hiCblMasterShowMore.ClientID %>"; break };
                case "cblPlanUser": { controlInfo = "<%=cblPlanUser.ClientID %>"; relHiddenControlID = "<%=hiCblPlanShowMore.ClientID %>"; break };
                case "cbSpecality": { controlInfo = "<%=cbSpecality.ClientID %>"; relHiddenControlID = "<%=hiCblSpecality.ClientID %>"; break };
            }
            var shouldShow = $("#" + relHiddenControlID).val() == "0" ? change ? true : false : change ? false : true;
            if (change) {
                if (shouldShow) {
                    $("#" + relHiddenControlID).val("1");
                    $(obj).html("收起");
                    setCBListDisplay(controlInfo, true);
                }
                else {
                    $("#" + relHiddenControlID).val("0");
                    $(obj).html("更多");
                    setCBListDisplay(controlInfo, false);
                }
            }
            else {
                setCBListDisplay(controlInfo, shouldShow);
                if (shouldShow)
                    $(obj).html("收起");
                else
                    $(obj).html("更多");
            }
        }

        //设置CheckboxList 是否显示更多
        function setCBListDisplay(controlID, shouldShow) {
            if (shouldShow) {
                $("#" + controlID + " tr:gt(0)").show();
            }
            else {
                $("#" + controlID + " tr:gt(0)").hide();
            }
        }
    </script>
</asp:Content>
