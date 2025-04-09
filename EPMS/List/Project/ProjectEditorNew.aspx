<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectEditorNew.aspx.cs" Title="项目基本信息"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectEditorNew" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Register Src="~/EPMS/UI/Project/PhaseProjectCommon.ascx" TagName="PhaseProject" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnStartWf" EnableTheming="false" CssClass="subtoolbarlink" OnClientClick="return checkDept();"
            OnClick="btnStartWorkFlow_Click" ToolTip="发送项目立项通知给设总"><span>
             <img src="../../../Themes/Images/btn_submit.gif" />发送</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <uc1:PhaseProject ID="PhaseProjectCommon" runat="server" />
    </table>
    <input id="hiOrganizationID" type="hidden" tablename="EPMS_ProjectEntity" field="OrganizationID" runat="server" />
    <script type="text/javascript">
        function checkDept() {
            //隐藏产值计列部门
            <%--if ("<%=ActionType %>" != "<%=AccessLevel.Update%>") {
                alert("请先保存并填写产值计列部门");
                return false;
            }
            if (!checkRate()) {
                return false;
            }--%>
            if (!saveData()) {
                return false;
            }
            if (!confirm('您将发送项目通知给设总，确定吗？')) {
                return false;
            }
            setReturnVal();
            return true;
        }

        function checkForm() {
            return checkGS();
        }
        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = "saved";
        }
    </script>
</asp:Content>
