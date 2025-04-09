<%@ Page Title="流程使用详细" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="UserWorkflowDetail.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.UserWorkflowDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="pdgDetail" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataKeyNames="PartId"
        Width="100%" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="FormName" HeaderText="流程名称"></asp:BoundField>
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate>
                    <div style="width: 300px; white-space: normal; word-break: break-all; word-wrap: break-word;">
                        <a href='/Portal/Sys/Workflow/FormDetail.aspx?actionType=1&formId=<%#Eval("FormId") %>&prcinstid=<%#Eval("ProcessInstanceId") %>'
                            target="_blank" style="color: Blue; text-decoration: underline">
                            <%#Eval("ProcessInstanceName")%></a>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="待办步骤">
                <ItemTemplate>
                    <a href='/Portal/Sys/Workflow/FormDetail.aspx?actionType=1&formId=<%#Eval("FormId") %>&prcinstid=<%#Eval("ProcessInstanceId") %>'
                        target="_blank" style="color: Blue; text-decoration: underline">
                        <%#Eval("ActivityName")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DateDay" HeaderText="待办未处理天数"></asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
