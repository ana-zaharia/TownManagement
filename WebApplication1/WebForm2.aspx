<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Model modificare</title>
</head>
<body>
    <form id="form1" runat="server">
      <asp:AccessDataSource ID="ADS1" runat="server" DataFile="~/App_Data/ProiectDB.accdb" 
             SelectCommand="SELECT [IdPort], [Denumire], [Capacitate], [Tara] FROM [Porturi]"
             InsertCommand="INSERT INTO [Porturi] ([Denumire], [Capacitate], [Tara]) VALUES (?, ?, ?)"   
             UpdateCommand="UPDATE [Porturi] SET [Denumire] = ?, [Capacitate] = ?, [Tara] = ? WHERE [IdPort] = ?">
          <InsertParameters>
                <asp:Parameter Name="Denumire" Type="String" />
                <asp:Parameter Name="Capacitate" Type="Int32" />
                <asp:Parameter Name="Tara" Type="String" />
            </InsertParameters>
           

            <UpdateParameters>
                <asp:Parameter Name="Denumire" Type="String" />
                <asp:Parameter Name="Capacitate" Type="Int32" />
                <asp:Parameter Name="Tara" Type="String" />
                <asp:Parameter Name="IdPort" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" 
BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ADS1" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ButtonType="Button" SelectText="" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" Text="Modifica o carte" style="position:absolute; 
top: 14px; left: 471px;" OnClick="Button1_Click" />
        <asp:Panel ID="Panel1" runat="server" style="position:absolute; top: 54px; left: 467px; 
width: 481px; height: 286px;">
             <asp:Label ID="LblTitlu" runat="server" Text="Denumire" style="position:absolute; top: 31px;
 left: 18px; bottom: 136px;"></asp:Label>
             <asp:TextBox ID="TxtTitlu" runat="server" style="position:absolute; top: 32px; 
left: 105px;"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RFVTitlu" runat="server" ErrorMessage="Completati denumire"
 style="position:absolute; top: 34px; left: 262px;" ControlToValidate="TxtTitlu" SetFocusOnError="True">&nbsp;</asp:RequiredFieldValidator>
             
             <asp:Label ID="LblAn" runat="server" Text="Capacitate" style="position:absolute; top: 80px; 
left: 22px; bottom: 87px;"></asp:Label>
             <asp:TextBox ID="TxtAn" runat="server" style="position:absolute; top: 79px; left: 107px;
 right: 206px;"></asp:TextBox>
             <asp:RangeValidator ID="RVAn" Type="Integer" runat="server" ErrorMessage="Capacitate eronata" 
style="position:absolute; top: 80px; left: 274px;" ControlToValidate="TxtAn" MaximumValue="50000" MinimumValue="1" SetFocusOnError="True">&nbsp;</asp:RangeValidator>

             <asp:Label ID="LblAutor" runat="server" Text="Tara" style="position:absolute; top: 134px;
 left: 25px;" ></asp:Label>
             <asp:DropDownList ID="DdlAutor" runat="server" style="position:absolute; top: 130px; 
left: 109px;">
                 <asp:ListItem></asp:ListItem>
                 <asp:ListItem>Spania</asp:ListItem>
                 <asp:ListItem>Romania</asp:ListItem>
                 <asp:ListItem>Germania</asp:ListItem>
                 <asp:ListItem>OLanda</asp:ListItem>
                 <asp:ListItem>Belgia</asp:ListItem>
             </asp:DropDownList>
             <asp:Label ID="LblIdProdus" runat="server" Text="IdPort" style="position :absolute; 
top: 183px; left: 25px;"></asp:Label>
             <asp:TextBox ID="TxtIdCarte" runat="server" style="position:absolute; top: 185px; 
left: 106px; width: 63px;" ReadOnly="True"></asp:TextBox>

             <asp:Button ID="BtnConfirma" runat="server" Text="Confirma" style="position:absolute; 
top: 243px; left: 25px;"/>
             <asp:Button ID="BtnRenunta" runat="server" Text="Renunta" style="position:absolute; 
top: 243px; left: 152px;" CausesValidation="False" OnClick="BtnRenunta_Click"/>

             <asp:CustomValidator ID="CV" runat="server" style="position:absolute; top: 102px; 
left: 311px; width: 25px;" OnServerValidate="CustomValidator1_ServerValidate">&nbsp;</asp:CustomValidator>
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="position:absolute; 
top: 211px; left: 271px; width: 199px;" ForeColor="Red"/>
        </asp:Panel>
    </form>
</body>
</html>
