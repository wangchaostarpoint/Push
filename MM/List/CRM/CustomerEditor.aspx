<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.CRM.CustomerEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="客户单位信息" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('customerInfo')">单位基本信息&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="tz-table" id="customerInfo">
                    <tr>
                        <td class="td-l">业务板块<span class="req-star">*</span></td>
                        <td class="td-m" colspan="3">
                            <asp:RadioButtonList runat="server" ID="rblBusinessPlate" RepeatDirection="Horizontal" req="1" activestatus="(23.*)" tablename="MM_CUSTOMERENTITY" field="ParamBusinessPlateID" />
                            <input type="hidden" runat="server" id="hiBusinessPlate" tablename="MM_CUSTOMERENTITY" field="BusinessPlate" />
                        </td>
                        <td class="td-l">重要程度<%--<span class="req-star">*</span>req="1"--%>
                        </td>
                        <td class="td-r">
                            <asp:RadioButtonList runat="server"  ID="rblImportantLevel" RepeatDirection="Horizontal" activestatus="(23.*)" tablename="MM_CUSTOMERENTITY" field="ImportantLevel">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">客户名称<span class="req-star">*</span></td>
                        <td class="td-m" colspan="5">
                            <zhongsoft:LightTextBox ID="tbCustomerName" runat="server" req="1" tablename="MM_CUSTOMERENTITY"
                                field="CustomerName" activestatus="(23.*)" MaxLength="64" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">是否境内<span class="req-star">*</span></td>
                        <td class="td-r">
                            <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="IsChurchyard" tablename="MM_CUSTOMERENTITY" req="1"
                                RepeatDirection="Horizontal" activestatus="(23.*)" AutoPostBack="true" OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
                            </asp:RadioButtonList>
                        </td>
                        <td class="td-l">省市<span class="req-star">*</span></td>
                        <td class="td-r" colspan="1">
                            <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" Width="45%"
                                req="1" activestatus="(23.*)" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
                            </zhongsoft:LightDropDownList>
                            <input type="hidden" runat="server" id="hiProvince" field="CustomerProvince" tablename="MM_CUSTOMERENTITY" />
                            <zhongsoft:LightDropDownList ID="ddlArea" runat="server" Width="45%"
                                activestatus="(23.*)" req="1">
                            </zhongsoft:LightDropDownList>
                            <input type="hidden" runat="server" id="hiCity" field="CustomerCity" tablename="MM_CUSTOMERENTITY" />
                        </td>
                        <td class="td-l">邮政编码</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbPostCode" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="PostCode" activestatus="(23.*)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">客户地址</td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox ID="tbAddress" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="CustomerPlace" activestatus="(23.*)" MaxLength="64" />
                        </td>
                        <td class="td-l">区域</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbArea" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="Area" activestatus="(23.*)" MaxLength="64" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">所属单位<%--<span class="req-star">*</span> req="1"--%>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="ddlBelongUnit" tablename="MM_CUSTOMERENTITY" field="BelongUnit" activestatus="(23.*)"  />
                        </td>
                        <td class="td-l">所属行业<%--<span class="req-star">*</span> req="1"--%>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="ddlBelongIndustry" tablename="MM_CUSTOMERENTITY" field="BelongIndustry" activestatus="(23.*)" />
                        </td>
                        <td class="td-l">企业性质<%--<span class="req-star">*</span>req="1"--%>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList ID="ddlCustomerTypeId" activestatus="(23.*)" runat="server"
                                 tablename="MM_CUSTOMERENTITY" field="CustomerNature">
                            </zhongsoft:LightDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">法人代表</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbArtificial" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="LegalPerson" activestatus="(23.*)" MaxLength="16" />
                        </td>
                        <td class="td-l">单位传真</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbCorporationFax" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="Fax" activestatus="(23.*)" MaxLength="32" />
                        </td>
                        <td class="td-m" colspan="2"></td>
                    </tr>
                    <tr>
                        <td class="td-l">开户银行</td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox ID="tbBankName" runat="server" class="kpms-textbox" tablename="MM_CUSTOMERENTITY"
                                field="BANKNAME" activestatus="(23.*)" MaxLength="32" />
                        </td>
                        <td class="td-l">账号</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbBankAccount" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="BANKACCOUNT" activestatus="(23.*)" />
                        </td>

                    </tr>
                    <tr>

                        <td class="td-l">主要联系人</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbMainContacter" tablename="MM_CUSTOMERENTITY" field="MainContacter" activestatus="(23.*)" MaxLength="32" />
                        </td>
                        <td class="td-l">联系电话</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbMainContacterPhone" tablename="MM_CUSTOMERENTITY" field="MainContacterPhone" activestatus="(23.*)" MaxLength="16" />
                        </td>
                        <td class="td-l">职务</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbMainContacterPost" tablename="MM_CUSTOMERENTITY" field="MainContacterPost" activestatus="(23.*)" MaxLength="32" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">电子邮箱</td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox runat="server" ID="tbMainContacterEmail" tablename="MM_CUSTOMERENTITY" field="MainContacterEmail" activestatus="(23.*)" MaxLength="16" Regex="^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$"
                                ErrMsg="请输入正确的邮箱" />
                        </td>
                        <td class="td-m" colspan="2"></td>
                    </tr>
                    <tr>
                        <td class="td-l">我方联系部门</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbDutyDept" runat="server" class="kpms-textbox" ReadOnly="true"
                                activestatus="(23.*)" />
                            <input type="hidden" id="hiDeptId" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="DutyDeptID" />
                            <input type="hidden" id="hiDutyDept" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="DutyDeptName" />
                        </td>
                        <td class="td-l">我方联系人</td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbDutyUser" runat="server" class="kpms-textbox" ReadOnly="true"
                                activestatus="(23.*)" />
                            <input type="hidden" id="hiDutyUserID" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="DutyUserID" />
                            <input type="hidden" id="hiDutyUserName" runat="server" tablename="MM_CUSTOMERENTITY"
                                field="DutyUserName" />
                        </td>
                        <td class="td-m" colspan="2"></td>
                    </tr>
                    <tr>
                        <td class="td-l">备注
                        </td>
                        <td class="td-m" colspan="5">
                            <zhongsoft:LightTextBox ID="tbFamilySituation" runat="server" CssClass="kpms-textarea"
                                EnableTheming="false" tablename="MM_CUSTOMERENTITY" field="Memo"
                                activestatus="(23.*)" TextMode="MultiLine" Rows="3" MaxLength="512" />
                            <input type="hidden" runat="server" id="hiCreateUserId" tablename="MM_CUSTOMERENTITY" field="CreateUserId" />
                            <input type="hidden" runat="server" id="hiCreateUserName" tablename="MM_CUSTOMERENTITY" field="CreateUserName" />
                            <input type="hidden" runat="server" id="hiCreateDate" tablename="MM_CUSTOMERENTITY" field="CreateDate" />
                            <input type="hidden" runat="server" id="hiLastModifyUserId" tablename="MM_CUSTOMERENTITY" field="LastModifyUserId" />
                            <input type="hidden" runat="server" id="hiLastModifyUserName" tablename="MM_CUSTOMERENTITY" field="LastModifyUserName" />
                            <input type="hidden" runat="server" id="hiLastModifyDate" tablename="MM_CUSTOMERENTITY" field="LastModifyDate" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">客户联系录</td>
                        <td class="td-m" colspan="5">
                            <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(3.*)" EnableTheming="False" OnClientClick="return uploadFile('Module','ContactRecord');" OnClick="btnUpLoad_OnClick">
                                <img src="../../../Themes/Images/btn_upload.gif">
                                <span>上传附件</span>
                            </asp:LinkButton>
                            <span class="req-star" style="float: right;"
                                runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
                            <uc1:AttachmentView ID="ucUploadFile" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('customerContact')">联系人信息<span class="req-star" id="Span2" runat="server" displaystatus="(2.*)">(请先保存再添加联系人)</span>&nbsp;<img
                src="<%=WebAppPath%>/Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="tz-table" width="100%" id="customerContact">
                    <tr>
                        <td colspan="6" align="right" style="text-align: right">
                            <asp:Button ID="btnAdd" runat="server" Text="添加联系人" Width="80px" OnClientClick="return addContacter();"
                                OnClick="btnAdd_Click" ActiveStatus="(3.*)" DisplayStatus="(3.*)" />
                        </td>
                    </tr>
                    <tr id="contacter">
                        <td colspan="6">
                            <zhongsoft:LightPowerGridView ID="gvContacterList" runat="server" AllowPaging="true"
                                UseDefaultDataSource="true" PageSize="10" DataKeyNames="CONTACTERID" AutoGenerateColumns="false"
                                OnRowCommand="gvContacterList_RowCommand" BindGridViewMethod="BindContacter">
                                <Columns>
                                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <zhongsoft:LightBoundField DataField="ContacterName" HeaderText="姓名">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="性别" DataField="sex" />
                                    <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName" />
                                    <zhongsoft:LightBoundField DataField="Post" HeaderText="职务">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField DataField="PHONE" HeaderText="办公室电话">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="手机" DataField="MobilePhone" />
                                    <zhongsoft:LightBoundField DataField="EMAIL" HeaderText="电子邮箱">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="家庭电话" DataField="HomePhone" />
                                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showContacter" DataParamFields="CONTACTERID"
                                        ImageUrl="../../../Themes/Images/btn_dg_view.gif">
                                    </zhongsoft:LightButtonField>
                                    <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editContacter" DataParamFields="CONTACTERID"
                                        ImageUrl="../../../Themes/Images/btn_dg_edit.gif" Visible="false">
                                    </zhongsoft:LightButtonField>
                                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                                        Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                                                OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("CONTACTERID") %>'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif"                                     />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('project')">合作项目信息<span class="req-star" id="Span3" runat="server" displaystatus="(2.*)"></span>&nbsp;<img
                src="<%=WebAppPath%>/Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="tz-table" width="100%" id="project">
                    <tr>
                        <td colspan="6">
                            <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="10" ID="gvRelationProject" UseDefaultDataSource="True"
                                runat="server" Width="100%" ShowExport="True" BindGridViewMethod="BindRelationProject" OnRowDataBound="gvRelationProject_OnRowDataBound">
                                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                <Columns>
                                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewProject" ToolTip="查看" DataParamFields="MarketProjectID"
                                        ImageUrl="../../../Themes/Images/btn_dg_view.gif" />
                                    <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" ShowToolTip="True" Width="100px" />
                                    <zhongsoft:LightBoundField HeaderText="工程编号" DataField="MarketProjectCode" />
                                    <zhongsoft:LightBoundField HeaderText="工程名称" DataField="MarketProjectName" ShowToolTip="True" Width="100px" />
                                    <zhongsoft:LightBoundField HeaderText="工程类型" DataField="ProjectType" />
                                    <zhongsoft:LightBoundField HeaderText="服务性质" DataField="ServiceType" />
                                    <zhongsoft:LightBoundField HeaderText="建设性质" DataField="BuildType" />
                                    <zhongsoft:LightBoundField HeaderText="工程阶段" DataField="ProjectPhaseNames" ShowToolTip="True" Width="100px" />
                                    <zhongsoft:LightBoundField HeaderText="工程规模" DataField="ProjectScale" ShowToolTip="True" Width="100px" />
                                    <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade" ItemStyle-HorizontalAlign="Right" />
                                    <zhongsoft:LightBoundField HeaderText="是否正式工程" />
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('CustomerSatisfaction')">客户满意度<span class="req-star" id="Span4" runat="server" displaystatus="(2.*)">(请先保存再上传)</span>&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table class="tz-table" width="100%" id="CustomerSatisfaction">
                    <tr>
                        <td colspan="6" align="right" style="text-align: right">
                            <asp:Button ID="btnUpLoadCS" runat="server" Text="上传" OnClientClick="return uploadFile('Module','CustomerSatisfaction');" OnClick="btnUpLoadCS_OnClick" displaystatus="(3.*)" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="10" ID="gvCustomerSatisfactionList" UseDefaultDataSource="True"
                                DataKeyNames="FileId" runat="server" OnRowCommand="gvCustomerSatisfactionList_OnRowCommand"
                                Width="100%">
                                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                <Columns>
                                    <asp:TemplateField HeaderText="文件名称" ItemStyle-Width="80%">
                                        <ItemTemplate>
                                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"
                                                target="_blank" title="<%# Eval("FileName") %>" style="text-decoration: underline; color: Blue"><%# Eval("FileName") %></a>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <zhongsoft:LightBoundField HeaderText="上传时间" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="15%" />
                                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" EnableTheming="False" CommandName="remove" CommandArgument='<%#Eval("FileId") %>'>
                                            <img id="btnDelete" alt="删除" style="CURSOR: hand" onclick="return confirm('是否删除附件？')"
                                                 src="../../../Themes/Images/btn_dg_delete.gif"  border="0" />
                                            </asp:LinkButton>
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
    <!---客户信息Id--->
    <input type="hidden" id="hiCustomerId" tablename="MM_CUSTOMERENTITY" field="CUSTOMERID"
        runat="server" />
    <input type="hidden" id="hiFielID" runat="server" />
    <input type="hidden" runat="server" id="hiFlag" field="FLAG" tablename="MM_CUSTOMERENTITY"
        value="1" />
    <asp:Button ID="btnResetList" runat="server" Visible="false" OnClick="btnResetList_Click" />
    <asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            if ("<%=this.ActionType %>" == "Create") {
                $("#contacter").hide();
            }
            else {
                $("#contacter").show();
            }
        }

        //上传附件
        function uploadFile(flag, fileType) {
            var fileSrcId = $("#<%=hiCustomerId.ClientID%>").val();
            showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
        }

        //查看客户联系人详细信息
        function showContacter(id) {
            var url = buildBizUrl(1, id, "MM/List/CRM/CustomerContacterEditor.aspx", { CustomerName: escape($('#<%=tbCustomerName.ClientID %>').val()) });
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 610, 330, null);
            return false;
        }

        //编辑客户联系人详细信息
        function editContacter(id) {

            var url = buildBizUrl(3, id, "MM/List/CRM/CustomerContacterEditor.aspx", { CustomerName: escape($('#<%=tbCustomerName.ClientID %>').val()) });
            //return checkReturn(showModal(url, null, 1200, 1000));
            showDivDialog(url, null, 610, 330, resetList);
            return false;
        }

        //添加联系人
        function addContacter() {
            var url = buildQueryUrl("MM/List/CRM/CustomerContacterEditor.aspx", { actionType: 2, CustomerId: $('#<%=hiCustomerId.ClientID %>').val(), CustomerName: escape($('#<%=tbCustomerName.ClientID %>').val()) });

            //return checkReturn(showModal(url, null, 1200, 1000));
            showDivDialog(url, null, 610, 330, resetList);
            return false;
        }

        //新建、编辑弹出层callback方法
        function resetList() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnResetList,"") %>
        }

        function checkForm() {
            if ("<%=this.ActionType %>" == "Create") {
                if (checkCustomerName() != "") {
                    alert("已存在名称为【" + $("#<%=tbCustomerName.ClientID %>").val() + "】的客户");
                    return false;
                }
            }
            return true;
        }

        //判断编号是否可用
        function checkCustomerName() {
            var isOK = false;
            $.ajax({
                type: "POST",
                async: false,
                url: "CustomerEditor.aspx",
                data: { asyfunc: "CheckCustomerNameRepeat", "customerName": $("#<%=tbCustomerName.ClientID %>").val(), "customerID": $("#<%=hiCustomerId.ClientID %>").val() },
                success: function (data) {
                    isOK = data;
                },
                error: function (err) {
                    alert(err);
                }
            })
            return isOK;
        }
        //查看工程信息
        function viewProject(id) {
            var url = buildBizUrl(1, id, "MM/List/MM/AddToFormalProject.aspx", null);
            showDivDialog(url, null, 850, 550, null);
            return false;
        }
    </script>
</asp:Content>
