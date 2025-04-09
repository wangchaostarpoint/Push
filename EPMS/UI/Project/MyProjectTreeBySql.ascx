<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyProjectTreeBySql.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Project.MyProjectTreeBySql" %>
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
    .wp_main{ border-left:none;}
</style>
<div class="wp_listleft">
    <div class="wp_header">
        <div>
            <span style="font-weight: normal;"><span id="spImp">
                <asp:Label ID="lbPlate" runat="server"></asp:Label>-项目目录树</span></span>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span>
                            <%--ShowLines="True"--%>
                            <asp:TreeView ID="tvProjTree" runat="server" Height="100%" Width="100%"
                                onclick="chooseTree(this)">
                                <SelectedNodeStyle BackColor="#F7F7F7" />
                            </asp:TreeView>
                        </span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    function initCustomerPlugin() {
        $(window.parent.iFrameHeight(self.frameElement.id, "left"));
    }

    function chooseTree(obj) {
        var selectedNodeID = $("#<%=tvProjTree.ClientID %>_SelectedNode").val();
        var selectedNode = document.getElementById(selectedNodeID);
        var param = null;
        if (selectedNode.href.indexOf(";") < 0) {
            var value = selectedNode.href.substring(selectedNode.href.lastIndexOf("','") + 4, selectedNode.href.lastIndexOf("'"));
            var vals = value.split('\\\\');
            var valLen = vals.length;
            var busiPlate = '<%=BusinessPlate %>';
            var projectType = '';
            var phase = '';
            var scaleGrade = '';
            if (busiPlate == "") {
                if (valLen > 1) {
                    busiPlate = vals[1];
                }
                if (valLen > 2) {
                    projectType = vals[2];
                }
                if (valLen > 3) {
                    phase = vals[3];
                }
                if (valLen > 4) {
                    scaleGrade = vals[4];
                }
            }
            else {
                if (valLen > 1) {
                    projectType = vals[1];
                }
                if (valLen > 2) {
                    phase = vals[2];
                }
                if (valLen > 3) {
                    scaleGrade = vals[3];
                }
            }
        }
        else {
            return false;
        }
        //向webPart部件传参
        param = { busiPlate: busiPlate, projectType: projectType, phase: phase, scaleGrade: scaleGrade };
        setDashboardParam(param, obj);
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

</script>
