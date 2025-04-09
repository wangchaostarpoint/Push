<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PublishNotifyNewForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Publish.WF_PublishNotifyNewForm" %>
<%@ Register Src="~/EPMS/UI/Publish/PublishNotifyNewInfo.ascx" TagName="PublishNotifyNewInfo"
    TagPrefix="uc1" %>
<uc1:PublishNotifyNewInfo ID="PublishNotifyNewInfo" runat="server" />
<!--主键-->
<input type="hidden" runat="server" id="hiPublishNotifyID" field="PublishNotifyID"
    tablename="EPMS_PublishNotify" />
<script type="text/javascript">
    function initCustomerPlugin() {
        initNumPlugin();
    }
</script>
