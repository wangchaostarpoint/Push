<%@ Page Title="模块管理" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="MetroEditor.aspx.cs" Inherits="Zhongsoft.Portal.Metro.List.MetroEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
<table width="100%" class="tz-table">
        <tr>
            <td class="td-l">
                板块名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiMetroID" field="MetroID" tablename="PortalMetro" />
                <zhongsoft:LightTextBox runat="server" ID="tbMetroName" CssClass="kpms-textbox" 
                    MaxLength="20" req="1" field="MetroName" tablename="PortalMetro" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                图标名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <table cellpadding='0' cellspacing='0' width="85%">
                    <tr>
                        <td>
                            <zhongsoft:LightTextBox runat="server" ID="tbIcon" CssClass="kpms-textbox" req="1"
                                Style="width: 100%; height: 16px;" field="ICON" tablename="PortalMetro" activestatus="(23.*)">
                            </zhongsoft:LightTextBox>
                        </td>
                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                            <asp:LinkButton runat="server" ID="lbtnGetIcon" OnClientClick="return GetIcon();"
                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <%--<td class="td-l">
                板块类型<span class="req-star">*</span>
            </td>
            <td class="td-r">                
                <asp:RadioButtonList runat="server" ID="rbtnContentType" RepeatDirection="Horizontal" field="CONTENTTYPE" tablename="PortalMetro">
                    <asp:ListItem Value="1" Selected="True">磁贴</asp:ListItem>
                    <asp:ListItem Value="0">页面</asp:ListItem>
                </asp:RadioButtonList>
            </td>--%>
        </tr>
         <tr>
            <td class="td-l">
                页面路径<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbUrl" CssClass="kpms-textbox"
                    MaxLength="100" req="1" field="URL" tablename="PortalMetro" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否公开<span class="req-star">*</span>
            </td>
            <td class="td-r">                
                <asp:RadioButtonList runat="server" ID="rbtnPublic" RepeatDirection="Horizontal" field="ISPUBLIC" tablename="PortalMetro">
                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="Sort" regex="^\d*$" errmsg="排序只能填写非负整数"
                    tablename="PortalMetro" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    <tr id="trAdmin" runat="server">
        <td class="td-l">
            模块管理员
        </td>
        <td class="td-m" colspan="3">
            <table cellpadding='0' cellspacing='0' width="85%">
                <tr>
                    <td>
                        <input type="hidden" id="hiConsignerID" runat="server" field="MODULEADMINIDS" tablename="PortalMetro"/>
                        <input type="text" runat="server" id="tbConsignUserName" readonly="readonly" class="kpms-textbox"
                            style="width: 100%; height: 16px;" field="MODULEADMINNAMES" tablename="PortalMetro"/>
                    </td>
                    <td valign='middle' style='width: 19px; padding-left: 2px'>
                        <asp:LinkButton runat="server" ID="btnonsignUse" OnClientClick="return GetUser();"
                            Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" tablename="PortalMetro" field="Flag" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
        //选择人
        function GetUser() {
            var param = new InputParamObject("m");
            var users = getUsers("none", param, "");
            if (null != users) {
                var strid = "";
                var strname = "";
                var o = users.selectNodes("//o/@id");
                for (var i = 0; i < o.length; i++) {
                    strid += o[i].value + "|";
                }
                o = users.selectNodes("//o/@name");
                for (var i = 0; i < o.length; i++) {
                    strname += o[i].value + " ";
                }
                $("#<%=this.tbConsignUserName.ClientID %>").val(strname);
                $("#<%=this.hiConsignerID.ClientID %>").val(strid);
            }
            return false;
        }

        function GetIcon() {
            var url = buildQueryUrl("Metro/Obsolete/MetroIconSelector.aspx", { "IconType": "ModuleIcon" });
            showDivDialog(encodeURI(url), null, 1000, 600, afterParamFilter);
            return false;
        }
        function afterParamFilter(re) {
            $("#<%=tbIcon.ClientID %>").val(re);
            return false;
        }

    </script>
</asp:Content>
