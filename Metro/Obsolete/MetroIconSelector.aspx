<%@ Page Language="C#" AutoEventWireup="true" Title="ѡ��ͼ��" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="MetroIconSelector.aspx.cs" Inherits="Zhongsoft.Portal.Metro.Obsolete.MetroIconSelector" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                ͼ������
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="70px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <asp:DataList ID="IconList" runat="server" RepeatColumns="6" RepeatDirection="Horizontal"
        onitemdatabound="IconList_ItemDataBound">
        <ItemTemplate>
            <div runat="server" id="divIcon">
                <table class="myCss" style="cursor: pointer; width:150px; height:100px">
                    <tr><td style="height: 2px;"></td></tr>
                    <tr>
                        <td align="center" style="height: 75px; width: 150px">
                            <img ID="imgIcon" runat="server" alt='<%#Eval("FileName") %>' src='<%#Eval("FilePath") %>' width="130" height="70" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 18px; width: 150px">
                            <asp:Label runat="server" ID="lbName" CssClass="metrogrouptitle" Text='<%#Eval("FileName") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
                <div runat="server" id="divMes" style="display: none">
                    �ߴ磺<%#Eval("Width") %>*<%#Eval("Height") %>����С��<%#Eval("Length")%>KB
                </div>                
            </div>
        </ItemTemplate>
    </asp:DataList>
    <style>
        .myCss:hover
        {
            background:url(../../Themes/images/bacground.png);
        }
        .divLock
        {
            background-color:#b9e6ec;
            display: none;
            height: 25px;
            width: 100%;
            position: absolute;
            display: inline-block;
            bottom: 0px;
            left: 0px;
            line-height: 25px;
            cursor: pointer;
        }
    </style>
    <script>
        function initCustomerPlugin() {
        }
        function closeExpWindow(re) {
            parent.returnValue = re;
            closeWindow();
            return false;
        }
        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }
        function showLock(obj) {
            $("#" + obj).show(); //��ʾ 
        }
        function hideLock(obj) {
            $("#" + obj).hide(); //���� 
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
