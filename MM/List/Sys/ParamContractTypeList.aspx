<%@ Page Title="合同类别参数设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ParamContractTypeList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.Sys.ParamContractTypeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnDetailNew" EnableTheming="false" CssClass="subtoolbarlink"
                        OnClientClick="return addDetailItem()">
            <img src="../../../Themes/Images/btn_new.gif"/><span>新建</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">合同类别</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContractType" CssClass="kpms-textboxsearch" EnableTheming="false"/>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" AllowPaging="True" PageSize="15" OnRowDataBound="gvList_OnRowDataBound" 
                                  BindGridViewMethod="BindData" DataKeyNames="ParamContractTypeID" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showDetailItem" ToolTip="查看" DataParamFields="ParamContractTypeID"
                                        ImageUrl="../../../Themes/Images/btn_dg_view.gif" ItemStyle-Width="30px" >
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="编辑" ToolTip="编辑" EditItemClick="editDetailItem" DataParamFields="ParamContractTypeID"
                                        ImageUrl="../../../Themes/Images/btn_dg_edit.gif" ItemStyle-Width="30px" >
            </zhongsoft:LightButtonField>
            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="removeData" CommandArgument='<%#Eval("ParamContractTypeID")%>'
                                    EnableTheming="false" ToolTip="删除"> 
                        <img id="imgEdit" alt="删除" style="CURSOR: hand" 
                             onclick="if(!confirm('确认要删除吗？')) return false;"
                             src="../../../Themes/Images/btn_dg_delete.gif" border="0" /></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="合同类别" DataField="ContractTypeName" ItemStyle-Width="80px"/>
            <zhongsoft:LightBoundField HeaderText="排序" DataField="Sort" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamContractTypeID") %>'
                                         OnSelectedIndexChanged="rbl_OnSelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamContractTypeID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="主要内容" DataField="Content" ShowToolTip="True" Width="450px" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="True" Width="450px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindParam" OnClick="btnBindParam_OnClick" Style="display: none" />
    <script type="text/javascript">
        //查看详细信息
        function showDetailItem(id) {
            var url = buildBizUrl(1, id, "/MM/List/Sys/ParamContractTypeEditor.aspx", null);
            showDivDialog(url, null, 600, 400, null);
            return false;
        }

        function editDetailItem(id) {
            var url = buildBizUrl(3, id, "/MM/List/Sys/ParamContractTypeEditor.aspx", null);
            showDivDialog(url, null, 600, 400, bindParam);
            return false;
        }

        function addDetailItem() {
            var param = { actionType: 2,baseType:"收费合同"};
            var url = buildQueryUrl("/MM/List/Sys/ParamContractTypeEditor.aspx", param);
            showDivDialog(url, "", 600, 400, bindParam);
            return false;
        }

        //刷新列表
        function bindParam() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindParam,"")%>;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
