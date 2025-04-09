<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentTaskDetailList.aspx.cs"
    Title="工作负荷" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" Inherits="Zhongsoft.Portal.EPMS.List.OBS.CurrentTaskDetailList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" runat="server" MaxLength="64" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">设计阶段名称</span>
        <span>
            <asp:TextBox ID="tbPhaseCodeOrName" runat="server" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">工程类别</span> <span>
            <asp:TextBox ID="tbProjectType" runat="server" MaxLength="64" class="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <div id="templateTabs">
        <ul>
            <li><a href='#Design' id='a0'>
                <asp:Label ID="lbDesign" runat="server"></asp:Label></a></li>
            <li><a href='#MasterDesign' id='a1'>
                <asp:Label ID="lbMasterDesign" runat="server"></asp:Label></a></li>
            <li><a href='#MyProject' id='a2'>
                <asp:Label ID="lbMyProject" runat="server"></asp:Label></a></li>
        </ul>
        <div id="Design">
            <asp:UpdatePanel ID="panelDesign" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView ID="gvDesign" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" DataKeyNames="WBSID"
                        BindGridViewMethod="BindDesign" OnRowDataBound="gvDesign_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="工程类型" DataField="ProjectType" HeaderStyle-Width="7%" />
                            <asp:BoundField HeaderText="项目编号" DataField="ProjectCode" />
                            <asp:BoundField HeaderText="项目名称" DataField="ProjectName" />
                            <asp:BoundField HeaderText="设计阶段" DataField="PhaseName" />
                            <asp:BoundField HeaderText="设计规模" DataField="ProjectScale" />
                            <asp:BoundField HeaderText="任务类型" DataField="WBSType" />
                            <asp:BoundField HeaderText="编号" DataField="WBSCode" />
                            <asp:BoundField HeaderText="名称" DataField="WBSName" />
                            <asp:BoundField HeaderText="工作类别" DataField="TaskType" />
                            <asp:BoundField HeaderText="计划开始日期" DataField="PlanStartTime" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField HeaderText="计划完成日期" DataField="PlanCompleteTime" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField HeaderText="任务状态" DataField="WBSState" HeaderStyle-Width="7%" />
                            <asp:BoundField HeaderText="完成百分比" DataField="CompleteRate" />
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="MasterDesign">
            <asp:UpdatePanel ID="panelMasterDesign" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView ID="gvMasterDesign" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" DataKeyNames="SpecialtyOfProjectEntityID"
                        BindGridViewMethod="BindMasterDesign" OnRowDataBound="gvMasterDesign_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="工程类型" DataField="ProjectType" HeaderStyle-Width="7%" />
                            <asp:BoundField HeaderText="项目编号" DataField="ProjectCode" />
                            <asp:BoundField HeaderText="项目名称" DataField="ProjectName" />
                            <asp:BoundField HeaderText="设计阶段" DataField="PhaseName" />
                            <asp:BoundField HeaderText="设计规模" DataField="ProjectScale" />
                            <asp:BoundField HeaderText="专业代字" DataField="SpecialtyCode" />
                            <asp:BoundField HeaderText="专业名称" DataField="SpecialtyName" HeaderStyle-Width="7%" />
                            <%--<asp:BoundField HeaderText="已完成定额<br/>/卷册定额" DataField="FinishWorkDayRate" HtmlEncode="false" />
                            <asp:BoundField HeaderText="已完成卷册数<br/>/卷册数" DataField="FinishRate" HtmlEncode="false" />--%>
                            <asp:BoundField HeaderText="任务类别" DataField="TaskType" />
                            <asp:BoundField HeaderText="项目状态" DataField="ProjectState" />
                            <asp:TemplateField HeaderText="项目网站" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                                        <img alt=""  src ="../../../Themes/Images/btn_dg_view.gif" onclick =" return ViewProjectPortal('<%#Eval("OrganizationId") %>');" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="MyProject">
            <asp:UpdatePanel ID="panelMyProject" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView ID="gvMyProject" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" DataKeyNames="OrganizationId"
                        BindGridViewMethod="BindMyProject">
                        <Columns>
                            <asp:TemplateField HeaderText="项目网站" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt=""  src ="../../../Themes/Images/btn_dg_view.gif" onclick =" return ViewProjectPortal('<%#Eval("OrganizationId") %>');" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="工程类型" DataField="ProjectType" HeaderStyle-Width="7%" />
                            <asp:BoundField HeaderText="项目编号" DataField="ProjectCode" />
                            <asp:BoundField HeaderText="项目名称" DataField="ProjectName" />
                            <asp:BoundField HeaderText="设计阶段" DataField="PhaseName" />
                            <asp:BoundField HeaderText="设计规模" DataField="ProjectScale" />
                            <asp:BoundField HeaderText="主管总工" DataField="ManagerUserName" />
                            <asp:BoundField HeaderText="项目经理" DataField="ManagerUserName" />
                            <%--<asp:BoundField HeaderText="已完成定额/<br/>专业定额" DataField="FinishWorkDayRate" HtmlEncode="false" />
                            <asp:BoundField HeaderText="已完成卷册数/<br/>卷册数" DataField="FinishRate" HtmlEncode="false" />--%>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" runat="server" id="hiIndex" value="0" />
    <script type="text/javascript">
        function initFormPlugin() {
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
        }


        //查看项目网站
        function ViewProjectPortal(OrganizationID) {
//            var url = "../ProjectPortal/ProjectHomePage.aspx?projectPhaseID=" + OrganizationID;

            var url = "<%=WebAppPath%>/CatalogTree/EPMSFileTree.aspx?organizationID=" + OrganizationID;
            window.open(url);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
