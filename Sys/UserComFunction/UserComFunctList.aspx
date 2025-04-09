<%@ Page Title="自定义流程" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="UserComFunctList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.UserComFunctList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">类&nbsp;别</span> <span>
        <asp:TextBox runat="server" ID="tbFormName" search="1" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <table>
        <tr>
            <td>
               <!-- <asp:LinkButton runat="server" ID="btnSearchForm" OnClick="btnSearchForm_Click">
                                           <span>查询</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnResetForm" OnClick="btnResetForm_Click">
                                        <span>重置</span></asp:LinkButton>-->
                <asp:LinkButton runat="server" ID="btnNew" CssClass="btn-query" EnableTheming="false" OnClientClick='return chooseForm();'><span>定制</span></asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <div id="templateTabs">
        <ul style="display: none">
            <li><a href='#form' id='aform'>常办工作</a></li>
            <li><a href='#list' id='alist'>常用台账</a></li>
        </ul>
        <div id="form">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView runat="server" ID="gvForm" AllowPaging="true" DataKeyNames="ComFunctionId"
                        AutoGenerateColumns="False" OnRowCommand="gvForm_RowCommand" BindGridViewMethod="BindGvForm">
                        <Columns>
                            <asp:BoundField DataField="FormName" HeaderText="类别" />
                            <asp:BoundField DataField="SortIndex" HeaderText="排序" />
                            <asp:TemplateField HeaderText="编辑">
                                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="EditData" EnableTheming="false">
						<img   onclick='return DetailOfList("<%#Eval("ComFunctionId")%>",3,1);'  src="../../Themes/Images/btn_dg_edit.gif" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除">
                                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%#Eval("ComFunctionId") %>'
                                        CommandName="DeleteData" EnableTheming="false">
						 <img    onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="list" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <div class="tz-toolbar" style="display: none; border-bottom: none!important;">
                        <table>
                            <tr>
                                <td>
                                    台账名称
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="tbName" search="2"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" Style="display: none" class="kpms-btn" ID="btnSearch"
                                        OnClick="btnSearch_Click">
                        <img  src="../../Themes/Images/btn/btn_search.gif"/><span>查找</span></asp:LinkButton>
                                    <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click"
                                        Style="display: none">
                     重置</asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="btnAdd" class="searchbtn" OnClick="btnAdd_Click"
                                        Style="display: none" OnClientClick='return DetailOfList(null,2,0);'>定制</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="true" DataKeyNames="ComFunctionId"
                        AutoGenerateColumns="False" OnRowCommand="gvList_RowCommand" BindGridViewMethod="BindGvList">
                        <Columns>
                            <asp:BoundField DataField="PageName" HeaderText="台账名称" />
                            <asp:BoundField DataField="SortIndex" HeaderText="排序" />
                            <asp:TemplateField HeaderText="编辑">
                                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="EditData" AccessLevel="3">
						<img   onclick='return DetailOfList("<%#Eval("ComFunctionId")%>",3,0);'  src="../../Themes/Images/btn_dg_edit.gif" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除">
                                <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%#Eval("ComFunctionId") %>'
                                        AccessLevel="4" CommandName="DeleteData">
						 <img    onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" runat="server" id="hiXML" />
    <asp:Button ID="btnAddForm" runat="server" OnClick="btnNew_Click" Visible="false" />
    <script type="text/javascript">
        function InitCustomerPlugin() {
            $('#templateTabs').tabs();
            $("#search").hide();
            var userId = "<%=KPMSUser.UserId %>";
            selectorHandler("<%=this.tbFormName.ClientID %>", ',formtype', 1);
            selectorHandler("<%=this.tbName.ClientID %>", '|' + userId + ',userlist', 1);

            $('input[search=1]').each(function () {
                $(this).blur(function () {
                    editCallBack();
                })
            })
            //            $('input[search=2]').each(function () {
            //                $(this).blur(function () {
            //                    <%=ClientScript.GetPostBackEventReference(this.btnSearch,"HiGet") %>;
            //                })
            //            })
        }

        function DetailOfList(bizId, actionType, type) {
            var bizIdCondition = actionType == "2" ? "" : "&bizId=" + bizId;
            var url = "";
            if (actionType == "2") {
                url = buildQueryUrl("/Sys/UserComFunction/UserComFunctEditor.aspx", { actionType: actionType, FunctType: type })
            } else {
                url = buildQueryUrl("/Sys/UserComFunction/UserComFunctEditor.aspx", { actionType: actionType, FunctType: type, bizId: bizId })
            }
            showDivDialog(url, null, 350, 200, editCallBack);
            return false;
        }

        function editCallBack() {
            <%=ClientScript.GetPostBackEventReference(this.btnSearchForm,"HiGet") %>;
        }

        function chooseForm() {
            var param = new InputParamObject("m");
            var re = getUserForm("<%=hiXML.ClientID %>", param, "", chooseFormCallBack);
            return false;
        }

        function chooseFormCallBack() {//btnAddForm
            <%=ClientScript.GetPostBackEventReference(this.btnAddForm,"") %>;
        }
        parent.returnValue = "Saved";
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
