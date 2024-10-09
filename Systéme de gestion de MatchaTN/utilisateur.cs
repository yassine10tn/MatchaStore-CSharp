using Org.BouncyCastle.Ocsp;
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
    public partial class utilisateur : Form
    {
        Functions Con;
        public utilisateur()
        {
            InitializeComponent();
            Con = new Functions();
        }
        private void ListerUsers()
        {
            string Req = "Select * from utilisateur";
            UserBox.DataSource = Con.RecupererDonnees(Req);
        }
        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void utilisateur_Load(object sender, EventArgs e)
        {

        }

        private void EnregistrerBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Id_user.Text == "" || Nom_user.Text == "" || Email_user.Text == "" || Mdp_user.Text == "" || Type_user.Text == "")
                {
                    MessageBox.Show("Complétez le formulaire, s'il vous plaît !");
                }
                else
                {
                    string id = Id_user.Text;
                    string nom = Nom_user.Text;
                    string email = Email_user.Text;
                    string mdp = Mdp_user.Text;
                    string type = Type_user.Text;

                    // Requête SQL pour insérer les données dans la table utilisateur
                    string req = "INSERT INTO utilisateur (Id_user, Nom_user, Email_user, Mdp_user, Type_user) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}')";
                    req = string.Format(req, id, nom, email, mdp, type);

                    // Envoyer la requête à la base de données
                    Con.EnvoyerDonnees(req);

                    // Mettre à jour l'affichage des utilisateurs
                    ListerUsers();

                    MessageBox.Show("Utilisateur ajouté.");
                    Id_user.Text = "";
                    Nom_user.Text = "";
                    Email_user.Text = "";
                    Mdp_user.Text = "";
                    Type_user.Text = "";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void ModifierBtn_Click(object sender, EventArgs e)
        {

        }

        private void SupprimerBtn_Click(object sender, EventArgs e)
        {

        }
        int key = 1;
        private void liste_user_TextChanged(object sender, EventArgs e)
        {
            Id_user.Text = UserBox.SelectedRows[0].Cells[1].ToString();
            Nom_user.Text = UserBox.SelectedRows[1].Cells[2].ToString();
            Email_user.Text = UserBox.SelectedRows[2].Cells[3].ToString();
            Mdp_user.Text = UserBox.SelectedRows[3].Cells[4].ToString();
            Type_user.Text = UserBox.SelectedRows[4].Cells[5].ToString();

            if (Id_user.Text == "")
            {
                key = 1;
            }
            else
            {
                key = Convert.ToInt32(UserBox.SelectedRows[0].Cells[1].ToString());
            }


        }

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}