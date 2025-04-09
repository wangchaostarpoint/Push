<%@ Page Title="项目待归档信息台帐" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ArchivedProjectList.aspx.cs" Inherits="Zhongsoft.Portal.DAMS.List.ACS.ArchivedProjectList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <style type="text/css">
        .divTitleContent {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 500px;
            border: 2px solid black;
            background-color: white;
            z-index: 1002;
        }
    </style>
    <table id="tableBtn" runat="server">
        <tr>
            <td>项目名称
            </td>
            <td style="width: 300px">
                <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" ResultAttr="name" SelectPageMode="Dialog"
                    SourceMode="SelectorPage" PageUrl="../../Obsolete/ProjectEntitySelector.aspx" ResultForControls="{'hiOrganizationID':'id','hiProjectCode':'ProjectCode'}" />
                <input id="hiOrganizationID" runat="server" type="hidden" />
                <input id="hiProjectCode" runat="server" type="hidden" />
            </td>
            <td>
                <asp:LinkButton runat="server" ID="btnInit" class="searchbtn" OnClick="btnInit_Click">
                                <span>查询</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnReset" class="searchbtn" OnClick="btnReset_Click" Visible="false">
                                <span>重置</span></asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:TreeView ID="treeView" runat="server" Height="100%" Width="100%" ShowLines="true"
                OnSelectedNodeChanged="treeView_SelectedNodeChanged">
                <SelectedNodeStyle BackColor="#F7F7F7" />
            </asp:TreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div id="contentTab">
        <ul>
            <li><a href="#arcInfo" id="aarcInfo" onclick="changeIndex(0)">文件管理</a></li>
            <li><a href="#dossierInfo" id="adossierInfo" onclick="changeIndex(1)">案卷管理</a></li>
        </ul>
        <div id="arcInfo">
            <div id="arcTitle" style="clear: both; margin-bottom: 30px">
                <div style="float: left">
                    <asp:LinkButton runat="server" ID="lbtnAdd" class="searchbtn" Visible="false" OnClientClick="addItem()">
                        <span>新增文件</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnBuild" class="searchbtn" OnClientClick="return checkEmpty();" OnClick="lbtnBuild_Click" Visible="false">
                        <span>组卷</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnAppendArc" class="searchbtn" OnClientClick="return openDossierDiv(this);" Visible="false">
                        <span>添加至已有卷</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnBatchEditor" class="searchbtn" OnClientClick="batchEditor();" Visible="false">
                        <span>批量修改</span>
                    </asp:LinkButton>
                </div>
                <div style="float: left">
                    <asp:RadioButtonList ID="rblFiled" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblFiled_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="2">不归档</asp:ListItem>
                        <asp:ListItem Value="0" Selected="true">未归档</asp:ListItem>
                        <asp:ListItem Value="1">已归档</asp:ListItem>
                        <asp:ListItem Value="">全部</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div id="arcContent">
                <zhongsoft:LightPowerGridView ID="gvArcList" runat="server" AutoGenerateColumns="False" UseDefaultDataSource="true" DataKeyNames="ArcFileID"
                    AllowPaging="true" PageSize="15" OnRowCommand="gvArcList_RowCommand" OnRowDataBound="gvArcList_RowDataBound" BindGridViewMethod="BindData">
                    <Columns>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
                        </zhongsoft:LightCheckField>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Width="5%">
                            <ItemTemplate>
                                <%#((GridViewRow)Container).DataItemIndex + 1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="图纸名称">
                            <ItemStyle Width="200px" />
                            <ItemTemplate>
                                <div style="width: 200px; word-break: break-all !important; white-space: normal !important;">
                                    <%#Eval("ArcFileName")%>
                                </div>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="ArcFileCode" HeaderText="图号" />
                        <zhongsoft:LightBoundField DataField="FileDate" HeaderText="文件日期" DataFormatString="{0:yyyy-MM-dd}" />
                        <zhongsoft:LightBoundField DataField="PageCnt" HeaderText="页码范围" ItemStyle-HorizontalAlign="Right" />
                        <zhongsoft:LightBoundField DataField="SubjectTerm" HeaderText="主题词" ShowToolTip="true" Width="200" /> 
                        <zhongsoft:LightBoundField DataField="TransferUserName" HeaderText="移交人" />
                        <zhongsoft:LightBoundField DataField="IsFiledText" HeaderText="归档状态" />
                        <zhongsoft:LightTemplateField HeaderText="是否归档" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" SortExpression="IsFiled">
                            <ItemTemplate>
                                <%#GetStatus(Eval("IsFiled").ToString())%>
                                <asp:LinkButton ID="lbtnPublish" runat="server" CommandName="Publish" CommandArgument='<%#Eval("ArcFileID") %>' EnableTheming="false">
						            <img title="恢复归档"  src="../../../Themes/Images/btn_back.gif" alt=""/>
                                </asp:LinkButton>
                                <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="CancelPublish" CommandArgument='<%#Eval("ArcFileID") %>' EnableTheming="false">
						            <img title="不归档" src="../../../Themes/Images/btn_finish.gif" alt=""/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" EditItemClick="editItem" DataParamFields="ArcFileID">
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false" EditItemClick="viewItem" DataParamFields="ArcFileID">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </div>
        </div>
        <div id="dossierInfo">
            <div id="dossierTitle" style="clear: both; margin-bottom: 30px">
                <div style="float: left">
                    <asp:LinkButton runat="server" ID="lbtnBatch" OnClientClick="return checksEmpty();" OnClick="lbtnBatch_Click" Visible="false">
                    <span>批量移交</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnAppend" OnClientClick="return openTitleTypeDiv(this);" Visible="false">
                    <span>追加至现有流程</span>
                    </asp:LinkButton>
                </div>
                <div style="float: left">
                    <asp:RadioButtonList ID="rblTrans" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblTrans_SelectedIndexChanged">
                        <asp:ListItem Value="0" Selected="True">未移交</asp:ListItem>
                        <asp:ListItem Value="2">移交中</asp:ListItem>
                        <asp:ListItem Value="1">已移交</asp:ListItem>
                        <asp:ListItem Value="">全部</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div id="dossierContent">
                <zhongsoft:LightPowerGridView ID="gvDossierList" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="15"
                    DataKeyNames="DossierID" ItemShowLength="15" BindGridViewMethod="BindData" UseDefaultDataSource="true" OnRowDataBound="gvDossierList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
                        </zhongsoft:LightCheckField>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="档号" DataField="DossierSearchNO" />
                        <zhongsoft:LightTemplateField HeaderText="题名">
                            <ItemStyle Width="200px" />
                            <ItemTemplate>
                                <div style="width: 200px; word-break: break-all !important; white-space: normal !important;">
                                    <%#Eval("DossierName")%>
                                </div>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ShowToolTip="true" Width="200px" />
                        <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
                        <zhongsoft:LightBoundField HeaderText="原档分类" DataField="OriginalTypeName" />
                        <zhongsoft:LightBoundField HeaderText="保管期限" DataField="SaveDeadline" />
                        <zhongsoft:LightBoundField HeaderText="保密级别" DataField="SecretLevel" />
                        <zhongsoft:LightBoundField HeaderText="移交状态" DataField="IsTransText" />
                        <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" EditItemClick="editDossier" DataParamFields="DossierID">
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false" EditItemClick="viewDossier" DataParamFields="DossierID">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </div>
        </div>
    </div>
    <%-- 现有工程原档流程信息--%>
    <div id="divTitleType" class="divTitleContent">
        <div style="text-align: right; width: 100%">
            <img onclick="closeTitleTypeDiv()" alt="关闭" src="/portal/Themes/Images/btn_cancel.gif" />
        </div>
        <div style="width: 100%">
            <table style="width: 100%; height: 100%; text-align: center;">
                <tr>
                    <td>
                        <a runat="server" onclick=""></a>
                    </td>
                </tr>
                <%=GetWorkFlow() %>
            </table>
        </div>
    </div>
    <%-- 现有案卷信息--%>
    <div id="divDossier" class="divTitleContent">
        <div style="text-align: right; width: 100%">
            <img onclick="closeDossierDiv()" alt="关闭" src="/portal/Themes/Images/btn_cancel.gif" />
        </div>
        <div style="width: 100%">
            <table style="width: 100%; height: 100%; text-align: center;">
                <tr>
                    <td>
                        <a runat="server" onclick=""></a>
                    </td>
                </tr>
                <%=GetDossier() %>
            </table>
        </div>
    </div>
    <%--原档类型Code--%>
    <input id="hiOriginalTypeCode" type="hidden" runat="server" />
    <%--原档类型Name--%>
    <input id="hiOriginalTypeName" type="hidden" runat="server" />
    <%--tab页签索引--%>
    <input id="hiIndex" type="hidden" runat="server" />
    <asp:LinkButton runat="server" ID="btnQuery1" class="searchbtn" OnClick="btnQuery1_Click" Visible="false">
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnQuery2" class="searchbtn" OnClick="btnQuery2_Click" Visible="false">
    </asp:LinkButton>
    <script type="text/javascript" language="javascript"> 
        //改变当前选项卡的索引
        function changeIndex(index) {
            $("#<%=hiIndex.ClientID%>").val(index);
        }
        function initCustomerPlugin() {
            var index = $("#<%=hiIndex.ClientID%>").val();
            $("#contentTab").tabs({ active: index });
        }
        $gvArcCheckedClientID = "<%=gvArcList.CheckedClientID %>";
        function checkEmpty() {
            if ($gvArcCheckedClientID != undefined) {
                var array = buildGirdRowIds($gvArcCheckedClientID);
                if (array.length == 0) {
                    alert("请选择文件信息！");
                    return false;
                } else {
                    return true;
                }
            }
        }
        $gvDossierCheckedClientID = "<%=gvDossierList.CheckedClientID %>";
        function checksEmpty() {
            if ($gvDossierCheckedClientID != undefined) {
                var array = buildGirdRowIds($gvDossierCheckedClientID);
                if (array.length == 0) {
                    alert("请选择案卷！");
                    return false;
                } else {
                    return true;
                }
            }
        }
        function addItem() {
            var url = buildQueryUrl("<%=WebAppPath %>/DAMS/List/ACS/ProjOrigArcFileEditor.aspx", { actionType: 2, sessionid: buildGuid(), projectId: "<%=ProjectId%>", originalTypeCode: $("#<%=hiOriginalTypeCode.ClientID%>").val() });
            showDivDialog(encodeURI(url), null, 1000, 800, callBackItem);
            return false;
        }
        function editItem(ArcFileID) {
            var url = buildQueryUrl("<%=WebAppPath %>/DAMS/List/ACS/ProjOrigArcFileEditor.aspx", { actionType: 3, bizId: ArcFileID, sessionid: buildGuid() });
            showDivDialog(encodeURI(url), null, 1000, 800, callBackItem);
            return false;
        }
        function viewItem(ArcFileID) {
            var url = buildQueryUrl("<%=WebAppPath %>/DAMS/List/ACS/ProjOrigArcFileEditor.aspx", { actionType: 1, bizId: ArcFileID, sessionid: buildGuid() });
            showDivDialog(encodeURI(url), null, 1000, 800, null);
            return false;
        }
        function editDossier(DossierID) {
            var url = buildQueryUrl("<%=WebAppPath %>/DAMS/List/ACS/ProjOrigEditor.aspx", { actionType: 3, bizId: DossierID, sessionid: buildGuid(),IsBuild:1 });
            showDivDialog(encodeURI(url), null, 1000, 800, callBackDossier);
            return false;
        }
        function viewDossier(DossierID) {
            var url = buildQueryUrl("<%=WebAppPath %>/DAMS/List/ACS/ProjOrigEditor.aspx", { actionType: 1, bizId: DossierID, sessionid: buildGuid() });
            showDivDialog(encodeURI(url), null, 1000, 800, null);
            return false;
        }
        function batchEditor() {
            var array = buildGirdRowIds($gvArcCheckedClientID);
            if (array.length == 0) {
                alert("请选择文件信息！");
                return false;
            }
            else {
                var url = buildQueryUrl("<%=WebAppPath %>/DAMS/List/ACS/ProjOrigCommEditor.aspx", { actionType: 3, array: array });
                showDivDialog(encodeURI(url), null, 600, 400, null);
                return false;
            }
        }
        function openTitleTypeDiv(obj) {
            $('#divTitleType').css({ top: $(obj).offset().top, left: $(obj).offset().left + 120 }).toggle('slide');
            return false;
        }
        function closeTitleTypeDiv() {
            document.getElementById('divTitleType').style.display = 'none';
        }
        function openDossierDiv(obj) {
            $('#divDossier').css({ top: $(obj).offset().top, left: $(obj).offset().left + 120 }).toggle('slide');
            return false;
        }
        function closeDossierDiv() {
            document.getElementById('divDossier').style.display = 'none';
        }
        //打开流程页面
        function openUrl(formId, prcInstId, actInstId) {
            var url = "<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx?formId=" + formId + "&actiontype=3&prcinstid=" + prcInstId + "&actinstid=" + actInstId;
            window.open(url);
        }
        //将选择的流程追加到现在的流程中
        function appendNowWorkFlow(formId, prcInstId, actInstId, transferId) {
            var array = buildGirdRowIds($gvDossierCheckedClientID);
            $.ajax({
                type: 'POST',
                url: 'ArchivedProjectList.aspx',
                dataType: 'text',
                async: true,
                data: { asyfunc: "AppendToWorkFlow", transferId: transferId, array: array }
            });
            openUrl(formId, prcInstId, actInstId);
        }
        //将选择的文件信息追加到现在的案卷中
        function appendNowDossier(dossierId) {
            var array = buildGirdRowIds($gvArcCheckedClientID);
            $.ajax({
                type: 'POST',
                url: 'ArchivedProjectList.aspx',
                dataType: 'text',
                async: true,
                data: { asyfunc: "AppendToDossier", dossierId: dossierId, array: array }
            });
            editDossier(dossierId);
        }
        //查看附件详细信息
        function viewDetail(bid, pid) {
            var url = "<%=WebAppPath %>/DAMS/List/ACS/WorkFlowAttachment.aspx?actionType=1&bid=" + bid + "&pid=" + pid;
            showDivDialog(url, "", "900", "600", null);
            return false;
        }
        function callBackItem() {
            <%=Page.GetPostBackEventReference(this.btnQuery1,"") %>;
        }
        function callBackDossier() {
            <%=Page.GetPostBackEventReference(this.btnQuery2,"") %>;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
