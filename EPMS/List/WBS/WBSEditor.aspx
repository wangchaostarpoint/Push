<%@ Page Language="C#" AutoEventWireup="true" Title="任务详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="WBSEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSEditor" %>

<%@ Register Src="../../UI/WBS/WBSInfoSimple.ascx" TagName="WBSInfoSimple" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <uc1:WBSInfoSimple ID="wbsInfo" runat="server" />
    </table>
    <script type="text/javascript">
        function checkForm() {
            //保存再次验重
            return checkWBSCode();
        }
    </script>
</asp:Content>
