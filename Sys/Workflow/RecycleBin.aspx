<%@ Page  Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="RecycleBin.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.RecycleBin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
        <span class="filter-block"><span class="filter-block-lb">流程状态</span> <span>
            <asp:DropDownList ID="ddlPrcStatus" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                    <asp:ListItem Value="2">流转中</asp:ListItem>
                    <asp:ListItem Value="7">已完成</asp:ListItem>
                </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">
            分&nbsp;类</span> <span>
                <asp:DropDownList runat="server" ID="ddlFormType" AutoPostBack="true" class="kpms-ddlsearch" EnableTheming="false"
                    OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged">
                </asp:DropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">
                表单类型</span><span>
                    <asp:DropDownList runat="server" ID="ddlType" class="kpms-ddlsearch" EnableTheming="false">
                </asp:DropDownList>
                </span></span><span class="filter-block"><span class="filter-block-lb">
            发起人</span> <span>
                <asp:TextBox ID="tbPrcCreator" MaxLength="10" class="kpms-textboxsearch" EnableTheming="false"
                    runat="server"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">
            主&nbsp;题</span> <span>
                <asp:TextBox ID="tbPrcName" MaxLength="20" class="kpms-textboxsearch" EnableTheming="false"
                    runat="server"></asp:TextBox>
            </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <script src="/Portal/UI/Script/jquery.tools.min.js" type="text/javascript"></script>
    <zhongsoft:LightPowerGridView ID="PrcDoneList" runat="server" AllowPaging="true"
        PageSize="15" AutoGenerateColumns="false" OnRowCommand="PrcDoneList_RowCommand"
        DataKeyNames="ProcessInstanceId" OnRowDataBound="PrcDoneList_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderStyle-Width="20px">
                <HeaderTemplate>
                    <img src="../../Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# FlowState(Eval("ProcessStatus").ToString(),
                      Eval("ProcessInstanceId").ToString(), 
                     Eval("packageName").ToString(), 
                     Eval("processId").ToString(), 
                      string.Empty, string.Empty)%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="事项主题">
                <ItemTemplate>
                    <a href="javascript:void(0)" isshow="0" prc="<%#Eval("ProcessInstanceId") %>">
                        <%#Eval("ProcessInstanceName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="最后处理时间" HeaderStyle-Width="120px">
                <ItemTemplate>
                    <%# GetStartDate(Convert.ToDateTime(Eval("LastRunDate")))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发起人[发起时间]" HeaderStyle-Width="350px">
                <ItemTemplate>
                    <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]&nbsp;<%# GetStartDate(DateTime.Parse(Eval("StartDateTime").ToString()))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="还原" HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ProcessInstanceId")%>' CommandName="DeleteData"
                        ID="btnDelete" EnableTheming="false"><img title="还原" onclick='return confirm("确定还原?");' src="../../Themes/Images/btn_back.gif" /></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function initCustomerPlugin() {
            $("#<%=this.tbPrcCreator.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',user'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=hiUserId.ClientID %>").attr("value", ui.item.id);
                    }
                }
            });
            $("#<%=PrcDoneList.ClientID %> a[prc]").click(function () {
                var $prc = $(this).attr("prc");
                $("#<%=PrcDoneList.ClientID %> tr[id='" + $prc + "']").toggle();
                if ($(this).attr("isShow") == "1") return;
                $(this).attr("isShow", "1");
                var $prcRow = $(this).parents('tr')[0];
                $.post("WorkProcessDoneList.aspx",
                    { asyfunc: "ShowWorkItems", prcId: $prc },
                    function (res) {
                        var $item = $("<tr id='" + $prc + "'><td></td><td colspan='3'><table cellspacing='0' rules='all' border='1' style='width:100%;border-collapse:collapse;'><tr class='kpms-detbodyheader' style='font-weight:bold;'><th scope='col' style='width:25px'><img src='../../Themes/Images/othertype_t.gif' title='委托信息' alt='委托信息'></th><th scope='col' style='width:200px;'>已办理步骤</th><th scope='col' style='width:380px;'>已发给</th><th scope='col' style='width:100px;'>完成时间</th></tr>" + res + "</table></td></tr>");
                        $($item).insertAfter($prcRow);
                        $("#<%=PrcDoneList.ClientID %> span").tooltip({ position: 'bottom center' });
                    }
                );
            });
        }     
    </script>
    <input type="hidden" runat="server" id="hiUserId" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
