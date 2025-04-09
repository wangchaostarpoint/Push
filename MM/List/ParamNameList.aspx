<%@ Page Language="C#" Title="参数明细台账" AutoEventWireup="true" CodeBehind="ParamNameList.aspx.cs" MasterPageFile="~/UI/Master/ObjectList.Master"
    Inherits="Zhongsoft.Portal.MM.List.ParamNameList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
    <div>
        <asp:TreeView ID="treeParam" runat="server" OnSelectedNodeChanged="treeParam_SelectedNodeChanged"
            Height="100%" Width="100%" ShowLines="True">
            <SelectedNodeStyle BackColor="#F7F7F7" />
        </asp:TreeView>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">参数明细/参数明细值</span> <span>
        <asp:TextBox ID="tbParamName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnDetailNew" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return AddDetailItem()">
                                <img src="../../Themes/Images/btn_new.gif"/><span>新建</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvDetailList" runat="server" AutoGenerateColumns="false" BindGridViewMethod="BindDetailDataGrid"
        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="ParamGeneralID"
        OnRowCommand="gvDetailList_RowCommand" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="参数类型" DataField="ParamType"></asp:BoundField>
            <zhongsoft:LightBoundField HeaderText="参数明细名" DataField="ParamName" ItemStyle-Width="300px" Width="300px" ShowToolTip="true"></zhongsoft:LightBoundField>
            <asp:BoundField HeaderText="参数明细值" DataField="ParamValue"></asp:BoundField>
            <asp:BoundField HeaderText="排序" DataField="Sort"></asp:BoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamGeneralID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                <img alt="编辑" id="ImgEdit"   src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand"
                                                 onclick='return EditDetailItem("<%#DataBinder.Eval(Container.DataItem,"ParamGeneralID") %>");'/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" EnableTheming="false"
                        CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ParamGeneralID") %>'>
                                             <img alt="删除" id="ImgDelete"  border="0" onclick="return confirm('确定删除？');" src="../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindParam" OnClick="btnBindParam_Click"
        Style="display: none" />
    <script type="text/javascript">
        function EditDetailItem(bizId) {
            var param = { actionType: 3, bizId: bizId };
            var url = buildQueryUrl("/MM/List/ParamDetailEditor.aspx", param);
            showDivDialog(url, "", 600, 400, bindParam);
            return false;
        }

        function AddDetailItem() {
            var paramType = "<%=ParamType %>";
            if (paramType == "") {
                alert("请选中一个参数再添加参数明细");
                return false;
            }
            var param = { actionType: 2, paramType: paramType };
            var url = buildQueryUrl("/MM/List/ParamDetailEditor.aspx", param);
            showDivDialog(url, "", 600, 400, bindParam);
            return false;
        }

        //刷新列表
        function bindParam() {
          <%=Page.ClientScript.GetPostBackEventReference(this.btnBindParam,"")%>;
        }
    </script>
</asp:Content>

