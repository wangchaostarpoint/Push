<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RollPartakerEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.RollPartakerEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="安排人员" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table style="width: 100%; border-spacing: 0px">
        <tr>
            <td>
                <asp:DataList ID="dlRollPartakerList" runat="server" EnableViewState="true" RepeatDirection="Horizontal"
                    RepeatColumns="2" Width="100%" OnItemDataBound="dlRollPartakerList_ItemDataBound">
                    <ItemTemplate>
                        <table style="width: 100%; border-spacing: 0px; border-color: #cbccce; border-style: solid;
                            border-width: 1px;">
                            <tr style="height: 25px;">
                                <td style="width: 100%;">
                                    <asp:Label runat="server" ID="lbRoleName" Text='<%# Eval("RoleName") %>'></asp:Label>
                                    <input type="hidden" runat="server" id="hiRoleName" value='<%# Eval("RoleName") %>' />
                                </td>
                            </tr>
                            <tr align="left">
                                <td style="height: 28px; border-color: #cbccce; border-style: solid; border-width: 1px;">
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbOperatorName" IsMutiple="true"
                                        Width="110px" SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                        PageWidth="850" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiOperatorId':'id','hiOperatorCode':'LoginId'}"
                                        PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                                    <input type="hidden" runat="server" id="hiOperatorId" />
                                    <input type="hidden" runat="server" id="hiOperatorCode" />
                                    <input type="hidden" runat="server" id="hiRoleId" value='<%#Eval("RoleId")%>' />
                                    <input type="hidden" runat="server" id="hiRoleLevel" value='<%#Eval("RoleLevel")%>' />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
    <div style="width: 100%; text-align: center;">
        <asp:LinkButton runat="server" ID="ibtnOK" ToolTip="确定" OnClick="ibtnOK_Click">
            <span>
               确定</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnCancel" ToolTip="取消" OnClientClick="return cancelExp();">
            <span>
                取消</span>
        </asp:LinkButton>
    </div>
    <input type="hidden" runat="server" id="hiXML" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            $("[id$=divToolBtn]").hide();
        }

        function closeExpWindow() {
            parent.returnValue = $("#<%=hiXML.ClientID %>").val();
            closeWindow();
            return false;
        }

        function cancelExp() {
            parent.returnValue = null;
            closeWindow();
        }
    </script>
</asp:Content>
