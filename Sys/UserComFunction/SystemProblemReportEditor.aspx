<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemProblemReportEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.UserComFunction.SystemProblemReportEditor" MasterPageFile="~/UI/Master/ObjectEditorNew.Master" %>

<%@ Register Src="~/Sys/UserComFunction/SystemProblemInfo.ascx" TagName="SystemProblemInfo"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <uc1:SystemProblemInfo ID="SystemProblemInfo" runat="server" />
    <!--主键-->
    <input type="hidden" runat="server" id="hiProblemID" field="ProblemID" tablename="SystemProblemReport" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="SystemProblemReport"
        value="1" />
</asp:Content>
