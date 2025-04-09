<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FixedFilterBar.ascx.cs"
    Inherits="Zhongsoft.Portal.UI.Controls.FixedFilterBar" %>
<asp:DataList runat="server" ID="dlFilters" RepeatDirection="Horizontal" OnItemDataBound="dlFilters_ItemDataBound"
    OnItemCommand="dlFilters_ItemCommand" SelectedItemStyle-BackColor="White">
    <ItemStyle />
    <ItemTemplate>
        <asp:LinkButton runat="server" CssClass="btn-query" EnableTheming="false" ID="btn"
            CommandName='<%#Eval("Command") %>' ToolTip='<%#Eval("Label") %>'>
            <img runat="server" id="imgStructure" width="16" height="16" />
            <span runat="server" id="span">
                <%#Eval("Label") %></span>
        </asp:LinkButton>
        <div id="divGroup" visible="false" runat="server" class="divCreate" style="position: relative;
            z-index: 100">
            <div style=" margin-top:2px;">
                <asp:LinkButton runat="server" CssClass="btn-query" EnableTheming="false" ID="btngroup"
                    Visible="false" CommandName='<%#Eval("Command") %>' ToolTip='<%#Eval("Label") %>'>
                    <img runat="server" id="imggroup" alt='<%#Eval("Label") %>' width="16" height="16"
                        visible="false" />
                    <span runat="server" id="spangroup" visible="false"></span>
                </asp:LinkButton></div>
            <div class="divdll" style="display: none; position: absolute; top: 24px">
                <asp:DataList runat="server" ID="dlButtons" RepeatDirection="Vertical" RepeatColumns="1"
                    OnItemCommand="dlFilters_ItemCommand" OnItemDataBound="dlFilters_ItemDataBound" CellPadding="0" CellSpacing="0" CssClass="droplist">
                    <ItemStyle Wrap="false" />
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CssClass="btn-toolmenu2" EnableTheming="false" ID="btn"
                            Width="100%" CommandName='<%#Eval("Command") %>' ToolTip='<%#Eval("Label") %>'>
                            <img runat="server" id="imgStructure" alt='<%#Eval("Label") %>' width="16" height="16" />
                            <span runat="server" id="span"></span>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </ItemTemplate>
</asp:DataList>
<input type="hidden" runat="server" id="hiFixedFilter" />
