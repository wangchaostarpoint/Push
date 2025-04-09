<%@ Page Title="互提资料" Language="C#" AutoEventWireup="true" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="ProjectMutualFileList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.ProjectMutualFileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span> <span>
        <asp:TextBox ID="tbProjectInfo" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">卷册编号/名称</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">资料编号/名称</span>
            <span>
                <asp:TextBox ID="tbFileInfo" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">提交状态</span><span>
                <zhongsoft:LightDropDownList ID="ddlState" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">提资专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlExecSpe" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">接收专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlReceiveSpe" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">接收卷册编号/名称</span>
        <span>
            <asp:TextBox ID="tbReceiveRoll" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="WBSID" UseDefaultDataSource="false" OnRowDataBound="gvList_RowDataBound"
        BindGridViewMethod="BindDataGrid">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" ToolTip="查看"
                        Visible="false"><span>
                        <img src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif" alt="查看" /> </span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料名称" DataParamFields="WBSID"
                DialogMode="Dialog" EditItemClick="viewItem">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="提资专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RollCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RollName" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RecSpe" HeaderText="接收专业" MaxLength="15" Width="200px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RecRoll" HeaderText="接收卷册" MaxLength="15" Width="200px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="提交状态">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbState"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划提交" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际提交" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程
        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
