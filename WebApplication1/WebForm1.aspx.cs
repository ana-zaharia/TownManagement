using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Panel1.Visible = false;
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = ADS1.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select IdPort from Porturi where Denumire='" + TxtTitlu.Text + "'";
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Denumire deja existenta";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                adaugaInregistrare();
            }
        }

        protected void BtnRenunta_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Button1.Enabled = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Enabled = false;
            nullControale();
        }
        private void nullControale()
        {
            TxtTitlu.Text = null;
            TxtAn.Text = null;
            DdlAutor.SelectedIndex = 0;
        }
        private void adaugaInregistrare()
        {
            ADS1.InsertParameters[0].DefaultValue = TxtTitlu.Text;
            ADS1.InsertParameters[1].DefaultValue = TxtAn.Text;
            ADS1.InsertParameters[2].DefaultValue = DdlAutor.Text;
            ADS1.Insert();
            nullControale();
        }

        protected void BtnConfirma_Click(object sender, EventArgs e)
        {

        }
    }
}