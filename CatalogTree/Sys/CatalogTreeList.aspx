<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CatalogTreeList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProjectDesign.CatalogTreeList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <script type="text/javascript" src="/Portal/UI/Script/treegrid.js"></script>
    <span class="filter-block"><span class="filter-block-lb">分类编号/名称</span> <span>
        <input type="text" runat="server" id="txtClassfiedInfo" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <table>
        <tr>
            <td>
                <asp:LinkButton ID="btnNew" runat="server" CssClass="searchbtn" OnClientClick="return DesignClassfiedItem('','2')"
                    OnClick="btnNew_Click">
                                <span>新建</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:TreeGridView ID="gvDesignClassfied" runat="server" AutoGenerateColumns="false" BindGridViewMethod="BindGrid"
        UseDefaultDataSource="true" AllowPaging="true" PageSize="80" OnRowCommand="gvDesignClassfied_RowCommand"
        SelfIdColumn="CatalogID" ParentIdColumn="ParentID" DataKeyNames="CatalogID"
        ShowExport="true" OnExport="gvDesignClassfied_Export" OnRowDataBound="gvDesignClassfied_RowDataBound">
        <Columns>
            <asp:TemplateField ItemStyle-Width="60px">
                <ItemTemplate>
                    <%# gvDesignClassfied.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CatalogCode" HeaderText="分类编号" />
            <asp:BoundField DataField="CatalogName" HeaderText="分类名称" />
            <asp:BoundField DataField="Sort" HeaderText="排序" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="RIsDistinctSpecialty" HeaderText="是否区分专业" ItemStyle-Width="100px" />
            <asp:BoundField DataField="FormNames" HeaderText="关联流程" />
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                                                <img alt="" src="/Portal/Themes/Images/btn_dg_view.gif" border='0'  onclick="return DesignClassfiedItem('<%#Eval("CatalogID") %>','1');"/>
                    </asp:LinkButton>
                    <input type="hidden" runat="server" id="hiId" value='<%#DataBinder.Eval(Container.DataItem,"CatalogID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="editData" EnableTheming="false">
                                                <img alt="" src="/Portal/Themes/Images/btn_dg_edit.gif" border='0' onclick="return DesignClassfiedItem('<%#Eval("CatalogID") %>','3');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDel" runat="server" CommandName="del" CommandArgument='<%#Eval("CatalogID") %>' EnableTheming="false">
                                                <img alt="" src="/Portal/Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:TreeGridView>

    <script type="text/javascript">
        function DesignClassfiedItem(bizId, actionType) {
            var url = "";
            if (actionType == "2") {
                url = "/CatalogTree/Sys/CatalogTreeEditor.aspx?actionType=" + actionType;
            }
            else {
                url = "/CatalogTree/Sys/CatalogTreeEditor.aspx?actionType=" + actionType + "&bizId=" + bizId;
            }
            url += "&type=" + "<%=TreeType %>";

            if ('<%=TreeType %>' == 'EPMS') {
                if ('<%=ParamProjectTypeId%>' != '' && '<%=ParamPhaseId%>' != '') {
                    url += '&ShowProjectTypeAndPhase=1';
                    //新建直接传递参数ID，以便直接默认而不用再去选择参数
                    if (actionType == "2") {
                        url += '&ParamProjectTypeId=<%=ParamProjectTypeId%>&ParamPhaseId=<%=ParamPhaseId%>';
                    }
                }
            }

            url = buildQueryUrl(url, null);
            //if (window.showModalDialog(url, null, stringFeatures) == undefined) {
            //    return false;
            //}
            var callBack = null;
            if (actionType != '1')
                callBack = rebindGridData;
            showDivDialog(url, "", 550, 350, callBack);
            return false;
        }

        function InitCustomerPlugin() {
            initTreeGrid();
        }
    </script>

</asp:Content>
