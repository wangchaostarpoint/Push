<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WBSTaskEditor.aspx.cs" Title="任务信息"
    Inherits="Zhongsoft.Portal.EPMS.List.WBSTaskEditor" MasterPageFile="~/UI/Master/ObjectEditorNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                任务名称
            </td>
            <td class="td-r">

            </td>
            <td class="td-l">
                任务编号
            </td>
            <td class="td-r">

            </td>
        </tr>
    </table>
    <input id="hiWBSTaskID" type="hidden" tablename="EPMS_WBSTaskTemp" field="WBSTaskID" runat="server" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
