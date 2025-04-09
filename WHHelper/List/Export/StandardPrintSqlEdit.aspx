<%@ Page Title="表单数据源配置信息添加" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="StandardPrintSqlEdit.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.Export.StandardPrintSqlEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">数据源名称<span class="req-star">*</span></td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="ltbSqlName" TableName="WH_Helper_StandardExportDetail" Field="SqlName" runat="server" ActiveStatus="(23.*)" req="1" Width="200px" />
            </td>
        </tr>
         <tr>
            <td colspan="6"><span class="req-star">注释：<br />
                                                       1.如果自定义签名数据，签名图片字段必须包含SignImg，例如：SignImg1;系统会自动判断签名图片是否存在<br />
                                                       2.自定义签名数据签名图片地址只需配置EDPortal下属目录结构即可，例如：SignImg1=Sys/UserSign/empty.JPG<br />
                                                       3.sql中需要用到主键参数，使用@bizid 例如：keyId=@bizid
                            </span></td>
        </tr>
        <tr>
            <td class="td-l">SQL表达式<span class="req-star">*</span>
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbSqlStr" isBar="1" TextMode="MultiLine" CssClass="kpms-textarea" Rows="20"  Height="200"
                    activeStatus="(23.*)" EnableTheming="false" req="1" Field="SqlStr" tablename="WH_Helper_StandardExportDetail" />
            </td>
        </tr>
       
        <tr flag="list">
            <td class="td-l">排序字段<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="ltbSort"  req="1" TableName="WH_Helper_StandardExportDetail" Field="Sort" runat="server" ActiveStatus="(23.*)" Width="50px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" MaxText="512" TableName="WH_Helper_StandardExportDetail" Field="Remark" ActiveStatus="(23.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hdnSourceId" name="hdnSourceId" tablename="WH_Helper_StandardExportDetail" field="SourceId" />
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="WH_Helper_StandardExportDetail" field="DetailId" />
</asp:Content>
