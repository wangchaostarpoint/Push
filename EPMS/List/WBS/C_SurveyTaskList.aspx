<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_SurveyTaskList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.C_SurveyTaskList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="勘测任务书台账" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">任务书编号</span>
            <span>
                <asp:TextBox ID="tbBookCode" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block" style="display: none"><span class="filter-block-lb">
                工程类型</span> <span>
                    <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span></span><span class="filter-block" style="display: none"><span class="filter-block-lb">
                    设计阶段</span> <span>
                        <zhongsoft:LightDropDownList ID="ddlPhaseName" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                        </zhongsoft:LightDropDownList>
                    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlSpeInfo" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBSBook" AutoGenerateColumns="false"
        DataKeyNames="WBSBookID" ShowExport="true" HideFieldOnExport="全部" runat="server"
        BindGridViewMethod="BindDataGrid" OnSorting="gvWBSBook_Sorting" ShowPageSizeChange="true"
        AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="任务类型">
                <ItemTemplate>
                    <span wbstype='<%#Eval("WBSID") %>;<%#Eval("OrganizationID") %>'></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="名称" DataField="WBSName" SortExpression="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="任务负责人">
                <ItemTemplate>
                    <span wbsownername='<%#Eval("WBSID") %>;<%#Eval("OrganizationID") %>'></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="勘测任务书<br/>编号" DataField="WBSBookCode" SortExpression="WBSBookCode"
                HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="工程类型">
                <ItemTemplate>
                    <span projecttype='<%#Eval("WBSID") %>;<%#Eval("OrganizationID") %>'></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计阶段">
                <ItemTemplate>
                    <span phasename='<%#Eval("WBSID") %>;<%#Eval("OrganizationID") %>'></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="任务提出专业" DataField="PutSpecialtyName" SortExpression="PutSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提出人" DataField="PutUserName" SortExpression="PutUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提出时间" DataField="PutDate" SortExpression="PutDate"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划完成时间" DataField="ReceiveSpecialtyName" SortExpression="ReceiveSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际提资<br/>时间" DataField="WBSSendTime" SortExpression="WBSSendTime"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="实际室交出<br/>时间">
                <ItemTemplate>
                    <span factrechecktime1='<%#Eval("WBSID") %>;<%#Eval("OrganizationID") %>'></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="实际院交出<br/>时间">
                <ItemTemplate>
                    <span factdeliverytime='<%#Eval("WBSID") %>;<%#Eval("OrganizationID") %>'></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWBSBook.CheckedClientID %>";

        function initPagePlugin() {
            getBookInfo();
        }

        //异步加载 工程类型、设计阶段
        //异步加载任务类型、实际室交出、实际院交出时间
        //传参：项目ID，任务ID
        function getBookInfo() {
            var $ids = "";
            $("#<%=gvWBSBook.ClientID %> span[projecttype]").each(function () {
                $ids += $(this).attr("projecttype") + "|";
            });
            $.post("C_SurveyTaskList.aspx",
                 { asyfunc: "GetBookInfo", wbsIdList: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //工程类型
                     $("#<%=gvWBSBook.ClientID %> span[projecttype]").each(function () {
                         var $projecttype = $(this).attr("projecttype");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][1];
                             if ($projecttype == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                     //设计阶段
                     $("#<%=gvWBSBook.ClientID %> span[phasename]").each(function () {
                         var $phasename = $(this).attr("phasename");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][2];
                             if ($phasename == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                     //任务类型
                     $("#<%=gvWBSBook.ClientID %> span[wbstype]").each(function () {
                         var $wbstype = $(this).attr("wbstype");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][3];
                             if ($wbstype == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                     //实际室交出
                     $("#<%=gvWBSBook.ClientID %> span[factrechecktime1]").each(function () {
                         var $factrechecktime1 = $(this).attr("factrechecktime1");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][4];
                             if ($factrechecktime1 == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                     //实际院交出时间
                     $("#<%=gvWBSBook.ClientID %> span[factdeliverytime]").each(function () {
                         var $factdeliverytime = $(this).attr("factdeliverytime");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][5];
                             if ($factdeliverytime == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                     //任务负责人
                     $("#<%=gvWBSBook.ClientID %> span[wbsownername]").each(function () {
                         var $wbsownername = $(this).attr("wbsownername");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][6];
                             if ($wbsownername == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
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
