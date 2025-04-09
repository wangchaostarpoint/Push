<%@ Page Title="����������" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="PartCfg.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.PartConf" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <table width="100%">
        <tr>
            <td>
                [<b><asp:Label ID="lbProcesName" runat="server"></asp:Label></b>ϵͳ������]
                <asp:DropDownList ID="DDLParticipants" Width="200px" runat="server" OnSelectedIndexChanged="DDLParticipants_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <div id="templateTabs">
                    <ul>
                        <li><a href='#user' id='auser'>�ض��û�</a></li>
                        <li><a href='#role' id='arole'>�ض���ɫ</a></li>
                        <li><a href='#projrole' id='aprojrole'>��Ŀ��ɫ</a></li>
                    </ul>
                    <div id="user">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td class="td-m">
                                            <select id="listAssignedUsers" title="˫��ɾ��" multiple="multiple" name="lsDept" size="8"
                                                class="kpms-select" style="width: 180px">
                                            </select>
                                            <img src="/Portal/Themes/Images/btn_select.gif" onclick="assignUsers()" />
                                            <asp:LinkButton ID="btnSaveUsersConf" runat="server" CssClass="kpms-btn" OnClick="btnSaveUsersConf_Click">
                                            <span>����ָ���û�</span></asp:LinkButton>
                                            <input type="hidden" id="hiAssignedParts" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="role">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td class="td-m">
                                            ����<input style="width: 160px" id="tbAssignedDept" class="kpms-textbox" readonly="readonly"
                                                runat="server" />
                                            <img src="/Portal/Themes/Images/btn_select.gif" onclick="assignDept()" />
                                        </td>
                                        <td class="td-m">
                                            <asp:Button ID="hiBtnShowRole" runat="server" Text="��ʾ��ɫ" Style="display: none" OnClick="hiBtnShowRole_Click" />
                                            ��ɫ<asp:DropDownList ID="DDLRoles" runat="server">
                                                <asp:ListItem Value="">��ѡ��</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinkButton ID="btnAddRole" runat="server" CssClass="kpms-btn" OnClick="btnAddRole_Click">
                                            <span>��ӽ�ɫ</span></asp:LinkButton>
                                            <input type="hidden" id="hiAssignDept" runat="server" />
                                            <input type="hidden" id="hiAssignDeptRole" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-m">
                                            <select id="assignedDeptList" title="˫��ɾ��" multiple="multiple" size="8" class="kpms-select"
                                                style="width: 180px">
                                            </select>
                                        </td>
                                        <td class="td-m">
                                            <select id="assignedRoleList" disabled="disabled" multiple="multiple" size="8" class="kpms-select"
                                                style="width: 180px">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnSaveRoleConf" runat="server" CssClass="kpms-btn" OnClick="btnSaveRoleConf_Click"><span>����ָ�ɽ�ɫ</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="projrole">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Always">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td class="td-l">
                                            ��ɫ
                                        </td>
                                        <td class="td-m">
                                            <select id="unitRoleList" title="˫��ɾ��" multiple="multiple" size="8" class="kpms-select"
                                                style="width: 180px">
                                            </select>
                                            <input type="hidden" runat="server" id="hiAssignedUnitRole" />
                                            <img src="/Portal/Themes/Images/btn_select.gif" onclick="assignRole()" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            ����
                                        </td>
                                        <td class="td-m">
                                            <input style="width: 300px" id="tbClass" class="kpms-textbox" runat="server" maxlength="50" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            ����
                                        </td>
                                        <td class="td-m">
                                            <input style="width: 300px" id="tbAssembly" class="kpms-textbox" runat="server" maxlength="50" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            �洢����
                                        </td>
                                        <td class="td-m">
                                            <input style="width: 300px" id="tbProcedure" class="kpms-textbox" runat="server"
                                                maxlength="50" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnSaveUnitRole" runat="server" CssClass="kpms-btn" OnClick="btnSaveUnitRole_Click"><span>����ָ�ɽ�ɫ</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiIndex" value="0" />

    <script>
       
       function assignRole()
       {
              var param = new InputParamObject("m");
              var reObj = getRoles("<%=hiAssignedUnitRole.ClientID%>", param, "2");
                if( reObj == null ) return;
              var jsonList = reObj.buildAttrJsonList("o");
              $("#unitRoleList").empty();
              createJsonOption("unitRoleList",jsonList);
       }
 
   
 
        function assignUsers(){
              var param = new InputParamObject("m");
              var reObj = getUsers("<%=hiAssignedParts.ClientID%>", param, "");
              if( reObj == null ) return;
              var jsonList = reObj.buildAttrJsonList("o");
              $("#listAssignedUsers").empty();
              createJsonOption("listAssignedUsers",jsonList);
        }
         
        function initCustomerPlugin(){  
            $("body").css("min-width","") 
            var $tabs= $("#templateTabs").tabs({select:function(event,ui){ $("#<%=hiIndex.ClientID %>").val(ui.index)}});  
            var index=$("#<%=hiIndex.ClientID %>").val();
            if(index=="1")
              $tabs.tabs('select', 1); 
            else if(index=="2")
              $tabs.tabs('select', 2); 
            loadAssignedUsers();
            loadAssignedDeptRole();
            loadAssignedUnit();
        }
        function assignDept(){
            var param = new InputParamObject("s");
            var reObj = getOrgs("<%=hiAssignDept.ClientID%>", param, "");
            $("#<%=tbAssignedDept.ClientID%>").val(reObj.buildAttrJson("o","name"));
            <%= this.ClientScript.GetPostBackEventReference(this.hiBtnShowRole,string.Empty)%>;
        }
        
        var $assignUnitRole = new KPMSXml();
         function loadAssignedUnit(){
         
           var $hiXml = $("#<%=hiAssignedUnitRole.ClientID%>").val();
           if( $hiXml == "" ) return;
            $assignUnitRole.loadXML($hiXml);
            var jsonList = $assignUnitRole.buildAttrJsonList("o");
            createJsonOption("unitRoleList",jsonList);
            
             $("#unitRoleList").dblclick(function() {
                var id = $(this).val();
                if (id != null) {
                    $assignUnitRole.removeEntityByOption("unitRoleList","o");
                    $("#<%=hiAssignedUnitRole.ClientID%>").val($assignUnitRole.xml());
                }
            });
         
         }
        
        var $assignUsersConf = new KPMSXml();
        function loadAssignedUsers(){
            var $hiXml = $("#<%=hiAssignedParts.ClientID%>").val();
            if( $hiXml == "" ) return;
            $assignUsersConf.loadXML($hiXml);
            var jsonList = $assignUsersConf.buildAttrJsonList("o");
            createJsonOption("listAssignedUsers",jsonList);
            
             $("#listAssignedUsers").dblclick(function() {
                var id = $(this).val();
                if (id != null) {
                    $assignUsersConf.removeEntityByOption("listAssignedUsers","o");
                    $("#<%=hiAssignedParts.ClientID%>").val($assignUsersConf.xml());
                }
            });
        }
        
        var $assignDeptRoleConf = new KPMSXml();
        function loadAssignedDeptRole(){
            var $hiXml = $("#<%=hiAssignDeptRole.ClientID%>").val();
            if( $hiXml == "" ) return;
            $assignDeptRoleConf.loadXML($hiXml);
            var jsonList = $assignDeptRoleConf.buildAttrJsonList("o");
            createJsonOption("assignedDeptList",jsonList);
         
            $("#assignedDeptList").change(function(){
                $("#assignedRoleList").empty();
                getChildRole();
            }).dblclick(function(){
                var $deptId = $(this).val();
                $assignDeptRoleConf.removeEntityByOption("assignedDeptList","o");
                $("#<%=hiAssignDeptRole.ClientID%>").val($assignDeptRoleConf.xml());
                $("#assignedRoleList").empty();
            });
        }
        
        
        function getChildRole(){
            var $firstDeptId = $("#assignedDeptList").val();
            var $dept = $assignDeptRoleConf.getElementById($firstDeptId,"o");
            var $childR = $dept.childNodes;
            for(var i = 0; i< $childR.length; i++){
                createOption("assignedRoleList",$childR[i].getAttribute("name"),$childR[i].getAttribute("id"));
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
