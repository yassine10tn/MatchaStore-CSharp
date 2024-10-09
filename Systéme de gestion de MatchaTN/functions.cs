using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Systéme_de_gestion_de_MatchaTN
{

    internal class Functions
    {
        private SqlConnection Con;
        private SqlCommand cmd;
        private SqlDataAdapter sda;
        private DataTable dt;
        private string Constring;

        public Functions()
        {
            Constring = "Server=127.0.0.1;Database=matchadb;User Id=root;Password=;";
            Con = new SqlConnection(Constring);
            cmd = new SqlCommand();
            cmd.Connection = Con;
        }

        public DataTable RecupererDonnees(string Req)
        {
            dt = new DataTable();
            sda = new SqlDataAdapter(Req, Con);
            sda.Fill(dt);
            return dt;
        }

        public int EnvoyerDonnees(string Req)
        {
            int cnt = 0;
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            cmd.CommandText = Req;
            cnt = cmd.ExecuteNonQuery();
            Con.Close(); // Close the connection after execution
            return cnt;
        }
    }
}