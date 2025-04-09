<%@ Page Language="C#" AutoEventWireup="true" Title="人员资质编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="QualificOfUserEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.QualificOfUserEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" IsMutiple="false" SelectPageMode="Dialog"
                    activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUserId" />
            </td>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbUserCode" activestatus="(2.*)" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                所属部门
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbDeptName" activestatus="(2.*)" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSex" activestatus="(2.*)" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                联系电话
            </td>
            <td class="td-r">
            </td>
            <td class="td-l">
                电子邮件
            </td>
            <td class="td-r">
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" style="text-align: center;">
                <b>拥有的资格信息</b>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
                <!--增加permissionstatus="true"会导致保存后列表没有了！-->
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="QualificationID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                    OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkState">
                        </zhongsoft:LightCheckField>
                        <zhongsoft:LightTemplateField HeaderText="资质名称">
                            <ItemTemplate>
                                <asp:Label ID="lbProjctType" runat="server" Text='<%#Eval("QualificationName") %>'></asp:Label>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("QualificationID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="生效时间">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText ID="txtEffectiveDate" runat="server" type="text" class="kpms-textbox-date"
                                    readonly="readonly" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="过期时间">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText ID="txtExpireDate" runat="server" type="text" class="kpms-textbox-date"
                                    readonly="readonly" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="能力系数" Visible="false"><%--能力系数，此字段仅在河北电力院出现过，其他单位暂时无用--%>
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlCapacityFactor" runat="server">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="控制项目类型<span class='req-star'>*</span>"
                            HeaderStyle-Width="80px">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rblIsCtrlProjType" onclick='changeReq(this)'
                                    RepeatDirection="Horizontal" key='<%#Eval("QualificationID") %>'>
                                    <asp:ListItem Value="1" >是</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目类型">
                            <ItemTemplate>
                                <table cellpadding='0' cellspacing='0' width="100%">
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="tbProjType" Height="16px" ReadOnly="true" Width="100%"
                                                activestatus="(2.*)" CssClass="kpms-textbox"></asp:TextBox>
                                            <input type="hidden" runat="server" id="hiXml" />
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 0px'>
                                            <asp:LinkButton runat="server" ID="btnProjType" Style="height: 18px; width: 20px;
                                                padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img src="../../../Themes/Images/look-up.gif"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="控制项目专业<span class='req-star'>*</span>"
                            HeaderStyle-Width="80px">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rblIsCtrlSpe" onclick='changeReq(this)' RepeatDirection="Horizontal"
                                    key='<%#Eval("QualificationID") %>'>
                                    <asp:ListItem Value="1" >是</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="专业">
                            <ItemTemplate>
                                <table cellpadding='0' cellspacing='0' width="100%">
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="tbSpeType" Height="16px" ReadOnly="true" Width="100%"
                                                activestatus="(2.*)" CssClass="kpms-textbox"></asp:TextBox>
                                            <input type="hidden" runat="server" id="hiSpeXml" />
                                            <input type="hidden" runat="server" id="hiName" />
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 0px'>
                                            <asp:LinkButton runat="server" ID="btnSpeType" Style="height: 18px; width: 20px;
                                                padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img src="../../../Themes/Images/look-up.gif"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="描述" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbDescription" activestatus="(23.*)"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" runat="server" />
    <%--选择专业模式：专业、专业类型--%>
    <input type="hidden" runat="server" id="hiSpeMode" value="SpeType" />
    <script>

        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

        $tbId = "";
        $hiXmlId = "";
        //选择项目类型
        function setProjType(qualificOfUserID, userId, qualificationID, tbId, hidId) {
            userId = $("#<%=hiUserId.ClientID %>").val();
            if (userId == "") { alert("请先选择用户！"); return false; }
            $tbId = tbId;
            $hiXmlId = hidId;
            var xml = $("#" + hidId).val();
            var url = buildQueryUrl("EPMS/List/OBS/QuaProjTypeEditor.aspx", { "qualificOfUserID": qualificOfUserID, "userId": userId, "qualificationID": qualificationID, "ViewId": "<%=BusinessObjectId%>" });
            showDivDialog(encodeURI(url), xml, 1000, 700, afterParamFilter);
            return false;
        }
        function afterParamFilter(re) {
            var arr = re.split('|');
            $("#" + $hiXmlId).val(arr[0]);
            $("#" + $tbId).val(arr[1]);
            return false;
        }

        //配置专业
        function setSpeType(qualificOfUserID, userId, qualificationID, tbId, hidId, hiNameId) {
            userId = $("#<%=hiUserId.ClientID %>").val();
            if (userId == "") { alert("请先选择用户！"); return false; }
            $tbId = tbId;
            $hiXmlId = hidId;
            var xml = $("#" + hidId).val();
            xml = xml + "|" + $("#" + hiNameId).val();
            var url = buildQueryUrl("EPMS/Obsolete/SpecialtyTypeSelector.aspx", null);
            showDivDialog(encodeURI(url), xml, 890, 350, afterParamFilter);
            return false;
        }

        function checkState(re, re1, re2, re3) {
            //re = clickfun(arry, rowIndex, rowId, $(self)[0].checked);
            var gvList = $("#<%=gvList.ClientID %>");
            var row = gvList.find("tr[rowId='" + re2 + "']");
            setReq(row);
            var myDate = new Date();
            var txtEffectiveDate = row.find("input[id$='txtEffectiveDate']").val(timeStamp2String(myDate));
        }

        //在Jquery里格式化Date日期时间数据
        function timeStamp2String(time) {
            var datetime = new Date();
            datetime.setTime(time);
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
            var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
            var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
            //return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
            return year + "-" + month + "-" + date;
        }

        function changeReq(obj) {
            var row = $(obj).parent().parent();
            setReq(row);
        }

        //更具所在行的状态设置项目类型与专业是否必填
        function setReq(row) {
            var tbProType = row.find("input[id$='tbProjType']");
            var tbSpeType = row.find("input[id$='tbSpeType']");
            var isChecked = row.find("input[type='checkbox']").is(':checked');
            if (isChecked) {
                var isCtrlProType = row.find("input[type='radio']:checked").eq(0).val();
                var isCtrlSpeType = row.find("input[type='radio']:checked").eq(1).val();
                tbProType.attr("req", isCtrlProType);
                tbSpeType.attr("req", isCtrlSpeType);
            }
            else {
                tbProType.attr("req", "0");
                tbSpeType.attr("req", "0");
            }
        }
    </script>
</asp:Content>
