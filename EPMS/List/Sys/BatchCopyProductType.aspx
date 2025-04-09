<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatchCopyProductType.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.BatchCopyProductType" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="批量复制成品类别" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td colspan="4" style="text-align: center; font-weight: bold">
                批量复制成品类别
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <p>
                    数据源：</p>
            </td>
        </tr>
        <tr>
            <td>
                项目类型
            </td>
            <td>
                <zhongsoft:LightDropDownList runat="server" ID="ddlSourceProjectType" flag="checkValue"
                    alertMsg="数据源的项目类型">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                项目阶段
            </td>
            <td>
                <zhongsoft:LightDropDownList runat="server" ID="ddlSourcePhase" flag="checkValue"
                    alertMsg="数据源的项目阶段">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <p>
                    目标：</p>
            </td>
        </tr>
        <tr>
            <td>
                项目类型
            </td>
            <td>
                <zhongsoft:LightDropDownList runat="server" ID="ddlTargetProjectType" flag="checkValue"
                    alertMsg="目标的项目类型">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                项目阶段
            </td>
            <td>
                <zhongsoft:LightDropDownList runat="server" ID="ddlTargetPhase" flag="checkValue"
                    alertMsg="目标的项目阶段">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <p>
                    <asp:Button Text="复制" runat="server" ID="btnCopy" OnClientClick="return checkSelValue()"
                        OnClick="btnCopy_Click" />
                    <asp:Button Text="取消" runat="server" ID="btnCancle" OnClick="btnCancle_Click" />
                </p>
            </td>
        </tr>
    </table>
    <script>
        function initCustomerPlugin() {
            $("[id$=divToolBtn]").hide();
        }
        //判断是否源
        function checkSelValue() {
            var $ddlSelValue = $("[flag=checkValue]");
            for (i = 0; i <= $ddlSelValue.length - 1; i++) {
                var selValue = $($ddlSelValue[i]).val();
                if (selValue == "") {
                    alert("请选择" + $($ddlSelValue[i]).attr("alertMsg"));
                    return false;
                }
            }
            return true;
        }
    </script>
</asp:Content>
