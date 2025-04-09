<%@ Page Title="流程办毕" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ProcessTaskFinish.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.ProcessTaskFinish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="finishPanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        <asp:TreeView ID="SubActivitiesTree" runat="server">
                            <Nodes>
                                <asp:TreeNode ImageUrl="~/Themes/Images/btn_select.gif" NavigateUrl="#" Text="选择办毕流程"
                                    Value="选择办毕流程"></asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                    </td>
                </tr>
                <tr>
                    <td class="td-l" align="right">
                        </font><asp:Button ID="btnFinish" OnClientClick="return window.confirm('您确定办毕流程吗？')"
                            runat="server" Text="打“√”流程办毕" OnClick="btnFinish_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
