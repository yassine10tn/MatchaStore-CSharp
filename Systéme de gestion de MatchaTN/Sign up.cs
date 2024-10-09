using MySql.Data.MySqlClient;
using System;
using System.Windows.Forms;

namespace Systéme_de_gestion_de_MatchaTN
{
    public partial class Sign_up : Form
    {
        string connection = "server=127.0.0.1;uid=root;pwd=;database=matchadb";
        MySqlConnection conn = new MySqlConnection();

        public Sign_up()
        {
            InitializeComponent();
        }

        private void SeConnecterBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Id_signup.Text != "" && Nom_signup.Text != "" && Email_signup.Text != "" && Mdp_signup.Text != "")
                {
                    if (Mdp_signup.Text == ConfirmerMdp.Text)
                    {
                        if (check(Email_signup.Text) != 1)
                        {
                            conn.Open();
                            MySqlCommand command = new MySqlCommand("INSERT INTO admin (id, name, email, password) VALUES (@id, @name, @email, @password)", conn);
                            command.Parameters.AddWithValue("@id", Id_signup.Text);
                            command.Parameters.AddWithValue("@name", Nom_signup.Text);
                            command.Parameters.AddWithValue("@email", Email_signup.Text);
                            command.Parameters.AddWithValue("@password", Mdp_signup.Text);
                            command.ExecuteNonQuery();
                            conn.Close();
                            MessageBox.Show("Enregistrement réussi !");
                            Nom_signup.Text = "";
                            Id_signup.Text = "";
                            Email_signup.Text = "";
                            Mdp_signup.Text = "";
                        }
                        else
                        {
                            MessageBox.Show("Vous êtes déjà inscrit !");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Les mots de passe ne correspondent pas.");
                    }
                }
                else
                {
                    MessageBox.Show("Veuillez remplir tous les champs !");
                }
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Erreur de connexion : " + ex.Message);
            }
        }

        int check(string email)
        {
            conn.Open();
            string query = "SELECT COUNT(*) FROM admin WHERE email=@email";
            MySqlCommand command = new MySqlCommand(query, conn);
            command.Parameters.AddWithValue("@email", email);
            int v = Convert.ToInt32(command.ExecuteScalar());
            conn.Close();
            return v;
        }

        private void Sign_up_Load(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            connexion login = new connexion();
            login.Show();
        }
    }
}
