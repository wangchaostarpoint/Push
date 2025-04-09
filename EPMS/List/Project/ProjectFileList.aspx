<%@ Page Language="C#" AutoEventWireup="true" Title="项目文档" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjectFileList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectFileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    文件类型
    <zhongsoft:LightDropDownList runat="server" ID="ddlFileType" Width="120px">
    </zhongsoft:LightDropDownList>
    <span id="spFile">
        <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(3.*)" EnableTheming="False" OnClientClick="return uploadFile();" OnClick="lbtnUploadNew_OnClick" >
            <img src="../../../Themes/Images/ico_fujian.gif">
            <span>上传文件</span>
        </asp:LinkButton>
    </span><span style="float: right; display: none;">
        <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
            ToolTip="批量下载" OnClientClick="return batchDownload();">
            <span>
                <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
                    height="16" />批量下载</span>
        </asp:LinkButton></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvFile" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="FileID" UseDefaultDataSource="true" BindGridViewMethod="BindFile"
        OnRowCommand="gvFile_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="文件类型" DataField="FileType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="文件名称">
                <ItemTemplate>
                    <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileID") %>"
                        target="_blank" title="<%# Eval("FileName") %>" class="aStyle">
                        <%#Eval("FileName")%>
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="上传人" DataField="CreateUserName"/>
            <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                        CommandArgument='<%# Eval("FileID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvFile.CheckedClientID %>";

        function initCustomerPlugin() {

        }

        //上传附件
        function uploadFile() {

            var fileType = $('#<%=ddlFileType.ClientID %>').val();
            if (fileType == '') {
                alert('请先选择文件类型，再上传！');
                return false;
            }
            var fileSrcId = "<%=OrganizationID%>";
            var flag = "<%=FileSourceFlag%>";
            showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnUploadNew,"") %>
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
