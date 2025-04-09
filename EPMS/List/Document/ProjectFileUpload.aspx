<%@ Page Language="C#" Title="文件上传" AutoEventWireup="true" CodeBehind="ProjectFileUpload.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Document.ProjectFileUpload"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/EPMS/UI/ProjectData/UCProjectFileCreate.ascx" TagName="ProjectFileCreate" TagPrefix="uc3" %>

<%@ Import Namespace="DAL.EPMS" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content3" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <uc3:ProjectFileCreate ID="UcProjectFileCreate" runat="server" />
    <table class="tz-table">
        <tr>
            <td colspan="2">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    AutoGenerateColumns="false" ShowExport="false" DataKeyNames="FileID" UseDefaultDataSource="true"
                    BindGridViewMethod="BindDataGrid" EmptyDataText="没有要查找的数据"
                    OnRowDataBound="gvList_RowDataBound">
                    <Columns>

                        <zhongsoft:LightTemplateField HeaderText="项目名称">
                            <ItemTemplate>
                                <div style="word-break: break-all !important; white-space: normal !important;">
                                    <asp:Label ID="lbProjectName" runat="server"></asp:Label>
                                </div>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目编号">
                            <ItemTemplate>
                                <asp:Label ID="lbProjectCode" runat="server"></asp:Label>
                                <input type="hidden" runat="server" id="hiFileID" value='<%#Eval("FileID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="专业" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" content="state"></zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="文件类别" DataField="FileType">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="版本号" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlFileVersion" runat="server"></zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="备注">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="lbMemo" Text='<%#Eval("Memo") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="上传日期">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText ID="txtWriteTime" runat="server"
                                    class="kpms-textbox-date" readonly="readonly">
                                </zhongsoft:XHtmlInputText>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="创建人" DataField="CreateUserName">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="创建日期" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div style="width: 100%; text-align: center;">
                    <asp:LinkButton runat="server" ID="ibtnOK" ToolTip="确定" OnClientClick="return saveProjectFile();">
            <span>
               确定</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnCancel" ToolTip="取消" OnClientClick="return delProjectFile();">
            <span>
                取消</span>
                    </asp:LinkButton>
                </div>
            </td>
        </tr>
    </table>

    <asp:LinkButton runat="server" ID="lbtnOK" Style="display: none" OnClick="ibtnOK_Click"> 
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="lbtnDel" Style="display: none" OnClick="lbtnDel_Click"> 
    </asp:LinkButton>
    <script type="text/javascript">
        function initCustomerPlugin() {
            initProjectFile();
            $(".subtoolbar").css("display", "none");
        }

        function cancelExp() {
            closeWindow();
        }

        function saveProjectFile() {
            var $State = $('#<%=gvList.ClientID %> [content="state"]');
            var len = $State.length;
            for (var i = 0; i < len; i++) {
                if ($State.eq(i).find('option:selected').val() == "") {
                    alert('请选择专业！');
                    return false;
                }
            }
            parent.returnValue = "saved";
          <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnOK, "")%>;

            return false;
        }

        function delProjectFile() {
          <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnDel, "")%>;
            cancelExp();
        }

    </script>
</asp:Content>

