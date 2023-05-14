using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private const int Denumire= 2;
        private const int IdPort = 1;
        private const int Capacitate = 3;
        private const int Tara = 4;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                GridView1.SelectedIndex = 0;
            }

        }
        protected void BtnRenunta_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Button1.Enabled = true;
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = ADS1.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select IdPort from Porturi where Denumire='" + TxtTitlu.Text +
                              "' and IdPort <> " + TxtIdCarte.Text;
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                args.IsValid = false;
                CV.ErrorMessage = "Port deja existent";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                modificaInregistrare();
                Panel1.Visible = false;
                Button1.Enabled = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Enabled = false;
            TxtTitlu.Text = GridView1.SelectedRow.Cells[Denumire].Text;
            TxtIdCarte.Text = GridView1.SelectedRow.Cells[IdPort].Text;
            if (GridView1.SelectedRow.Cells[Capacitate].Text != "&nbsp;")
                TxtAn.Text = GridView1.SelectedRow.Cells[Capacitate].Text;
            if (GridView1.SelectedRow.Cells[Tara].Text != "&nbsp;")
                DdlAutor.Text = GridView1.SelectedRow.Cells[Tara].Text;
        }

        private void modificaInregistrare()
        {
            ADS1.UpdateParameters[0].DefaultValue = TxtTitlu.Text;
            ADS1.UpdateParameters[1].DefaultValue = TxtAn.Text;
            ADS1.UpdateParameters[2].DefaultValue = DdlAutor.Text;
            ADS1.UpdateParameters[3].DefaultValue = TxtIdCarte.Text;
            ADS1.Update();
        }

        protected void BtnConfirma_Click(object sender, EventArgs e)
        {

        }
    }
}