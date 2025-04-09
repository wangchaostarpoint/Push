<%@ Page Title="投标项目开标记录详细" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="TenderOpenRecordEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.TenderOpenRecordEditor" %>

<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('TenderOpenRecordBase')">投标项目开标记录基本信息&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="tz-table" id="TenderOpenRecordBase">
                    <tr>
                        <td class="td-l">投标批次</td>
                        <td class="td-m" colspan="5">
                            <zhongsoft:LightTextBox ID="tbTenderBatch" runat="server" MaxText="32" TableName="MM_TenderOpenRecord" Field="TenderBatch" ActiveStatus="(23.*)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">所属工程包</td>
                        <td class="td-m" colspan="5">
                            <zhongsoft:LightTextBox ID="tbProjectPackage" runat="server" MaxText="128" TableName="MM_TenderOpenRecord" Field="ProjectPackage" ActiveStatus="(23.*)" ReadOnly="True" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">工程名称</td>
                        <td class="td-m" colspan="5">
                            <zhongsoft:LightTextBox ID="tbProjectName" runat="server" MaxText="128" TableName="MM_TenderOpenRecord" Field="ProjectName" ActiveStatus="(23.*)" ReadOnly="True" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">开标日期</td>
                        <td class="td-r" style="width: 15%">
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtBidOpenDate" runat="server" readonly="readonly" TableName="MM_TenderOpenRecord" Field="BidOpenDate" ActiveStatus="(23.*)" />
                        </td>
                        <td class="td-l">开标地点</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbBidOpenPlace" runat="server" MaxText="128" TableName="MM_TenderOpenRecord" Field="BidOpenPlace" ActiveStatus="(23.*)" />
                        </td>
                        <td class="td-l">是否中标<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="rblIsWinBid" tablename="MM_TenderOpenRecord" field="IsWinBid" ActiveStatus="(23.*)" req="1" />
                        </td>
                    </tr>
                    <tr flag="trNotWinBid">
                        <td class="td-l">未中标原因<span class="req-star">*</span></td>
                        <td class="td-m" colspan="5">
                            <zhongsoft:LightTextBox ID="tbNotWinBidReason" EnableTheming="False" TextMode="MultiLine" CssClass="kpms-textarea" Rows="3" runat="server" MaxText="1024" TableName="MM_TenderOpenRecord" Field="NotWinBidReason" ActiveStatus="(23.*)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">商务经理</td>
                        <td class="td-r">
                            <zhongsoft:LightObjectSelector runat="server" ID="lbsBusinessManagerName" ResultAttr="name" Writeable="False" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" TableName="MM_TenderOpenRecord" Field="BusinessManagerName" ResultForControls="{'hiBusinessManagerID':'id'}" EnableTheming="false" ActiveStatus="(23.*)" IsMutiple="False" SelectPageMode="Dialog" />
                            <input type="hidden" runat="server" id="hiBusinessManagerID" tablename="MM_TenderOpenRecord" field="BusinessManagerID" />
                        </td>
                        <td class="td-l" flag="isWinBid">中标价格(万元)<span class="req-star">*</span></td>
                        <td class="td-m" colspan="4" flag="isWinBid">
                            <zhongsoft:LightTextBox ID="tbWinBidPrice" EnableTheming="False" CssClass="kpms-textbox-money"
                                runat="server" DataType="Decimal2" TableName="MM_TenderOpenRecord" Field="WinBidPrice" ActiveStatus="(23.*)" />
                        </td>
                        <td class="td-m" colspan="4" flag="isNotWinBid" />
                    </tr>
                    <tr>
                        <td class="td-l">参与开标人员</td>
                        <td class="td-m" colspan="5">
                            <zhongsoft:LightObjectSelector runat="server" ID="lbs" MaxText="64" TableName="MM_TenderOpenRecord" Field="JoinUserNames" ActiveStatus="(23.*)" Writeable="False" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ResultAttr="name" ResultForControls="{'hiJoinUserIDs':'id'}" IsMutiple="True" SelectPageMode="Dialog" />
                            <input type="hidden" runat="server" id="hiJoinUserIDs" tablename="MM_TenderOpenRecord" field="JoinUserIDs" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">评标办法</td>
                        <td class="td-m" colspan="5">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <zhongsoft:LightTextBox ID="tbBidEvaluationMethod" runat="server" MaxText="512" TableName="MM_TenderOpenRecord" Field="BidEvaluationMethod" ActiveStatus="(23.*)" TextMode="MultiLine" EnableTheming="False" CssClass="kpms-textarea" Rows="3" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                                            DisplayStatus="(3.*)" OnClick="lbtnUpload_OnClick"><img src="../../../Themes/Images/btn_upload.gif" />
                                            <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                                                runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
                                        <uc3:UpLoadFile ID="uploadFile" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">备注</td>
                        <td class="td-m" colspan="5">
                            <zhongsoft:LightTextBox ID="tbMemo" EnableTheming="False" TextMode="MultiLine" CssClass="kpms-textarea" Rows="3" runat="server" MaxText="512" TableName="MM_TenderOpenRecord" Field="Memo" ActiveStatus="(23.*)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('TenderOpenRecordExt')">投标单位信息&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="tz-table" id="TenderOpenRecordExt">
                    <tr runat="server" id="trAdd">
                        <td align="right" displaystatus="(3.*)">新增
                            <zhongsoft:LightTextBox runat="server" ID="tbNum" ActiveStatus="(3.*)" Width="30px" onblur="CheckCnt(this)" ToolTip="请输入1-10之间的整数" />
                            条
                            <asp:Button runat="server" ID="btnAdd" Text="确认" OnClientClick="return CheckTbNum();" OnClick="btnAdd_OnClick" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <zhongsoft:LightPowerGridView runat="server" ID="gvList" BindGridViewMethod="BindData" AllowPaging="True" PageSize="10" UseDefaultDataSource="True" OnRowDataBound="gvList_OnRowDataBound" OnRowCommand="gvList_OnRowCommand">
                                <Columns>
                                    <zhongsoft:LightTemplateField HeaderText="序号">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="35%" HeaderText="投标单位<span style='color:#FF0000;font-weight:bold;'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbBidUnitName" Text='<%#Eval("TenderUnitName") %>' ActiveStatus="(3.*)" req="1" />
                                            <input type="hidden" runat="server" id="hiBidUnitID" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="是否中标" ItemStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:RadioButtonList runat="server" ID="rblIsWinBid" RepeatDirection="Horizontal" ActiveStatus="(3.*)" />
                                            <input type="hidden" runat="server" id="hiIsWinBid" value='<%#Eval("IsWinBid") %>' />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="投标报价<br/>（万元）" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbBidQuotation" Width="80px" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Money6" Text='<%#Eval("BidQuotation") %>' ActiveStatus="(3.*)" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="修正报价<br/>（万元）" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbRevisedQuotation" Width="80px" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Money6" Text='<%#Eval("RevisedQuotation") %>' ActiveStatus="(3.*)" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="投标报价<br/>百分比" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbBidQuotationPercent" Width="40px" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Decimal2" Text='<%#Eval("BidQuotationPercent") %>' ActiveStatus="(3.*)" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="报价得分" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbQuotationScore" Width="40px" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Decimal2" Text='<%#Eval("QuotationScore") %>' ActiveStatus="(3.*)" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="工期<br/>（日历天）" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbProjectTime" Width="40px" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Decimal2" Text='<%#Eval("ProjectTime") %>' ActiveStatus="(3.*)" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="质量" ItemStyle-Width="20%">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbQuality" Text='<%#Eval("Quality") %>' ActiveStatus="(3.*)" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" EnableTheming="False" CommandName="remove" CommandArgument='<%#Eval("TenderUnitInfoID") %>'>
                                                <img id="btnDelete" alt="删除" style="CURSOR: hand" onclick="return confirm('是否删除附件？')"
                                                     src="../../../Themes/Images/btn_dg_delete.gif"  border="0" />
                                            </asp:LinkButton>
                                            <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("TenderUnitInfoID") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiTenderOpenRecordID" name="hiTenderOpenRecordID" runat="server" tablename="MM_TenderOpenRecord" field="TenderOpenRecordID" />
    <input type="hidden" id="hiTenderEntityID" name="hiTenderEntityID" runat="server" tablename="MM_TenderOpenRecord" field="TenderEntityID" />
    <input type="hidden" id="hiCreateUserId" name="hiCreateUserId" runat="server" tablename="MM_TenderOpenRecord" field="CreateUserId" />
    <input type="hidden" id="hiCreateUserName" runat="server" tablename="MM_TenderOpenRecord" field="CreateUserName" />
    <input type="hidden" runat="server" id="hiCreateDate" tablename="MM_TenderOpenRecord" field="CreateDate" />
    <input type="hidden" id="hiLastModifyUserId" name="hiLastModifyUserId" runat="server" tablename="MM_TenderOpenRecord" field="LastModifyUserId" />
    <input type="hidden" runat="server" id="hiLastModifyUserName" tablename="MM_TenderOpenRecord" field="LastModifyUserName" />
    <input type="hidden" runat="server" id="hiLastModifyDate" tablename="MM_TenderOpenRecord" field="LastModifyDate" />
    <input type="hidden" runat="server" id="hiFlag" tablename="MM_TenderOpenRecord" field="Flag" value="1" />
    <input type="hidden" runat="server" id="hiBidNumber" tablename="MM_TenderOpenRecord" field="BidNumber" />

    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            initNotWindBid();
            $('#<%=rblIsWinBid.ClientID %>').live('change', function () {
                initNotWindBid();
            });
        }

        function CheckCnt(obj) {
            if (obj.value != "") {
                if (isNaN(parseInt(obj.value))) {
                    alert("请输入1-10之间的整数");
                    obj.value = "";
                }
                else {
                    var num = parseInt(obj.value);
                    obj.value = num;
                    if (num < 1 || num > 10) {
                        alert("请输入1-10之间的整数");
                        obj.value = "";
                    }
                }
            }
        }

        function CheckTbNum() {

            if ($("#<%=tbNum.ClientID %>").val() == "") {
                alert("请填写要添加的行数");
                return false;
            }
            return true;
        }

        //设置未中标原因状态
        function initNotWindBid() {
            var isWinBid = $('#<%=rblIsWinBid.ClientID %> input[type=radio]:checked').val();
            if (isWinBid =='<%=MDMEnum.IsWinBid.未中标.GetHashCode()%>') {
                $('[flag = "trNotWinBid"]').show();
                $("#<%=tbNotWinBidReason.ClientID %>").attr("req", "1");
                $("#<%=tbWinBidPrice.ClientID %>").removeAttr("req");
                $('[flag = "isNotWinBid"]').show();
                $('[flag = "isWinBid"]').hide();
            }
            else if (isWinBid == '<%=MDMEnum.IsWinBid.中标.GetHashCode()%>') {
                $('[flag = "isNotWinBid"]').hide();
                $('[flag = "isWinBid"]').show();
                $('[flag = "trNotWinBid"]').hide();
                $("#<%=tbWinBidPrice.ClientID %>").attr("req", "1");
                $("#<%=tbNotWinBidReason.ClientID %>").removeAttr("req");
            }
            else {
                $('[flag = "trNotWinBid"]').hide();
                $('[flag = "isNotWinBid"]').show();
                $('[flag = "isWinBid"]').hide();
                $("#<%=tbNotWinBidReason.ClientID %>").removeAttr("req");
                $("#<%=tbWinBidPrice.ClientID %>").removeAttr("req");
            }
        }

    </script>
</asp:Content>

