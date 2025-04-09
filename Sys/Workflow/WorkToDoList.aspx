<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkToDoList.aspx.cs" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="待办流程" Inherits="Zhongsoft.Portal.Sys.Workflow.WorkToDoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">主&nbsp;题</span> <span>
        <asp:TextBox MaxLength="20" ID="tbTitle" ToolTip="请输入主题" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false">
        </asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">分&nbsp;类</span>
        <span>
            <asp:DropDownList runat="server" ID="ddlFormType" AutoPostBack="true" OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged"
                class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">表单类型</span><span>
            <asp:DropDownList runat="server" ID="ddlType" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
    <div style="background-color: #EFF2F7;">
        <span class="filter-block"><span class="filter-block-lb">发起人</span> <span>
            <asp:TextBox ID="tbCreateUser" MaxLength="10" runat="server" class="kpms-textboxsearch"
                EnableTheming="false">
            </asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">发起部门</span> <span>
            <asp:DropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">委托类型</span><span>
            <asp:DropDownList runat="server" ID="ddlConsign" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">优先级</span><span>
            <asp:DropDownList runat="server" ID="ddlPriorityLevel" Width="60px" class="kpms-ddlsearch"
                EnableTheming="false">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">关&nbsp;注</span><span>
            <asp:DropDownList runat="server" ID="ddlAttention" Width="60px" class="kpms-ddlsearch"
                EnableTheming="false">
                <asp:ListItem Value="">全部</asp:ListItem>
                <asp:ListItem Value="true">已关注</asp:ListItem>
                <asp:ListItem Value="false">未关注</asp:ListItem>
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
    <zhongsoft:LightPowerGridView Width="100%" AllowPaging="true" PageSize="10" ID="ToDoList"
        runat="server" BindGridViewMethod="BindToDoList" AllowSorting="true" OnRowDataBound="ToDoList_DataBound">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <img src="../../Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# FlowState(Eval("ProcessStatus").ToString(),
                      Eval("ProcessInstanceId").ToString(), 
                     Eval("packageName").ToString(), 
                     Eval("processId").ToString(), 
                      Eval("ActivityInstanceId").ToString(),
                    Eval("ActivityName").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <img src="../../Themes/Images/readtype_t.gif" title="阅读信息" alt="阅读信息">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# ReadState(Eval("ReadDateTime").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <img src="../../Themes/Images/othertype_t.gif" title="处理人信息" alt="处理人信息">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# GetConsign(Eval("partId").ToString(), Eval("partName").ToString(), Eval("FormId").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="关注">
                <%--<HeaderTemplate>
                    <img src="../../Themes/Images/btn_notattention.png" flag="" title="关注情况" alt="关注情况">
                </HeaderTemplate>--%>
                <ItemTemplate>
                    <%# AttentionState(Eval("ProcessInstanceId").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="事项主题">
                <ItemTemplate>
                    <%#GetToDoItem(  
                                                Eval("FormID").ToString(),
                                                Eval( "ActivityInstanceId").ToString(),
                                                Eval("ProcessInstanceId").ToString(),
                                                Eval("ProcessInstanceName").ToString(),
                                                Eval("ActivityName").ToString(),
                                                Eval("ReadDateTime").ToString(),
                                                Eval("AlertTimes").ToString(),
                                                Eval("PartId").ToString(),
                                                Eval("PriorityLevel").ToString(),
                                                Eval("PartName").ToString(),
                                                Eval("PartOrganizationId").ToString(),
                                                Eval("PartOrganizationName").ToString())
                    %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProcessName" HeaderText="表单类型" HeaderStyle-Width="150px" />
            <asp:TemplateField HeaderText="接收时间" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <%#GetReceiveDate(DateTime.Parse(Eval("ReceiveDateTime").ToString()))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="上一步处理人" HeaderStyle-Width="180px">
                <ItemTemplate>
                    <span actid='<%#Eval("ActivityInstanceId") %>'></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发起人[所在部门/科室]" HeaderStyle-Width="180px">
                <ItemTemplate>
                    <div style='width: 180px' class='autoskip' title='<%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]'>
                        <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]</div>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:HiddenField ID="hiFormTypeId" runat="server" />
    <input type="hidden" runat="server" id="hiUserId" />
    <input type="hidden" runat="server" id="hiAttentionFlag" />
    <script language="javascript">
        function setId(proid) {
            $("#<%=hiFormTypeId.ClientID %>").attr("value", proid);
        }
        function initCustomerPlugin() {
            initReceiveDate();
            initAttention();

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
            getTaskSender();
        }
        try {
            window.parent.getTodo();
        } catch (e) { }
        function getTaskSender() {
            var $ids = "";
            $("#<%=ToDoList.ClientID %> span[actId]").each(function () {
                $ids += $(this).attr("actId") + "|";
            });
            $.post("WorkToDoList.aspx",
                 { asyfunc: "GetTaskSender", prcId: $ids },
                 function (res) {
                     if (res == "") { return; }
                     var $l = eval('(' + res + ')');
                     $("#<%=ToDoList.ClientID %> span[actId]").each(function () {
                         var $actid = $(this).attr("actId");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $un = $l[i][1];
                             var $on = $l[i][2];
                             if ($actid == $id) {
                                 if ($un == "")
                                     $(this).html("系统自动发送");
                                 else {
                                     var t = $un + "&nbsp;[" + $on + "]";
                                     $(this).html("<div style='width:150px' class='autoskip' title='" + t + "'>" + t + "</div>");
                                 }
                             }
                         }
                     });
                 }
                );
        }

        //执行查询按钮点击
        function btnQueryClick() {
            $("[content='searchResult']").click();
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

            $('[state="MyContent"]').each(function () {
                $(this).bind("click", function () {
                    var $type = $(this).attr("type");
                    if ("add" == $type) { //加载关注的      
                        $("#<%=hiAttentionFlag.ClientID %>").val("true");
                    }
                    else {//加载所有             
                        $("#<%=hiAttentionFlag.ClientID %>").val("false");
                    }
                    $("[id$='btnQuery']")[0].click();
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
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
