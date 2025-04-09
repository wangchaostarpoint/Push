<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyProjTaskTree.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.OBS.MyProjTaskTree" %>
<style>
    .astyle
    {
        /*background: #1f7078;
        height: 20px;
        padding: 4px;
        font-size: 12px;
        font-weight: normal !important;
        width: 33px;*/
        color: #fff;
        margin-bottom: 3px; /*text-align: center;*/
    }
    .imp
    {
        font-weight: bold !important;
        float: none !important; /*color:Red;*/
        color: #f9a949;
    }
</style>
<div class="wp_listleft">
    <div class="wp_header">
        <div>
            <span style="font-weight: normal;"><span id="spImp">按&nbsp;<a id="agc" class="astyle"
                onclick="changeTree('Project')">工程</a>&nbsp;/ <a id="arw" class="astyle" onclick="changeTree('TaskType')">
                    任务类型</a>&nbsp;分类 </span></span>
            <div style="float: right; margin-right: 1px;">
                <a class="astyle" style="margin-left: 1px; display: none;" onclick="changeTree('Project')"
                    title="按工程分类">工程</a> <a class="astyle" style="margin-left: 1px; display: none;" onclick="changeTree('TaskType')"
                        title="按任务类型分类">任务类型</a>
            </div>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span>
                            <%--ShowLines="True"--%>
                            <asp:TreeView ID="tvProjTree" runat="server" Height="100%" Width="100%" OnSelectedNodeChanged="tvProjTree_SelectedNodeChanged"
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
<!--当前分类-->
<input type="hidden" runat="server" id="hiTreeType" value="TaskType" />
<!--上次分类-->
<input type="hidden" runat="server" id="hiLastType" value="Project" />
<input type="hidden" runat="server" id="hiArrangeType" value="" />
<asp:Button runat="server" ID="btnChangeTree" OnClick="btnChangeTree_Click" Visible="false" />
<script type="text/javascript">
    function initCustomerPlugin() {
        $(window.parent.iFrameHeight(self.frameElement.id, "left"));

        initImpTxt();
    }

    //突出显示分类信息
    function initImpTxt() {
        var txt = $('#spImp').html();
        var replaceTxt = '';
        var treeType = $('#<%=hiTreeType.ClientID %>').val();
        if(treeType == 'Project') {
            replaceTxt='工程';
        }
        else if(treeType == 'TaskType'){
            replaceTxt='任务类型';
        }
        if(replaceTxt != ''){
            $('#spImp').html(txt.replace(replaceTxt,"<span class='imp'>" + replaceTxt + "</span>"));
        }

        $('#agc').attr('title','点击按工程分类');
        $('#arw').attr('title','点击按任务类型分类');
    }

    function viewProjSite(projectPhaseId) {
        var url = '<%=ProjSiteUrl %>?ActionType=2&projectPhaseID=' + projectPhaseId;
        window.open(buildQueryUrl(url, null));
        return false;
    }

    //改变分类显示
    function changeTree(type) {
        $('#<%=hiTreeType.ClientID %>').val(type);        
        <%=Page.ClientScript.GetPostBackEventReference(this.btnChangeTree,"")%>;
    }

    function chooseTree(obj) {
        var treeType = $('#<%=hiTreeType.ClientID %>').val();
        var selectedNodeID = $("#<%=tvProjTree.ClientID %>_SelectedNode").val();
        var selectedNode = document.getElementById(selectedNodeID);
        
        if (selectedNode.href.indexOf(";") < 0) {
            var value = selectedNode.href.substring(selectedNode.href.lastIndexOf("','") + 4, selectedNode.href.lastIndexOf("'"));
            var vals = value.split('\\\\');
            var valLen = vals.length;
            var project = '';
            var phase = '';
            var task = '';

            //按工程分类下传参
            if(treeType=='Project'){
                if (valLen > 1)
                    project = vals[1];
                if (valLen > 2)
                    task = vals[2];
            }
            //按任务类型分类下传参
            else {
                if (valLen > 1)
                    task = vals[1];
                if (valLen > 2)
                    project = vals[2];
            }
            
        var allType = $('#<%=hiArrangeType.ClientID %>').val();
        if(task!=""&&allType.indexOf(task+ ",")>=0){
            configProjUsers();
            return false;
        }

            //点击更多加载树，不需要传参
            if (project == '<%=moreValue %>') {
                return true;
            }

            var param = { OrgId: project, task: task };
        }
        else {
            var param = { OrgId: '', task: '' };
            return false;
        }
        //向webPart部件传参
//        window.parent.setParam(self.frameElement.id, param);
        setDashboardParam(param,obj);

    }
        
    function configProjUsers() {
        var url = "/EPMS/List/OBS/ProjWBSList.aspx";
        var json = { actiontype: 3,IsShowHeader:1 };
        url = buildQueryUrl(url, json);
        window.open(url);
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

</script>
