using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.X509;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Systéme_de_gestion_de_MatchaTN
{
    public partial class connexion : Form
    {


        MySqlConnection conn;
        string connString;
        public connexion()
        {
            InitializeComponent();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label12_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            string connString = "server=127.0.0.1;uid=root;pwd=;database=matchadb";

            try
            {
                if (Email_log.Text != "" && Mdp_log.Text!="" )
                {
                    string query = "select cout(*) from admin where email='" + Email_log + "' and " + "password='" + Mdp_log + "'";
                    conn.Open();
                    MySqlCommand command = new MySqlCommand(query, conn);
                    int v =(int)command.ExecuteScalar();
                    if(v != 1)
                    {
                        MessageBox.Show("Erreur email or password  ","erreur");
                    }
                    else
                    {
                        MessageBox.Show("Welcome to your porfile !");
                        Email_log.Text = "";
                        Mdp_log.Text = "";
                        this.Hide();
                        utilisateur utli= new utilisateur();
                        utli.Show();
                    }
                }
                else
                {
                    MessageBox.Show("Remplir le formulaire !");
                }
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Erreur de connexion : " + ex.Message);
            }


        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void Email_Admin_TextChanged(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            Sign_up connexionn= new Sign_up();
            connexionn.Show();
        }

        private void connexion_Load(object sender, EventArgs e)
        {

        }
    }
}
