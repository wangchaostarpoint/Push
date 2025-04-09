<%@ Page Title="过程文档" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="ProcessManager.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.ProcessManager" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<%@ Import Namespace="Zhongsoft.Portal.Sys.Workflow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">主&nbsp;题</span> <span>
        <asp:TextBox MaxLength="20" ID="tbTitle" ToolTip="请输入主题" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">分&nbsp;类</span>
        <span>
            <asp:DropDownList runat="server" ID="ddlFormType" AutoPostBack="true" EnableTheming="false"
                class="kpms-ddlsearch" OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">表单类型</span><span>
            <asp:DropDownList runat="server" ID="ddlType" EnableTheming="false" class="kpms-ddlsearch">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">参与人</span> <span>
            <asp:TextBox ID="txtPartUser" MaxLength="10" class="kpms-textboxsearch" EnableTheming="false"
                runat="server">
            </asp:TextBox>
        </span></span>
    <span class="filter-block"><span class="filter-block-lb">流程状态</span><span>
        <asp:DropDownList runat="server" ID="ddlProcessStatus" EnableTheming="false" class="kpms-ddlsearch">
            <asp:ListItem>全部</asp:ListItem>
            <asp:ListItem Value="1" Selected="True">有效</asp:ListItem>
            <asp:ListItem Value="0">删除</asp:ListItem>
        </asp:DropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProject" MaxLength="10" class="kpms-textboxsearch" EnableTheming="false"
            runat="server">
        </asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">发起人</span> <span>
        <asp:TextBox ID="tbCreateUser" MaxLength="10" class="kpms-textboxsearch" EnableTheming="false"
            runat="server">
        </asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">发起部门</span><span>
        <asp:DropDownList runat="server" ID="ddlDept" EnableTheming="false" class="kpms-ddlsearch">
        </asp:DropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="ProcessList" AllowPaging="true" PageSize="15" runat="server"
        UseDefaultDataSource="False" OnRowCommand="ProcessList_RowCommand">
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
            <asp:TemplateField HeaderText="主题">
                <ItemTemplate>
                    <div style="width: 420px;" class="autoskip">
                        <a title='<%# Eval("ProcessInstanceName") %>' onclick="viewForm('<%#Eval("FormId") %>','<%#Eval("ProcessInstanceId")%>','<%#Eval("FormType")%>','<%#Eval("AppFlag")%>')">
                            <%# Eval("ProcessInstanceName") %></a>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="当前处理人" HeaderStyle-Width="180px">
                <ItemTemplate>
                    <div class="autoskip" style="width: 180px">
                        <span prcid='<%#Eval("ProcessInstanceId") %>'></span>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProcessName" HeaderText="表单类型" HeaderStyle-Width="150px" />
            <asp:TemplateField HeaderText="发起人[发起时间]" HeaderStyle-Width="350px">
                <ItemTemplate>
                    <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]&nbsp;<%# GetStartDate(DateTime.Parse(Eval("StartDateTime").ToString()))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FinishDateTime" HeaderText="结束时间" DataFormatString="{0:yyyy-MM-dd}"
                HeaderStyle-Width="80px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function viewForm(formId, processId, formType, appFlag) {
            var url = 'FormDetail.aspx?actionType=1&FormID=' + formId + '&prcinstid=' + processId;
            if (formType == '<%=EDPortal.BLL.Sys.SysConfig.Instance.EPMSModuleName%>' || appFlag == '<%=Zhongsoft.Portal.AppFlag.EPMS%>') {
                <%--url = '<%=EDPortal.BLL.Sys.SysConfig.Instance.EPMSWebAppPath%>/Sys/Workflow/' + url;--%>
            }
            else if (formType == '<%=EDPortal.BLL.Sys.SysConfig.Instance.DAMSModuleName%>') {
                url = '<%=EDPortal.BLL.Sys.SysConfig.Instance.DAMSWebAppPath%>/Sys/Workflow/' + url;
            }
            else {
                url = '<%=EDPortal.BLL.Sys.SysConfig.Instance.MainWebAppPath%>/Sys/Workflow/' + url;
            }
            window.open(encodeURI(url), "", "");
        }

        function initCustomerPlugin() {
            getCurrUser();
        }

        //获取当前处理人
        function getCurrUser() {
            var $ids = "";
            $("#<%=ProcessList.ClientID %> span[prcid]").each(function () {
                $ids += $(this).attr("prcid") + "|";
            });
            $.post("ProcessManager.aspx",
                { asyfunc: "GetCurrUser", prcIdList: $ids },
                function (res) {
                    if (res == "") { return; }
                    var $l = eval('(' + res + ')');
                    $("#<%=ProcessList.ClientID %> span[prcid]").each(function () {
                        var prcid = $(this).attr("prcid");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $prcStatus = $l[i][1];
                            var $currName = $l[i][2];
                            if (prcid == $id) {
                                //可能有多个步骤，把之前的拼接上来
                                var currName = $currName;
                                var preName = $(this).html();
                                var t = preName + currName;
                                $(this).html(t);
                                $(this).attr("title", t);
                            }
                        }
                    });
                }
            );
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
