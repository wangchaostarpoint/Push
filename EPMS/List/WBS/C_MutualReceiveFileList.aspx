<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_MutualReceiveFileList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.C_MutualReceiveFileList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="接口收资" %>

<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" flag="proj"><span>项目名称 </span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
            OnClick="txtProjectName_Click" Style="width: 255px;"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span><span class="filter-block" flag="proj"><span>项目编号 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" readonly="readonly"
            class="kpms-textbox" style="width: 75px;" />
    </span></span><span class="filter-block" flag="noproj"><span class="filter-block-lb">
        项目名称/编号</span> <span>
            <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">提出任务名称/编号</span>
            <span>
                <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                    EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">资料名称/编号</span>
                <span>
                    <asp:TextBox ID="tbFileInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                        EnableTheming="false"></asp:TextBox>
                </span></span>
    <%--<div style="display: none">--%>
    <span class="filter-block"><span class="filter-block-lb">接收专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <%--</div>--%><span class="filter-block"><span class="filter-block-lb">提交状态</span><span>
        <zhongsoft:LightDropDownList ID="ddlWBSState" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" style="display: none"><span class="filter-block-lb">
        是否计划</span><span>
            <zhongsoft:LightDropDownList ID="ddlIsPlan" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
                <asp:ListItem Value="">全部</asp:ListItem>
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0">否</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <style>
        body, html
        {
            overflow: hidden;
        }
    </style>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
        DataKeyNames="WBSID,ExecSpecialtyCode,ExecSpecialtyName" ShowExport="true" HideFieldOnExport="全部"
        runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowCommand="gvWBS_RowCommand"
        OnRowDataBound="gvWBS_RowDataBound" OnSorting="gvWBS_Sorting" AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType"
                Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="名称" HeaderStyle-Width="180px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openWBSDetail(\"{0}\")", Eval("WBSID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span><%#Eval("WBSName")%></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接收专业">
                <ItemTemplate>
                    <input type="hidden" id="hiWBSID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>' />
                    <div style="word-break: break-all !important; white-space: normal !important; width: 250px">
                        <%#Eval("RecSpe")%>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="提资专业代字" DataField="ExecSpecialtyCode" SortExpression="ExecSpecialtyCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提资专业名称" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提资任务编号" DataField="RollCode" SortExpression="RollCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提资任务名称" DataField="RollName" SortExpression="RollName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提交人" DataField="WBSOwnerName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="校核人" ItemStyle-Width="70px">
                <ItemTemplate>
                    <span wbsid='<%#Eval("WBSID") %>'><%#GetCheckUserName(Eval("WBSID").ToString()) %></span>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="资料性质" DataField="FileType" SortExpression="FileType"
                Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料状态" DataField="FileNature" SortExpression="FileNature"
                                       ItemStyle-Width="70px"/>
            <zhongsoft:LightBoundField HeaderText="提交状态" DataField="WBSState" SortExpression="WBSState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划提交时间" DataField="PlanCompleteTime" SortExpression="PlanCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际提交时间" DataField="FactCompleteTime" SortExpression="FactCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" ToolTip="查看"
                        CommandName="view" Visible="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>'><span>
                        <img src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif" alt="查看" /> </span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <script type="text/javascript">

        $gridCheckedClientID = "<%=this.gvWBS.CheckedClientID %>";
        function initPagePlugin() {
            getWBSChecker();
        }

        function openWBSDetail(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSEditor.aspx", { actionType: 1, bizid: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false
        }

        //定制新建、编辑、查看弹出窗口方式
        function beforeDialog(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(url, "", 850, 550, rebindGridData);
            return false;
        }
        function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }
        //获取任务校核人
        function getWBSChecker() {
            var $ids = "";
            $("#<%=gvWBS.ClientID %> span[wbsid]").each(function () {
                $ids += $(this).attr("wbsid") + "|";
            });
            $.post("C_RollList.aspx",
                 { asyfunc: "GetWBSChecker", wbsIdList: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     $("#<%=gvWBS.ClientID %> span[wbsid]").each(function () {
                         var $wbsid = $(this).attr("wbsid");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][1];
                             if ($wbsid == $id) {
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

        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        function initPagePlugin(){
            //根据是否在项目网站展示，显隐一些信息
            $('[flag="proj"]').hide();
            $('[flag="noproj"]').hide();
            <%--if('<%=QueryOrgID %>'!='') {
                $('[flag="proj"]').hide();
            }
            else{
                $('[flag="noproj"]').hide();
            }--%>
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
