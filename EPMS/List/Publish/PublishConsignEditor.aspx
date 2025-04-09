<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishConsignEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishConsignEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%--项目基本信息--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishConsignProjInfo.ascx" TagName="PublishConsignProjInfo"
    TagPrefix="uc1" %>
<%--出版卷册列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishConsignWBSInfo.ascx" TagName="PublishConsignWBSInfo"
    TagPrefix="uc3" %>
<%--工种安排列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishWorkInfo.ascx" TagName="PublishWorkInfo"
    TagPrefix="uc4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <uc1:PublishConsignProjInfo ID="PublishConsignProjInfo" runat="server" />
    <uc3:PublishConsignWBSInfo ID="PublishConsignWBSInfo" runat="server" />
    <uc4:PublishWorkInfo ID="PublishWorkInfo" runat="server" />
    <!--主键-->
    <input type="hidden" runat="server" id="hiPublishConsignID" field="PublishConsignID"
        tablename="EPMS_PublishConsign" />
    <script type="text/javascript">
        function checkForm() {
            if ($formAction == 0) {               
            }
            return true;
        }
        function initCustomerPlugin() {
            initPublishProjInfo();
            initConsignPlugin();
        }
    </script>
</asp:Content>
