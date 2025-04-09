<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="项目任务状态查询" CodeBehind="ProjRollState.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.ProjRollState" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>项目名称 </span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','txtDesigner':'ManagerUserName','txtDesignSize':'ProjectScale'}"
            OnClick="txtProjectName_Click" Style="width: 255px;"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span><span class="filter-block"><span>项目编号 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" readonly="readonly"
            class="kpms-textbox" style="width: 75px;" />
    </span></span><span class="filter-block"><span>任务状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRollState" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span>出版状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPublishState" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>交付状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDeliverState" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>分院</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>专业</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="WBSID"
        UseDefaultDataSource="false" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="任务状态">
                <ItemTemplate>
                    <%# Enum.GetName(typeof(DAL.EPMS.WBSState), Eval("WBSState") != DBNull.Value ?Eval("WBSState") :0 )%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="出版状态">
                <ItemTemplate>
                    <%# Enum.GetName(typeof(DAL.EPMS.PublishState), Eval("PublishState") != DBNull.Value ?Eval("PublishState") :0 )==DAL.EPMS.PublishState.不出版.ToString()?"":Enum.GetName(typeof(DAL.EPMS.PublishState), Eval("PublishState") != DBNull.Value ?Eval("PublishState") :0 )%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="交付状态">
                <ItemTemplate>
                    <%# Enum.GetName(typeof(DAL.EPMS.DeliveryState), Eval("DeliveryState") != DBNull.Value ?Eval("DeliveryState"):0 )==DAL.EPMS.DeliveryState.不交付.ToString()?"":Enum.GetName(typeof(DAL.EPMS.DeliveryState), Eval("DeliveryState") != DBNull.Value ?Eval("DeliveryState"):0 )%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="状态位置">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbStatePosition"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
