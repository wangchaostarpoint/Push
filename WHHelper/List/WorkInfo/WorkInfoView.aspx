<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="WorkInfoView.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.LIst.WorkInfo.WorkInfoView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
 
       <asp:Table ID="showInfo" runat="server" Width="100%" BorderColor="Gray" BorderStyle="Solid" GridLines="Both" HorizontalAlign="Left">
           <asp:TableHeaderRow  CssClass="tr" >
               <asp:TableHeaderCell Text="范围" CssClass="td-l"> </asp:TableHeaderCell>
               <asp:TableHeaderCell Text="主题" CssClass="td-l"> </asp:TableHeaderCell>
               <asp:TableHeaderCell Text="说明" CssClass="td-l"> </asp:TableHeaderCell>
           </asp:TableHeaderRow> 
            
       </asp:Table> 
    <script type="text/javascript">
    </script>
</asp:Content>


