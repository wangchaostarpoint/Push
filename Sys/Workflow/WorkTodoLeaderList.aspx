<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkTodoLeaderList.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.WorkTodoLeaderList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的待办</title>
      <meta http-equiv="refresh" content="120">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <style type="text/css">
        #templateTabs ul li {
            border: none
        }

            #templateTabs ul li.ui-tabs-active a {
                color: #dd0208;
                background-color: #fff;
                border-bottom: #dd0208 2px solid;
                background: url(../../Themes/custom/images/tabsabg.png) center bottom no-repeat #fff
            }

        #templateTabs .ui-widget-header {
            border-bottom: none;
        }

        #templateTabs2 ul li {
            border: none
        }

            #templateTabs2 ul li.ui-tabs-active a {
                color: #dd0208;
                background-color: #fff;
                border-bottom: #dd0208 2px solid;
                background: url(../../Themes/custom/images/tabsabg.png) center bottom no-repeat #fff
            }

        #templateTabs2 .ui-widget-header {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <asp:LinkButton runat="server" ID="btnOrg" Style="display: none;" OnClick="btnOrg_Click"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="templateTabs">
            <ul id="tabmenu">
                <li class="toDoList" style="display: none"><a href='#toDoList' id='atoDoList'>我的待办()</a></li>
               <%-- <li class="myFocus"  ><a href='#myFocus' id='amyFocus'>我的关注()</a></li>--%>
                <li class="myNotice" style="display: none"><a href='#myNotice' id='amyNotice'>工作提醒()</a></li>
                <%-- <li><a onclick="opengztx('BBF8E5A1-1AD2-4842-8FDC-A6D2FD2578D6','工作提醒','<%=WebAppPath %>/Custom/List/Dashboard.aspx?secid=BBF8E5A1-1AD2-4842-8FDC-A6D2FD2578D6')">
                    <img id="newsImg" alt="" src="../../Themes/Images/newstag.gif" height="24px;" style="text-align: center; vertical-align: middle" /></a></li>--%>
            </ul>
            <!--**************************************我的代办*****************************************-->
            <div id="toDoList" style="display: none">
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset class="rtm_fds_bd" style="display: block; background: #fff; border: #d5dfe5 1px solid;">
                            <div style="background-color: #EFF2F7; height: 35px">
                                <div style="padding-left: 5px; padding-top: 5px;">
                                    <span class="filter-block">
                                        <span class="filter-block-lb">主&nbsp;题</span>
                                        <span>
                                            <asp:TextBox MaxLength="20" ID="tbTitle" ToolTip="请输入主题" runat="server" CssClass="kpms-textboxsearch"
                                                EnableTheming="false">
                                            </asp:TextBox>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">分&nbsp;类</span>
                                        <span>
                                            <asp:DropDownList runat="server" ID="ddlFormType" AutoPostBack="true" OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged"
                                                class="kpms-ddlsearch" EnableTheming="false">
                                            </asp:DropDownList>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">表单类型</span>
                                        <span>
                                            <asp:DropDownList runat="server" ID="ddlType" class="kpms-ddlsearch" EnableTheming="false">
                                            </asp:DropDownList>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">发起人</span>
                                        <span>
                                            <asp:TextBox ID="tbCreateUser" MaxLength="10" runat="server" class="kpms-textboxsearch"
                                                EnableTheming="false">
                                            </asp:TextBox>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">发起部门</span>
                                        <span>
                                            <asp:DropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false">
                                            </asp:DropDownList>
                                        </span>
                                    </span>
                                    <div style="float: right; padding-right: 5px;">
                                        <asp:LinkButton runat="server" class="searchbtn" ID="btnQuery" OnClick="btnQuery_Click">
                                         <span>查找</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                                         <span>重置</span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <div style="overflow: hidden; padding-top: 3px">
                            <zhongsoft:LightPowerGridView Width="100%" AllowPaging="true" PageSize="5" ID="ToDoList" UseDefaultDataSource="true"  
                                runat="server" BindGridViewMethod="BindToDoList" AllowSorting="true" OnRowDataBound="ToDoList_DataBound">
                                <Columns>
                                    <asp:TemplateField  HeaderStyle-Width="20px">
                                        <HeaderTemplate>
                                          <%--  <img src="../../Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">--%>流转过程
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
                                    <asp:TemplateField Visible="false">
                                        <HeaderTemplate>
                                            <img src="../../Themes/Images/othertype_t.gif" title="处理人信息" alt="处理人信息">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%# GetConsign(Eval("partId").ToString(), Eval("partName").ToString(), Eval("FormId").ToString())%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="关注"> 
                                          <HeaderTemplate>
                                           关注
                                        </HeaderTemplate>
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
                                                Eval("PartOrganizationName").ToString(),
                                               Convert.ToBoolean(Eval("IsWarn")))
                                            %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ProcessName" HeaderText="表单类型" HeaderStyle-Width="150px" />
                                    <asp:TemplateField HeaderText="接收时间" HeaderStyle-Width="100px">
                                        <ItemTemplate>
                                            <%#GetReceiveDate(DateTime.Parse(Eval("ReceiveDateTime").ToString()))%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="发起人[所在部门/科室]" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <div style='width: 180px' class='autoskip' title='<%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]'>
                                                <%#Eval("CreatorName")%>&nbsp;[<%#GetDeptName(Eval("CreatorOrganizationID").ToString(), Eval("CreatorOrganizationName").ToString(), Eval("packageName").ToString())%>]
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="上一步处理人" HeaderStyle-Width="180px">
                                        <ItemTemplate>
                                            <span actid='<%#Eval("ActivityInstanceId") %>'></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </div>
                        <asp:HiddenField ID="hiFormTypeId" runat="server" />
                        <input type="hidden" runat="server" id="DB_hiUserId" />
                        <input type="hidden" runat="server" id="hiAttentionFlag" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!--**************************************我的关注*****************************************-->
            <div id="myFocus" style="display: none">
                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset class="rtm_fds_bd" style="display: block; background: #fff; border: #d5dfe5 1px solid;">
                            <div style="background-color: #EFF2F7; height: 35px">
                                <div style="padding-left: 5px; padding-top: 5px;">
                                    <span class="filter-block">
                                        <span class="filter-block-lb">标&nbsp;题</span>
                                        <span>
                                            <zhongsoft:LightTextBox runat="server" ID="GZ_tbTitle" CssClass="kpms-textboxsearch"
                                                EnableTheming="false">
                                            </zhongsoft:LightTextBox>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">发起人</span>
                                        <span>
                                            <zhongsoft:LightTextBox runat="server" ID="tbUser" CssClass="kpms-textboxsearch"
                                                EnableTheming="false">
                                            </zhongsoft:LightTextBox>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">关注日期</span>
                                        <span>
                                            <zhongsoft:XHtmlInputText ID="txtStart" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                                                compare="1">
                                            </zhongsoft:XHtmlInputText>
                                            <span>至</span>
                                            <zhongsoft:XHtmlInputText ID="txtEnd" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                                                compare="1">
                                            </zhongsoft:XHtmlInputText>
                                        </span>

                                    </span>
                                    <div style="float: right; padding-right: 5px;">
                                        <asp:LinkButton runat="server" class="btn-link" ID="GZ_btnQuery" OnClick="GZ_btnQuery_Click">
                                        <span>查找</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" class="btn-link" ID="GZ_btnReset" OnClick="GZ_btnReset_Click">
                                        <span>重置</span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <div style="overflow: hidden; padding-top: 3px">
                            <zhongsoft:LightPowerGridView runat="server" ID="lpgMyAttention" PageSize="5" DataKeyNames="ProcessInstanceId"
                                BindGridViewMethod="BindGrid" UseDefaultDataSource="true" AllowPaging="true"
                                OnRowCommand="lpgMyAttention_RowCommand">
                                <Columns>
                                    <zhongsoft:LightTemplateField>
                                        <HeaderTemplate>
                                            序号
                                        </HeaderTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%#Container.DisplayIndex+1 %>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="流程标题">
                                        <ItemTemplate>
                                            <%#  Eval("WORKFLOWURL").ToString()%>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="发起人" ItemStyle-Width="100px">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField DataField="AttentionDate" HeaderText="关注日期" DataFormatString="{0:yyyy-MM-dd }"
                                        ItemStyle-Width="70px" ItemStyle-Wrap="false">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightButtonField HeaderText="取消关注" CommandName="DeleteData" DeleteText="是否取消关注"
                                        DataParamFields="ProcessInstanceId">
                                    </zhongsoft:LightButtonField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <!--**************************************工作提醒*****************************************-->
            <div id="myNotice">
                <asp:UpdatePanel ID="UpdatePanelNotice" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset class="rtm_fds_bd" id="Fieldset11" style="display: block; background: #fff; border: #d5dfe5 1px solid;">
                            <div style="background-color: #EFF2F7; height: 35px">
                                <div>
                                    <asp:LinkButton ID="lkbRead" runat="server" EnableTheming="false" CssClass="btn-query"
                                        OnClick="lkbRead_Click"><span><IMG  width="16" height="16" id='01_img' alt='批量已读'  src="<%=WebAppPath %>/Themes/Images/readed.png">批量已读</span></asp:LinkButton>
                                    <%--<asp:LinkButton ID="btnTest" runat="server" EnableTheming="false" CssClass="btn-query"
                                        OnClick="btnTest_Click"><span><IMG  width="16" height="16" id='01_img' alt='测试发送消息'  src="<%=WebAppPath %>/Themes/Images/readed.png">测试发送消息</span></asp:LinkButton>--%>
                                </div>
                                <div style="padding-left: 5px; padding-top: 5px;">
                                    <span class="filter-block"><span class="filter-block-lb">主&nbsp;题</span> <span>
                                        <asp:TextBox ID="txtNoticeTitle" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                                            EnableTheming="false" Width="120px"></asp:TextBox>
                                    </span></span>
                                    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span>
                                        <span>
                                            <asp:TextBox ID="tbNoticeProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                                                EnableTheming="false" Width="120px"></asp:TextBox>
                                        </span></span>
                                    <span class="filter-block"><span class="filter-block-lb">阅读状态</span> <span>
                                        <zhongsoft:LightDropDownList ID="ddlReadState" runat="server" class="kpms-ddlsearch"
                                            EnableTheming="false" Width="60px">
                                        </zhongsoft:LightDropDownList>
                                    </span></span>
                                    <span class="filter-block"><span class="filter-block-lb">类&nbsp;别</span>
                                        <span>
                                            <zhongsoft:LightDropDownList ID="ddlAlertType" runat="server" class="kpms-ddlsearch"
                                                EnableTheming="false" Width="60px">
                                            </zhongsoft:LightDropDownList>
                                        </span></span>
                                    <div style="float: right; padding-right: 5px;">
                                        <asp:LinkButton runat="server" class="searchbtn" ID="lbNotice" OnClick="lbNotice_Click">
                                        <span>查找</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" class="searchbtn" ID="ltbNoticeReset" OnClick="ltbNoticeReset_Click">
                                        <span>重置</span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <div style="overflow: hidden; padding-top: 3px">
                            <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvPortalAlert" AutoGenerateColumns="false"
                                DataKeyNames="AlertID,RelationUrl" ShowExport="true" HideFieldOnExport="全部" runat="server"
                                BindGridViewMethod="BindDataNoticeGrid" ShowPageSizeChange="true" OnRowCommand="gvPortalAlert_RowCommand"
                                OnRowDataBound="gvPortalAlert_RowDataBound" AllowSorting="true">
                                <Columns>
                                    <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkGridViewRow">
                                    </zhongsoft:LightCheckField>
                                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="主题" ItemStyle-Width="200px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lkbTitle" runat="server" CommandName="readAlert" CommandArgument='<%#Eval("AlertID") %>'
                                                OnClientClick='<%# String.Format("return ViewItem(\"{0}\")", Eval("AlertID")) %>'
                                                ToolTip='<%#Eval("Title") %>' Text='<%#Eval("Title").ToString().Length > 25 ? Eval("Title").ToString().Substring(0, 24) + "..." : Eval("Title")%>'
                                                EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField HeaderText="内容" DataField="Content" SortExpression="Content"
                                        ShowToolTip="true" Width="200px" MaxLength="10">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="Title">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="Title"
                                        ShowToolTip="true" Width="250px">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="类别" DataField="AlertType" SortExpression="AlertType"
                                        Width="60px">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="级别" DataField="AlertLevel" SortExpression="AlertLevel"
                                        Width="60px">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="发送人" DataField="SendUserName" SortExpression="SendUserName"
                                        Width="60px">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="发送时间" DataField="AlertTime" SortExpression="AlertTime"
                                        DataFormatString="{0:yyyy-MM-dd}" Width="80px">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="接收时间" DataField="CreateDate" SortExpression="CreateDate"
                                        DataFormatString="{0:yyyy-MM-dd}" Width="80px">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="阅读时间" Width="80px">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="阅读状态">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightTemplateField HeaderText="相关链接">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lkbUrl" runat="server" CommandName="readAlert" CommandArgument='<%#Eval("AlertID") %>'
                                                OnClientClick='<%# String.Format("return openUrl(\"{0}\")", Eval("RelationUrl")) %>'
                                                ToolTip='<%#Eval("RelationUrl") %>' Text='打开' EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                                    </zhongsoft:LightTemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <!--**************************************传阅*****************************************-->
        <div id="templateTabs2">
            <ul id="tabmenu2" style="background-color: white">
                <li class="Pass" style="display: none"><a href='#Pass' id='aPass'>传阅()</a></li>
            </ul>
            <div id="Pass" style="display: none">
                <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block; background: #fff; border: #d5dfe5 1px solid;">
                            <div style="background-color: #EFF2F7; height: 35px">
                                <div style="padding-left: 5px; padding-top: 5px;">
                                    <span class="filter-block">
                                        <span class="filter-block-lb">主&nbsp;题</span>
                                        <span>
                                            <asp:TextBox ID="CY_tbTitle" ToolTip="请输入标题" runat="server" MaxLength="20" class="kpms-textboxsearch"
                                                EnableTheming="false"></asp:TextBox>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">发送人</span>
                                        <span>
                                            <asp:TextBox ID="CY_tbUser" MaxLength="10" runat="server" class="kpms-textboxsearch"
                                                EnableTheming="false">
                                            </asp:TextBox>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">发送部门</span>
                                        <span>
                                            <asp:DropDownList runat="server" ID="CY_ddlDept" class="kpms-ddlsearch" EnableTheming="false">
                                            </asp:DropDownList>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">状&nbsp;态</span>
                                        <span>
                                            <asp:DropDownList ID="CY_ddlStatus" runat="server" Width="60px" class="kpms-ddlsearch"
                                                EnableTheming="false">
                                                <asp:ListItem Value="0">全部</asp:ListItem>
                                                <asp:ListItem Value="read">已读</asp:ListItem>
                                                <asp:ListItem Value="unread" Selected="True">未读</asp:ListItem>
                                            </asp:DropDownList>
                                        </span>
                                    </span>
                                    <span class="filter-block">
                                        <span class="filter-block-lb">发送时间</span>
                                        <span>
                                            <asp:DropDownList runat="server" ID="CY_ddlReceiveDate" Width="60px" class="kpms-ddlsearch"
                                                EnableTheming="false">
                                                <asp:ListItem Text="全部" Value="" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="近一天" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="近三天" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="近一周" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="其他" Value="more"></asp:ListItem>
                                            </asp:DropDownList>
                                        </span>
                                    </span>
                                    <input type="hidden" runat="server" id="CY_hiUserId" />
                                    <div style="float: right; padding-right: 5px;">
                                        <asp:LinkButton runat="server" class="searchbtn" ID="CY_btnQuery" OnClick="CY_btnQuery_Click">
                                        <span>查找</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" class="searchbtn" ID="CY_btnReset" OnClick="CY_btnReset_Click">
                                        <span>重置</span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <div style="overflow: hidden; padding-top: 3px">
                            <zhongsoft:LightPowerGridView ID="forwardList" runat="server" Width="100%" AllowPaging="true"
                                PageSize="5" OnRowCommand="forwardList_RowCommand" BindGridViewMethod="BindDataGrid">
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
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <script type="text/javascript">
            $gridCheckedClientID = "<%=this.gvPortalAlert.CheckedClientID %>";
            function initCustomerPlugin() {
                checkMaxLength();
                checkRegex();
                $("#tabmenu").children("li").each(function () {
                    $(this).show();

                });
                $('#templateTabs').tabs();

                $("#tabmenu2").children("li").each(function () {
                    $(this).show();
                });
                $('#templateTabs2').tabs();

                initAttention();
                GetAllData();
               
            }
            //刷新左侧代办数量
                try {
            window.parent.getTodo();
        } catch (e) { }
            //取出页面数据
            function GetAllData() {
                var $ids = "";
                $("#<%=ToDoList.ClientID %> span[actId]").each(function () {
                    $ids += $(this).attr("actId") + "|";
                });
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/Sys/Handler/WorkTodoLeaderHandler.ashx", null),
                    data: { UserId: '<%=KPMSUser.UserId%>', prcId: $ids },
                    async: false,
                    cache: false,
                    success: function (res) {
                        var $l = eval('(' + res + ')');
                        //获取待办条数
                        $("#atoDoList").html('我的待办(<font color="red">' + $l.GetToDoItemsCount + '</font>)');
                        ////获取关注条数
                        //$("#amyFocus").html('我的关注(<font color="red">' + $l.GetAttentionItemsCount + '</font>)');
                        ////获取传阅条数
                        $("#aPass").html('传阅(<font color="red">' + $l.GetForwardItemsCount + '</font>)');
                        //工作提醒
                        $("#amyNotice").html('工作提醒(<font color="red">' + $l.GetPortalAlertAlertNum + '</font>)');
                        var $task = $l.GetTaskSender;
                         
                        //我的待办
                        $("#<%=ToDoList.ClientID %> span[actId]").each(function () {
                            var $actid = $(this).attr("actId");
                            for (var i = 0; i < $task.length; i++) {
                                 
                                var $id = $task[i][0];
                                var $un = $task[i][1];
                                var $on = $task[i][2];
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
                    },
                    error: function (err) {
                        //alert(err);
                    }
                });
            }


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
                                getAttention();
                            }
                            else {
                                $type = "add";
                                img.attr("title", "未关注,点击加关注");
                                img.attr("src", "../../Themes/Images/btn_notattention.png");
                                getAttention();
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

         <%--   $(function () {
                $(".myFocus").click(function () {
                     <%=ClientScript.GetPostBackEventReference(this.btnOrg,"") %>

                });
            });--%>
            function opengztx(id, text, url) {
                //点击闪动的图标打开工作提醒台账页
                //id:菜单id
                //text:菜单名称
                //url:页面url
                window.parent.parent.$("#tab-container").opentabitem({ id: id, text: text, url: url, isactive: true, closeable: true }, true);
                return false;
            }

            function ViewItem(alertID) {
                var url = "/Sys/PortalAlter/PortalAlertEditor.aspx";
                var json = { actionType: 1, bizId: alertID, PageType: "readPage" };
                url = buildQueryUrl(url, json);
                showDivDialog(url, "", 1050, 600, null);
                return true;
            }


            function checkGridViewRow(array) {
                transParamToToolBar(array, null);
            }

            //向顶部工具条传入参数
            function transParamToToolBar(rowIds, param) {
                if (typeof (getGirdParam) == "function") {
                    getGirdParam(rowIds, param);
                }
            }
            function openUrl(url) {
                window.open(url);
                return true;
            }
        </script>
    </form>
</body>
</html>
