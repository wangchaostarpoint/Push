<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="C_ExternalFileList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.C_ExternalFileList" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" flag="proj"><span>项目名称 </span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
            OnClick="txtProjectName_Click" Style="width: 255px;"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span><span class="filter-block" flag="proj"><span>项目编号 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" readonly="readonly"
            class="kpms-textbox" style="width: 75px;" />
    </span></span><span class="filter-block" flag="noproj"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block" flag="noproj"><span class="filter-block-lb">任务名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">外部资料名称/编号</span>
            <span>
                <asp:TextBox ID="tbFileInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block" style="display: none"><span class="filter-block-lb">提供资料单位</span> <span>
                <asp:TextBox ID="tbFileUnit" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">专业</span><span>
                <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">资料状态</span><span>
                <zhongsoft:LightDropDownList ID="ddlFileState" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<%--<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
   
    
    <span class="filter-block"><span class="filter-block-lb">专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnAdd" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClientClick="return openEditor('2','2','');"><span>新建</span></asp:LinkButton>
    <asp:LinkButton ID="btnEdit" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClick="btnEdit_Click"><span>编辑</span></asp:LinkButton>
    <asp:LinkButton ID="btnDel" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClick="btnDel_Click"><span>删除</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <div style="overflow-y: auto; overflow-x: auto; max-height: 450px;">
        <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
            DataKeyNames="WBSID,ExecSpecialtyName,ExecSpecialtyCode" ShowExport="true" HideFieldOnExport="全部"
            runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowCommand="gvWBS_RowCommand"
            AllowFrozing="true" FrozenColNum="4" OnRowDataBound="gvWBS_RowDataBound" OnSorting="gvWBS_Sorting"
            AllowSorting="true">
            <Columns>
                <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkGridView">
                </zhongsoft:LightCheckField>
                <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </zhongsoft:LightTemplateField>

                <zhongsoft:LightTemplateField HeaderText="发起流程" ItemStyle-HorizontalAlign="Center"
                    HeaderStyle-Width="40px">
                    <ItemTemplate>
                        <asp:LinkButton ID="lkbFileDispense" runat="server" CssClass="subtoolbarlink" EnableTheming="false" OnClientClick='<%# String.Format("return startWF(\"{0}\")",Eval("WBSID")) %>' ToolTip="发起外部资料管理"><span><img id="img8" src="<%=WebAppPath %>/Themes/Images/btn_gongzuoliu.gif" alt="外部资料管理流程" width="16" height="16" /></span></asp:LinkButton>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>

                <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType"
                    Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="任务编号" DataField="RollCode" SortExpression="RollCode" Width="60px" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="任务名称" DataField="RollName" SortExpression="RollName" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="外部资料编号" DataField="WBSCode" SortExpression="WBSCode">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="外部资料名称" DataField="WBSName" SortExpression="WBSName">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="专业代字" DataField="ExecSpecialtyCode" SortExpression="ExecSpecialtyCode" Width="60px">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="专业名称" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="资料提供单位" DataField="ProvideFileUnit" SortExpression="ProvideFileUnit">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="资料状态" DataField="FileNature" SortExpression="FileNature"
                    ItemStyle-Width="70px">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="验证人" DataField="PartakerUserName" SortExpression="PartakerUserName"
                    ItemStyle-Width="70px" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="验证时间" DataField="FactCompleteTime" SortExpression="FactCompleteTime"
                    DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="70px">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="提交状态" DataField="WBSState" SortExpression="WBSState"
                    ItemStyle-Width="70px">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="接受专业" Visible="false">
                    <ItemTemplate>
                        <div runat="server" id="divRecSpe" tip="1" style="width: 100px" class="autoskip">
                        </div>
                        <input type="hidden" id="hiWBSID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>' />
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" ToolTip="查看"
                            Visible="false" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>'><span>
                        <img src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif" alt="查看" /> </span>
                        </asp:LinkButton>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
            </Columns>
        </zhongsoft:LightPowerGridView>
    </div>
    <input type="hidden" runat="server" id="hiKey" />
    <input type="hidden" runat="server" id="hiWBSTypeId" />
    <script type="text/javascript">

        $gridCheckedClientID = "<%=this.gvWBS.CheckedClientID %>";

        //定制新建、编辑、查看弹出窗口方式
        function beforeDialog(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(url, "", 850, 550, rebindGridData);
            return false;
        }

        function checkGridView(array) {
            transParamToToolBar(array, null);
        }

        function openEditor(actionType, type, bizId) {
            var json;
            if (actionType == "2") {
                var value = $("#<%=hiWBSTypeId.ClientID %>").val();
                //                
                //                if (speId == null || speId == "") {
                //                    alert("请先选择专业，再新建资料！");
                //                    return false;
                //                }
                //                else {
                json = { actionType: 2, ParamWBSTypeID: value, OrganizationID: '<%=QueryOrgID %>', ExecSpecialtyID: '<%=QuerySpecialtyID %>' };
                var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
                showDivDialog(url, "", 850, 550, rebindGridData);
                return false;
                //                }
            }
            else {
                json = { actionType: actionType, bizId: bizId, ParamWBSTypeID: type };
                var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
                showDivDialog(url, "", 850, 550, rebindGridData);
                return false;
            }
        }

        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
        //发起外部资料流程
        function startWF(wbsID) {
            var url = encodeURI("<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSExternalFile.xpdl&xpdlId=EPMSExternalFile_wp1&formId=" + '<%=FormHelper.GetFormIdByPackage("EPMSExternalFile.xpdl")%>' + "&ver=|&OrganizationID=" + '<%=QueryOrgID%>' + "&WBSID=" + wbsID + "&ProjectSpecialtyID=" + '<%=QuerySpecialtyID%>');

            window.open(url, "workspace");
            return false;
        }
        function initPagePlugin() {
            //根据是否在项目网站展示，显隐一些信息
            $('[flag="proj"]').hide();
            $('[flag="noproj"]').hide();
            <%--if ('<%=QueryOrgID %>' != '') {
                $('[flag="proj"]').hide();
            }
            else {
                $('[flag="noproj"]').hide();
            }--%>
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
