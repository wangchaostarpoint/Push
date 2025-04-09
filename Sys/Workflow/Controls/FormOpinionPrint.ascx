<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormOpinionPrint.ascx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.FormOpinionPrint" %>
<input id="hiESignCheck" runat="server" type="hidden" />
<%=SignRender%>

<input id="hiESignStr" runat="server" type="hidden" />
<input id="hiEImageStr" value="" type="hidden" runat="server" />

<script type="text/javascript">
function ESignProtect1() {
       <%=ESignBatchExe.ToString() %>
    }
    
</script>
