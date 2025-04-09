<%@ Page Title="模块管理" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ModuleEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.ModuleEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                模块名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbModuleName" runat="server" MaxLength="50" ActiveStatus="(23.*)"
                    req="1" Field="ModuleName" TableName="PortalModule"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                模块权限
            </td>
            <td class="td-m">
                <asp:DropDownList ID="ddlPublic" runat="server" Field="IsPublic" TableName="PortalModule"
                    Width="85%" ActiveStatus="(23.*)">
                    <asp:ListItem Value="1">公用访问</asp:ListItem>
                    <asp:ListItem Value="0">受限访问</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr runat="server" id="trPageId">
            <td class="td-l">
                连接页面
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiPageXML" />
                <input type="hidden" runat="server" id="hiPageId" field="PageId" tablename="PortalModule" />
                <table cellpadding='0' cellspacing='0' width="85%">
                    <tr>
                        <td>
                            <input type="text" runat="server" id="tbPageName" readonly="readonly" style="width: 100%"
                                class="kpms-textbox" />
                        </td>
                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                            <asp:LinkButton runat="server" ID="btnChoose" OnClientClick="return chooseMenu();"
                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                模块配置类名
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbPackageName" runat="server" MaxLength="512" Field="CfgClassName"
                    TableName="PortalModule" ActiveStatus="(23.*)" ToolTip="格式：类全名称+逗号(,)+程序集名称(没有后缀)"> </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                模块图标
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbMenuIcon" runat="server" MaxLength="56" Field="ModuleIcon" TableName="PortalModule"
                    ActiveStatus="(23.*)"> </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序顺序<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbSoft" runat="server" MaxLength="3" ActiveStatus="(23.*)" regex="^\d*$"
                    errMsg="排序顺序只能填写正整数！" req="1" Field="Sort" TableName="PortalModule"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbMemo" runat="server" MaxLength="512" ActiveStatus="(23.*)" TextMode="MultiLine"
                    CssClass="kpms-textarea" EnableTheming="false" Field="Memo" TableName="PortalModule"></asp:TextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiModuleId" field="ModuleId" tablename="PortalModule" />
    <script>

        function initCustomerPlugin() {
            checkRegex();
        }

        function chooseMenu() {
            var param = new InputParamObject("s");
            var parentId = $("#<%=hiModuleId.ClientID%>").val();
            var re = getPage("<%=hiPageXML.ClientID %>", param, "0|" + parentId);
            if (re != null) {
                $("#<%=hiPageId.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=tbPageName.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }
      
    </script>
</asp:Content>
