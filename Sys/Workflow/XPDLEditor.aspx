<%@ Page Title="流程编辑器" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="XPDLEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.XPDLEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    `
    <link type="text/css" rel="stylesheet" href="../../Themes/Styles/zTreeStyle.css" />
    <script src="../../ui/script/zrender/esl/esl.js"></script>
    <script src="../../ui/script/xpdl/xpdleditor-pub.js"></script>
    <script src="../../ui/script/xpdl/xpdleditor.js"></script>
    <script src="../../ui/script/xpdl/xpdleditor-undo.js"></script>
    <script src="../../ui/script/jquery.layout-latest.min.js"></script>
    <script src="../../ui/script/jquery.ztree.core-3.5.js"></script>
    <style type="text/css">
        .ui-layout-pane-center
        {
            padding-top: 5px !important;
        }
        .ui-layout-pane
        {
            border-top: none !important;
            border-bottom: none !important;
        }
        .subtoolbar1
        {
            border: #cbcccd 1px solid !important;
            background: #f4f5f9 !important;
            background-image: none !important;
        }
    </style>
    <script> 
        var $xpdlBuilder = null;
        var $wfId = '<%=XPDLId %>';
        var $inputParts=<%=Participants %>;
        var $inputActs = <%= Activities%>;
        var $inputTrans = <%= Transitions%>;
        var $wfPartsOrder = <%= WfPartsOrder%>;
        var storage = window.localStorage;
        require(["../../ui/script/zrender/src/zrender", 
        "../../ui/script/zrender/src/animation/animation"],     
        function (zrender, animation) {
            // 初始化zrender
            var zr = zrender.init(document.getElementById("xpdlCanvas"));
            $xpdlBuilder = new XPDLMgr(zr); 
            $xpdlBuilder.canDrag = true;
            $xpdlBuilder.buildXPDL($wfId);
        });
        function initCustomerPlugin(){
              initXPDLEditor(); 
              $("#btnDelete").click(function(){                
                    var del = new ActivityTrans();
                    if(!isValidProp($xpdlBuilder.selectedEntity)) return;
                    del.exe(del.deleteActivity($xpdlBuilder.selectedEntity.id));
                    $xpdlBuilder.selectedEntity = null;
              });
              $("#btnUndo").click(function(){
                    undoXPDL();
              });
              $("#btnRedo").click(function(){
                    redoXPDL();
              });
              $(document).keypress(function(e) {   
                  if (e.ctrlKey && e.which == 26) { undoXPDL(); }
                  if (e.ctrlKey && e.which == 25) { redoXPDL();}
              });
        }
       
        function xpdlTreeClick(treeId, treeNode, clickFlag){   
         
            var scopeId = null;var shape = null;
            switch (clickFlag.type) {
                    case "ActivitySet": case "WorkflowProcess":
                         scopeId = clickFlag.id;    
                         moveScroll(0,0);                 
                        break;
                   case "Implementation": case "BlockActivity":
                         scopeId = $xpdlBuilder.getParent($inputActs[0],clickFlag.id);      
                    default: 
        
            }
            if($xpdlBuilder.scopeId != scopeId ){
                $xpdlBuilder.clearXPDL();
                $xpdlBuilder.buildXPDL(scopeId);
            }
            if(clickFlag.type == "Implementation" || clickFlag.type == "BlockActivity" ){
                 var actShape = $xpdlBuilder.getActShape(clickFlag.id);             
                 var s = $xpdlBuilder.focusOn(actShape.entity);  
                 moveScroll(s.style.x,s.style.y);               
            }
        }
        function save(){
            var url = "http://localhost/portal/sys/workflow/xpdleditor.aspx";
            var data = { users: [{ Id: 1, Name: "AA" }, { Id: 2, Name: "BB"}] };
            alert(JSON.stringify($inputActs));
//            $.post(url, $inputActs, function () {
//                alert("提交成功");
//            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <div id="debugText" style="display: none">
    </div>
    <div id="xpdlTreeContainer">
        <ul id="xpdlTree" class="ztree">
        </ul>
    </div>
    <div id="xpdlContainer" style="overflow: auto">
        <div id="divToolBtn" class="subtoolbar1" style="height: 26px; margin-bottom: 3px;">
            <div class="subtoolbarbg">
                <a class="subtoolbarlink" id="cStartAct"><span>
                    <img src="../../themes/images/ico_act_start.png" />开始步骤</span></a> <a class="subtoolbarlink"
                        id="cEndAct"><span>
                            <img src="../../themes/images/ico_act_end.png" />结束步骤</span></a> <a class="subtoolbarlink"
                                id="cActivity"><span>
                                    <img src="../../themes/images/ico_activity.gif" />步骤</span></a>
                <a class="subtoolbarlink" id="cBlock"><span>
                    <img src="../../themes/images/ico_blockActivity.gif" />块步骤</span></a> <a class="subtoolbarlink"
                        id="cPart"><span>
                            <img src="../../themes/images/ico_part.png" />参与人</span></a> <a class="subtoolbarlink"
                                id="btnUndo"><span>撤销</span></a> <a class="subtoolbarlink" id="btnRedo"><span>重做</span></a>
            </div>
            <div class="subtoolbarbg">
                <a class="subtoolbarlink" id="btnDelete"><span>
                    <img src="../../themes/images/btn_delete.gif" />删除</span></a>
            </div>
        </div>
        <div id="xpdlCanvas" style="width: 4200px; height: 3000px;">
        </div>
    </div>
    <div id="xpdlProperty">
        <table class="tz-table">
            <tr>
                <td colspan='2' class="tz-title">
                   基本信息
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    名称
                </td>
                <td class='td-r'>
                    <input maxlength="25" type="text" id="propname" proptype="name" class="kpms-textbox" />
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    ID
                </td>
                <td>
                    <input readonly="readonly" type="text" id="propid" proptype="id" class="kpms-textbox" />
                </td>
            </tr>
        </table>
        <table class="tz-table">
            <tr>
                <td colspan='2' class="tz-title">
                    扩展属性
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    迁入模式
                </td>
                <td class='td-r'>
                    <select id="joinType" proptype="jointype" class="kpms-ddl">
                        <option value="0">Join-XOR</option>
                        <option value="5">Join-AND</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    迁出模式
                </td>
                <td>
                    <select id="splitType" proptype="splittype" class="kpms-ddl">
                        <option value="0">Split-XOR</option>
                        <option value="5">Split-AND</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    开始模式
                </td>
                <td>
                    <select id="startmode" proptype="startmode" class="kpms-ddl">
                        <option value="0">Manual</option>
                        <option value="1">Automatic</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    完成模式
                </td>
                <td>
                    <select id="finishmode" proptype="finishmode" class="kpms-ddl">
                        <option value="0">Manual</option>
                        <option value="1">Automatic</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    参与人
                </td>
                <td>
                    <input type="text" id="performer" proptype="performer" class="kpms-textbox" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    优先级
                </td>
                <td>
                    <input type="text" id="actpri" proptype="pri" class="kpms-textbox" />
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    响应类型
                </td>
                <td>
                    <select id="resptype" proptype="resptype" class="kpms-ddl">
                        <option value="0">OneResponse</option>
                        <option value="1">AllResponse</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    选择模式
                </td>
                <td>
                    <select id="choicemode" proptype="choicemode" class="kpms-ddl">
                        <option value="0">OnlyOne</option>
                        <option value="1">All</option>
                        <option value="2">Any</option>
                        <option value="3">Specified</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    执行模式
                </td>
                <td>
                    <select id="exerespmode" proptype="exerespmode" class="kpms-ddl">
                        <option value="Manual">Manual</option>
                        <option value="Automatic">Automatic</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    允许选择参与人
                </td>
                <td>
                    <select id="partmore" proptype="partmore" class="kpms-ddl">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    自动选入参与人
                </td>
                <td>
                    <select id="addparts" proptype="addparts" class="kpms-ddl">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    关键步骤
                </td>
                <td>
                    <input type="text" id="keyact" proptype="keyact" class="kpms-textbox" />
                </td>
            </tr>
            <tr>
                <td class='td-l'>
                    排序号
                </td>
                <td>
                    <input type="text" id="actsort" proptype="sort" class="kpms-textbox" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
