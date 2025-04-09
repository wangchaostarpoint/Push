<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectTimeChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectTimeChangeForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectTimeChangeInfo.ascx" TagName="ProjectTimeChangeInfo"
    TagPrefix="uc1" %>
<uc1:ProjectTimeChangeInfo ID="ProjectTimeChangeInfo1" runat="server" />
<!--主键 -->
<input type="hidden" id="hiProjectTimeChangeID" name="ProjectTimeChangeID" runat="server"
    field="ProjectTimeChangeID" tablename="EPMS_ProjectTimeChange" />
