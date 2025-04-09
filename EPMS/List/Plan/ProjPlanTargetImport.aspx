<%@ Page Title="导入产品质量、环境和职业健康安全管理目标、措施及测评" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ProjPlanTargetImport.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjPlanTargetImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <tr style="height: 30px;">
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold">
                <asp:FileUpload ID="fileUploadWbs" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton runat="server" ID="lbtmInport" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return beforeImport()" OnClick="btnImport_Click">
                    <span runat="server" id="spanImport">
                        <img runat="server" id="imgImport" src="~/Themes/Images/ico_excel.gif" alt="导入" width="16"
                            height="16" />确定导入</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiImportStatus" />
    <script>
        function beforeImport() {
            var importStatus = $("#<%=hiImportStatus.ClientID %>").val();
            var hasFile = $("#<%=fileUploadWbs.ClientID %>").val();
            if (hasFile != "") {
                if (importStatus != "") {
                    alert("正在导入数据，请稍等！");
                    return false;
                }
                else {
                    $("#<%=hiImportStatus.ClientID %>").val("1");
                    setReturnVal();
                }
            }
            else {
                alert("请选择excel文件");
                return false;
            }
            return true;
        }

        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = "saved";
        }

    </script>
</asp:Content>
