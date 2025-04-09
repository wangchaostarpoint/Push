<%@ Page Title="表单管理" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="FormManager.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormManager" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">表单类型</span> <span>
        <asp:DropDownList runat="server" ID="ddlIsXForm" class="kpms-ddlsearch"
            EnableTheming="false">
                    <asp:ListItem Value="">全部</asp:ListItem>
                    <asp:ListItem Value="0">定制表单</asp:ListItem>
                    <asp:ListItem Value="1"> 自定义表单</asp:ListItem>
                </asp:DropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">表单名称</span> <span>
        <asp:TextBox ID="tbFormName" MaxLength="20" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
<div>
    <asp:TreeView ID="treeModule" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeModule_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="formList" DataKeyNames="objectId" runat="server"
        AutoGenerateColumns="False" AllowPaging="True" PageSize="12" UseDefaultDataSource="true"
        Width="100%" FooterStyle-HorizontalAlign="Center" OnRowCommand="formList_RowCommand"
        OnRowDataBound="formList_RowDataBound" BindGridViewMethod="DataGridBind">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="FormId" HeaderText="Id" ItemStyle-Width="30px"></asp:BoundField>
            <asp:BoundField DataField="FormCode" HeaderText="表单编号" ItemStyle-Width="100px" />
            <zhongsoft:LightBoundField DataField="FormName" HeaderText="表单名称" HeaderStyle-Width="200px"
                ItemStyle-Width="200px" EditItemClick="viewForm" DataParamFields="PackageName,XPDLID,FormId,PrimaryVersion,MinorVersion">
            </zhongsoft:LightBoundField>
            <asp:BoundField DataField="FormType" HeaderText="所属模块" ItemStyle-Width="100px" />
            <asp:TemplateField HeaderText="表单类型" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                <ItemTemplate>
                    <%#GetFormIsXForm(Eval("IsXForm").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Sort" HeaderText="排序" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="表单状态" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%#GetFormIsPublish(Eval("Flag").ToString())%>
                    <asp:LinkButton ID="lbtnPublish" runat="server" CommandName="Publish" CommandArgument='<%#Eval("objectId") %>'
                        EnableTheming="false">
						<img title="发布表单"  src="../../Themes/Images/btn_finish.gif" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="CancelPublish" CommandArgument='<%#Eval("objectId") %>'
                        EnableTheming="false">
						<img title="取消发布" src="../../Themes/Images/btn_back.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="表单权限" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%#GetFormPermission(Eval("IsPublic").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField HeaderText="权限" ImageUrl="~/Themes/Images/btn_lock.gif"
                CommandName="ViewACL" EditItemClick="editACL" DataParamFields="objectId,formName" />
            <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditData" CommandArgument='<%#Eval("objectId") %>'
                        EnableTheming="false">
						<img title="编辑" src="../../Themes/Images/btn_dg_edit.gif"  onclick="return editList('<%#Eval("objectId") %>')"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiPublishIds" />
    <script language="javascript">


        $gridCheckedClientID = "<%=formList.CheckedClientID %>";

        function customSetEnableScope(rowIds) {
            var $single = $("[title!='编辑'][EnableScope='1']");
            var $hasSelect = $("[title!='删除'][EnableScope='2']");
            var $edit = $("[title='编辑'][EnableScope='1']").hide();
            var $delete = $("[title='删除'][EnableScope='2']").hide();
            var publishIds = $("#<%=hiPublishIds.ClientID %>").val();
            if (rowIds.length == 0) {
                $single.hide();
                $hasSelect.hide();
                $edit.hide();
                $delete.hide();
            }
            else if (rowIds.length == 1) {
                $single.show('slide');
                $hasSelect.show('slide');
                if (publishIds.indexOf(rowIds[0]) >= 0) {
                    $edit.hide();
                    $delete.hide();
                }
                else {
                    $delete.show('slide');
                    $edit.show('slide');
                }
            }
            else {
                $single.hide();
                $hasSelect.show('slide');
                $edit.hide();
                var show = true;
                for (var i = 0; i < rowIds.length; i++) {
                    if (publishIds.indexOf(rowIds[i]) >= 0) {
                        show = false;
                    }
                }
                if (show) {
                    $delete.show('slide');
                }
                else {
                    $delete.hide();
                }
            }
        }

        function editList(bizId) {
            var url = buildBizUrl(3, bizId, "Sys/Workflow/CustomXPDLEditor.aspx", null);
            window.open(url);
            return false;
        }

        function viewForm(packageName, xpdlId, formId, pver, mver) {
            var url = buildQueryUrl("Sys/Workflow/FormDetail.aspx",
            { actionType: 2, packageName: packageName, xpdlId: xpdlId, formId: formId, ver: pver + "|" + mver });
            window.open(url);
            return false;
        }

        function setCtrl(objId, formName) {
            var url = buildBizUrl("3", objId, "sys/workflow/FormStatusEditor.aspx", { secObjId: objId, secObjName: encodeURI(formName) });
            return checkReturn(showModal(url, null, 900, 600));
        }

        function editXPDL(packName, xpldId) {
            var url = buildQueryUrl("sys/workflow/xpdleditor.aspx", { packName: packName, xpdlId: xpldId });
            window.open(url);
            return false;
        }

        function editACL(objId, formName) {
            var url = buildQueryUrl("sys/Acl/AclMgr.aspx", { secObjId: objId, secObjName: encodeURI(formName), ObjSecurityType: "<%=ObjectSecurityType.Form %>" });
            showModal(url, null, 980, 590);
            return false;
        }


        function editParticipant(packageName, xpdlId) {
            var url = buildQueryUrl("sys/Workflow/partCfg.aspx", { "PackageName": packageName, "XPDLID": xpdlId });
            showModal(encodeURI(url), null, 650, 450);
            return false;
        }

        function editCondition(formId, formName, packageName, xpdlId) {
            var url = buildQueryUrl("sys/Workflow/ConditionCfg.aspx", { FormId: formId, FormName: formName, PackageName: packageName, XPDLID: xpdlId });
            showModal(encodeURI(url), null, 800, 500);
            return false;
        }

        function editRule(packageName, xpdlId) {
            var url = buildQueryUrl("sys/Workflow/FormRuleMapping.aspx", { PackageName: packageName, XPDLID: xpdlId });
            showModal(encodeURI(url), null, 800, 500);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
