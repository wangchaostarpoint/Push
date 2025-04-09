<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidTenderEntityEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.BidTenderEntityEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register TagPrefix="uc1" TagName="BidProjectReview" Src="~/MM/Form/MBM/WF_BidProjectReview.ascx" %>
<%@ Register TagPrefix="uc2" TagName="OtherBidUnit" Src="~/MM/UI/Controls/OtherBidUnit.ascx" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <uc1:BidProjectReview ID="ucBidProjectReview" runat="server"></uc1:BidProjectReview>
    <uc2:OtherBidUnit ID="ucOtherBidUnit" runat="server"></uc2:OtherBidUnit>
    
    <script>
        function initCustomerPlugin() {
            controlOfFillType();
        }
        
    </script>
</asp:Content>
