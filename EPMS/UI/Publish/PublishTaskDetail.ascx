<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishTaskDetail.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishTaskDetail" %>
<table class="tz-table">
    <tr id="trSure" runat="server">
        <td colspan="6" style="text-align: right">
            <span style="float: right;" id="Span3" runat="server" displaystatus="(23.发起申请)(23.申请人修改)">
                <%
                    if (ApplyType == Zhongsoft.Portal.EPMS.PublishApplyType.出案报告审批单)
                    {
                %>
                <asp:LinkButton runat="server" ID="lbtnViewPublishInfo" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="出案任务记录"
                    OnClientClick="return viewPublishInfo();">
                    <span>
                        <img runat="server" src="~/Themes/Images/btn_dg_view.gif" alt="出案任务记录" width="16"
                            height="16" />出案任务记录</span>
                </asp:LinkButton>
                <%
                    }
                %>
                <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="选择出版任务" OnClientClick="return false;">
                    <span>
                        <img runat="server" src="~/Themes/Images/look-up.gif" alt="选择任务" width="16"
                            height="16" />
                        选择任务
                    </span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnAddWBS" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="选择出版任务" OnClientClick="return false;">
                    <span>
                        <img runat="server" src="~/Themes/Images/btn_add.gif" alt="添加任务" width="16"
                            height="16" />
                        添加任务
                    </span>
                </asp:LinkButton>
            </span>

            <%--新增--%>
            <zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$" Visible="false"
                Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox><%--行--%>
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" Visible="false"
                OnClientClick="return checkFillNum()" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvApplyFormDetail" runat="server" DataKeyNames="ApplyFormDetailId"
                OnRowDataBound="gvApplyFormDetail_RowDataBound" UseDefaultDataSource="true"
                OnRowCommand="gvApplyFormDetail_RowCommand">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="任务编号">
                        <ItemTemplate>
                            <%#Eval("WBSCode") %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="任务名称" HeaderStyle-Width="200px">
                        <ItemTemplate>
                            <%#Eval("WBSName") %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                     <zhongsoft:LightBoundField DataField="PrepareDate" HeaderText="编制日期" ItemStyle-Width="40px" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="档号">
                        <ItemTemplate>
                            <%#Eval("ArchiveCode") %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="总印制数<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSumNum" runat="server" class="kpms-textbox-money" ReadOnly="true"
                                EnableTheming="false" Text='<%# Eval("SumNum") %>'
                                Style="text-align: right; width: 70px" errmsg="总印制数请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="提交客户份数<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSendNum" runat="server" class="kpms-textbox-money"
                                Style="text-align: right; width: 70px" EnableTheming="false" Text='<%#Eval("SendNum") %>'
                                req="1" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="提交客户份数请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="自留份数<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSaveNum" runat="server" class="kpms-textbox-money"
                                req="1" EnableTheming="false" Text='<%# Eval("SaveNum") %>' Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                                Style="text-align: right; width: 70px" errmsg="自留份数请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox><asp:Label
                                    ID="lbSaveNum" runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="归档份数<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbArchiveNum" runat="server" class="kpms-textbox-money" ReadOnly="true"
                                req="1" EnableTheming="false" Text='<%# Eval("ArchiveNum") %>' Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
                                Style="text-align: right; width: 70px" errmsg="归档份数请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox><asp:Label
                                    ID="lbArchiveNum" runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" MaxLength="256" Style="width: 95%"
                                Text='<%#Eval("Memo") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="上传产品文件" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <zhongsoft:LightFileUploader runat="server" ID="btnNew" EnableTheming="false" CssClass="subtoolbarlink"
                                CommandName="UploadProductFile" CommandArgument='<%#Eval("WBSID") %>'>
                                <span><img src="<%=WebAppPath%>/Themes/Images/btn_new.gif" title="上传产品文件"  width="16"
                                height="16" />上传</span>
                            </zhongsoft:LightFileUploader>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="上传印制文件" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:LightFileUploader runat="server" ID="btnUploadPublishProduct" EnableTheming="false" CssClass="subtoolbarlink"
                                CommandName="UploadPublishProduct" CommandArgument='<%#Eval("WBSID") %>'>
                                <span><img src="<%=WebAppPath%>/Themes/Images/btn_new.gif" title="上传产品文件"  width="16"
                                height="16" />上传</span>
                            </zhongsoft:LightFileUploader>
                            <zhongsoft:LightFileUploader runat="server" ID="btnUploadPdf" EnableTheming="false" CssClass="subtoolbarlink"
                                CommandName="UploadPdf" CommandArgument='<%#Eval("WBSID") %>'>
                                <span><img src="<%=WebAppPath%>/Themes/Images/btn_new.gif" title="上传PDF文件"  width="16"
                                height="16" />上传PDF</span>
                            </zhongsoft:LightFileUploader>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="二维码" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="35px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="ibtnViewQRCode" EnableTheming="false">
                                                <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/qrCode.png"
                                                     onclick="return downloadQRCodeOfwbs('<%#Eval("WBSID")%>');" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                     <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" ToolTip="编辑" DataParamFields="WBSID"
                ImageUrl="../../../Themes/Images/btn_dg_edit.gif" />
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                    </zhongsoft:LightButtonField>
                </Columns>
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input id="hiInitContract" runat="server" type="hidden" />
<input type="hidden" runat="server" id="hiWBSXML" />
<asp:Button runat="server" ID="btnSelWBS" OnClick="btnSelWBS_Click" Style="display: none" />
<asp:Button runat="server" ID="btnBindWBS" OnClick="btnBindWBS_Click" Style="display: none" />
<script>

    function ucDetail_Init() {
        $("#<%=gvApplyFormDetail.ClientID %> [id$=tbSendNum]").live("change", function () { computeAllValue($(this)); });
        $("#<%=gvApplyFormDetail.ClientID %> [id$=tbSaveNum]").live("change", function () { computeAllValue($(this)); });
        $("#<%=gvApplyFormDetail.ClientID %> [id$=tbArchiveNum]").live("change", function () { computeAllValue($(this)); });

        $('#<%=lbtnSelWBS.ClientID %>').on('click', function () {
            if (checkProject()) {
                selWBS();
            }
        });

        $('#<%=lbtnAddWBS.ClientID %>').on('click', function () {
            if (checkProject()) {
                addWBS();
            }
        });
    }

    //验证是否选择了项目
    function checkProject() {
        var organizationID = $('#<%=this.Parent.FindControl("hiOrganizationID").ClientID %>').val();
        if (organizationID == "") {
            alert("请先选择项目");
            return false;
        }
        return true;
    }

    //选择加晒任务
    function selWBS() {
        var param = new InputParamObject("m");
        var organizationID = $('#<%=this.Parent.FindControl("hiOrganizationID").ClientID %>').val();
        var publishState = '<%=DAL.EPMS.PublishState.待送出版.GetHashCode()%>'
        var json = { OrganizationID: organizationID, WBSState: 4, IsShowMore: 1, PublishState: publishState }
        getWBS('<%=hiWBSXML.ClientID %>', param, json, bindSelWBS);
        return false;
    }

    // 绑定任务信息
    function bindSelWBS() {
        $("#<%=btnSelWBS.ClientID %>").click();
    }

    function addWBS() {
        var organizationID = $('#<%=this.Parent.FindControl("hiOrganizationID").ClientID %>').val();
        var json = {
            OrganizationId: organizationID, actionType: 2, WBSSourceType: '<%=Zhongsoft.Portal.EPMS.WBSSourceType.出版.GetHashCode()%>', WBSSourceID:'<%=BusinessObjectId%>'
        };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor4NoData.aspx', json);
        showDivDialog(url, null, 850, 500, bindWBS);
    }

    //编辑详细信息
        function editDetail(id) {
            var url = buildBizUrl(3, id, "/EPMS/List/WBS/WBSEditor4NoData.aspx", null);

            showDivDialog(url, null, 850, 550, bindWBS);
            return false;
        }


    // 绑定任务信息
    function bindWBS() {
        $("#<%=btnBindWBS.ClientID %>").click();
    }

    // 任务出版记录
    function viewPublishInfo() {
        if (checkProject()) {
            var organizationID = $('#<%=this.Parent.FindControl("hiOrganizationID").ClientID %>').val();
            var json = { OrganizationID: organizationID, ExceptConsignFormID: "<%=BusinessObjectId%>", ViewPublishInfo: "true" };
            var url = buildQueryUrl('/EPMS/List/Publish/PublishConsignList.aspx', json);
            showDivDialog(url, "", 900, 500, null);
            return false;
        }
    }

    //确定行是否隐藏
    function accessOfSureDisplay(isHide) {
        if (isHide) {
            $("#trSure").hide();
        }
        else {
            $("#trSure").show();
        }
    }

    function checkFillNum() {
        var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }

    function checkTask() {
        if ($('#<%=gvApplyFormDetail.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
            window.alert('-请至少添加一条资料（任务）信息 ！');
            return false;
        }
        return true;
    }

    //计算总出版份数
    function computeAllValue(tbtxt) {
        var sumValue = 0;

        var tbArchiveNum = tbtxt.parent('td').parent('tr').find('[id$=tbArchiveNum]');//归档份数
        var tbSaveNum = tbtxt.parent('td').parent('tr').find('[id$=tbSaveNum]');//自留份数
        var tbSendNum = tbtxt.parent('td').parent('tr').find('[id$=tbSendNum]');//自留份数
        //var tbSumNum = tbtxt.parent('td').parent('tr').find('[id$=tbSumNum]');//总份数
        var archiveNum = tbArchiveNum.val();
        var saveNum = tbSaveNum.val();
        var sendNum = tbSendNum.val();
        var sumNum = 0;
        if (archiveNum != null && archiveNum != "") {
            if (!isNaN(archiveNum)) {
                sumNum = parseInt(sumNum) + parseInt(archiveNum);
            }

        }
        if (saveNum != null && saveNum != "") {
            if (!isNaN(saveNum)) {
                sumNum = parseInt(sumNum) + parseInt(saveNum);
            }
        }
        if (sendNum != null && sendNum != "") {
            if (!isNaN(sendNum)) {
                sumNum = parseInt(sumNum) + parseInt(sendNum);
            }
        }
        tbtxt.parent('td').parent('tr').find('[id$=tbSumNum]').val(sumNum);
    }

    //上传前控制，已有产品校审，不允许在印制流程上传文件
    function checkWBSVerify() {
        alert('该任务已有产品校审，不可以在这里上传文件！');
        return false;
    }

    //生成并下载卷册二维码
    function downloadQRCodeOfwbs(wbsID) {
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?QRType=2&fileType=QRCodeOfWBS&wbsID=" + wbsID;
        window.open(urlStr);
        //showDivDialog(urlStr, null, 750, 550);
        return false;
    }
</script>