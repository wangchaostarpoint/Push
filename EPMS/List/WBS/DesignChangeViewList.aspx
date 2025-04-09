<%@ Page Title="设计变更管理" Language="C#" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    AutoEventWireup="true" CodeBehind="DesignChangeViewList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.DesignChangeViewList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged"
            class="kpms-ddlsearch" EnableTheming="false" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">变更原因</span> <span>
        <zhongsoft:LightDropDownList ID="ddlChangeReason" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvDesignChange" AutoGenerateColumns="false"
        DataKeyNames="DesignChangeID" ShowExport="true" HideFieldOnExport="全部" runat="server"
        UseDefaultDataSource="true" BindGridViewMethod="BindDesignChange" ShowPageSizeChange="true"
        OnRowDataBound="gvDesignChange_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变更金额" DataField="ChangeSum" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变更单编号" DataField="ChangeBillCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变更原因" DataField="ChangeReason">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvDesignChange.CheckedClientID%>";
    </script>
</asp:Content>
