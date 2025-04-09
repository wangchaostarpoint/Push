<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkInfoListControl.ascx.cs" Inherits="Zhongsoft.Portal.WHHelper.LIst.WorkInfo.WorkInfoListControl" %>
<zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" DownLoadFileName="领导动向"
    PageSize="10" DataKeyNames="UserId" AutoGenerateColumns="false"  RowStyle-HorizontalAlign="Center"
    OnRowDataBound="gvList_RowDataBound" OnRowCreated="gvList_RowCreated">
    <Columns>
        <asp:BoundField DataField="UserId" HeaderText="UserId" Visible="false" />
        <asp:BoundField DataField="UserName" HeaderText="姓名" ItemStyle-HorizontalAlign="Left"
            ItemStyle-Width="80px" />
        <asp:BoundField HeaderText="周一" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周二" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周三" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周四" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周五" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周六" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周日" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
    </Columns>
</zhongsoft:LightPowerGridView>
<asp:Button ID="btnReload" runat="server" Visible="false" OnClick="btnReload_Click" />
<script type="text/javascript">

    function ViewDetail(keyID, time) {
        var json = { userid: keyID, actionType: "1", isOrder: "1" ,timestr:time };
        var url = buildQueryUrl('/WHHelper/LIst/WorkInfo/WorkInfoView.aspx', json);
         
        showDivDialog(url, "", 500, 240, null);
      
        return false;
    } 
</script>

