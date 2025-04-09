<%@ Page Title="已办流程" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="WorkDoneListByPublish.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.WorkDoneListByPublish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">主&nbsp;题</span> <span>
        <asp:TextBox ID="tbPrcName" MaxLength="20" class="kpms-textboxsearch" EnableTheming="false"
            runat="server">
        </asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">分&nbsp;类</span><span>
        <asp:DropDownList runat="server" ID="ddlFormType" AutoPostBack="true" class="kpms-ddlsearch"
            EnableTheming="false" OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged">
        </asp:DropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">表单类型</span><span>
        <asp:DropDownList runat="server" ID="ddlType" class="kpms-ddlsearch" EnableTheming="false">
        </asp:DropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
    <div style="background-color: #EFF2F7;">
        <span class="filter-block"><span class="filter-block-lb">发起人</span> <span>
            <asp:TextBox ID="tbPrcCreator" MaxLength="10" class="kpms-textboxsearch" EnableTheming="false"
                runat="server">
            </asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">发起部门</span> <span>
            <asp:DropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">流程状态</span><span>
            <asp:DropDownList ID="ddlPrcStatus" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                <asp:ListItem Value="">全部</asp:ListItem>
                <asp:ListItem Value="2">流转中</asp:ListItem>
                <asp:ListItem Value="7">已完成</asp:ListItem>
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">关&nbsp;注</span><span>
            <asp:DropDownList runat="server" ID="ddlAttention" Width="60px" class="kpms-ddlsearch"
                EnableTheming="false">
                <asp:ListItem Value="">全部</asp:ListItem>
                <asp:ListItem Value="true">已关注</asp:ListItem>
                <asp:ListItem Value="false">未关注</asp:ListItem>
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">委托类型</span><span>
            <asp:DropDownList runat="server" ID="ddlConsign" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">接收时间</span><span>
            <asp:DropDownList runat="server" ID="ddlReceiveDate" Width="60px" class="kpms-ddlsearch"
                EnableTheming="false">
                <asp:ListItem Text="全部" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="近一天" Value="1"></asp:ListItem>
                <asp:ListItem Text="近三天" Value="3"></asp:ListItem>
                <asp:ListItem Text="近一周" Value="7"></asp:ListItem>
                <asp:ListItem Text="其他" Value="more"></asp:ListItem>
            </asp:DropDownList>
        </span></span><span class="filter-block" style="display: none"><span>
            <div id="dateCompare">
                <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    ID="txtStartDate" compare="1" />
                至
                <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    ID="txtEndDate" compare="1" />
            </div>
        </span></span>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <script src="<%=WebAppPath%>/UI/Script/jquery.tools.min.js" type="text/javascript"></script>
    <zhongsoft:LightPowerGridView ID="PrcDoneList" runat="server" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" OnRowCommand="PrcDoneList_RowCommand"
        OnRowDataBound="PrcDoneList_DataBound">
        <Columns>
            <asp:TemplateField HeaderStyle-Width="20px">
                <HeaderTemplate>
                    <img src="../../../Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# FlowState(Eval("ProcessStatus").ToString(),
                      Eval("ProcessInstanceId").ToString(), 
                     Eval("packageName").ToString(), 
                     Eval("processId").ToString(), 
                      string.Empty, string.Empty)%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <img src="../../../Themes/Images/btn_notattention.png" title="关注情况" alt="关注情况">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# AttentionState(Eval("ProcessInstanceId").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="缓急程度">
                <ItemTemplate>
                    <%#Eval("ImportantLevel")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="事项主题">
                <ItemTemplate>
                    <div style="width: 500px;" class="autoskip">
                        <a href="javascript:void(0)" isshow="0" prc="<%#Eval("ProcessInstanceId") %>">
                            <%# Server.HtmlEncode(Convert.ToString(Eval("ProcessInstanceName")))%></a></div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="最后处理时间" HeaderStyle-Width="120px">
                <ItemTemplate>
                    <%# GetStartDate(Convert.ToDateTime(Eval("PROLASTRUNDATE")))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发起人[所在部门/科室]发起时间" HeaderStyle-Width="350px">
                <ItemTemplate>
                    <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]&nbsp;<%# GetStartDate(DateTime.Parse(Eval("StartDateTime").ToString()))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="回收" HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ProcessInstanceId")%>' CommandName="Recycle"
                        ID="btnRecycle" EnableTheming="false"><img title="放入回收站" onclick='return confirm("确定放入回收站?");' src="../../../Themes/Images/btn_cancel.gif" /></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <script>
        function initCustomerPlugin() {
            initReceiveDate();
            initAttention();

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
                $.post("WorkDoneListByPublish.aspx",
                    { asyfunc: "ShowWorkItems", prcId: $prc },
                    function (res) {
                        var $item = $("<tr id='" + $prc + "'><td></td><td colspan='3'><table cellspacing='0' rules='all' border='1' style='width:100%;border-collapse:collapse;'><tr class='kpms-detbodyheader' style='font-weight:bold;'><th scope='col' style='width:25px'><img src='../../../Themes/Images/othertype_t.gif' title='委托信息' alt='委托信息'></th><th scope='col' style='width:200px;'>已办理步骤</th><th scope='col' style='width:380px;'>已发给</th><th scope='col' style='width:100px;'>完成时间</th></tr>" + res + "</table></td></tr>");
                        $($item).insertAfter($prcRow);
                        $("#<%=PrcDoneList.ClientID %> span").tooltip({ position: 'bottom center' });
                        //展开步骤详细后，改变底色 tianhl 20141103
                        $("#<%=PrcDoneList.ClientID %> tr[id='" + $prc + "']").css('background-color', '#CCFFCC');
                    }
                );
            });
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
                            img.attr("src", "../../../Themes/Images/btn_attention.png");
                        }
                        else {
                            $type = "add";
                            img.attr("title", "未关注,点击加关注");
                            img.attr("src", "../../../Themes/Images/btn_notattention.png");
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
    <input type="hidden" runat="server" id="hiUserId" />
</asp:Content>
