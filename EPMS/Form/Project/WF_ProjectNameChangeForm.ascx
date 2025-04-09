<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectNameChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectNameChangeForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectNameChangeInfo.ascx" TagName="ProjectNameChangeInfo"
    TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <uc1:ProjectNameChangeInfo ID="ProjectNameChangeInfo1" runat="server" />
</table>
<!--主键 -->
<input type="hidden" id="hiProjectNameChangeID" name="hiProjectNameChangeID" runat="server"
    field="ProjectNameChangeID" tablename="EPMS_ProjectNameChange" />