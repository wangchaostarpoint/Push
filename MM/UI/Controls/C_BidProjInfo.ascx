<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_BidProjInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_BidProjInfo" %>
<div class="wp_listleft">
    <div class="wp_header">
        <div>
            <span><a onclick="" style="color: White">全院项目投标情况</a></span>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <zhongsoft:LightPowerGridView runat="server" ID="gvBidProj" AllowPaging="false" PageSize="3"
                UseDefaultDataSource="true" AutoGenerateColumns="false" ShowFooter="true" ShowExport="false"
                OnRowDataBound="gvBidProj_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField HeaderText="业务板块" DataField="NAME" ItemStyle-HorizontalAlign="left">
                    </zhongsoft:LightBoundField>
                    <%--<zhongsoft:LightBoundField HeaderText="投标<br/>项数" DataField="BID" ItemStyle-HorizontalAlign="Right"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="投标<br/>项数" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <a onclick='viewBidInfo()' target="_blank">
                                <asp:Label ID="lbBidNum" Text='<%#Eval("BID") %>' runat="server"></asp:Label></a>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%--<zhongsoft:LightBoundField HeaderText="中标<br/>项数" DataField="NOTBID" ItemStyle-HorizontalAlign="Right"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="中标<br/>项数" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <a onclick='viewReBidInfo()' target="_blank">
                                <asp:Label ID="lbReBidNum" Text='<%#Eval("NOTBID") %>' runat="server"></asp:Label></a>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%-- <zhongsoft:LightBoundField HeaderText="未揭标" DataField="NOTRESULT" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="未揭标" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <a onclick='viewNotInfo()' target="_blank">
                                <asp:Label ID="lbNot" Text='<%#Eval("NOTRESULT") %>' runat="server"></asp:Label></a>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="中标率" DataField="" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </div>
    </div>
</div>
<script>

    //查看投标项目信息
    function viewBidInfo() {
        var param = { "secId": "AE35002E-906A-4EF2-BBAE-AE350763E224", "flag": '1' };
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", param);
        showModal(url, null, 1080, 600);
        return false;
    }
    //查看中标项目信息
    function viewReBidInfo() {
        var param = { "secId": "AE35002E-906A-4EF2-BBAE-AE350763E224", "bidResult": '0' };
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", param);
        showModal(url, null, 1080, 600);
        return false;
    }
    //查看未揭标项目信息
    function viewNotInfo() {
        var param = { "secId": "AE35002E-906A-4EF2-BBAE-AE350763E224", "flag": '1', "id": '20' };
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx", param);
        showModal(url, null, 1080, 600);
        return false;
    }
</script>
