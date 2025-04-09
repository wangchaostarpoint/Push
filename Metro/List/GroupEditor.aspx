<%@ Page Title="分组管理" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="GroupEditor.aspx.cs" Inherits="Zhongsoft.Portal.Metro.List.GroupEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
<table width="100%" class="tz-table">
        <tr>
            <td class="td-l">
                分组名称
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiGroupID" field="GroupID" tablename="PortalMetroGroup" />
                <zhongsoft:LightTextBox runat="server" ID="tbGroupName" CssClass="kpms-textbox"
                    MaxLength="20" field="GroupName" tablename="PortalMetroGroup" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                图标位置
            </td>
            <td class="td-r">                
                <asp:RadioButtonList runat="server" ID="rbtnContentType" RepeatDirection="Horizontal" field="ICONALIGN" tablename="PortalMetroGroup">
                    <asp:ListItem Value="1">居左</asp:ListItem>
                    <asp:ListItem Value="0">居右</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                业务箭头图标名称
            </td>
            <td class="td-r">
                <table cellpadding='0' cellspacing='0' width="85%">
                    <tr>
                        <td>
                            <zhongsoft:LightTextBox runat="server" ID="tbIcon" CssClass="kpms-textbox" Style="width: 100%; height: 16px;"
                                MaxLength="100" field="ICON" tablename="PortalMetroGroup" activestatus="(23.*)">
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
            <td class="td-l">
                单元格间距<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox3" CssClass="kpms-textbox" Width="40px"
                    MaxLength="4" req="1" Style="text-align: right" field="CELLPADDING" regex="^\d*$" errmsg="只能填写非负整数"
                    tablename="PortalMetroGroup" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>  
         </tr>
         <tr>         
            <td class="td-l">
                分组高度(像素)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox1" CssClass="kpms-textbox" Width="40px"
                    MaxLength="4" req="1" Style="text-align: right" field="HEIGHT" regex="^\d*$" errmsg="只能填写非负整数"
                    tablename="PortalMetroGroup" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>         
            <td class="td-l">
                分组宽度(像素)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox2" CssClass="kpms-textbox" Width="40px"
                    MaxLength="4" req="1" Style="text-align: right" field="WIDTH" regex="^\d*$" errmsg="只能填写非负整数"
                    tablename="PortalMetroGroup" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
         <tr>         
            <td class="td-l">
                分组行数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRowNum" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="ROWNUM" regex="^\d*$" errmsg="只能填写非负整数"
                    tablename="PortalMetroGroup" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>         
            <td class="td-l">
                分组列数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbColNum" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="COLNUM" regex="^\d*$" errmsg="只能填写非负整数"
                    tablename="PortalMetroGroup" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否公开<span class="req-star">*</span>
            </td>
            <td class="td-r">                
                <asp:RadioButtonList runat="server" ID="rbtnPublic" RepeatDirection="Horizontal" field="ISPUBLIC" tablename="PortalMetroGroup">
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
                    tablename="PortalMetroGroup" activestatus="(23.*)">
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
    <input type="hidden" runat="server" id="hiMetroId" field="METROID" tablename="PortalMetroGroup" />
    <input type="hidden" runat="server" id="hiFlag" tablename="PortalMetroGroup" field="Flag" />
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
