<%@ Page Language="C#" AutoEventWireup="true" Title="选择会签专业" CodeBehind="SignSpecSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.SignSpecSelector" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">专业代字/名称</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <%--<asp:LinkButton runat="server" ID="ibtnOK" CssClass="subtoolbarlink" EnableTheming="false"
        ToolTip="选择完成" OnClick="ibtnOK_Click">
        <span>
            <img runat="server" id="imgOk" src="~/Themes/Images/btn_finish.gif" alt="选择完成" width="16"
                height="16" />选择完成</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="lbtnCancel" CssClass="subtoolbarlink" EnableTheming="false"
        ToolTip="取消" OnClientClick="return cancelExp();">
        <span>
            <img runat="server" id="imgCancel" src="~/Themes/Images/btn_cancel.gif" alt="取消"
                width="16" height="16" />取消</span>
    </asp:LinkButton>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="99%" runat="server" ID="gvList" AllowPaging="false"
         AutoGenerateColumns="false" AllowSorting="true"
        DataKeyNames="OrganizationUsersInRolesID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
          
            <zhongsoft:LightTemplateField ItemStyle-Width="20px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("OrganizationUsersInRolesID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
           
            <zhongsoft:LightBoundField DataField="UnitPostName" HeaderText="专业角色" />
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名" />
            <zhongsoft:LightBoundField DataField="LoginId" HeaderText="工号" ItemStyle-Width="40px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div style="width: 100%; text-align: center;">
        <asp:LinkButton runat="server" ID="ibtnOK" ToolTip="确定" OnClick="ibtnOK_Click">
            <span>
               确定</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnCancel" ToolTip="取消" OnClientClick="return cancelExp();">
            <span>
                取消</span>
        </asp:LinkButton>
    </div>
    <input type="hidden" runat="server" id="hiXML" />
    <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        $(document).ready(function () {
            //传递返回值
            if (!parseBool("<%=IsPostBack %>")) {
                if ("<%=DIALOG_MODE%>" == "Dialog") {
                    if (window.parent.document.getElementById("<%=PARAM_HI_ID%>") != null) {
                        var str = window.parent.document.getElementById("<%=PARAM_HI_ID%>").value;
                        var arr = str.split('|');
                        $("#<%=hiXML.ClientID %>").val(arr[0]);
                    }
                }
                else {
                        var str = window.dialogArguments
                        var arr = str.split('|');
                        $("#<%=hiXML.ClientID %>").val(arr[0]);
                     }
                <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
            }
        })   

        function initCustomerPlugin() {
          
        }

        function closeExpWindow() {
            parent.returnValue = $("#<%=hiXML.ClientID %>").val();
            closeWindow();
            return false;
        }

        function cancelExp() {
            parent.returnValue = null;
            closeWindow();
        }

        //单选按钮实现
        function radioClick(obj) {
            $('#<%=gvList.ClientID %> input:radio:checked').attr('checked',false);
            $(obj).attr('checked',true);
        }        
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
