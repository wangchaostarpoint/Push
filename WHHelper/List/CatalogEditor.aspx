<%@ Page Title="帮助文档-目录" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="CatalogEditor.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.CatalogEditor" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table"> 
        <tr>
            <td class="td-l">目录名称<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCatalogName" TableName="WH_Helper_Catalog" Field="CatalogName" runat="server" ActiveStatus="(23.*)" req="1" />
            </td>

            <td class="td-l">目录编码<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCatalogCode" TableName="WH_Helper_Catalog" Field="CatalogCode" runat="server" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">目录说明<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbRemark" TableName="WH_Helper_Catalog" Field="Remark" ActiveStatus="(23.*)"  
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
             
        </tr>
        <tr>
              <td class="td-l">排序<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="WH_Helper_Catalog" Field="Sort" Width="50px" runat="server" ActiveStatus="(23.*)"   />
            </td>
        </tr> 
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="WH_Helper_Catalog" field="CatalogId" />
     <input type="hidden" runat="server" id="hiParentId" name="hiParentId" tablename="WH_Helper_Catalog" field="ParentId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
 
