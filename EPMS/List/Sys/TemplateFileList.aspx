<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateFileList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.TemplateFileList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">模板类型</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" class="kpms-ddlsearch"
                                     EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">模板文件名称</span> <span>
        <zhongsoft:LightTextBox ID="tbFileName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnCopy" OnClientClick="return upLoadFile()"
            CssClass="subtoolbarlink" OnClick="lbtnUpload_Click" EnableTheming="false">
            <span>
                <img runat="server" id="img2" src="~/Themes/Images/C_write.gif" alt="上传模板文件" height="16" />上传模板文件</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvFile" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        OnRowDataBound="gvList_RowDataBound" DataKeyNames="TemplateFileID" UseDefaultDataSource="true"
        BindGridViewMethod="BindFile">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="模板文件名称">
                <ItemTemplate>
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("TemplateFileURL") %>"
                        title="<%# Eval("TemplateFileName") %>">
                        <%#Eval("TemplateFileName")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="模板类型">
                <ItemTemplate>
                    <zhongsoft:LightDropDownList runat="server" ID="ddlParamWBSTypeID" OnSelectedIndexChanged="dll_SelectedIndexChanged"
                        AutoPostBack="true">
                    </zhongsoft:LightDropDownList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="业务板块">
                <ItemTemplate>
                    <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlate" OnSelectedIndexChanged="dll_SelectedIndexChanged"
                        AutoPostBack="true">
                    </zhongsoft:LightDropDownList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiBusinessId" value='' />
    <script>
        $gridCheckedClientID = "<%=gvFile.CheckedClientID %>";

        function upLoadFile() {
            var businessId = $("#<%=hiBusinessId.ClientID %>").val();
            showUploadFormAndType(businessId, "Module", null, uploadFileCallBack);
            return false;
        }

        function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnCopy,"") %>
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
