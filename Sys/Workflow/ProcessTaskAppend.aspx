<%@ Page Title="׷������" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
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
                                <asp:TreeNode ImageUrl="~/Themes/Images/btn_select.gif" NavigateUrl="#" Text="ѡ��׷������"
                                    Value="ѡ��׷������"></asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                    </td>
                </tr>
                <tr>
                    <td class="td-l" align="right">
                        <asp:Button ID="btnParticipant" runat="server" Text="ѡ������" OnClick="btnParticipant_Click"
                            OnClientClick="return selPart();" />
                        <asp:Button ID="btnSend" runat="server" Text="׷������" OnClick="btnSendNew_Click" OnClientClick="return window.confirm('��ȷ��׷��������')" />
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnDeletePart" runat="server" Text="ɾ���û�" Visible="false" OnClick="btnDeletePart_Click" />
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
            else { alert("����ѡ��һ�����裡"); }
            return false;
        }
        function deletePart(actId,userId) {
             if( !window.confirm("��ȷ��ɾ����")) return;
             $("#hiDelUserFlag").val(actId+"|"+userId);
             <%=this.ClientScript.GetPostBackEventReference(this.btnDeletePart,null)%>
        }
    </script>

</asp:Content>
