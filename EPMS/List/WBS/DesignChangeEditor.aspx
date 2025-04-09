<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesignChangeEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.DesignChangeEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="设计变更管理详细" %>

<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
        <tr>
            <td class="td-l">
                变更专业<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" activestatus="(23.*)"
                    req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" id="hiSpecialtyID" runat="server" field="SpecialtyID" tablename="EPMS_DesignChange" />
                <input type="hidden" id="hiSpecialtyCode" runat="server" field="SpecialtyCode" tablename="EPMS_DesignChange" />
                <input type="hidden" runat="server" id="hiSpecialtyName" field="SpecialtyName" tablename="EPMS_DesignChange" />
            </td>
            <td class="td-l">
                变更金额（元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbChangeSum" runat="server" MaxLength="14" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$"
                    errmsg="变更费用必须填写数字，最多12位整数，2位小数" CssClass="kpms-textbox-money" EnableTheming="false"
                    field="ChangeSum" tablename="EPMS_DesignChange" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                变更单编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbChangeCode" runat="server" MaxLength="32" EnableTheming="false"
                    field="ChangeBillCode" tablename="EPMS_DesignChange" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                变更原因<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlChangeReason" activestatus="(23.*)"
                    req="1" field="ChangeReason" tablename="EPMS_DesignChange">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                变更日期<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtChangeTime" activestatus="(23.*)"
                    EnableTheming="false" req="1" class="kpms-textbox-date" readonly="readonly" field="ChangeTime"
                    tablename="EPMS_DesignChange" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbChangeContent" CssClass="kpms-textarea"
                    EnableTheming="false" activestatus="(23.*)" TextMode="MultiLine" maxtext="512"
                    Rows="4" field="Memo" tablename="EPMS_DesignChange">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">
                附件列表
            </td>
        </tr>
        <tr runat="server" displaystatus="(3.*)">
            <td class="td-m" colspan="6" style="text-align: right;">
                <zhongsoft:LightFileUploader runat="server" ID="fu" CssClass="subtoolbarlink" EnableTheming="false"
                    FileSourceFlag="Module" OnClick="btnBindFile_Click"> <span>
                              <img id="imgFile" src="../../../Themes/Images/ico_fujian.gif" alt="上传文件" width="16"
                                height="16" />上传文件</span></zhongsoft:LightFileUploader>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvFile" AllowPaging="True"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="FileId" UseDefaultDataSource="true" BindGridViewMethod="BindFile"
                    OnRowCommand="gvFile_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="文件名称">
                            <ItemTemplate>
                                <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileID") %>"
                                    target="_blank" title="<%# Eval("FileName") %>" class="aStyle">
                                    <%#Eval("FileName")%>
                                </a>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="上传人" DataField="CreateUserName">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="上传时间" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiFilePath" value='<%#Eval("FilePath") %>' />
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("FileID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <!--项目ID-->
    <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
        tablename="EPMS_DesignChange" />
    <!---项目编号-->
    <input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
        tablename="EPMS_DesignChange" />
    <!---项目名称-->
    <input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
        tablename="EPMS_DesignChange" />
    <!--主键-->
    <input type="hidden" runat="server" id="hiDesignChangeID" field="DesignChangeID"
        tablename="EPMS_DesignChange" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_DesignChange"
        value="1" />
    <script type="text/javascript">
     
    </script>
</asp:Content>
