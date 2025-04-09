<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TilesContainer.ascx.cs"
    Inherits="Zhongsoft.Portal.Metro.Controls.TilesContainer" %>
<%@ Register Namespace="Zhongsoft.Portal.Metro.Controls" TagPrefix="zs" Assembly="Zhongsoft.Portal" %>
<%@ Register Src="../Controls/ProjContainer.ascx" TagName="ProjContainer" TagPrefix="uc1" %>

<div class="tilescontainer" runat="server" id="divTiles">
    <asp:Repeater ID="tiles" runat="server" OnItemDataBound="tiles_ItemDataBound" OnItemCommand="tiles_ItemCommand">
        <ItemTemplate>
          <div runat="server" id="divAll" style=" position:relative; float:left; margin:4px;" tileid='<%#Eval("TileId") %>'>
            <asp:HyperLink runat="server" ID="linkTile">
                <asp:Image runat="server" ID="imgIcon" />                
                <uc1:ProjContainer ID="projContainer" runat="server" visible="false"/>
                <iframe runat="server" id="iframeContent" visible="false"></iframe>
                <asp:Label runat="server" ID="lbLabel"></asp:Label>
            </asp:HyperLink>            
            <div runat="server" id="divLock" style="display:none">
                    <span>&nbsp;&nbsp;</span><img title="权限设置" src="../../themes/images/btn_lock.gif" style=" float:left;" width="16" height="16" onclick="editPermission('<%# Eval("TileId").ToString() %>','<%# Eval("TileName").ToString() %>','')"/>&nbsp;&nbsp;
                    <img title="编辑" src="../../themes/images/btn_dg_edit.gif" style=" float:left;" width="22" height="16" onclick="addOrEditTile(3,'<%# Eval("TileId").ToString() %>','')" />&nbsp;&nbsp;
                    <img id="imgSetContent" runat="server" title="内容布局设置" src="../../Themes/Images/ico_blockActivity2.gif" style=" float:left;" width="16" height="16" visible="false" />&nbsp;&nbsp;
                    <asp:LinkButton ID="lbtnDelete" ToolTip="删除" runat="server" CommandName="DeleteData" EnableTheming="false"
                        CommandArgument='<%#DataBinder.Eval(Container.DataItem,"TileId") %>'  >
                                             <img width="16" height="16"  alt="删除" id="ImgDelete"  border="0" onclick="return confirm('确定删除？');" src="../../Themes/Images/btn_dg_delete.gif" style="cursor: hand; float:left;" />
                    </asp:LinkButton>
             </div>             
         </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<input type="hidden" runat="server" id="hiGroupId" />