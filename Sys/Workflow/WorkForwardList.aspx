<%@ Page Language="C#" AutoEventWireup="true" Title="信息传阅" CodeBehind="WorkForwardList.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.Sys.Workflow.WorkForwardList" %>

<%@ Import Namespace="Zhongsoft.Portal.Sys.Workflow" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">主&nbsp;题</span> <span>
        <asp:TextBox ID="tbTitle" ToolTip="请输入标题" runat="server" MaxLength="20" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
        <span class="filter-block"><span class="filter-block-lb">发送人</span> <span>
        <asp:TextBox ID="tbCreateUser" MaxLength="10" runat="server" class="kpms-textboxsearch"
            EnableTheming="false">
        </asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">发送部门</span> <span>
        <asp:DropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false">
        </asp:DropDownList>
    </span></span>
       <span class="filter-block"><span class="filter-block-lb">状&nbsp;态</span><span>
        <asp:DropDownList ID="ddlStatus" runat="server" Width="60px" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Value="0">全部</asp:ListItem>
            <asp:ListItem Value="read">已读</asp:ListItem>
            <asp:ListItem Value="unread" Selected="True">未读</asp:ListItem>
        </asp:DropDownList>
    </span></span>
      <span class="filter-block"><span class="filter-block-lb">发送时间</span><span>
        <asp:DropDownList runat="server" ID="ddlReceiveDate" Width="60px" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Text="全部" Value="" Selected="True"></asp:ListItem>
            <asp:ListItem Text="近一天" Value="1"></asp:ListItem>
            <asp:ListItem Text="近三天" Value="3"></asp:ListItem>
            <asp:ListItem Text="近一周" Value="7"></asp:ListItem>
            <asp:ListItem Text="其他" Value="more"></asp:ListItem>
        </asp:DropDownList>
    </span></span>
    <input type="hidden" runat="server" id="hiUserId" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
<span class="filter-block"><span class="filter-block-lb">关&nbsp;注</span><span>
        <asp:DropDownList runat="server" ID="ddlAttention" Width="60px" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Value="true">已关注</asp:ListItem>
            <asp:ListItem Value="false">未关注</asp:ListItem>
        </asp:DropDownList>
    </span></span>
   <span class="filter-block"><span class="filter-block-lb">分&nbsp;类</span><span>
        <asp:DropDownList runat="server" ID="ddlFormType" AutoPostBack="true" class="kpms-ddlsearch"
            EnableTheming="false" OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged">
        </asp:DropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">表单类型</span><span>
        <asp:DropDownList runat="server" ID="ddlType" class="kpms-ddlsearch" EnableTheming="false">
        </asp:DropDownList>
    </span></span>
<span class="filter-block" style="display: none"><span>
        <div id="dateCompare">
            <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                ID="txtStartDate" compare="1" />
            至
            <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                ID="txtEndDate" compare="1" />
        </div>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="forwardList" runat="server" Width="100%" AllowPaging="true"
        PageSize="15" OnRowCommand="forwardList_RowCommand">
        <Columns>
            <asp:TemplateField HeaderStyle-Width="30px">
                <HeaderTemplate>
                    <img src="../../Themes/Images/readtype_t.gif" title="阅读信息" alt="阅读信息">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# ReadState(Eval("ReadDateTime").ToString())%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-Width="30px">
                <HeaderTemplate>
                    <img src="../../Themes/Images/btn_notattention.png" title="关注情况" alt="关注情况">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# AttentionState(Eval("ProcessInstanceId").ToString())%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="事项主题">
                <ItemTemplate>
                    <%#GetToDoItem(  
                                                Eval("FormID").ToString(),
                                                Eval( "ActivityInstanceId").ToString(),
                                                Eval("ProcessInstanceId").ToString(),
                                                Eval("ProcessInstanceName").ToString(),
                                                Eval("ReadDateTime").ToString(),
                                                Eval("ForwardId").ToString(),
                                                Eval("ReceiveUserId").ToString())
                    %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SendUserName" HeaderText="发送人" HeaderStyle-Width="120px" />
            <asp:BoundField DataField="ReceiveDateTime" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                HeaderStyle-Width="120px" HeaderText="发送时间" />
            <asp:BoundField DataField="ProcessName" HeaderText="表单类型" HeaderStyle-Width="150px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initCustomerPlugin() {
            $("#<%=this.tbCreateUser.ClientID %>").autocomplete({
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
            initReceiveDate();
            initAttention();
        }


        function initReceiveDate() {
            var ddlDate = $('select#<%=ddlReceiveDate.ClientID %> option:selected').val();
            if (ddlDate == "more") {
                $("#dateCompare").show();
            }
            else {
                $("#dateCompare").hide();
                $("#<%=txtStartDate.ClientID %>").val("");
                $("#<%=txtEndDate.ClientID %>").val("");
            }
        }
        $("#<%=ddlReceiveDate.ClientID %>").live("click", function () {
            initReceiveDate();
        })

        function initAttention() {
            $('[state="attetion"]').each(function () {
                $(this).bind("click", function () {
                    formAttention($(this).attr("prcInstId"), $(this).attr("type"), $(this))
                });
            });
        }
        function formAttention(prcInstId, type, img) {
            var userId = '<%=KPMSUser.Id %>';
            $.ajax({
                type: "POST",
                url: buildQueryUrl("Sys/Handler/WorkflowAttentionHandler.ashx", null),
                data: { prcInstId: prcInstId, userId: userId, type: type },
                async: false,
                success: function (result) {
                    var $type;
                    if (result.indexOf("失败") < 0) {
                        if ("add" == type) {
                            $type = "cancel";
                            img.attr("title", "已关注,点击取消关注");
                            img.attr("src", "../../Themes/Images/btn_attention.png");
                        }
                        else {
                            $type = "add";
                            img.attr("title", "未关注,点击加关注");
                            img.attr("src", "../../Themes/Images/btn_notattention.png");
                        }
                        //为按钮添加文本、click事件
                        img.unbind("click");
                        img.bind("click", function () {
                            formAttention(prcInstId, $type, img)
                        });
                    }
                    else {
                        alert(result);
                    }
                }
            });
        } 
    </script>
</asp:Content>
