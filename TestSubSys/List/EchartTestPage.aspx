<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="EchartTestPage.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.EchartTestPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <script type="text/javascript">
        function func111(pa1, pa2, pa3) {
            alert(pa1 + "|" + pa2 + "|" + pa3);
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <div style="background-color: #fff">
        <zhongsoft:EChart ID="myChart" runat="server" MainTitle="计划完成、实际完成卷册数柱状图" SubText="按月份统计计划完成、实际完成卷册数"
            Width="850px" TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top"
            LegendXAlign="Center" LegendYAlign="Top" LegendOrient="Horizontal" ClickOpenUrl="http://www.baidu.com"
            ClientClickFunction="func111" Height="400px">
        </zhongsoft:EChart>
        <hr />
        <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none" />
        <asp:TextBox ID="TextBox1" Style="display: none" runat="server" Text="斯蒂芬克实得分扩散的付款撒的发那时快的烦恼看撒娇的脑神经的女"></asp:TextBox>
        <!---DataGrid列表--->
        <zhongsoft:EChart ID="EChart1" runat="server" MainTitle="计划完成、实际完成卷册数折线图" SubText="按月份统计计划完成、实际完成卷册数" Width="850px"
            TitleXAlign="Left" TitleYAlign="Center" ToolboxXAlign="Center" ToolboxYAlign="Center"
            LegendXAlign="Center" LegendYAlign="Top" LegendOrient="Horizontal" ClickOpenUrl="http://www.baidu.com"
            ClientClickFunction="func111" Height="400px" OptionsJson="{ backgroundColor: '#fff'}">
        </zhongsoft:EChart>
        <zhongsoft:EChart ID="EChart5" runat="server" MainTitle="主标题" SubText="副标题3" Width="850px"
            TitleXAlign="Left" TitleYAlign="Center" ToolboxXAlign="Center" ToolboxYAlign="Center"
            LegendXAlign="Center" LegendYAlign="Top" LegendOrient="Horizontal" ClickOpenUrl="http://www.baidu.com"
            ClientClickFunction="func111" Height="400px">
        </zhongsoft:EChart>
        <zhongsoft:EChart ID="EChart2" runat="server" Width="550px" Height="400px" ClientClickFunction="func111">
        </zhongsoft:EChart>
        <zhongsoft:EChart ID="EChart3" runat="server" Width="550px" Height="300px">
        </zhongsoft:EChart>
        <zhongsoft:EChart ID="EChart4" runat="server" Width="650px" Height="400px" OptionsJson="{series:[{itemStyle:{normal:{label:{show:false}}}}]}">
        </zhongsoft:EChart>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
