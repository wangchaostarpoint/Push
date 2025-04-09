<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_BidNoticeList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.C_BidNoticeList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td>
                附件名称
                <asp:TextBox ID="tbName" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnUpByFile" OnClientClick="uploadFileForm();"
            OnClick="lbtnUpByFile_Click" CssClass="btn-toolmenu" EnableTheming="false"> 
            <span>上传</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false"
        DataKeyNames="BIDNOTICESID" AllowFrozing="true" FrozenColNum="2" ShowExport="true"
        runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack" ItemStyle-Width="40px">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="附件名称" ItemStyle-Width="90%">
                <ItemTemplate>
                    <a href="/portal/sys/fileDocument/FileDownload.aspx?fileId=<%#Eval("BIDNOTICESNAME") %>"
                        target="_parent" title="点击下载文件" class="kpms-attachmenta" style="text-decoration: underline;
                        color: #0033FF;">
                        <%# Eval("BIDNOTICESNAME")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        //上传附件
        function uploadFileForm() {
            var fileSrcId = "<%=KeyId%>";
            showUploadForm(fileSrcId, "Module");
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
