<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyPartProjects.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.MyPartProjects" %>
<style>
    .astyle
    {
        color: #fff;
        margin-bottom: 3px;
    }
    .imp
    {
        font-weight: bold !important;
        float: none !important;
        color: #f9a949;
    }
    .wp_main
    {
        border-left: none;
    }
    .wp_listleft
    {
        min-height: 200px;
        border: 1px solid #7bbec5;
        padding: 5px;
    }
    .siteImg
    {
        float: left;
        padding-right: 2px;
    }
</style>
<div class="wp_listleft">
    <div class="wp_header">
        <div>
            <span style="font-weight: normal;"><span id="spImp">
                <asp:Label ID="lbPlate" runat="server"></asp:Label></span></span>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr id="change">
                    <td>
                        <a id="aChangeRole" style="display: none; color: White">
                            <label id="lbChangRole" onmouseover="showSetInfo('divChangeRole')">
                                【切换项目角色】</label></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                            <%--ShowLines="True"--%>
                            <asp:TreeView ID="tvProjTree" runat="server" Height="100%" Width="100%" onclick="return chooseTree(this)">
                                <SelectedNodeStyle BackColor="#F7F7F7" />
                            </asp:TreeView>
                        </span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<input type="hidden" runat="server" id="hiRole" />
<div id="divChangeRole" class="wp_main" style="display: none">
    <asp:DataList runat="server" ID="dlRepeater" RepeatColumns="2">
        <ItemTemplate>
            <asp:Button ID="btnRoleName" runat="server" OnClick="btnRoleName_Click" flag="changeRole"
                key='<%#Eval("RoleJC")%>' Text='<%#Eval("RoleName")%>' Style="text-decoration: underline;
                border: 0; background-color: White; cursor: pointer" EnableTheming="false"></asp:Button>
        </ItemTemplate>
    </asp:DataList>
</div>
<script type="text/javascript">
    function initCustomerPlugin() {
        //Del by xuning 2015-08-31
        //在工作台加载时出现滚动条
        $(window.parent.iFrameHeight(self.frameElement.id, "left"));

        var role = '<%=thisRoleName %>';
        if (role == null || role == "") {
            role = '<%=RoleName %>';
        }
        var param = { RoleName: role, OrganizationID: '00000000-0000-0000-0000-000000000000' };
        setDashboardParam(param, $('#lbChangRole'));
    }

    function chooseTree(obj) {
        var selectedNodeID = $("#<%=tvProjTree.ClientID %>_SelectedNode").val();
        var selectedNode = document.getElementById(selectedNodeID);
        var orgID;
        if (selectedNode.href.indexOf(";") < 0) {
            var value = selectedNode.href.substring(selectedNode.href.lastIndexOf("','") + 4, selectedNode.href.lastIndexOf("'"));
            var vals = value.split('\\\\');
            var valLen = vals.length;
            orgID = vals[1];
        }
        else {
            return false;
        }
        //setDashboardTab("OutDoc");
        //向webPart部件传参
        if (orgID == undefined || orgID == null) {
            orgID = "";
        }
        //add by xuning 2015-08-31
        //角色控制放到了我参与的项目树中，在点击树节点相应右侧页面时传参RoleName
        var role = '<%=thisRoleName %>';
        if (role == null || role == "") {
            role = '<%=RoleName %>';
        }
        var param = { RoleName: role, OrganizationID: orgID };
        setDashboardParam(param, obj);
        return false;
    }

    //重写标准的事件，使得展开折叠节点时调用initCustomerPlugin()
    function TreeView_ToggleNode(data, index, node, lineType, children) {
        var img = node.childNodes[0];
        var newExpandState;
        try {
            if (children.style.display == "none") {
                children.style.display = "block";
                newExpandState = "e";
                if ((typeof (img) != "undefined") && (img != null)) {
                    if (lineType == "l") {
                        img.src = data.images[15];
                    }
                    else if (lineType == "t") {
                        img.src = data.images[12];
                    }
                    else if (lineType == "-") {
                        img.src = data.images[18];
                    }
                    else {
                        img.src = data.images[5];
                    }
                    img.alt = data.collapseToolTip.replace(/\{0\}/, TreeView_GetNodeText(node));
                }
            }
            else {
                children.style.display = "none";
                newExpandState = "c";
                if ((typeof (img) != "undefined") && (img != null)) {
                    if (lineType == "l") {
                        img.src = data.images[14];
                    }
                    else if (lineType == "t") {
                        img.src = data.images[11];
                    }
                    else if (lineType == "-") {
                        img.src = data.images[17];
                    }
                    else {
                        img.src = data.images[4];
                    }
                    img.alt = data.expandToolTip.replace(/\{0\}/, TreeView_GetNodeText(node));
                }
            }
            initCustomerPlugin();
        }
        catch (e) { }
        data.expandState.value = data.expandState.value.substring(0, index) + newExpandState + data.expandState.value.slice(index + 1);
    }
    function viewProjSite(projectPhaseId) {
        var url = '<%=ProjSiteUrl %>?organizationID=' + projectPhaseId;
        window.open(buildQueryUrl(url, null));
        return false;
    }

    //加载div默认事件
    function initEvent(div) {
        var pX; var pY;
        pX = $('#change').offset().left + 1;
        pY = $('#change').offset().top + $('#change').outerHeight() + 1;

        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            title: "选择项目角色",
            resizable: false,
            autoOpen: false,
            minHeight: 100,
            minWidth: 100,
            width: 180,
            modal: true,
            //改变位置todo控件值改变，重新绑定
            position: [pX, pY],
            buttons: {
            //                "关闭": function () {
            //                    $(this).dialog("close");
            // }
        }
    });
}

//弹出对应层
function showSetInfo(div) {
    initEvent('divChangeRole');

    $("#" + div).dialog('open');
    $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
    return false;
}

</script>
