<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IntellectualPropertyList.aspx.cs" Title="知识产权" Inherits="Zhongsoft.Portal.TSM.Form.TM.IntellectualPropertyList" MasterPageFile="~/UI/Master/ObjectList.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" UseDefaultDataSource="true" AutoGenerateColumns="false" DataKeyNames="ID"
        PermissionStatus="true" AllowSorting="true" ShowExport="true" OnRowCommand="gvList_RowCommand"
        BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound" HideFieldOnExport="上传,操作">
        <Columns>
            <zhongsoft:LightBoundField DataField="Name" HeaderText="名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Code" HeaderText="编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PropOwner" HeaderText="产权人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Classify" HeaderText="分类">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="HasStatus" HeaderText="状态" HeaderStyle-Width="40px" Visible="false">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="上传" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="20px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnView" EnableTheming="false" CommandName="UploadFile">
                                <img alt="上传" title="上传" src="../../../Themes/Images/btn_dg_upfile.gif"                                 
                                     onclick="return upLoadFile('<%#Eval("ID") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnEdit" EnableTheming="false" CommandName="EditData"
                        CommandArgument='<%#Eval("Classify")+","+Eval("ID") %>'>
                                <img alt="编辑" title="编辑" src="../../../Themes/Images/btn_dg_edit.gif" />
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                        CommandArgument='<%#Eval("ID") %>' OnClientClick='return confirm("确定要删除吗？");'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnLoadGrid" OnClick="btnLoadGrid_Click" Visible="false"/>
    <script type="text/javascript">
        //上传证书
        function upLoadFile(fileSourceId) {
            showUploadForm(fileSourceId, "Module");
            return true;
        }
        function openDialog(classify,id) {
            var path = "";
            if (classify == "专利技术") {
                path = "/TSM/List/TSM/PatentTechnologyEditor.aspx";
            } else if (classify == "专有技术") {
                path = "/TSM/List/TSM/ProprietaryTechnicalEditor.aspx";
            } else if (classify == "软件著作") {
                path = "/TSM/List/TSM/SoftwareCopyRightEditor.aspx";
            } else if (classify == "论文") {
                path = "/TSM/List/TSM/PaperEntityEditor.aspx";
            } else if (classify == "专著") {
                path = "/TSM/List/TSM/TreatiseEntityEditor.aspx";
            }
            var url = buildQueryUrl(path, { actionType: 3, bizId: id });
            showDivDialog(encodeURI(url), "", 800, 500, rebindGridData);
            return false;
        }
        function rebindGridData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnLoadGrid,"") %>
        }
        </script>
</asp:Content>
