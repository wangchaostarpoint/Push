<%@ Page  Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="EPMSTreeEditor.aspx.cs" Inherits="Zhongsoft.Portal.CatalogTree.Sys.EPMSTreeEditor" Title="类别设置" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
<table class="tz-table">
        <tr>
            <td class="td-l">
                节点编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCatalogCode" CssClass="kpms-textbox" req="1"
                         activestatus="(23.*)"   field="CatalogCode" tablename="EPMS_CatalogSet">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                节点名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCatalogName" CssClass="kpms-textbox" req="1"
                     activestatus="(23.*)"   field="CatalogName" tablename="EPMS_CatalogSet">
                </zhongsoft:LightTextBox>
            </td> 
        </tr> 　
         <tr>
            <td class="td-l">
                父级名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbParentName" CssClass="kpms-textbox"  
                      ReadOnly="true"    activestatus="(23.*)"   >
                </zhongsoft:LightTextBox> 
            </td>
            <td class="td-l">
                排序编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" CssClass="kpms-textbox" req="1"
                         activestatus="(23.*)"  field="Sort" tablename="EPMS_CatalogSet" errmsg="请输入正确的培训人数(1-4位整数)" regex="^\d{1,4}$">
                </zhongsoft:LightTextBox>
            </td> 
        </tr> 　
    </table>
    
    <input type="hidden" runat="server" id="hiEPMSCatalogID" field="EPMSCatalogID"   tablename="EPMS_CatalogSet" />
    <input type="hidden" runat="server" id="hiCatalogID" field="CatalogID"   tablename="EPMS_CatalogSet" />
    <input type="hidden" runat="server" id="hiParentID" field="ParentID"   tablename="EPMS_CatalogSet" /> 
    <input type="hidden" runat="server" id="hiIsDistinctSpecialty" field="IsDistinctSpecialty"   tablename="EPMS_CatalogSet" /> 
    <input type="hidden" runat="server" id="hiIsPermitUserMaintain" field="IsPermitUserMaintain"   tablename="EPMS_CatalogSet" /> 
    <input type="hidden" runat="server" id="hiBelongView" field="BelongView"   tablename="EPMS_CatalogSet" /> 
     <input type="hidden" runat="server" id="hiCatalogLevel" field="CatalogLevel"   tablename="EPMS_CatalogSet" /> 
      <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"   tablename="EPMS_CatalogSet" /> 
      <input type="hidden" runat="server" id="hiTreeType" field="TreeType"   tablename="EPMS_CatalogSet" /> 
</asp:Content>
