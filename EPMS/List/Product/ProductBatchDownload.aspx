<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductBatchDownload.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductBatchDownload" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="成品批量下载" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block" id="spWbsState" runat="server"><span class="filter-block-lb">
            任务状态</span> <span>
                <zhongsoft:LightDropDownList ID="ddlWBSState" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">专业</span> <span>
                <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">卷册负责人/工号</span>
                <span>
                    <asp:TextBox ID="tbWBSOwnerName" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                        EnableTheming="false"></asp:TextBox>
                </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <table>
        <tr>
            <td>
                <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="批量下载" OnClientClick="return batchDownload();">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
                            height="16" />批量下载</span>
                </asp:LinkButton>
                <span style="color: Red">设总及项目通用角色可下载所有专业的成品，专业主设人和主任工下载本专业卷册成品，卷册负责人下载自己负责卷册的成品。其他特殊岗位下载权限同设总</span>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <style>
        body, html
        {
            overflow: hidden;
        }
    </style>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
        DataKeyNames="WBSID,ExecSpecialtyCode,ExecSpecialtyName" ShowExport="true" HideFieldOnExport="全部,序号"
        runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" OnRowDataBound="gvWBS_RowDataBound"
        UseDefaultDataSource="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" SortExpression="WBSCode"
                HeaderStyle-Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="名称">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openWBSDetail(\"{0}\")", Eval("WBSID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span><%#Eval("WBSName")%></span></asp:LinkButton>
                    <input type="hidden" id="hiWBSID" content='<%#Eval("WBSID")%>' />
                    <input type="hidden" id="hiWBSCode" content='<%#Eval("WBSCode")%>' />
                    <input type="hidden" id="hiWBSName" content='<%#Eval("WBSName")%>' />
                    <input type="hidden" id="hiWBSOwnerID" content='<%#Eval("WBSOwnerID")%>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="卷册负责人" DataField="WBSOwnerName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业代字" DataField="ExecSpecialtyCode" SortExpression="ExecSpecialtyCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业名称" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务状态" DataField="WBSState" SortExpression="WBSState"
                HeaderStyle-Width="60px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvWBS.CheckedClientID %>";

        function batchDownload() {
            //权限：
            var speId = "<%=SpecialtyID %>";
            if (!checkLimit(speId)) {
                return false;
            }
            var wbsIds = $("#" + $gridCheckedClientID).val();
            if (wbsIds != "" && wbsIds != undefined && wbsIds.length > 10) {
                var tempIds = wbsIds.replace("[", '""').replace("]", '""');
                tempIds = tempIds.replace(/\"/g, "");
                var fileRelateId = tempIds;
                var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=sign&wbsIds=" + fileRelateId;
                showDivDialog(urlStr, null, 750, 550);
            } else {
                alert("请选择要下载的成品");
            }
            return false;
        }

        function checkLimit(speId) {
            if (parseBool("<%=IsProjTYRole %>")) {
                //项目通用角色，有权限下载所有专业卷册成品
                return true;
            }
            else if (parseBool("<%=IsSpecialRole %>")) {
                //特殊角色，有选权限下载所有专业或指定项目类型和指定项目的卷册成品
                return true;
            }
            else if (parseBool("<%=IsMainSet %>") || parseBool("<%=IsDirector %>")) {//第一个判断包含此项,此项判断暂时不起作用 2017-8-11 update by duxk
                //主设人，主任工，有权限下载负责专业的卷册成品
                if (speId == '' || speId == undefined) {
                    alert('请先从左侧树形结构选择专业！');
                    return false;
                } else {
                    var curSpeId = '<%=CurSpeID %>';
                    if (curSpeId.indexOf(speId) < 0) {

                        alert('您不是该专业的主设人或者主任工，请选择其他专业操作！');
                        return false;
                    }
                    return true;
                }
            }
            else if (parseBool("<%=IsRoomSpeUser %>")) {
                //生产部门的人员可以下载人员所在科室对应的专业下的卷册 tianhl 20170207
                return true;
            }
            else {
                //当前登录人角色不是项目通用角色、特殊权限角色、主设人、主任工等。可作为卷册负责人权限下载卷册成品。
                var userID = "<%=KPMSUser.UserId %>";
                var wbsIds = $("#" + $gridCheckedClientID).val();
                var tempIds = wbsIds.replace("[", '""').replace("]", '""');
                tempIds = tempIds.replace(/\"/g, "");
                var fileRelateId = tempIds;
                var ids = fileRelateId.split(",");

                var errorMegs = "";
                for (var i = 0; i < ids.length; i++) {
                    var id = ids[i];
                    var wBSOwnerID = $("[content='" + id + "']").parent().find("#hiWBSOwnerID").attr("content");
                    if (userID.toLowerCase() == wBSOwnerID.toLowerCase()) {

                    } else {
                        var wBSCode = $("[content='" + id + "']").parent().find("#hiWBSCode").attr("content");
                        var wBSName = $("[content='" + id + "']").parent().find("#hiWBSName").attr("content");
                        errorMegs += "您不是卷册：【" + wBSName + "(" + wBSCode + ")】的负责人，没有权限下载该卷册成品" + "\n\r"
                    }
                }
                if (errorMegs != "") {
                    alert(errorMegs);
                    return false;
                }
                return true;
            }
        }

        function openWBSDetail(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSEditor.aspx", { actionType: 1, bizid: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
