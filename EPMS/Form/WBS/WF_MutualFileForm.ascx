<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MutualFileForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_MutualFileForm" %>
<%@ Register Src="../../UI/WBS/FileInfoDetail.ascx" TagName="FileInfoDetail" TagPrefix="uc1" %>
<%@ Register Src="../../UI/WBS/FileReceiveSpeList.ascx" TagName="FileReceiveSpeList"
    TagPrefix="uc2" %>
<%@ Register Src="../../UI/FileList.ascx" TagName="FileList" TagPrefix="uc4" %>
<%@ Register Src="../../UI/Product/ProductOpinionList.ascx" TagName="ProductOpinionList"
    TagPrefix="uc5" %>
<table class="tz-table" width="100%">
    <uc1:FileInfoDetail ID="fileInfo" runat="server" FileType="互提资料" />
    <tr id="trMessage">
        <td class="td-l"></td>
        <td class="tr-m" colspan="5">如当前资料已具备接收条件，请选择接收状态为：已接收；如当前资料还不具备接收条件或者还存在问题，请选择接收状态为：存在问题，并填写拒绝原因。</td>
    </tr>
    <tr>
        <td class="td-l">接受专业
        </td>
        <td colspan="5" class="td-m">
            <uc2:FileReceiveSpeList ID="fileSpeList" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">互提资料信息
        </td>
        <td colspan="5" class="td-m">
            <uc4:FileList ID="fileList" runat="server" FileType="互提资料" DownAllFile="true" />
        </td>
    </tr>
    <tr>
        <!-- 校审意见-->
        <td class="td-l">校审意见
        </td>
        <td colspan="5" class="td-m">
            <uc5:ProductOpinionList ID="fileOpinion" runat="server" OpinionType="MutualFile"
                OnDataChanged="fileOpinion_DataChanged" />
        </td>
    </tr>
</table>
<!-- 是否可以发送-->
<input type="hidden" runat="server" id="hiCanSendNext" value="true" />
<script type="text/javascript">
    function initCustomerPlugin() {
        initFileInfo();

        initFileSpe();
        trShow();
        <%--initFileWbs<%=fileWBSList.ClientID %>();--%>

        //在所有步骤显示接受卷册
        //if ($actName != '签收') {
        //$('[flag="hide"]').hide();
        //}
        initFileList();
    }

    function trShow() {
        if ($actName == "签收") {
            $("#trMessage").css('display', '');
        } else {
            $("#trMessage").css('display', 'none');
        }
    }

    function checkForm() {
        if (!checkReason()) {
            return false;
        }
        if ($formAction == 0) {
            if (!checReceiveSpe()) {
                return false;
            }
            else if (typeof (checkWBSCount) == 'function') {
                if (!checkWBSCount()) {
                    return false;
                }
                return true;
            }

            //修改步骤，判断是否有未选中的执行意见信息及未填写不执行原因的信息
            if ($actName.indexOf("修改") > -1) {
                var isAllExeSelected = checkHasChooseExeState();
                var isAllWrite = checkHasNoExeReason();
                if (!isAllExeSelected) {
                    alert("还存在没有填写修改情况的校审意见，请填写修改情况后再处理！");
                    return false;
                }
                else if (!isAllWrite) {
                    alert("还存在修改情况为“不执行”但没有填写不执行原因的校审意见，请填写后再处理！");
                    return false;
                }
            }
            else if ($actName == '校核' || $actName == '审核' || $actName == '审定' || $actName == '批准') {
                if (!parseBool($('#<%=hiCanSendNext.ClientID %>').val())) {
                    alert('您填写了校核意见之后，需要使用【回退】功能返回给设计人！');
                    return false;
                }
            }
        } else if ($formAction = 2) {
            //新建状态下保存要验证项目信息必填
            if ($actName == '编写资料交接单') {

                if ($("[Field='ProjectName']").val() == "" || ($("[Field='WBSName']").text() == "" && $("[Field='WBSName']").val() == "")) {
                    if ($("[Field='ProjectName']").val() == "") {
                        $("[Field='ProjectName']").addClass("kpms-textboxred");
                    }
                    if ($("[Field='WBSName']").val() == "") {
                        $("[Field='WBSName']").addClass("kpms-textboxred");
                    }
                    alert("请先选择项目、资料名称，再进行保存。");
                    return false;
                }
            }
        }
        return true;
    }
</script>
