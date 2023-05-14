using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private const int DenumireLocalitate = 2;
        private const int IdLocalitate = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                GridView1.SelectedIndex = 0;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Enabled = false;
            TxtTitlu.Text = GridView1.SelectedRow.Cells[DenumireLocalitate].Text;
            TxtIdCarte.Text = GridView1.SelectedRow.Cells[IdLocalitate].Text;
        }
        protected void BtnRenunta_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Button1.Enabled = true;
        }
        protected void CV_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = ADS1.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select Data from Desfiintari where IdLocalitate=" + TxtIdCarte.Text;
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                args.IsValid = false;
                CV.ErrorMessage = "Localitate referita in tabela Desfiintari";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                stergeInregistrare();
                Panel1.Visible = false;
                Button1.Enabled = true;
            }
        }
        private void stergeInregistrare()
        {
            int p = GridView1.SelectedIndex;
            int n;
            ADS1.DeleteParameters[0].DefaultValue = TxtIdCarte.Text;
            ADS1.Delete();
            GridView1.DataBind();
            n = GridView1.Rows.Count;

            if (n > 0)
                if (p == n) GridView1.SelectedIndex = p - 1;
                else GridView1.SelectedIndex = p;
        }

    }
}