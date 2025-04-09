<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ExternalFileForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_ExternalFileForm" %>
<%@ Register Src="../../UI/WBS/FileInfoDetail.ascx" TagName="FileInfoDetail" TagPrefix="uc1" %>
<%@ Register Src="../../UI/WBS/FileReceiveSpeList.ascx" TagName="FileReceiveSpeList"
    TagPrefix="uc2" %>
<%@ Register Src="../../UI/WBS/FileReceiveWBSList.ascx" TagName="FileReceiveWBSList"
    TagPrefix="uc3" %>
<%@ Register Src="../../UI/FileList.ascx" TagName="FileList" TagPrefix="uc4" %>
<%@ Register Src="../../UI/Product/ProductOpinionList.ascx" TagName="ProductOpinionList"
    TagPrefix="uc5" %>
<table class="tz-table" width="100%">
    <uc1:FileInfoDetail ID="fileInfo" runat="server" FileType="外部资料" />
    <tr style="display: none">
        <td class="td-l">相关专业
        </td>
        <td colspan="5" class="td-m">
            <uc2:FileReceiveSpeList ID="fileSpeList" runat="server" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">关联卷册
        </td>
        <td colspan="5" class="td-m">
            <uc3:FileReceiveWBSList ID="fileWBSList" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">外部资料信息
        </td>
        <td colspan="5" class="td-m">
            <uc4:FileList ID="fileList" runat="server" FileType="外部资料" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiNotUsed" value="作废" />
<script type="text/javascript">
    function initCustomerPlugin() {
        initFileInfo();

        initFileSpe();

        initFileWbs<%=fileWBSList.ClientID %>();

        initFileList();
    }

    function checkForm() {
        if ($formAction = 2) {
            //新建状态下保存要验证项目信息必填
            if ($actName == '登记') {
                if ($("[Field='ProjectName']").val() == "") {
                    $("[Field='ProjectName']").addClass("kpms-textboxred");
                    alert("请先选择项目，再进行保存。");
                    return false;
                }
                if (($("[Field='WBSName']").text() == "" && $("[Field='WBSName']").val() == "")) {
                    $("[Field='WBSName']").addClass("kpms-textboxred");
                    alert("请先填写资料名称，再进行保存。");
                    return false;
                }
                if ($("[Field='WBSCode']").val() == "") {
                    $("[Field='WBSCode']").addClass("kpms-textboxred");
                    alert("请先填写资料编号，再进行保存。");
                    return false;
                }
                if ($("[ID*='tbProvideFileUnit']").val() == "") {
                    $("[Field='ProvideFileUnit']").addClass("kpms-textboxred");
                    alert("请先填写提资单位，再进行保存。");
                    return false;
                }
            }
        }
        return true;
    }

</script>
