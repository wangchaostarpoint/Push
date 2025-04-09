<%@ Page Title="标准表单设置编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="StandardizedFormConfigEdit.aspx.cs" Inherits="Zhongsoft.Portal.Sys.StandardizedForm.StandardizedFormConfigEdit" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="toolBar" ContentPlaceHolderID="toolBtn" runat="server">
    <%--<asp:LinkButton runat="server" ID="btnCheck" CssClass="subtoolbarlink" EnableTheming="false"
        OnClick="btnCheck_Click" displayStatus="(3.*)">
        <span>校验</span>
    </asp:LinkButton>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l" nowrap="nowrap">
                <asp:RadioButtonList runat="server" ID="rblType" RepeatDirection="Horizontal" TableName="STANDARDIZEDFORMCONFIG_MAPPING"
                    Field="MAPPINGTYPE" activestatus="(2.*)" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Selected="True">表单</asp:ListItem>
                    <asp:ListItem Value="2">台帐</asp:ListItem>
                </asp:RadioButtonList>
                <span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtFormName" runat="server" class="kpms-textbox-short"
                    readonly="readonly" TableName="STANDARDIZEDFORMCONFIG_MAPPING" Field="FormName"
                    req="1" activestatus="(2.*)">
                </zhongsoft:XHtmlInputText>
                <asp:ImageButton ID="ibtnSelectForm" runat="server" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择" CausesValidation="False" displaystatus="(2.*)" OnClientClick="return selForm()" />
                <input type="hidden" runat="server" id="hiFormId" field="FormID" tablename="STANDARDIZEDFORMCONFIG_MAPPING" />
            </td>
            <td class="td-l">
                是否启用<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsUse" runat="server" RepeatDirection="Horizontal" activeStatus="(23.*)"
                    req="1" Field="FLAG" tableName="STANDARDIZEDFORMCONFIG_MAPPING">
                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                校验状态
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtCheckState" runat="server" class="kpms-textbox"
                    readonly="readonly" TableName="STANDARDIZEDFORMCONFIG_MAPPING" Field="CHECKSTATE"
                    activestatus="(23.*)" value="校验未通过">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                标准表单模板<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText ID="txtTemplateFileName" runat="server" class="kpms-textbox"
                    readonly="readonly" TableName="STANDARDIZEDFORMCONFIG_MAPPING" Field="STANDARDIZEDTEMPLATEFILENAME"
                    activestatus="(2.*)">
                </zhongsoft:XHtmlInputText>
                <a id="aFile" runat="server" visible="false" target="_blank" href="">打开</a>
                <!-- 与模板文件名一致-->
                <input type="hidden" runat="server" id="hiPDFFileName" field="PDFFileName" tablename="STANDARDIZEDFORMCONFIG_MAPPING" />
            </td>
            <td class="td-m" colspan="3">
                <asp:FileUpload runat="server" ID="fupPdf" Width="80%" displaystatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <span class="req-star">编辑模板请点击上方打开进行配置，配置完成后进行重新上传！</span>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                标准表单名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="ConfigName" tablename="STANDARDIZEDFORMCONFIG_MAPPING"
                    field="CONFIGNAME"></zhongsoft:LightTextBox>
            </td>
            <td class="td-m" colspan="4">
            </td>
        </tr>
        <%--<tr>
            <td class="td-l">
                PDF文件名<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <span class="req-star">注：不带扩展名。</span>
            </td>
        </tr>--%>
        <%--<tr>
            <td class="td-l">
                存档路径
            </td>
            <td class="td-m" colspan="3">
                <asp:TextBox ID="tbFilePath" runat="server" Width="450px" ActiveStatus="(23.*)" Field="FilePath"
                    tableName="STANDARDIZEDFORMCONFIG_MAPPING"></asp:TextBox>
                <span class="req-star">注：如果不指定，则存档在默认路径。</span>
            </td>
        </tr>--%>
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
        <tr id="Tr2" runat="server" displaystatus="(5.*)">
            <td colspan="6" align="right">
                <asp:Button ID="btnNew" runat="server" CssClass="kpms-btn" Text="添加" OnClick="btnNew_Click"
                    OnClientClick="return detailOfObject(2,'');" />
            </td>
        </tr>
        <tr id="Tr3" runat="server" nodisplaystatus="(2.*)">
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                    ShowExport="true" AllowPaging="true" OnRowCommand="gvList_RowCommand" BindGridViewMethod="BindListGrid"
                    HideFieldOnExport="查看,编辑,删除">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DataSource" HeaderText="数据源" />
                        <asp:BoundField DataField="IsList" HeaderText="列表" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="30px" />
                        <asp:BoundField DataField="IsHorizontalList" HeaderText="横向列表" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="40px" />
                        <asp:BoundField DataField="IsSignImage" HeaderText="签字图片" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="40px" />
                        <asp:BoundField DataField="IsThirdSign" HeaderText="第三方签字" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="40px" />
                        <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="btnView" EnableTheming="false">
                                     <img alt="查看" src="<%=WebAppPath %>/Themes/Images/btn_dg_view.gif" onclick="return detailOfObject(1,'<%# Eval("FillInfoID") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px"
                            Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditData">
                                     <img alt="编辑" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif" onclick="return detailOfObject(3,'<%# Eval("FillInfoID") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px"
                            Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%# Eval("FillInfoID") %>'>
                                     <img alt="删除" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" onclick="return confirm('-确定要删除吗？');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiMappingID" field="MappingID" tablename="STANDARDIZEDFORMCONFIG_MAPPING" />
    <script type="text/javascript">
        function InitCustomerPlugin() {
            $('#<%=rblType.ClientID %>').live('change', function () {
                clearFormInfo();
            });
            //导出
            ExpExcelAndWord("<%=gvList.ClientID %>");
        }

        //编辑填充SQL
        function detailOfObject(actionType, bizId) {
            var mappingId = $("#<%=this.hiMappingID.ClientID %>").val();
            var formId = $('#<%=hiFormId.ClientID %>').val();
            var url ="<%=WebAppPath %>/Sys/SWCS/StandardizedForm/StandardizedFormConfigEditFillSQL.aspx?actionType=" + actionType + "&mappingId=" + mappingId + "&formId=" + formId;
            if (bizId != '') {
                url += "&bizId=" + bizId;
            }
            showDivDialog(url, "", 900, 590, null);
            return false;
        }

        function selForm() {
            var type = $('#<%=rblType.ClientID %> input[type=radio]:checked').val();
            var param = new InputParamObject("s");
            var reObj = null;
            if (type == 1) {
                //选择表单
                reObj = getForm('re', param, null);
                if (reObj != null) {
                    $('#<%=hiFormId.ClientID %>').val(reObj.buildAttrJson("o", "FormID"));
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
                    $('#<%=hiFormId.ClientID %>').val(reObj.buildAttrJson("o", "att4"));
                    $('#<%=txtFormName.ClientID %>').val(reObj.buildAttrJson("o", "name"));
                }
            }
            return false;
        }

        //台帐表单切换后，清空选择结果
        function clearFormInfo() {
            $('#<%=hiFormId.ClientID %>').val('');
            $('#<%=txtFormName.ClientID %>').val('');
        }
    </script>
</asp:Content>
