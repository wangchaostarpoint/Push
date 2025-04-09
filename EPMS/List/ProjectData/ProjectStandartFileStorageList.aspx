<%@ Page Language="C#" AutoEventWireup="true" Title="标准表单" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjectStandartFileStorageList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProjectData.ProjectStandartFileStorageList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" 
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="DocID"
        UseDefaultDataSource="true" BindGridViewMethod="BindList" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DocType" HeaderText="文件类型">
            </zhongsoft:LightBoundField>                   
            <zhongsoft:LightBoundField DataField="DocName" HeaderText="文件名">
            </zhongsoft:LightBoundField>                   
            <zhongsoft:LightBoundField DataField="DocDate" HeaderText="生成日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="下载" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="下载" OnClientClick='<%# String.Format("return downloadFile(\"{0}\")", Eval("DocID")) %>'>
                        <span>
                            <img runat="server" id="img2" src="~/Themes/Images/ico_fujian.gif" alt="下载" width="16" title="下载"
                                height="16" />下载</span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function downloadFile(fileId) {
            var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=stdFileByProj&fileId=" + fileId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
