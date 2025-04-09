<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="SurveyBriefList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Survey.SurveyBriefList" MasterPageFile="~/UI/Master/ObjectList.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">子项目名称</span><span>
        <zhongsoft:LightTextBox ID="tbProjectName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">子项目编号</span><span>
        <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span> 
     <span class="filter-block" id="spanSpecialty"  runat="server"><span class="filter-block-lb">专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server"  />
    </span></span> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
        PageSize="15" DataKeyNames="SurveyBriefID" ShowExport="true" BindGridViewMethod="BindGrid" UseDefaultDataSource="true"
         HideFieldOnExport="查看" >
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="子项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="子项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="SpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编写人" DataField="WriteUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编写日期" DataField="WriteDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return openWorkFlow("<%#Eval("SurveyBriefID") %>");' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function openWorkFlow(bizid) {
            var url = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizid });
            window.open(url);
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
