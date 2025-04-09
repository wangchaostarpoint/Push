<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="StatisticalAnalysisDicParamList.aspx.cs" Inherits="Zhongsoft.Portal.GM.List.GM.StatisticalAnalysisDicParamList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
        <asp:LinkButton runat="server" ID="btnAdd" EnableTheming="false" CssClass="subtoolbarlink" OnClick="btnAdd_Click"><span>添加</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="false" BindGridViewMethod="BindDataGrid"
        PageSize="20" DataKeyNames="BD_ParamDicID" AutoGenerateColumns="false" ShowFooter="false" ShowEmptyDataHeader="true" EmptyDataText="暂无数据">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%#Container.DataItemIndex + 1%>
                    <input type="hidden" runat="server" id="hiBD_ParamDicID" value='<%#Eval("BD_ParamDicID") %>' />
                    <input type="hidden" runat="server" id="hiDicType" value='<%#Eval("DicType") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightTemplateField HeaderText="名称" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText type="text" runat="server" ID="tbDicName" Value='<%#Eval("DicName") %>' Style="text-align: right;"
                        class="kpms-textbox" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="值" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText type="text" runat="server" ID="tbDicValue" Value='<%#Eval("DicValue") %>' Style="text-align: right;"
                        class="kpms-textbox" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
