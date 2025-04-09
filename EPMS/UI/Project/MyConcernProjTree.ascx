<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyConcernProjTree.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.MyConcernProjTree" %>
<style>
    .astyle
    {
        background: #1f7078;
        height: 20px;
        padding: 4px;
        font-size: 12px;
        font-weight: normal !important;
        width: 33px;
        color: #fff;
        margin-bottom: 3px; /*text-align: center;*/
    }
    .aImp
    {
        color: #fff;
        margin-bottom: 3px;
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
            <span style="font-weight: normal;"><span id="spImp">我&nbsp;<a id="afz" class="aImp"
                onclick="changeProj('Manage')">负责</a>&nbsp;/ <a id="agz" class="aImp" onclick="changeProj('Concern')">
                    关注</a>&nbsp;的项目 </span></span>
            <div style="float: right;">
                <a class="astyle" style="margin-left: 3px; display: none;" onclick="changeProj('Manage')">
                    负责</a> <a class="astyle" style="margin-left: 3px; display: none;" onclick="changeProj('Concern')">
                        关注</a> <a class="astyle" title="添加关注项目" style="margin-left: 0px;" onclick="batchAddProj()">
                            <img src="../../Themes/Images/like_light.png" /></a>
                <asp:ImageButton ID="ibtnSort" runat="server" ImageUrl="/Portal/themes/images/sort_s.png"
                    ToolTip="立项时间 阶段倒序" Style="margin-bottom: 1px;" OnClick="ibtnSort_Click" />
            </div>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        项目编号/名称
                        <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="80">
                        </zhongsoft:LightTextBox>&nbsp;&nbsp;<asp:LinkButton ID="lbtnSearch" runat="server"
                            OnClick="lbtnSearch_Click" EnableTheming="false">查询</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                            <asp:TreeView ID="tvProjTree" runat="server" Height="100%" Width="100%" ShowLines="True"
                                onclick="return selectProj(this)">
                                <SelectedNodeStyle BackColor="#F7F7F7" />
                            </asp:TreeView>
                            &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbShowMore" runat="server" OnClick="lbShowMore_Click"
                                Visible="false" EnableTheming="false">更多…</asp:LinkButton>
                        </span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<asp:LinkButton runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" Visible="false"></asp:LinkButton>
<asp:LinkButton runat="server" ID="btnChangeProj" OnClick="btnChangeProj_Click" Visible="false"></asp:LinkButton>
<input type="hidden" id="hiProjectID" runat="server" />
<input type="hidden" id="hiSetType" runat="server" />
<input type="hidden" id="hiProjViewType" runat="server" value="Manage" />
<!-- 选择关注项目xml-->
<input type="hidden" runat="server" id="hiProjXML" />
<!-- 添加关注项目后台调用-->
<asp:Button runat="server" ID="btnAddProjs" OnClick="btnAddProjs_Click" Visible="false" />
<script type="text/javascript">
    function initCustomerPlugin() {
        $(window.parent.iFrameHeight(self.frameElement.id, "left"));

         initImpTxt();
    }

    //突出显示分类信息
    function initImpTxt() {
        var txt = $('#spImp').html();
        var replaceTxt = '';
        var treeType = $('#<%=hiProjViewType.ClientID %>').val();
        if(treeType == 'Manage') {
            replaceTxt='负责';
        }
        else if(treeType == 'Concern'){
            replaceTxt='关注';
        }
        if(replaceTxt != ''){
            $('#spImp').html(txt.replace(replaceTxt,"<span class='imp'>" + replaceTxt + "</span>"));
        }

        $('#afz').attr('title','点击显示我负责的项目');
        $('#agz').attr('title','点击显示我关注的项目');
    }

    //关注、负责项目切换
    function changeProj(projType)
    {
        $("#<%=hiProjViewType.ClientID %>").val(projType);      
        <%=Page.ClientScript.GetPostBackEventReference(this.btnChangeProj,"")%>;
        var param = { ProjViewType:projType,OrganizationID:"",RoleName:'<%=RoleName %>'};
        setDashboardParam(param,$('#spImp'));
    }
    
    //批量添加关注项目
    function batchAddProj(){
        var param = new InputParamObject("m");
        getDivProjectNew('<%=hiProjXML.ClientID %>',param,'',addProjs);
    }
    //将选择的项目添加到我的关注项目中
    function addProjs(){
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddProjs,"")%>;
    }

    //添加、移除关注项目
    function addOrRemoveProj(flg,proj,projCode) {     
        var tip = "您确认将"+projCode+"项目添加到我的关注项目中吗？";
        if (flg == "Remove") {
            tip = "您确认将"+projCode+"项目从我的关注项目中移除吗？";
        }
        if (confirm(tip)) {
            $("#<%=hiProjectID.ClientID %>").val(proj);
            $("#<%=hiSetType.ClientID %>").val(flg);
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUpdate,"")%>;
        }
    }
    
    //查看项目网站
    function viewProjSite(projectPhaseId) {
            var url = '<%=ProjSiteUrl %>?ActionType=2&projectPhaseID=' + projectPhaseId;
            window.open(buildQueryUrl(url, null));
            return false;
        }

    //选中项目
    function selectProj(obj) {
        var selectedNodeID = $("#<%=tvProjTree.ClientID %>_SelectedNode").val();
        var selectedNode = document.getElementById(selectedNodeID);
        var param;
        if (selectedNode.href.indexOf(";") < 0) {
            var value = selectedNode.href.substring(selectedNode.href.lastIndexOf("','")+4, selectedNode.href.lastIndexOf("'"));
            var type=$("#<%=hiProjViewType.ClientID %>").val();
            param = { OrganizationID: value ,ProjViewType:type};
        }
        else {
            return false;
        }
        setDashboardParam(param,obj);
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
