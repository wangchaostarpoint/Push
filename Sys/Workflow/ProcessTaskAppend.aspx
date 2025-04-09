<%@ Page Title="追加流程" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ProcessTaskAppend.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.ProcessTaskAppend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="AppendPanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        <asp:TreeView ID="AppendActivities" runat="server" OnSelectedNodeChanged="AppendActivities_SelectedNodeChanged">
                            <Nodes>
                                <asp:TreeNode ImageUrl="~/Themes/Images/btn_select.gif" NavigateUrl="#" Text="选择追加流程"
                                    Value="选择追加流程"></asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                    </td>
                </tr>
                <tr>
                    <td class="td-l" align="right">
                        <asp:Button ID="btnParticipant" runat="server" Text="选择处理人" OnClick="btnParticipant_Click"
                            OnClientClick="return selPart();" />
                        <asp:Button ID="btnSend" runat="server" Text="追加流程" OnClick="btnSendNew_Click" OnClientClick="return window.confirm('您确定追加流程吗？')" />
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnDeletePart" runat="server" Text="删除用户" Visible="false" OnClick="btnDeletePart_Click" />
            <input type="hidden" runat="server" id="hiSelNodeValue" />
            <input type="hidden" runat="server" id="hiParts" />
            <input type="hidden" runat="server" id="hiPartType" />
            <input type="hidden" id="hiDelUserFlag" name="hiDelUserFlag" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        function selPart() {
            var $v = $("#<%=hiSelNodeValue.ClientID %>");
            var $pType = $("#<%=hiPartType.ClientID %>").val();
            if ($v.val() != "") {
                var param = new InputParamObject("m");
                var reObj = null;
                
                if( $pType == "<%=Zhongsoft.XPDL.Standard.ParticipantTypeType.ORGANIZATIONAL_UNIT.ToString() %>"){
                     reObj = getOrgs("<%=hiParts.ClientID %>", param, "2");
                }
                else{
                     reObj = getUsers("<%=hiParts.ClientID %>", param, "");
                }
                  
               
                if (null != reObj) {
                    return true;
                }
            }
            else { alert("请先选择一个步骤！"); }
            return false;
        }
        function deletePart(actId,userId) {
             if( !window.confirm("您确定删除吗？")) return;
             $("#hiDelUserFlag").val(actId+"|"+userId);
             <%=this.ClientScript.GetPostBackEventReference(this.btnDeletePart,null)%>
        }
    </script>

</asp:Content>
