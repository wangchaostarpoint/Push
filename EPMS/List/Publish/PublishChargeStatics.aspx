<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishChargeStatics.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishChargeStatics" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">计费日期</span> <span>
        <zhongsoft:XHtmlInputText runat="server" ID="tbBegin" compare="2" class="kpms-textbox-comparedate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至<zhongsoft:XHtmlInputText runat="server" ID="tbEnd" compare="2" class="kpms-textbox-comparedate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block" id="spProj" runat="server"><span class="filter-block-lb">
        项目名称/编号</span> <span>
            <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block" id="spDept" runat="server"><span class="filter-block-lb">
            部门</span><span>
                <zhongsoft:LightDropDownList ID="ddlDeptInfo" runat="server" EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" OnRowDataBound="gvList_RowDataBound" ShowFooter="true">
        <Columns>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
