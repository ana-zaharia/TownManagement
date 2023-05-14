<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Model adaugare</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:AccessDataSource ID="ADS1" runat="server" DataFile="~/App_Data/ProiectDB.accdb" 
             SelectCommand="SELECT [IdPort], [Denumire], [Capacitate], [Tara] FROM [Porturi]"
             InsertCommand="INSERT INTO [Porturi] ([Denumire], [Capacitate], [Tara]) VALUES (?, ?, ?)" >   
            <InsertParameters>
                <asp:Parameter Name="Denumire" Type="String" />
                <asp:Parameter Name="Capacitate" Type="Int32" />
                <asp:Parameter Name="Tara" Type="String" />
            </InsertParameters>

            </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="ADS1" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="IdPort">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="IdPort" HeaderText="IdPort" InsertVisible="False" ReadOnly="True" SortExpression="IdPort" />
                <asp:BoundField DataField="Denumire" HeaderText="Denumire" SortExpression="Denumire" />
                <asp:BoundField DataField="Capacitate" HeaderText="Capacitate" SortExpression="Capacitate" />
                <asp:BoundField DataField="Tara" HeaderText="Tara" SortExpression="Tara" />
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
        <asp:Button ID="Button1" runat="server" Text="Adauga porturi"
style="position:absolute; top: 14px; left: 471px;" OnClick="Button1_Click"/>
        <asp:Panel ID="Panel1" runat="server" style="position:absolute; top: 54px; left: 467px; width: 481px; height: 214px;">
             <asp:Label ID="LblTitlu" runat="server" Text="Denumire" style="position:absolute; top: 31px;
 left: 18px; bottom: 136px;"></asp:Label>
             <asp:TextBox ID="TxtTitlu" runat="server" style="position:absolute; top: 29px; left: 
122px;"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RFVTitlu" runat="server" ErrorMessage="Completati denumire!" 
style="position:absolute; top: 34px; left: 262px;" ControlToValidate="TxtTitlu" SetFocusOnError="True">&nbsp;</asp:RequiredFieldValidator>
             
             <asp:Label ID="LblAn" runat="server" Text="Capacitate" style="position:absolute; top: 80px; left: 
22px; bottom: 87px;"></asp:Label>
             <asp:TextBox ID="TxtAn" runat="server"  style="position:absolute; top: 78px; left: 121px; 
 right: 192px;"></asp:TextBox>
             <asp:RangeValidator ID="RVAn" runat="server" Type="Integer" ErrorMessage="Capacitate eronata" 
style="position:absolute; top: 80px; left: 274px; width: 61px;" ControlToValidate="TxtAn" MaximumValue="10000" MinimumValue="1" SetFocusOnError="True">&nbsp;</asp:RangeValidator>

             <asp:Label ID="LblAutor" runat="server" Text="Tara" style="position:absolute; top: 130px; 
left: 23px;" ></asp:Label>
             <asp:DropDownList ID="DdlAutor" runat="server" style="position:absolute; top: 128px; 
left: 126px;">
                 <asp:ListItem></asp:ListItem>
                 <asp:ListItem>Romania</asp:ListItem>
                 <asp:ListItem>Spania</asp:ListItem>
                 <asp:ListItem>Germania</asp:ListItem>
                 <asp:ListItem>Olanda</asp:ListItem>
             </asp:DropDownList>
             
             <asp:Button ID="BtnConfirma" runat="server" Text="Confirma" style="position:absolute; 
top: 175px; left: 43px;" OnClick="BtnConfirma_Click"/>
             <asp:Button ID="BtnRenunta" runat="server" Text="Renunta" style="position:absolute; 
top: 174px; left: 160px;" CausesValidation="False" OnClick="BtnRenunta_Click"/>

             <asp:CustomValidator ID="CustomValidator1" runat="server" style="position:absolute; 
top: 102px; left: 311px; width: 25px;" OnServerValidate="CustomValidator1_ServerValidate">&nbsp;</asp:CustomValidator>
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="position:absolute; 
top: 137px; left: 270px; width: 199px;" ForeColor="Red"/>
        </asp:Panel>
       
    </form>
</body>
</html>
