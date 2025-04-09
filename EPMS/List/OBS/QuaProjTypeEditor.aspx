<%@ Page Title="可参与的工程类型" Language="C#" AutoEventWireup="true" CodeBehind="QuaProjTypeEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectCfg.Master" Inherits="Zhongsoft.Portal.EPMS.List.QuaProjTypeEditor" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.Controls" TagPrefix="zhongsoft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="topBar" runat="server">
    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" 
        ID="btnAll" ToolTip="选择完成" OnClick="btnSure_Click" OnClientClick="return saveData();">        
        <span runat="server" id="span1"><img runat="server" id="img1" src="~/Themes/Images/btn_finish.gif" alt="选择完成" width="16" height="16" />选择完成</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" 
        ID="lbtnCancel" OnClientClick="cancelEdit();return false;"
        ToolTip="取消">        
        <span runat="server" id="span2"><img runat="server" id="img2" src="~/Themes/Images/btn_cancel.gif" alt="取消" width="16" height="16" />取消</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td colspan="2">
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                            PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                            DataKeyNames="ParamProjectTypeID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                            OnRowDataBound="gvList_RowDataBound">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField HeaderText="项目类别">
                                    <ItemTemplate>
                                        <asp:Label ID="lbProjctType" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                        <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamProjectTypeID") %>' />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="控制项目规模<span class='req-star'>*</span>">
                                    <ItemTemplate>
                                        <asp:RadioButtonList runat="server" ID="rblIsControlScale" RepeatDirection="Horizontal"
                                            key='<%#Eval("ParamProjectTypeID") %>'>
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="最低规模">
                                    <ItemTemplate>
                                        <zhongsoft:LightDropDownList ID="ddlLowScale" runat="server">
                                        </zhongsoft:LightDropDownList>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="最高规模">
                                    <ItemTemplate>
                                        <zhongsoft:LightDropDownList ID="ddlHighScale" runat="server">
                                        </zhongsoft:LightDropDownList>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="描述">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbDescription" activestatus="(23.*)" Text='<%#Eval("Description") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>       
            <input type="hidden" runat="server" id="hiExpXml" />
            <input type="hidden" runat="server" id="hiProjName" /> 
            <input type="hidden" runat="server" id="hiProjID" /> 
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function saveData() {
            if (!checkReqField()) {
                return false;
            }
            return true;
        }

        $(document).ready(function () {
            if (!parseBool("<%=IsPostBack %>")) {
                $("#<%=hiExpXml.ClientID %>").val(window.dialogArguments);
        })

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function closeExpWindow() { 
            parent.returnValue = $("#<%=hiExpXml.ClientID %>").val() + "|" + $("#<%=hiProjName.ClientID %>").val() + "|" + $("#<%=hiProjID.ClientID %>").val();
            closeWindow();
            return false;
        }
        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }    
    </script>
</asp:Content>
