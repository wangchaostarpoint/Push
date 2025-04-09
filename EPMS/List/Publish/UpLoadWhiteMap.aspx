<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditorNew.Master"
    AutoEventWireup="true" CodeBehind="UpLoadWhiteMap.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.UpLoadWhiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../../UI/Script/swfuploadjs/handlers.js" type="text/javascript"></script>
    <script src="../../../UI/Script/swfuploadjs/swfupload.js" type="text/javascript"></script>
    <style type="text/css">
        .tz-detail-header
        {
            display: none;
        }
    </style>
    <script type="text/javascript">
        var swfu;
        window.onload = function () {
            swfu = new SWFUpload({
                //设置上传路径和附带参数
                upload_url: "<%=WebAppPath %>/EPMS/List/Publish/UpLoadwhiteMapOperate.aspx",
                post_params: {
                    "ASPSESSID": "<%=Session.SessionID %>",
                    "UserName": "<%=UserName %>",
                    "LoginId": "<%=UserLoginId %>"
                },

                // File Upload Settings
                file_size_limit: "0",
                file_types: "*.plt",
                file_types_description: "文件",
                file_upload_limit: "0",    // Zero means unlimited

                // Event Handler Settings - these functions as defined in Handlers.js
                //  The handlers are not part of SWFUpload but are part of my website and control how
                //  my website reacts to the SWFUpload events.
                file_queue_error_handler: fileQueueError,
                file_dialog_complete_handler: fileDialogComplete,
                upload_progress_handler: uploadProgress,
                upload_error_handler: uploadError,
                upload_success_handler: uploadSuccess,
                upload_complete_handler: uploadComplete,

                // Button settings
                button_image_url: "../../../Themes/Images/XPButtonNoText_160x22.png",
                button_placeholder_id: "spanButtonPlaceholder", //设置按钮位置
                button_width: 160,
                button_height: 22,
                button_text: '<span class="button" style="z-index:-1;">选择文件 <span class="buttonSmall"></span></span>',
                button_text_style: '.button { font-family: Helvetica, Arial, sans-serif; font-size: 14pt; } .buttonSmall { font-size: 10pt; }',
                button_text_top_padding: 1,
                button_text_left_padding: 5,
                // Flash Settingshttp:
                flash_url: "<%=WebAppPath %>/UI/Script/swfuploadjs/swfupload.swf", // Relative to this file

                custom_settings: {
                    upload_target: "divFileProgressContainer"
                },
                // Debug Settings
                debug: false
            });
        }

        function fileDialogComplete(numberselected, numberqueued) {
            if (swfu.getStats().files_queued > 0) {

                var hiFile = document.getElementById("<%=hiFile.ClientID %>");

                var msg = "";
                for (var i = 0; i < numberselected; i++) {
                    msg += swfu.getFile(i).name + ";";
                }

                hiFile.value = msg;
                document.getElementById("<%=lblFile.ClientID %>").innerText = msg;

                swfu.startUpload();
            }
        }

        function upload() {
            if (swfu.getStats().files_queued > 0) {
                swfu.startUpload();

                return true;
            }
            else {
                alert("请选择上传文件");
            }
            return false;
        }

        function uploadComplete(file) {
            try {
                //若有多个文件，则上传一个成功后，继续上传，否则显示上传成功！
                if (this.getStats().files_queued > 0) {
                    this.startUpload();
                } else {
                    document.getElementById("<%=btnSelect.ClientID %>").disabled = false;
                }
            } catch (ex) {
                this.debug(ex);
            }
        }
    </script>
    <table class="tz-table">
        <tr>
            <td colspan="6" style="background-color: #EFF2F7;" class="td-m">
                <span style="font-weight: bold;">白图上传</span>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbProjectPhaseName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Modal" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiOrganizationID':'id','tbProjectPhaseCode':'ProjectCode'}"
                    req="1"></zhongsoft:LightObjectSelector>
                <input runat="server" id="hiOrganizationID" type="hidden" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r" style="max-width: 75px !important">
                <zhongsoft:XHtmlInputText runat="server" ID="tbProjectPhaseCode" readonly="readonly"
                    class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <span id="spanButtonPlaceholder"></span>
                <div id="divFileProgressContainer" style="height: 75px; display: none;">
                </div>
                <div id="thumbnails">
                </div>
            </td>
            <td class="td-r">
                <asp:Button runat="server" ID="btnSelect" CssClass="ow_btn_b" Text="上传文件" Enabled="false"
                    OnClick="btnSelect_Click" />
                <asp:Button runat="server" ID="btnUpload" CssClass="ow_btn_b" Text="出版白图" OnClientClick='return CheckData();'
                    OnClick="btnUpload_Click" /><span class="req-star">出版后页面将关闭</span>
                <asp:Button runat="server" ID="btnSave" CssClass="ow_btn_b" Text="保存" OnClick="btnSave_Click"
                    Visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m">
                <span style="font-weight: bold;">选择文件列表：</span>
                <asp:Label runat="server" ID="lblFile"></asp:Label>
                <input type="hidden" runat="server" id="hiFile" />
                <script type="text/javascript">
                    document.getElementById("<%=lblFile.ClientID %>").innerText = document.getElementById("<%=hiFile.ClientID %>").value;
                </script>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m" style="background-color: #EFF2F7;">
                <span style="font-weight: bold;">已上传文件列表</span>
                <table style="float: right;">
                    <tr>
                        <td>
                            份数
                        </td>
                        <td>
                            <zhongsoft:LightTextBox runat="server" ID="tbNumber" Regex="^(([0])|([1-9]\d{0,4}))$"
                                errmsg="请填写正整数" Style="text-align: right; width: 60%;"></zhongsoft:LightTextBox>
                            <asp:Button runat="server" ID="btnBatchUpdateNum" Text="批量更改" OnClick="btnBatchUpdateNum_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" ShowFooter="true" UseDefaultDataSource="true"
                    PageSize="10" AutoGenerateColumns="false" Width="100%" DataKeyNames="PublishFilesID"
                    OnRowCommand="gvList_RowCommand" EmptyDataText="没有费用项目信息" OnRowDataBound="gvList_RowDataBound"
                    BindGridViewMethod="BindGrid" ShowExport="true">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <%#((GridViewRow)Container).DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightBoundField DataField="PublishFileTempID" HeaderText="PublishFileTempID"
                            Visible="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileName" HeaderText="文件名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="图幅">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlMapSize">
                                </zhongsoft:LightDropDownList>
                                <input runat="server" type="hidden" id="hiMapSize" value='<%#Eval("MapSize") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="比例">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbNormalSize" Text='<%#Eval("NormalSize") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="申请人" DataField="UploadUserName">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="出版类型">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPublishType">
                                    <asp:ListItem Value="白图">白图</asp:ListItem>
                                    <asp:ListItem Value="临委">临委底图</asp:ListItem>
                                </zhongsoft:LightDropDownList>
                                <input type="hidden" runat="server" id="hiPublishType" value='<%#Eval("PublishType") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="份数<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbNumber" req="1" Regex="^(([0])|([1-9]\d{0,4}))$"
                                    errmsg="请填写正整数" Style="text-align: right;" Text='<%#Eval("Number") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="备注">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbMemo" Text='<%#Eval("Memo") %>' TextMode="MultiLine"
                                    Rows="4" MaxLength="1024"></zhongsoft:LightTextBox>
                                <input type="hidden" runat="server" id="hiLocalPLTfilePath" value='<%#Eval("ExtendedAttribute") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="ibtnDel" ImageUrl="../../../Themes/Images/btn_delete.gif"
                                    OnClientClick='return confirm("确定要删除吗?");' CommandName="Del" CommandArgument='<%#Eval("PublishFilesID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function CheckData() {
            var msg = "";
            var i = 0;
            $("#<%=gvList.ClientID %> tr input[id*=tbPiece]").each(function () {
                i = i + 1;

                if ($(this).val() == "") {
                    msg = msg + "第" + i + "行出版份数不能为空;\r\n";
                }
                else {
                    if (isNaN(parseInt($(this).val()))) {
                        msg = msg + "第" + i + "行出版份数应为整数;\r\n";
                    }
                }
            });
            if (msg != "") {
                alert(msg);
                return false;
            }
            if (document.getElementById('<%=tbProjectPhaseName.ClientID %>').value == '') {
                alert('请选择项目后再进行白图出版！');
                return false;
            }
            return true;
            //return confirm("出版后页面将关闭，是否确定出版？");
        }

        //选择项目
        function ChooseProject() {
            var hiProjectId = '<%=hiOrganizationID.ClientID %>';
            var tbProjectCode = '<%=tbProjectPhaseCode.ClientID %>';
            var tbProjectName = '<%=tbProjectPhaseName.ClientID %>';
            SelectProject(hiProjectId, tbProjectCode, tbProjectName);
            return false;
        }

        //选择阶段
        function SelectProject(hiProjectPhaseID, hiProjectPhaseCode, tbProjectPhaseName, tbContractID) {
            //var key = document.all._ctl0_txtComplainerName.value;
            //var url='Common/SelectProjectList.aspx?Name='+key;
            var sFeatures = "dialogHeight: 530px; dialogWidth: 750px;scroll:yes;resizable: Yes";
            var url = '/dicp/Modules/webform/Common/SelectProjectList.aspx';
            var result = showModalDialog(url, null, sFeatures);
            var project;
            if (result != null) {
                domUser = result;
                project = domUser.selectSingleNode("//Project");
                if (null != tbProjectPhaseName && null != document.getElementById(tbProjectPhaseName))
                    document.all(tbProjectPhaseName).value = project.getAttribute("ProjectPhaseName");

                if (null != hiProjectPhaseID && null != document.getElementById(hiProjectPhaseID))
                    document.all(hiProjectPhaseID).value = project.getAttribute("ProjectPhaseID");

                if (null != hiProjectPhaseCode && null != document.getElementById(hiProjectPhaseCode))
                    document.all(hiProjectPhaseCode).value = project.getAttribute("ProjectPhaseCode");

                if (null != tbContractID && null != document.getElementById(tbContractID))
                    document.all(tbContractID).value = project.getAttribute("ContractID");
            }
        }
    </script>
</asp:Content>
