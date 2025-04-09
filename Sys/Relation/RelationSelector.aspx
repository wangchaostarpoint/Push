<%@ Page Title="业务关联" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="RelationSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.RelationSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    业务分类<asp:DropDownList runat="server" ID="ddlType" Width="100px" AutoPostBack="true"
        OnSelectedIndexChanged="ddlType_Change">
    </asp:DropDownList>
    <span class="filter-block"><span class="filter-block-lb">分&nbsp;类</span>
        <span>
            <asp:DropDownList runat="server" ID="ddlFormType" AutoPostBack="true" OnSelectedIndexChanged="ddlFormType_SelectedIndexChanged"
                class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">表单类型</span><span>
            <asp:DropDownList runat="server" ID="ddlFormDetail" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span></span>
    <br />
    <span class="filter-block"><span class="filter-block-lb">发起人</span> <span>
            <asp:TextBox ID="tbCreateUser" MaxLength="10" runat="server" class="kpms-textboxsearch"
                EnableTheming="false">
            </asp:TextBox>
        </span></span>
    <span class="filter-block"><span class="filter-block-lb">发起时间</span> <span>
                <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    ID="txtStartDate" compare="1" />
                至
                <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    ID="txtEndDate" compare="1" />
        </span></span>
    业务名称
    <asp:TextBox ID="tbName" runat="server" Width="100px" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="WorkflowList" runat="server" AutoGenerateColumns="false"
        ShowJsonRowColName="true" UseDefaultDataSource="true" BindJsonClick="true" OnJsonClick="addObject"
        AllowPaging="true" PageSize="10" OnRowCommand="WorkflowList_RowCommand" JsonClickMode="onclick">
        <Columns>
            <zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" DataParamFields="BusinessId,ISOld"
                EditItemClick="viewFormDetail">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
