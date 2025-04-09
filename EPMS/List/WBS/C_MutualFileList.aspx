<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="C_MutualFileList.aspx.cs" Title="接口提资" Inherits="Zhongsoft.Portal.EPMS.List.WBS.C_MutualFileList" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnAdd" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClientClick="return openEditor('2','2','');"><span>新建</span></asp:LinkButton>
    <asp:LinkButton ID="btnEdit" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClick="btnEdit_Click"><span>编辑</span></asp:LinkButton>
    <asp:LinkButton ID="btnDel" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClick="btnDel_Click"><span>删除</span></asp:LinkButton>
    <asp:LinkButton ID="lbtnStartWF" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClientClick="return startWF()" Visible="false"><span>发起互提资料提交流程</span></asp:LinkButton>
</asp:Content>
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
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">提出任务名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">资料名称/编号</span>
            <span>
                <asp:TextBox ID="tbFileInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                    EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">提资专业</span><span>
                <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">提交状态</span><span>
                <zhongsoft:LightDropDownList ID="ddlWBSState" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block" style="display: none"><span class="filter-block-lb">是否计划</span><span>
                <zhongsoft:LightDropDownList ID="ddlIsPlan" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                    <asp:ListItem Value="">全部</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <style>
        body, html {
            overflow: hidden;
        }
    </style>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
        DataKeyNames="WBSID,ExecSpecialtyCode,ExecSpecialtyName" ShowExport="true" HideFieldOnExport="全部"
        runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowCommand="gvWBS_RowCommand"
        OnRowDataBound="gvWBS_RowDataBound" OnSorting="gvWBS_Sorting" AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="发起流程" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbFileDispense" runat="server" CssClass="subtoolbarlink" EnableTheming="false" OnClientClick='<%# String.Format("return startMutualFileWF(\"{0}\")",Eval("WBSID")) %>' ToolTip="发起专业间互提资料单"><span><img id="img8" src="<%=WebAppPath %>/Themes/Images/btn_gongzuoliu.gif" alt="互提资料提交流程" width="16" height="16" /></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType"
                Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="名称" HeaderStyle-Width="180px">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openWBSDetail(\"{0}\")", Eval("WBSID")) %>'
                        EnableTheming="false" ForeColor="Blue" ToolTip='<%#Eval("WBSName")%>'><span> <%#Eval("WBSName").ToString().Length >9 ? Eval("WBSName").ToString().Substring(0, 8) + "..." : Eval("WBSName")%></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="提交人" DataField="WBSOwnerName" SortExpression="WBSOwnerName" Width="70px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="校核人">
                <ItemTemplate>
                    <input type="hidden" id="hiWBSID" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>' />
                    <span wbsid='<%#Eval("WBSID") %>'><%#GetCheckUserName(Eval("WBSID").ToString()) %></span>
                </ItemTemplate>
                <ItemStyle Width="70px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="提资专业代字" DataField="ExecSpecialtyCode" SortExpression="ExecSpecialtyCode" Width="50px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提资专业名称" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提资任务编号" DataField="RollCode" SortExpression="RollCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提资任务名称" DataField="RollName" SortExpression="RollName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="接收专业" DataField="RecSpe" SortExpression="RecSpe"
                ShowToolTip="true" ItemStyle-Width="80px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料类别" DataField="FileImportance" SortExpression="FileImportance" Width="60px"
                Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料状态" DataField="FileNature" SortExpression="FileNature"
                ItemStyle-Width="70px" />
            <zhongsoft:LightBoundField HeaderText="提交状态" DataField="WBSState" SortExpression="WBSState" Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划提交时间" DataField="PlanCompleteTime" SortExpression="PlanCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际提交时间" DataField="FactCompleteTime" SortExpression="FactCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName"
                ShowToolTip="true" ItemStyle-Width="80px" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" ToolTip="查看"
                        CommandName="view" Visible="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>'><span>
                        <img src="<%=WebAppPath %>/Themes/Images/btn_dg_view.gif" alt="查看" /> </span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <input type="hidden" runat="server" id="hiKey" />
    <input type="hidden" runat="server" id="hiWBSTypeId" />
    <script type="text/javascript">

        $gridCheckedClientID = "<%=GridViewList.CheckedClientID %>";

        function initPagePlugin() {
            getWBSChecker();

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

        function openWBSDetail(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSEditor.aspx", { actionType: 1, bizid: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false
        }

        //定制新建、编辑、查看弹出窗口方式
        function beforeDialog(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(url, "", 850, 550, rebindGridData);
            return false;
        }
        function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }
        //获取任务校核人
        function getWBSChecker() {
            var $ids = "";
            $("#<%=gvWBS.ClientID %> span[wbsid]").each(function () {
                $ids += $(this).attr("wbsid") + "|";
            });
            $.post("C_RollList.aspx",
                { asyfunc: "GetWBSChecker", wbsIdList: $ids },
                function (res) {
                    try {
                        var $l = eval('(' + res + ')');
                        $("#<%=gvWBS.ClientID %> span[wbsid]").each(function () {
                            var $wbsid = $(this).attr("wbsid");
                            for (var i = 0; i < $l.length; i++) {
                                var $id = $l[i][0];
                                var $name = $l[i][1];
                                if ($wbsid == $id) {
                                    if ($name == "")
                                        $(this).html("");
                                    else {
                                        $(this).html($name);
                                    }
                                }
                            }
                        });
                    } catch (ex) {

                    }
                }
            );
        }

        function openEditor(actionType, type, bizId) {
            var json;
            if (actionType == "2") {
                var value = $("#<%=hiWBSTypeId.ClientID %>").val();
                json = { actionType: 2, ParamWBSTypeID: value, OrganizationID: '<%=QueryOrgID %>', ExecSpecialtyID:'<%=QuerySpecialtyID %>' };
                var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
                showDivDialog(url, "", 850, 550, rebindGridData);
                return false;
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

        //发起流程
        function startWF() {

            var checkValue = $("input[CheckGroupFlag = 'gvWBS'][flag='_hiArray']").val();
            var url = "";
            var wbsID = "";
            if (checkValue.length > 40) {
                alert("请勾选单一资料进行编辑");
            } else if (checkValue == "[]") {
                url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                    actionType: 2, packageName: 'EPMSMutualFile.xpdl', xpdlId: 'EPMSMutualFile_wp1', formId: 171, ver:
                        '|', organizationID: '<%=hiKey.Value%>'
                });
            } else {
                url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                    actionType: 2, packageName: 'EPMSMutualFile.xpdl', xpdlId: 'EPMSMutualFile_wp1', formId: 171, ver:
                        '|', organizationID: '<%=hiKey.Value%>', wbsID: checkValue.replace('["', '')
                            .replace('"]', '')
                });

            }
            window.open(url);
            return false;
        }

        //modified by biye20210219 发起互提资料提交流程
        function startMutualFileWF(wbsID) {
            var url = encodeURI("<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSMutualFile.xpdl&xpdlId=EPMSMutualFile_wp1&formId=" + '<%=FormHelper.GetFormIdByPackage("EPMSMutualFile.xpdl")%>' + "&ver=|&OrganizationID=" + '<%=QueryOrgID%>' + "&WBSID=" + wbsID + "&ProjectSpecialtyID=" + '<%=QuerySpecialtyID%>');

            window.open(url, "workspace");
            return false;
        }
    </script>
    <script type="text/javascript">

        function checkAllLightCheckField(self, clickfun, postfun) {

            var groupFlag = $(self).parent().attr('CheckGroupFlag');
            var $hidden = $("input[CheckGroupFlag = '" + groupFlag + "'][flag='_hiArray']");
            var arry = new Array();
            if ($hidden.val() != "") {
                arry = jQuery.parseJSON($hidden.val());
            }
            var checkAll = self.checked;
            var delArry = new Array();
            $("[CheckGroupFlag='" + groupFlag + "'][flag='check']").each(function () {

                if (!$(this).find('input')[0].disabled) {
                    $(this).find('input')[0].checked = checkAll;
                    var rowId = $(this).closest("tr").attr('rowId');
                    if (rowId != undefined) {
                        if (checkAll) {
                            if ($.inArray(rowId, arry) == -1) {
                                arry.push(rowId);
                            }
                        } else {
                            if ($.inArray(rowId, arry) != -1) {
                                delArry.push(rowId);
                            }
                        }
                    }
                }
            })
            if (!checkAll) {
                for (var i = 0; i < delArry.length; i++) {
                    arry = $.grep(arry, function (value) { return value != delArry[i]; });
                }
            }
            $hidden.val(JSON.stringify(arry));

            var re = null;
            if (typeof (clickfun) == "function") {
                re = clickfun(arry);
            }

            if (re != false) {
                if (typeof (postfun) == "function") {
                    re = postfun();
                }
            }

        }

        function checkLightCheckField(self, clickfun, postfun, rowIndex) {
            var rowId = $(self).closest("tr").attr('rowId');
            var groupFlag = $(self).parent().attr('CheckGroupFlag');
            var $hidden = $("input[CheckGroupFlag = '" + groupFlag + "'][flag='_hiArray']");
            var arry = new Array();
            if (rowId != undefined) {
                if ($hidden.val() != "") {
                    arry = jQuery.parseJSON($hidden.val());
                }
                var $checkAll = $("[CheckGroupFlag='" + groupFlag + "'][flag='all']").find("input")[0];
                $("#" + $(self).attr("id")).each(function () {
                    $(this)[0].checked = $(self)[0].checked;
                });

                $("[CheckGroupFlag='" + groupFlag + "'][flag='check']").each(function () {

                    if ($($(this).find('input')[0]).attr("id") == $($(self)[0]).attr("id"))
                        $(this).find('input')[0].checked = $(self)[0].checked;
                })

                if ($(self)[0].checked) {
                    arry.push(rowId);
                    var allcheck = true;
                    $("[CheckGroupFlag='" + groupFlag + "'][flag='check']").each(function () {
                        if (!$(this).find('input')[0].checked) {
                            allcheck = false;
                        }
                    })
                    $checkAll.checked = allcheck;
                }
                else {
                    arry = $.grep(arry, function (value) { return value != rowId; });
                    $checkAll.checked = false;
                }
                $hidden.val(JSON.stringify(arry));

            }
            var re = null;
            if (typeof (clickfun) == "function") {
                re = clickfun(arry, rowIndex, rowId, $(self)[0].checked);
            }
            if (re != false) {
                if (typeof (postfun) == "function") {
                    re = postfun();
                }
            }
        }


        function setLightCheckField() {
            $("input[CheckGroupFlag][flag='_hiArray']").each(function () {
                var groupFlag = $(this).attr('CheckGroupFlag');
                var ids = $(this).val();
                var arry = new Array();
                if (ids != "") {
                    arry = jQuery.parseJSON(ids);
                }
                var checkAll = true;
                var allIds = new Array();
                $("[CheckGroupFlag='" + groupFlag + "'][flag='check']").each(function () {
                    var rowId = $(this).closest("tr").attr('rowId');
                    if (rowId != undefined) {
                        allIds.push(rowId);
                        if ($.inArray(rowId, arry) != -1) {
                            $(this).find('input')[0].checked = true;
                        }
                        else {
                            $(this).find('input')[0].checked = false;
                            checkAll = false;
                        }
                    }
                    else {
                        checkAll = false;
                    }
                })

                var pagingFlag = $(this).attr('PagingFlag');
                if (pagingFlag == "False") {
                    var deleteArray = new Array();
                    for (var i = 0; i < arry.length; i++) {
                        if ($.inArray(arry[i], allIds) == -1) {
                            deleteArray.push(arry[i]);
                        }
                    }
                    for (var i = 0; i < deleteArray.length; i++) {
                        arry = $.grep(arry, function (value) { return value != deleteArray[i]; });
                    }
                    $(this).val(JSON.stringify(arry));
                }
                var $checkAll = $("[CheckGroupFlag='" + groupFlag + "'][flag='all']").find("input");
                if ($checkAll.length > 0)
                    $checkAll[0].checked = checkAll;
            })
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
