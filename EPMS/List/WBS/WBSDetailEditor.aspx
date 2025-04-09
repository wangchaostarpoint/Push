<%@ Page Language="C#" AutoEventWireup="true" Title="WBS任务详细" MasterPageFile="~/UI/Master/ObjectEditorNew.Master"
    CodeBehind="WBSDetailEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSDetailEditor" %>

<%@ Register Src="../../UI/WBS/WBSInfoDetail.ascx" TagName="WBSInfoDetail" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <uc1:WBSInfoDetail ID="wbsInfo" runat="server" />
    </table>
    <script type="text/javascript">
        function checkForm() {
            //保存再次验重
            return checkWBSCode();
        }
    </script>
</asp:Content>
