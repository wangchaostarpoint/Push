<%@ Page Title="项目大事记台帐" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ProjectMemorabiliaList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectMemorabiliaList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lbtnNew" runat="server" EnableTheming="false" CssClass="subtoolbarlink" OnClientClick="return viewDetail('2', '');">
        <span>
            <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="新建" height="16" />新建</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" AllowPaging="True" PageSize="15" BindGridViewMethod="BindData"
        ShowExport="True" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewData" runat="server" EnableTheming="false">
                        <img alt="img" src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" onclick="viewDetail('1','<%# Eval("ProjectMemorabiliaID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEditData" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif" 
                             onclick="viewDetail('3','<%# Eval("ProjectMemorabiliaID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelData" runat="server" CommandName="DelData"
                        EnableTheming="false" CommandArgument='<%#Eval("ProjectMemorabiliaID") %>'>
                        <img alt="删除" src="<%=WebAppPath%>/Themes/Images/btn_dg_delete.gif" onclick='return confirm("您确定删除吗？");'/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" Width="150px" ShowToolTip="True"/>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
            <zhongsoft:LightBoundField HeaderText="填写人" DataField="WriteUserName" />
            <zhongsoft:LightBoundField HeaderText="填写日期" DataField="WriteDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="项目大事件" DataField="ProjectMemorabilia" Width="650px" ShowToolTip="True" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnCallBack" OnClick="btnCallBack_OnClick" Visible="False" />

    <script type="text/javascript">
        function viewDetail(actionType, bizId, organizationID) {
            var businessObjectId = '<%=BusinessObjectId%>';
            var organizationID = '<%=OrganizationID%>';
            var json = { actionType: actionType };

            if (actionType != "2") {
                var json = { actionType: actionType, bizId: bizId };
            } else {
                if (organizationID != "") {
                    json = { actionType: actionType, organizationID: organizationID };
                }
            }

            var url = buildQueryUrl("EPMS/List/Project/ProjectMemorabiliaEditor.aspx", json);
            showDivDialog(encodeURI(url), null, 900, 500, callBack);
            return false;
        }

        function callBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnCallBack, "")%>;
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
