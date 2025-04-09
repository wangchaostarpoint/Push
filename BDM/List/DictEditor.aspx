<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="字典定义" CodeBehind="DictEditor.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.DictEditor" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <table style="border-collapse: collapse;">
            <tr>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnDefault"
                        DisplayStatus="(3.*)" OnClientClick="return setDefault();" ToolTip='默认页'>
                            <span><img  src="../../Themes/Images/btn_defaultpage.gif" width="16" height="16" />默认页</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnAction"
                        DisplayStatus="(3.*)" OnClientClick="return setAction();" ToolTip='功能'>
                            <span><img  src="../../Themes/Images/btn_function.gif" width="16" height="16" />功能</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnTrigger"
                        DisplayStatus="(3.*)" OnClientClick="return setTrigger();" ToolTip='触发器'>
                            <span><img  src="../../Themes/Images/btn_triggergif.gif" width="16" height="16" />触发器</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" ID="btnValid" EnableTheming="false" DisplayStatus="(3.*)"
                        CssClass="subtoolbarlink" OnClientClick="return showRelation();" accesslevel="3">
                            <span><img  src="../../Themes/Images/btn-relation.png" width="16" height="16" />关联</span>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <input type="hidden" id="hiDictId" runat="server" field="DictId" tablename="BD_Dict" />
    <table class="tz-table">
        <tr>
            <td class="td-l">
                数据连接
            </td>
            <td class="td-m">
                <asp:DropDownList runat="server" ID="ddlDataCon" ActiveStatus="(2.*)" Width="200px"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlDataCon_Change">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型
            </td>
            <td class="td-m">
                <asp:RadioButtonList runat="server" ID="dictType" RepeatDirection="Horizontal" ActiveStatus="(2.*)"
                    EnableTheming="false" AutoPostBack="true" OnSelectedIndexChanged="dictType_Change">
                    <asp:ListItem Value="0" Selected="True">表</asp:ListItem>
                    <asp:ListItem Value="1">视图</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                数据库表/视图<%--DictCode--%><span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:DropDownList ID="ddlTableCode" Width="300px" runat="server" req="1" ActiveStatus="(2.*)"
                    EnableTheming="false">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                表/视图名称释义<%--DictName--%>
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbTableName" runat="server" Width="300px" req="1" ActiveStatus="(23.*)"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属模块
            </td>
            <td class="td-m">
                <asp:DropDownList runat="server" ID="ddlModule" Width="200px" req="1" activestatus="(23.*)"
                    EnableTheming="false">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="Id" AllowPaging="True" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="显示名称" HeaderStyle-Width="20%">
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiId" value='<%#Eval("Id") %>' />
                                <input type="text" runat="server" id="txtName" class="kpms-textbox" value='<%#Eval("Name") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Code" HeaderText="字段编号" HeaderStyle-Width="20%" />
                        <asp:BoundField DataField="Type" HeaderText="数据类型" HeaderStyle-Width="15%" />
                        <asp:TemplateField HeaderText="长度" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblLength"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="小数长度" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblDecLength"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CanNull" HeaderText="允许为空" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="IsPK" HeaderText="主键" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                        <asp:TemplateField HeaderText="启用" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="cbVisable" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <asp:LinkButton runat="server" ID="btnUpDate" OnClick="btnUpdate_Click" Visible="false"></asp:LinkButton>
    <script type="text/javascript">

        function initCustomerPlugin() {
            if (!parseBool("<%=Page.IsPostBack %>") && "<%=ActionType %>" == "Update") {
                var isUpdated = "<%=IsUpdated.ToString() %>";
                if (parseBool(isUpdated)) {
                    if (confirm("该数据库表结构有修改，是否更新到数据字典？")) {
                     <%=ClientScript.GetPostBackEventReference(this.btnUpDate,"") %>;    
                    }
                }
            }
            $("#<%=divSystemBar.ClientID %>").hide();
        }


        function showRelation()
        {
            var url=buildQueryUrl("Custom/List/RelationMgr.aspx",{ "DictId":$bizCtx.bizId});
            //showModal(url,"",800,500);
            showDivDialog(url, null, 830,500, null);
            return false;
        }

           function setDefault() {
            var url = buildBizUrl("3", $bizCtx.bizId, "Custom/list/DictFeatureEditor.aspx", null);
            //showModal(url, null, 600, 400);
            showDivDialog(url, null, 600,500, null);
            return false;
        }


        function setAction() {
            var url = buildBizUrl("3", null, "Custom/list/BDDictActionMgr.aspx", { dictid: $bizCtx.bizId });
            //showModal(url, null, 800, 400);
            showDivDialog(url, null, 900,500, null);
            return false;
        }

        function setTrigger() {
            var url = buildBizUrl("3", null, "Custom/list/TriggerMgr.aspx", { sourceId: $bizCtx.bizId,IsModalDialog: "1"  });
            showDivDialog(url, null, 700,500, null);
            return false;
        }
    </script>
</asp:Content>
