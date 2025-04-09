<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishProcessList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishProcessList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

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
        </span></span><span class="filter-block"><span class="filter-block-lb">缓急程度</span><span>
            <asp:DropDownList runat="server" ID="ddlImportantLevel" Width="80px" class="kpms-ddlsearch"
                EnableTheming="false">
            </asp:DropDownList>
        </span></span>
        <span class="filter-block"><span class="filter-block-lb">阅读状态</span><span>
            <asp:DropDownList runat="server" ID="ddlIsRead" Width="60px" class="kpms-ddlsearch"
                EnableTheming="false">
                <asp:ListItem Value="">全部</asp:ListItem>
                <asp:ListItem Value="true">已读</asp:ListItem>
                <asp:ListItem Value="false">未读</asp:ListItem>
            </asp:DropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="advSearch" runat="server">
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
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <div id="templateTabs">
        <ul>
            <li><a href='#List0' id='a0'>
                <asp:Label ID="lb0" runat="server" Text="待办事项"></asp:Label></a></li>
            <li><a href='#List1' id='a1'>
                <asp:Label ID="lb1" runat="server" Text="出版进度"></asp:Label></a></li>
        </ul>
        <div id="List0">
            <asp:UpdatePanel ID="panelList0" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView Width="100%" AllowPaging="true" PageSize="15" ID="ToDoList"
                        UseDefaultDataSource="false" ShowPageSizeChange="true" runat="server" BindGridViewMethod="BindToDoList"
                        AllowSorting="true" OnRowDataBound="ToDoList_DataBound">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <img src="../../../Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
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
                                    <img src="../../../Themes/Images/readtype_t.gif" title="阅读信息" alt="阅读信息">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# ReadState(Eval("ReadDateTime").ToString())%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <img src="../../../Themes/Images/othertype_t.gif" title="委托信息" alt="委托信息">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# GetConsign(Eval("partId").ToString(), Eval("partName").ToString(), Eval("FormId").ToString())%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="关注">
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
                                                "3")
                                    %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="接收时间" HeaderStyle-Width="100px">
                                <ItemTemplate>
                                    <%#GetReceiveDate(DateTime.Parse(Eval("ReceiveDateTime").ToString()))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="发起人[所在部门/科室]" HeaderStyle-Width="180px">
                                <ItemTemplate>
                                    <div style='width: 180px' class='autoskip' title='<%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]'>
                                        <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]</div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上一步处理人" HeaderStyle-Width="180px">
                                <ItemTemplate>
                                    <span actid='<%#Eval("ActivityInstanceId") %>'></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="List1">
            <asp:UpdatePanel ID="panelList1" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView Width="100%" AllowPaging="true" PageSize="15" ID="gvList"
                        UseDefaultDataSource="false" runat="server" BindGridViewMethod="BindList" AllowSorting="true"
                        ShowPageSizeChange="true">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <img src="../../../Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
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
                                                "1")
                                    %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="当前步骤" HeaderStyle-Width="180px">
                                <ItemTemplate>
                                    <%#Eval("ActivityName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="接收时间" HeaderStyle-Width="100px">
                                <ItemTemplate>
                                    <%#GetReceiveDate(DateTime.Parse(Eval("ReceiveDateTime").ToString()))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="当前处理人" HeaderStyle-Width="180px">
                                <ItemTemplate>
                                    <%#Eval("PARTNAME") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" runat="server" id="hiIndex" value="0" />
    <asp:HiddenField ID="hiFormTypeId" runat="server" />
    <input type="hidden" runat="server" id="hiUserId" />
    <input type="hidden" runat="server" id="hiAttentionFlag" />
    <input type="hidden" runat="server" id="hiImportantLevel" value="平件" />
    <input type="hidden" runat="server" id="hiIsSendForm" value="0" />
    <input type="hidden" runat="server" id="hiFormSendIndex" value="0" />
    <script type="text/javascript">
        function setId(proid) {
            $("#<%=hiFormTypeId.ClientID %>").attr("value", proid);
        }
        function initCustomerPlugin() {
            $('#templateTabs li a').each(function (i) {
                var index = $("#<%=hiIndex.ClientID %>").val();
                if (i == index) {
                    $('#templateTabs').tabs({ active: i });
                }
                $(this).click(function () {
                    $('#templateTabs').tabs({ active: i });
                    $("#<%=hiIndex.ClientID %>").val(i);
                    return true;
                });
            });

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
            $.post("/portal/Sys/Workflow/WorkToDoList.aspx",
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
            $("#<%=hiIsSendForm.ClientID %>").val("1");
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
