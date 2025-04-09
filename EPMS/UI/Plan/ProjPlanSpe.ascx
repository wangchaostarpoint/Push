<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjPlanSpe.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.ProjPlanSpe" %>
<tr>
    <td class="td-l">
        计划专业
    </td>
    <td class="td-m" colspan="5">
        <table width="100%">
            <tr>
                <td>
                    <asp:CheckBox runat="server" ID="cbAllChecked" Text="全选" checkFlag="all" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList runat="server" ID="cbSelSpe" RepeatDirection="Horizontal" Style="display: inline;
                        padding-left: 5px;">
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
    </td>
</tr>
<script type="text/javascript">
    function projPlanSpe_Init() {
        $("#<%=cbAllChecked.ClientID %>").live("click", function () { allSpeSelect(); });
        $("#<%=cbSelSpe.ClientID %>").live("click", function () { setAllChecked(); })
    }

    //设置计划专业全选功能
    function allSpeSelect() {
        var $checkAll = $("[checkFlag='all']").find("input");
        $("#<%=cbSelSpe.ClientID %> input").each(function () {
            $(this)[0].checked = $checkAll[0].checked;
            if ($checkAll[0].checked)
                $(this).next().css("font-weight", "bold")
            else
                $(this).next().removeAttr("style");
        });
        if ($checkAll[0].checked)
            $checkAll.next().css("font-weight", "bold")
        else
            $checkAll.next().removeAttr("style");
        return false;
    }

    //设置全选是否选中
    function setAllChecked() {
        var isAllChecked = true;
        var $checkAll = $("[checkFlag='all']").find("input");
        $("#<%=cbSelSpe.ClientID %> input").each(function () {
            if (!$(this)[0].checked) {
                isAllChecked = false;
            }
        });
        $checkAll[0].checked = isAllChecked;
        if (isAllChecked)
            $checkAll.next().css("font-weight", "bold")
        else
            $checkAll.next().removeAttr("style");
    }
</script>
