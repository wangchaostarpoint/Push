<%@ Page Title="委托授权" Language="C#" AutoEventWireup="true" CodeBehind="ConsignerList.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectCfg.Master" Inherits="Zhongsoft.Portal.Sys.Workflow.ConsignerList" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <link href="../../Themes/custom/Styles/global.css" type="text/css" rel="Stylesheet" />
    <%--添加功能区--%>
    <div id="divHeader" runat="server" class="detail-header" visible="false">
        <div class="tabs-title2">
            <%=this.Page.Title %>
            <%--—
            <%=AppConfig.Instance.BaseOrgUnitName %>--%>
        </div>
        <div class="tabs-title">
            <ul>
                <li><a class="tabs-tlink">功能区</a></li>
            </ul>
        </div>
    </div>
    <%--功能区结束--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs" style="margin-top: 5px;">
        <ul>
            <li><a href='#ConsignerTemplate0'>委托事项</a></li>
            <li><a href='#ConsignerTemplate1'>被委托事项</a></li>
        </ul>
        <div id='ConsignerTemplate0'>
            <asp:UpdatePanel runat="server" ID="consignUpdate" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="kpms-detailtabletotal" width="100%">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>事项名称&nbsp;<asp:TextBox ID="tbSeaFormType" MaxLength="20" class="kpms-textboxsearch" EnableTheming="false"
                                            runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click"><span>查询</span></asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click"><span>重置</span></asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="btnRecycle" OnClick="btnRecycle_Click" OnClientClick="return Recycle();"><span>回收</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="consignList" AllowPaging="true" PageSize="10" DataKeyNames="flagId"
                        runat="server" AutoGenerateColumns="false" Width="100%" OnRowEditing="consignList_RowEditing"
                        OnPageIndexChanging="consignList_PageIndexChanging" OnRowCancelingEdit="consignList_RowCancelingEdit"
                        OnRowDataBound="consignList_RowDataBound" OnRowUpdating="consignList_RowUpdating"
                        OnRowDeleting="consignList_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="FormName" HeaderText="事项名称" ReadOnly="true"></asp:BoundField>
                            <asp:BoundField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" ReadOnly="true"
                                DataField="ConsignUserName" HeaderText="被委托人"></asp:BoundField>
                            <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" HeaderText="委托方式">
                                <ItemTemplate>
                                    <%# GetAccessLevelName(Int16.Parse(Eval("AccessLevel").ToString())) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" HeaderText="委托开始时间">
                                <ItemTemplate>
                                    <%# DateTime.Parse(Eval("StartDate").ToString()).ToString("yyyy-MM-dd HH:mm") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbEditStartDate" EnableTheming="false" CssClass="kpms-textbox-wholedate"
                                        runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" HeaderText="委托结束时间">
                                <ItemTemplate>
                                    <%# DateTime.Parse(Eval("EndDate").ToString()).ToString("yyyy-MM-dd HH:mm")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbEditEndDate" EnableTheming="false" CssClass="kpms-textbox-wholedate"
                                        runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField ItemStyle-Width="120px" ReadOnly="true" ItemStyle-HorizontalAlign="Center"
                                DataField="CreateDate" HeaderText="创建时间"></asp:BoundField>
                            <asp:CommandField ShowEditButton="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="100px"
                                EditText="编辑" UpdateText="更新" CancelText="取消" />
                            <asp:TemplateField ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton OnClientClick="return window.confirm('您确定删除吗？')" CommandName="Delete"
                                        ImageUrl="~/Themes/Images/btn_dg_delete.gif" ID="btnDelete" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <hr />
                    <table class="tz-table" onclick="OpenDetail('consignMan')">
                        <!---标题--->
                        <tr>
                            <td class="tz-title">委托授权
                            </td>
                        </tr>
                    </table>
                    <table class="tz-table" style="width: 450px; margin: 0px;" id="consignMan">
                        <tr>
                            <td class="td-l">委托人
                            </td>
                            <td class="td-m">
                                <table cellpadding='0' cellspacing='0' width="240px">
                                    <tr>
                                        <td>
                                            <input type="hidden" id="hiUserID" runat="server" />
                                            <input type="text" runat="server" id="tbUserName" readonly="readonly" class="kpms-textbox"
                                                style="width: 100%; height: 16px;" />
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btUser" OnClientClick="return GetUser();"
                                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l" style="width: 100px">委托事项
                            </td>
                            <td class="td-m">
                                <asp:ListBox ID="lbFormType" runat="server" Rows="8" SelectionMode="Multiple" Width="240px"
                                    EnableTheming="false" Height="150px"></asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">被委托人
                            </td>
                            <td class="td-m">
                                <table cellpadding='0' cellspacing='0' width="240px">
                                    <tr>
                                        <td>
                                            <input type="hidden" id="hiConsignerID" runat="server" />
                                            <input type="text" runat="server" id="tbConsignUserName" readonly="readonly" class="kpms-textbox"
                                                style="width: 100%; height: 16px;" />
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnonsignUse" OnClientClick="return GetConsignUser();"
                                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">委托方式
                            </td>
                            <td class="td-m">
                                <asp:DropDownList ID="accessList" runat="server" Width="240px" EnableTheming="false">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">委托时间
                            </td>
                            <td class="td-m">从&nbsp;<asp:TextBox ID="tbStartDate" runat="server" EnableTheming="false" CssClass="kpms-textbox-wholedate"></asp:TextBox>
                                &nbsp;到&nbsp;<asp:TextBox ID="tbEndDate" runat="server" EnableTheming="false" CssClass="kpms-textbox-wholedate"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l"></td>
                            <td class="td-m">
                                <asp:Button ID="btnAddConsign" runat="server" Text="新建委托" OnClick="btnAddConsign_Click"
                                    OnClientClick="return window.confirm('您确定进行委托吗？')" />
                                <font color='red'>注意：委托到期后系统将自动回收</font>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id='ConsignerTemplate1'>
            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="kpms-detailtabletotal" width="100%">
                        <tr>
                            <td class="kpms-detailtoptitle">
                                <table class="kpms-detsearch">
                                    <tr>
                                        <td>事项名称&nbsp;
                                            <asp:TextBox ID="tbSelectFormType" MaxLength="20" class="kpms-textboxsearch" EnableTheming="false"
                                                runat="server" Width="180px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:LinkButton runat="server" ID="btnSelect" OnClick="btnSelect_Click"><span>查询</span></asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="btnResetSelect" OnClick="btnResetSelect_Click"><span>重置</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="consignedList" AllowPaging="true" PageSize="12" DataKeyNames="flagId"
                        runat="server" AutoGenerateColumns="false" Width="100%" OnPageIndexChanging="consignedList_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="FormName" HeaderText="事项名称" ReadOnly="true"></asp:BoundField>
                            <asp:BoundField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" ReadOnly="true"
                                DataField="UserName" HeaderText="委托人"></asp:BoundField>
                            <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" HeaderText="委托方式">
                                <ItemTemplate>
                                    <%# GetAccessLevelName(Int16.Parse(Eval("AccessLevel").ToString())) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" HeaderText="委托开始时间">
                                <ItemTemplate>
                                    <%# DateTime.Parse(Eval("StartDate").ToString()).ToString("yyyy-MM-dd HH:mm") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" HeaderText="委托结束时间">
                                <ItemTemplate>
                                    <%# DateTime.Parse(Eval("EndDate").ToString()).ToString("yyyy-MM-dd HH:mm")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField ItemStyle-Width="160px" ReadOnly="true" ItemStyle-HorizontalAlign="Center"
                                DataField="CreateDate" HeaderText="创建时间"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script language="javascript">
        $(document).ready(function () {
            // Tabs
            $('#templateTabs').tabs();
        });

        function Recycle() {
            return confirm("-您确定要回收所有委托事项吗？");
        }
        //选择人
        function GetConsignUser() {
            var param = new InputParamObject("s");
            var users = getUsers("none", param, "{'OrganizationId':'<%=KPMSUser.OrganizationId %>'}");
            if (null != users) {
                $("#<%=this.tbConsignUserName.ClientID %>").val(users.getAttrVal(0, "o", "name"));
                $("#<%=this.hiConsignerID.ClientID %>").val(users.getAttrVal(0, "o", "id"));
            }
            return false;
        }
        //选择委托人
        function GetUser() {
            var param = new InputParamObject("s");
            var users = getUsers("none", param, "");
            if (null != users) {
                $("#<%=this.tbUserName.ClientID %>").val(users.getAttrVal(0, "o", "name"));
                $("#<%=this.hiUserID.ClientID %>").val(users.getAttrVal(0, "o", "id"));
            }
            return false;
        }
        function setForm(formid, formvalue) {

            $("#<%=hiFormTypeId.ClientID %>").attr("value", formid);
            $("#<%=hiFormTypeName.ClientID %>").attr("value", formvalue);
        }
        function setConsign(operid, opervalue) {
            $("#<%=hiConsignUserId.ClientID %>").attr("value", operid);
        }
        function initCustomerPlugin() {

            $("#divExplain").hide();
            $("#<%=this.tbSeaFormType.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("/Portal/Sys/Handler/JsonSelectorHandler.ashx", {
                        term: request.term + ',FormType'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item)
                        setForm(ui.item.id, ui.item.value);
                    else
                        setForm("", "");
                }
            });
            $("#<%=this.tbConsignUserName.ClientID %>").autocomplete({
                source: function (reques, response) {
                    $.getJSON("/Portal/Sys/Handler/JsonSelectorHandler.ashx", {
                        term: request.term + ',user'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item)
                        setConsign(ui.item.id, ui.item.value);
                    else
                        setConsign("", "");
                }
            });

        }
    </script>
    <asp:HiddenField ID="hiFormTypeId" runat="server" />
    <asp:HiddenField ID="hiFormTypeName" runat="server" />
    <asp:HiddenField ID="hiConsignUserId" runat="server" />
</asp:Content>
