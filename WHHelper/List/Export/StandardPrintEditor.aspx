<%@ Page Title="标准表单导出配置编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="StandardPrintEditor.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.Export.StandardPrintEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l" nowrap="nowrap">
                <asp:RadioButtonList runat="server" ID="rblPrintType" RepeatDirection="Horizontal" TableName="WH_Helper_StandardExport"
                    Field="PrintType" activestatus="(2.*)" RepeatLayout="Flow">
                    <%--<asp:ListItem Value="1" Selected="True">表单</asp:ListItem>
                    <asp:ListItem Value="0">台帐</asp:ListItem>--%>
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hdnPrintName" field="PrintName" tablename="WH_Helper_StandardExport" />
                <span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:XHtmlInputText ID="txtFormName" runat="server" class="kpms-textbox-short"
                    readonly="readonly" TableName="WH_Helper_StandardExport" Field="PageName"
                    req="1" activestatus="(2.*)">
                </zhongsoft:XHtmlInputText>
                <asp:ImageButton ID="ibtnSelectForm" runat="server" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择" CausesValidation="False" displaystatus="(2.*)" OnClientClick="return selForm()" />
                <input type="hidden" runat="server" id="hiFormId" field="PageId" tablename="WH_Helper_StandardExport" />
            </td>

        </tr>
        <tr>
            <td class="td-l">关键字<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="ltbKeyWord" TableName="WH_Helper_StandardExport" Field="KeyWord" runat="server" req="1" ActiveStatus="(23.*)" Width="150px" />
            </td>
            <td class="td-l">是否流程<span class="req-star">*</span></td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsFlow" runat="server" RepeatDirection="Horizontal" activeStatus="(23.*)"
                    req="1" Field="IsFlow" tableName="WH_Helper_StandardExport">
                    <%-- <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>--%>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">是否启用<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsUse" runat="server" RepeatDirection="Horizontal" activeStatus="(23.*)"
                    req="1" Field="IsUse" tableName="WH_Helper_StandardExport">
                    <%--  <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>--%>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">标准表单模板<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="1">
                <zhongsoft:XHtmlInputText ID="txtTemplateFileName" runat="server" class="kpms-textbox" readonly="readonly"
                    TableName="WH_Helper_StandardExport" Field="StandardTemplateName" ActiveStatus="(23.*)">
                </zhongsoft:XHtmlInputText>
                <a id="aFile" runat="server" visible="false" target="_blank" href="">下载</a>
                <input type="hidden" runat="server" id="hdnStandardTemplatePath" field="StandardTemplatePath" tablename="WH_Helper_StandardExport" />
            </td>
            <td class="td-m" colspan="4">
                <asp:FileUpload runat="server" ID="fupPdf" Width="80%" displaystatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <span class="req-star">编辑模板请点击上方打开进行配置，配置完成后进行重新上传！</span>
            </td>
        </tr>
        <tr>
            <td class="td-l">标准表单名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="ConfigName" req="1" tablename="WH_Helper_StandardExport"
                    field="StandardName" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">导出类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlExportType" runat="server" OnSelectedIndexChanged="ddlExportType_SelectedIndexChanged" ActiveStatus="(23.*)" req="1" Width="90px">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hdnExportType" field="ExportType" tablename="WH_Helper_StandardExport" />
            </td>

            <td class="td-l">排序<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="ltbSort" TableName="WH_Helper_StandardExport" req="1" Field="Sort" runat="server" ActiveStatus="(23.*)" Width="50px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbRemark" runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" MaxText="512" TableName="WH_Helper_StandardExport" Field="Remark" ActiveStatus="(23.*)" />
            </td>
        </tr>
         <tr>
            <td colspan="6"><span class="req-star">注释：<br />
                                                       1.【是否流程】如果选择是，系统会自动把流程相关的环节处理人，意见，处理日期初始化表名为【WorkFlow】的数据源<br />
                                                      &nbsp; &nbsp;&nbsp; 环节处理人意见字段：【环节名称_Opinion】；环节处理时间【环节名称_Date】; 环节处理人【{0}_UserName】；<br />
                                                       2.【是否启用】-设置为是，则表单打印页可以看到打印入口，设置为否 则是不启用打印功能<br /> 
                                                       3.【导出类型】-原则上上传什么格式的文件类型就选择什么格式的类型，特例：上传任何格式文件都可以选择导出pdf<br /> 
                            </span></td>
        </tr>
        <tr>
            <td colspan="6" align="center">
                <b>表单数据源配置信息</b>
            </td>
        </tr>
        <tr id="Tr1" runat="server" displaystatus="(2.*)">
            <td colspan="6" align="right">
                <span class="req-star">先保存再添加表单数据源配置信息</span>
            </td>
        </tr>
        <tr id="Tr2" runat="server" displaystatus="(3.*)">
            <td colspan="6" align="right">
                <asp:Button ID="btnNew" runat="server" CssClass="kpms-btn" Text="添加"
                    OnClientClick="return detailOfObject(2,'');" />
            </td>
        </tr>
        <tr id="Tr3" runat="server" nodisplaystatus="(2.*)">
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="DetailId" PowerPageCount="0" PowerPageIndex="0" EmptyDataText="没有项目进度计划信息"
                    RecordsCount="0" UseDefaultDataSource="true" ShowFooter="false" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" OnRowCreated="gvList_RowCreated">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SqlName" HeaderText="数据源" />
                        <asp:BoundField DataField="Remark" HeaderText="备注" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="Sort" HeaderText="排序" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="30px" />
                        <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="btnView" EnableTheming="false">
                                     <img alt="查看" src="<%=WebAppPath %>/Themes/Images/btn_dg_view.gif" onclick="return detailOfObject(1,'<%# Eval("DetailId") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                     <img alt="编辑" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif" onclick="return detailOfObject(3,'<%# Eval("DetailId") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%# Eval("DetailId") %>' EnableTheming="false">
                                     <img alt="删除" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" onclick="return confirm('-确定要删除吗？');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" field="StandardExportId" tablename="WH_Helper_StandardExport" />
    <asp:Button ID="btnbindData" runat="server" Visible="false" OnClick="btnbindData_Click" />
    <script type="text/javascript">
        function checkForm() {
            return checkDoc();
        }
        function selForm() {
            var type = $('#<%=rblPrintType.ClientID %> input[type=radio]:checked').val();
            var param = new InputParamObject("s");
            var reObj = null;
            if (type == 1) {
                //选择表单
                reObj = getForm('re', param, null);
                if (reObj != null) {
                    $('#<%=hiFormId.ClientID %>').val(reObj.buildAttrJson("o", "id"));
                    $('#<%=txtFormName.ClientID %>').val(reObj.buildAttrJson("o", "name"));
                }
            }
            else if (type == 2) {
                //选择台帐
                reObj = getPage('re', param, '|||0');
                if (reObj != null) {
                    //对于台帐必须配置对应数据字典，否则无法与数据实体进行关联
                    var bizTable = reObj.buildAttrJson("o", "att4");
                    if (bizTable == '' || bizTable == null || bizTable == undefined) {
                        alert('请先配置对应台帐的数据字典，再进行标准表单配置');
                        return false;
                    }
                    $('#<%=hiFormId.ClientID %>').val(reObj.buildAttrJson("o", "id"));
                    $('#<%=txtFormName.ClientID %>').val(reObj.buildAttrJson("o", "name"));
                }
            }
            return false;
        }

        //编辑填充SQL
        function detailOfObject(actionType, bizId) {
            var sourceId = $('#<%=hiKeyId.ClientID %>').val();
            var url = "<%=WebAppPath %>/WHHelper/List/Export/StandardPrintSqlEdit.aspx?actionType=" + actionType + "&sid=" + sourceId;
            if (bizId != '') {
                url += "&bizId=" + bizId;
            }
            showDivDialog(url, "", 900, 590, rebindGridData);
            return false;
        }

        function rebindGridData() {
             <%=this.Page.GetPostBackEventReference(this.btnbindData,"") %>;
        }
        var filetype = ["doc", "docx", "xls", "xlsx"];
        $('#<%=fupPdf.ClientID %>').on("change", function () {
            var filePath = $(this).val();
            var arr = filePath.split('.');
            var fileName = (arr[arr.length - 1]).toLowerCase();
            if ($.inArray(fileName, filetype) < 0) {
                alert("文件格式错误，请上传doc、docx、xls、xlsx文件格式！");
                $(this).after($(this).clone().val(""));
                $(this).remove();
                return false;
            }
            $('#<%=ddlExportType.ClientID %>').val('');
            if (fileName == "doc" || fileName == "docx") {
                $('#<%=ddlExportType.ClientID %>').find("option").each(function () {
                    var optionP = $(this).parent("span");
                    if ($(this).attr("Value") != 10 && $(this).attr("Value") != 20 && $(this).attr("Value") != 40 && $(this).attr("Value") != "") {
                        if (!optionP.size()) {
                            $(this).wrap("<span style='display:none'></span>");
                        }
                    } else {
                        if (optionP.size()) {
                            optionP.children().clone().replaceAll(optionP);
                        }
                    }
                });
            }
            else {
                $('#<%=ddlExportType.ClientID %>').find("option").each(function () {
                    var optionP = $(this).parent("span");
                    if ($(this).attr("Value") != 5 && $(this).attr("Value") != 6 && $(this).attr("Value") != 40 && $(this).attr("Value") != "") {
                        if (!optionP.size()) {
                            $(this).wrap("<span style='display:none'></span>");
                        }
                    }
                    else {
                        if (optionP.size()) {
                            optionP.children().clone().replaceAll(optionP);
                        }
                    }
                });
            }
            return true;
        });

        function checkDoc() {
            var filePath = $('#<%=fupPdf.ClientID %>').val();
            if (filePath != "") {
                var arr = filePath.split('.');
                var fileName = (arr[arr.length - 1]).toLowerCase();
                if ($.inArray(fileName, filetype) < 0) {
                    alert("文件格式错误，请上传doc、docx、xls、xlsx文件格式！");
                    $(this).after($(this).clone().val(""));
                    $(this).remove();
                    return false;
                }
            }
            return true;
        }

    </script>
</asp:Content>
