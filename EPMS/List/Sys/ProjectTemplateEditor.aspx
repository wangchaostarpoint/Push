<%@ Page Language="C#" AutoEventWireup="true" Title="项目模板详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ProjectTemplateEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ProjectTemplateEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">模板名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbName" TableName="EPMS_ProjectTemplate"
                    Field="ProjectTemplateName" activestatus="(23.*)" req="1" ToolTip="模板名称可以根据选择的项目类型、项目阶段、规模等级自动生成"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">业务类型
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlBizType" TableName="EPMS_ProjectTemplate"
                    Field="ParamBusinessTypeID" activestatus="(23.*)" Visible="False">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">业务板块
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightDropDownList runat="server" ID="ddlBizPlate" TableName="EPMS_ProjectTemplate"
                    Field="ParamBusinessPlateID" activestatus="(23.*)" Visible="False" />

                <asp:RadioButtonList runat="server" ID="rblBusinessPlate" field="ParamBusinessPlateID" tablename="EPMS_ProjectTemplate"
                    RepeatDirection="Horizontal" activestatus="(23.*)" >
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">项目类型
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjType" TableName="EPMS_ProjectTemplate"
                    Field="ParamProjectTypeID" activestatus="(23.*)" OnSelectedIndexChanged="ddlProjType_SelectedIndexChanged"
                    AutoPostBack="true">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">规模等级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlScale" TableName="EPMS_ProjectTemplate"
                    Field="ParamScaleGradeID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">项目阶段
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" TableName="EPMS_ProjectTemplate"
                    Field="ParamPhaseID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ProjectTemplate" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[0-9]{0,2}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">适用范围
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUseRange" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/TemplateUsingRangeSelector.aspx"
                    TableName="EPMS_ProjectTemplate" Field="UsingRange" activestatus="(23.*)"></zhongsoft:LightObjectSelector>
            </td>
        </tr>
        <tr>
            <td class="td-l">项目总工日
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTotleWorkDays" TableName="EPMS_ProjectTemplate" Field="TotleWorkDays"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[0-9]+(\.[0-9]{2})?$"
                    errmsg="请输入数字（两位小数）" runat="server" onblur="Caculate()"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">备用工日
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSpareWorkDays" TableName="EPMS_ProjectTemplate" Field="SpareWorkDays"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[0-9]+(\.[0-9]{2})?$"
                    errmsg="请输入数字（两位小数）" runat="server" onblur="Caculate()"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">备用工日比例
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbSpareProportion" TableName="EPMS_ProjectTemplate"
                    Field="SpareProportion" Style="text-align: right; width: 70px;" activestatus="(23.*)"
                    regex="^[0-9]+(\.[0-9]{2})?$" errmsg="请输入数字（两位小数）" onblur="Caculate()"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">描述
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_ProjectTemplate"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <%--<td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ProjectTemplate" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,2}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>--%>
            <td class="td-l">是否启用
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ProjectTemplate"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" style="text-align: center;">
                <b>包含专业</b> <span runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:LinkButton runat="server" ID="ibtnAddSpe" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClientClick="return false">
                        <span>
                            <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="添加专业" width="16"
                                height="16" />添加专业</span>
                    </asp:LinkButton>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ParamSpecialtyID" UseDefaultDataSource="true" BindGridViewMethod="BindSpecialty"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="SpecialtyCode" HeaderText="专业代字">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="SpecialtyType" HeaderText="专业类型">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="所在部门">
                            <ItemTemplate>
                                <input runat="server" type="hidden" id="hiProjectSpecialtyTempID" />
                                <input runat="server" type="hidden" id="hiParamSpecialtyID" value='<%#Eval("ParamSpecialtyID") %>' />
                                <%--<asp:Label runat="server" ID="lbDeptName" Text='<%#Eval("OrganizationName") %>'></asp:Label>--%>
                                <asp:Label runat="server" ID="lbDept"></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightTemplateField HeaderText="工作类别">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlWorkType">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="企业定额工日">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkDays" onblur="CaculateSpe(this)"
                                    Style="text-align: right" regex="^[0-9]{0,6}$" errmsg="请输入最多6位整数" Text='<%#Eval("WorkDays") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="专业工日占比" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" Style="text-align: right" ID="tbSpeProportion"
                                    Text='<%#Eval("SpeProportion") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="行业定额工日">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbIndustryWorkDays" Style="text-align: right"
                                    regex="^[0-9]{0,6}$" errmsg="请输入最多6位整数" Text='<%#Eval("IndustryWorkDays") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>--%>
                        <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnView" EnableTheming="false" CommandName="view"
                                    OnClientClick="return ViewProjectSpe(this)">
                                <span><img src="../../../Themes/Images/btn_dg_edit.gif" alt="编辑" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("ParamSpecialtyID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" style="text-align: center;">
                <b>模板文件</b> <span runat="server" style="float: right" displaystatus="(3.*)">
                    <zhongsoft:LightFileUploader runat="server" ID="fu" CssClass="subtoolbarlink" EnableTheming="false"
                        FileSourceFlag="Module" OnClick="btnBindFile_Click"> <span>
                              <img id="imgFile" src="../../../Themes/Images/ico_fujian.gif" alt="上传文件" width="16"
                                height="16" />上传文件</span></zhongsoft:LightFileUploader>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvFile" AllowPaging="True"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="TemplateFileID" UseDefaultDataSource="true" BindGridViewMethod="BindFile"
                    OnRowCommand="gvFile_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="模板文件名称">
                            <ItemTemplate>
                                <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("TemplateFileURL") %>"
                                    target="_blank" title="<%# Eval("TemplateFileName") %>">
                                    <%#Eval("TemplateFileName")%></a>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("TemplateFileID")+","+Eval("TemplateFileURL") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ProjectTemplate" field="ProjectTemplateID"
        runat="server" />
    <input runat="server" id="hiSpeXML" type="hidden" />
    <asp:Button runat="server" ID="btnAddSpe" OnClick="btnAddSpe_Click" Visible="false" />
    <asp:Button runat="server" ID="btnBindFile" OnClick="btnBindFile_Click" Visible="false" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            $('#<%=ibtnAddSpe.ClientID %>').live('click', function () {
                return batchAddSpe();
            });

            $('#<%=ddlProjType.ClientID %>').live('change', function () {
                initTempName();
            });
            $('#<%=ddlPhase.ClientID %>').live('change', function () {
                initTempName();
            });
            $('#<%=ddlScale.ClientID %>').live('change', function () {
                initTempName();
            });
        }

        //批量添加专业
        function batchAddSpe() {
            var param = new InputParamObject("m");
            var projectTypeId = $('#<%=ddlProjType.ClientID %>').val();
            var json = { ProjectTemplateID: '<%=BusinessObjectId %>', ParamProjectTypeID: projectTypeId };
            var url = '/EPMS/Obsolete/SpeSelector.aspx';
            url = buildQueryUrl(url, null);
            //showDivDialog(encodeURI(url), null, 850, 550, addSpes);
            getDivSpecialty('<%=hiSpeXML.ClientID %>', param, json, addSpes);
            return false;
        }

        //执行后台添加专业数据
        function addSpes() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddSpe,"")%>;
        }

        //组织模板名称
        function initTempName() {
            var projType = $('#<%=ddlProjType.ClientID %> option:selected').text();
            var phase = $('#<%=ddlPhase.ClientID %> option:selected').text();
            var scale = $('#<%=ddlScale.ClientID %> option:selected').text();

            $('#<%=tbName.ClientID %>').val(projType + '_' + phase + '_' + scale);
        }

        function Caculate() {
            var totle = $('#<%=tbTotleWorkDays.ClientID %>').val();
            var spare = $('#<%=tbSpareWorkDays.ClientID %>').val();
            if (totle != "" && spare != "") {
                totle = parseInt(totle);
                spare = parseInt(spare);
                if (totle < spare) {
                    alert("备用工日不能大于项目总工日！");
                    $('#<%=tbTotleWorkDays.ClientID %>').val("");
                    $('#<%=tbSpareWorkDays.ClientID %>').val("");
                }
                else {
                    var proportion = (spare / totle).toFixed(2);
                    $('#<%=tbSpareProportion.ClientID %>').val(proportion);
                }
            }
        }

        function CaculateSpe(obj) {
            var sum = 0;
            $("[id$='tbWorkDays']").each(function (index) {
                var num = 0;
                if ($(this).val() != "") {
                    num = parseInt($(this).val());
                    sum = sum + num;
                }
            });
            var id = $(obj).attr("id").replace("tbWorkDays", "tbSpeProportion");
            var workDays = parseInt($(obj).val());
            var totalDays = parseInt($('#<%=tbTotleWorkDays.ClientID %>').val());
            var sperDays = parseInt($('#<%=tbSpareWorkDays.ClientID %>').val());
            if (sum > (totalDays - sperDays)) {
                alert("各专业额定工日总额应该小于项目总工日捡取备用工日");
                $(obj).val("");
            }
            else {
                var proportion = (workDays / (totalDays - sperDays)).toFixed(2);
                if (!isNaN(proportion)) {
                    $("#" + id).val(proportion);
                }
            }
        }

        //查看项目专业详细信息
        function ViewProjectSpe(obj) {
            var id = $(obj).attr("id").replace("lbtnView", "hiProjectSpecialtyTempID");
            var idSpe = $(obj).attr("id").replace("lbtnView", "hiParamSpecialtyID");
            var bizId = $("#" + id).val();
            var speId = $("#" + idSpe).val();
            //alert("<%=BusinessObjectId %>"+"-"+bizId);
            var url = "/EPMS/List/Sys/ProjectSpecailtyDetailEditor.aspx?actiontype=3&bizId=" + bizId + "&ProjectTemplateID=" +"<%=BusinessObjectId %>" + "&ParamSpecialtyID=" + speId;
            showDivDialog(encodeURI(url), null, 850, 550, null);
            return false;
        }

    </script>
</asp:Content>
