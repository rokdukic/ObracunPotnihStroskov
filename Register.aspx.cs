using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void primerjajGesli(object source, ServerValidateEventArgs args)
    {
        var pass1 = args.Value;
        var password2 = pass2.Text;
        if(!pass1.Equals(password2)){
            Label1.Text = "wrong password";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            MySql.Data.MySqlClient.MySqlConnection command = new MySql.Data.MySqlClient.MySqlConnection(ConfigurationManager.ConnectionStrings["rok1071_b1ConnectionString"].ConnectionString);
            try{
                command.Open();
                MySqlCommand cmd = new MySqlCommand("INSERT INTO uporabnik (EMail, Password) VALUES (@email,@password)",command);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@password", pass2.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                CustomValidator1.Text = "registered succesfully";
                CustomValidator1.ForeColor = System.Drawing.Color.Green;
            }catch(MySqlException ex){
                CustomValidator1.Text = ex.Message;
            }finally{
                if (command.State == ConnectionState.Open)
                {
                    command.Close();
                }
                
            }
            Label1.Text = "registration successful :)";
            Label1.ForeColor = System.Drawing.Color.Green;
        }
    }
}