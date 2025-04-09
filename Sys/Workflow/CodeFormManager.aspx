<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CodeFormManager.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.CodeFormManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="true"
            OnAddClientClick="addList()" OnAddData="gvList_Add" ShowAddData="true" AutoGenerateColumns="false"
            OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
            <Columns>
                <asp:BoundField DataField="FormId" HeaderText="Id" ItemStyle-Width="30px"></asp:BoundField>
                <asp:BoundField DataField="FormCode" HeaderText="表单编号" ItemStyle-Width="60px" />
                <zhongsoft:LightBoundField DataField="FormName" HeaderText="表单名称" HeaderStyle-Width="100px"
                    ItemStyle-Width="100px" EditItemClick="viewForm" DataParamFields="PackageName,XPDLID,FormId,PrimaryVersion,MinorVersion">
                </zhongsoft:LightBoundField>
                <asp:BoundField DataField="PackageName" HeaderText="包名" ItemStyle-Width="100px" />
                <asp:BoundField DataField="Sort" HeaderText="排序" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="表单状态" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                    <ItemTemplate>
                        <%#GetFormIsPublish(Eval("Flag").ToString())%>
                        <asp:LinkButton ID="lbtnPublish" runat="server" CommandName="Publish" CommandArgument='<%#Eval("objectId") %>'
                            EnableTheming="false">
						<img title="发布表单"  src="../../Themes/Images/btn_finish.gif" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="CancelPublish" CommandArgument='<%#Eval("objectId") %>'
                            EnableTheming="false">
						<img title="取消发布" src="../../Themes/Images/btn_back.gif" />
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditData" CommandArgument='<%#Eval("objectId") %>'
                            EnableTheming="false">
						<img title="编辑" src="../../Themes/Images/btn_dg_edit.gif"  onclick="return editList('<%#Eval("objectId") %>')"/>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" />
            </Columns>
        </zhongsoft:LightPowerGridView>
        <script>


            function addList() {
                var url = buildBizUrl(2, "", "Sys/Workflow/CustomXPDLEditor.aspx", { FormCode: '<%= this.Request["FormCode"]%>' });
                window.open(url);
                return false;
            }

            function editList(bizId) {
                var url = buildBizUrl(3, bizId, "Sys/Workflow/CustomXPDLEditor.aspx", null);
                window.open(url);
                return false;
            }

            function viewForm(packageName, xpdlId, formId, pver, mver) {
                var url = buildQueryUrl("Sys/Workflow/FormDetail.aspx",
            { actionType: 2, packageName: packageName, xpdlId: xpdlId, formId: formId, ver: pver + "|" + mver });
                window.open(url);
                return false;
            }
        
        
        </script>
    </div>
    </form>
</body>
</html>
