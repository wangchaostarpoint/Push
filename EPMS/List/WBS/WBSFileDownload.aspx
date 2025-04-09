<%@ Page Language="C#" AutoEventWireup="true" Title="资料下载" CodeBehind="WBSFileDownload.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSFileDownload" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="../../UI/WBS/DesignTaskInfo.ascx" TagName="DesignTaskInfo" TagPrefix="uc1" %>
<%@ Register Src="../../UI/WBS/WBSPartakerList.ascx" TagName="WBSPartakerList" TagPrefix="uc2" %>
<%@ Register Src="../../UI/WBS/FileItemList.ascx" TagName="FileItemList" TagPrefix="uc3" %>
<%@ Register Src="../../UI/WBS/FileReceiveList.ascx" TagName="FileReceiveList" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <%--ReleWBSID--%>
    <fieldset class="rtm_fds_bd" id="fsAdvSearch" runat="server" style="width: 99%;">
        <div style="background-color: #EFF2F7;">
            <table class="tz-table" width="100%">
                <tr>
                    <td>
                        <span class="filter-block"><span class="filter-block-lb">专业</span> <span>
                            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" class="kpms-ddlsearch"
                                EnableTheming="false">
                            </zhongsoft:LightDropDownList>
                        </span></span><span class="filter-block" id="spWBSState" runat="server"><span class="filter-block-lb">
                            提交状态</span> <span>
                                <zhongsoft:LightDropDownList ID="ddlWBSState" runat="server" class="kpms-ddlsearch"
                                    EnableTheming="false">
                                </zhongsoft:LightDropDownList>
                            </span></span><span class="filter-block" id="spFileNature" runat="server"><span class="filter-block-lb">
                                资料状态</span> <span>
                                    <zhongsoft:LightDropDownList ID="ddlFileNature" runat="server" class="kpms-ddlsearch"
                                        EnableTheming="false">
                                    </zhongsoft:LightDropDownList>
                                </span></span>
                    </td>
                    <td style="text-align: right">
                        <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click">
                      <span content='searchResult'>查询</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click">
                      <span content='searchResult'>重置</span>
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
    <table class="tz-table" width="100%">
        <tr content="inFiles">
            <td class="flexible" colspan="6">
                专业间接收资料
            </td>
        </tr>
        <tr content="inFiles">
            <td colspan="6">
                <uc3:FileItemList ID="inFile" runat="server" WBSType="内部专业间提资" WBSTypeID="1" CallType="1"
                    IsShowAllDownload="true" />
                <uc4:FileReceiveList ID="projRecFile" runat="server" />
            </td>
        </tr>
        <tr content="inFiles">
            <td class="flexible" colspan="6">
                专业间提出资料
            </td>
        </tr>
        <tr content="inFiles">
            <td colspan="6">
                <uc3:FileItemList ID="mutualFile" runat="server" WBSType="内部专业间提资" WBSTypeID="1"
                    CallType="2" AddFileBtnName="添加提出资料" IsShowAllDownload="true" />
            </td>
        </tr>
        <tr content="outFiles" flag="title">
            <td class="flexible" colspan="6">
                业主、厂家资料
            </td>
        </tr>
        <tr content="outFiles">
            <td colspan="6">
                <uc3:FileItemList ID="externalFile" runat="server" WBSType="外部接口资料接收" WBSTypeID="2"
                    CallType="3" AddFileBtnName="添加外部资料" IsShowAllDownload="true" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <script type="text/javascript">
        if ("<%=FileType %>" == "out") {
            $("[content='inFiles']").hide();
            $("[flag='title']").hide();

        } else if ("<%=FileType %>" == "in") {
            $("[content='outFiles']").hide();
        }

    </script>
</asp:Content>
