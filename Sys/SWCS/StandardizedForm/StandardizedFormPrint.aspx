<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StandardizedFormPrint.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.StandardizedForm.StandardizedFormPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="Zhongsoft.Portal.Sys.StandardizedForm" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>标准表单打印</title>
    <link type="text/css" rel="stylesheet" href="/Portal/Themes/Styles/global.css" />
    <link type="text/css" rel="stylesheet" href="/Portal/Themes/Styles/formsender.css" />
    <link type="text/css" rel="stylesheet" href="/Portal/Themes/Styles/form.css" />
    <script type="text/javascript" src="/Portal/UI/script/form.fullscr.js"></script>
</head>
<body id="formBody" class="form-body">
    <form id="form1" runat="server">
    <div class="form-container" id="formContainer">
        <div class="form-header">
            <div class="form-title" id="divTitle">
                <span>标准表单打印</span>
            </div>
        </div>
        <div class="form-content" id="lcbody">
            <table class="form-table">
                <tr class="form-toolbar">
                    <td class="form-toolbarleft">
                    </td>
                    <td class="form-toolbarmid">
                    </td>
                    <td class="form-toolbarright">
                    </td>
                </tr>
                <tr class="form-top">
                    <td class="form-topleft">
                    </td>
                    <td class="form-topmid">
                        &nbsp;
                    </td>
                    <td class="form-topright">
                    </td>
                </tr>
                <tr class="form-contentbody">
                    <td class="form-contentleft">
                    </td>
                    <td class="form-contentmid">
                        <div class="form-tabcontent" id="formContent" width="100%">
                            <div style="text-align: left">
                                <h3 class="kpms-star">
                                    生成进度：<asp:Label ID="lbMessage" runat="server"></asp:Label></h3>
                            </div>
                            <zhongsoft:LightPowerGridView ID="lpgvList" runat="server" AutoGenerateColumns="false"
                                AllowPaging="false" OnRowCommand="lpgvList_RowCommand" OnRowDataBound="lpgvList_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <%# Container.DisplayIndex+1  %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="标准表单文件" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%#  Eval("FileName")%>.pdf
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="下载" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbtnDown" CommandArgument='<%# Eval("FilePath")%>'
                                                CommandName="down" EnableTheming="false">
                                                <img alt="" src="../../../Themes/Images/btn_dg_upfile.gif" border="0"/>
                                            </asp:LinkButton>
                                            <input type="hidden" runat="server" id="hiFileName" value='<%# Eval("FileName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="预览" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <a onclick="return viewStdFile('<%#Eval("PDFFileInfoID") %>','<%#Eval("FileName") %>')">
                                                <img alt="" src="../../../Themes/Images/btn_dg_view.gif" border="0" />
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbtnDelete" CommandArgument='<%# Eval("PDFFileInfoID")%>'
                                                EnableTheming="false" CommandName="deleteData" Visible="false">
                                                <img alt="" src="../../../Themes/Images/btn_dg_delete.gif" border="0" onclick="return confirm('确认删除？')"/>
                                            </asp:LinkButton>
                                            <input type="hidden" runat="server" id="hiFilePath" value='<%# Eval("FilePath") %>' />
                                            <input type="hidden" runat="server" id="hiCreateUserID" value='<%# Eval("CreateUserID") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </div>
                    </td>
                    <td class="form-contentright">
                    </td>
                </tr>
                <tr class="form-bottom">
                    <td class="form-bottomleft">
                    </td>
                    <td class="form-bottommid">
                        &nbsp;
                    </td>
                    <td class="form-bottomright">
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        function viewStdFile(fileId, pathName) {
            var param = { fileId: fileId, fileType: 'stdFile', viewType: 'pdf', pathName: pathName };
            var viewUrl = buildQueryUrl("/Sys/FileView/AttachmentView.aspx", param);
            window.open(viewUrl);
            return false;
        }
    </script>
    </form>
</body>
</html>
