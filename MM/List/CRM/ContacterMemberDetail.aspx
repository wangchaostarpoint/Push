<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContacterMemberDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.CRM.ContacterMemberDetail" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="tz-table">
        <tr onclick="openDetail('divOpenBaseInfo')">
            <td class="td-hand" align="center" style="font-weight: bold" colspan="6">
                家庭成员基本信息
            </td>
        </tr>
    </table>
    <div id="divOpenBaseInfo">
        <table class="tz-table">
            <tr>
                <td class="td-l">
                    与客户的关系
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="ddlType" activestatus="(2.*)" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
        </table>
        <table class="tz-table">
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:DataList ID="dlMember" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                                Width="100%">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td class="td-l">
                                                <asp:Label runat="server" ID="lblTitle" Text='<%#Eval("PATAMDETAILNAME") %>'></asp:Label>
                                                <input type="hidden" runat="server" id="hiContacterDetailID" value='<%#Eval("CONTACTERDETAILID") %>' />
                                                <input type="hidden" runat="server" id="hiOrderNum" value='<%#Eval("SORT") %>' />
                                                <input type="hidden" runat="server" id="hiParamId" value='<%#Eval("PATAMDETAILID") %>' />
                                                <input type="hidden" runat="server" id="hiType" value='<%#Eval("TYPE") %>' />
                                            </td>
                                            <td class="td-m">
                                                <zhongsoft:LightTextBox ID="tbContent" runat="server" MaxLength="64" Text='<%#Eval("CONTACTERDETAILCONTENT") %>'
                                                    show='<%#Eval("TYPE") %>' Width="170px" activestatus="(23.*)" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
