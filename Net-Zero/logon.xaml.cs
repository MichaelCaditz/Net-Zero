using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using DevExpress.Xpf.Core;
using DevExpress.Xpf.Charts;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Diagnostics;
using Net_Zero.classes;
using System.ComponentModel;
using System.Drawing;
using Net_Zero.Properties;
using DevExpress.Xpf.Map;
using DevExpress.Charts.Designer;
using DevExpress.Xpf.Editors;
using Net_Zero.Infoscreens;


namespace Net_Zero
{
    /// <summary>
    /// Interaction logic for logon.xaml
    /// </summary>
    public partial class logon : ThemedWindow
    {

        public bool returnValue { get; set; }
        public logon()
        {
            InitializeComponent();
        }

        private void btnQuit_Click(object sender, RoutedEventArgs e)
        {
            returnValue = false;
            this.Close();
        }

        private void btnLogon_Click(object sender, RoutedEventArgs e)
        {

            SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };

            string cFirst = "";
            string cLast = "";
            string cRoleName = "";
            int nID = 0;
            int nRoleID = 0;

            string cEmail = (txtcEmail.EditValue == null ? "" : DBNull.Value.Equals(txtcEmail.EditValue) == true ? "" : (string)txtcEmail.EditValue);
            string cPassword = (txtcPassword.EditValue == null ? "" : DBNull.Value.Equals(txtcPassword.EditValue) == true ? "" : (string)txtcPassword.EditValue);
            try
            {


                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.getUser";
                    cmd3.Parameters.AddWithValue("@cEmail", cEmail);
                    cmd3.Parameters.AddWithValue("@cPassword", cPassword);

                    SqlParameter retvalcFirst = cmd3.Parameters.Add("@cFirst", SqlDbType.VarChar,50);
                    SqlParameter retvalcLast = cmd3.Parameters.Add("@cLast", SqlDbType.VarChar, 50);
                    SqlParameter retvalcRoleName = cmd3.Parameters.Add("@cRoleName", SqlDbType.VarChar, 50);
                    SqlParameter retvalnID = cmd3.Parameters.Add("@nID", SqlDbType.Int);
                    SqlParameter retvalnRoleID = cmd3.Parameters.Add("@nRoleID", SqlDbType.Int);
                    retvalcFirst.Direction = ParameterDirection.Output;
                    retvalcLast.Direction = ParameterDirection.Output;
                    retvalcRoleName.Direction = ParameterDirection.Output;
                    retvalnID.Direction = ParameterDirection.Output;
                    retvalnRoleID.Direction = ParameterDirection.Output;
                    conn1.Open();
                    cmd3.ExecuteNonQuery();
                    //cFirst = (string)cmd3.Parameters["@cFirst"].Value;
                   // cLast = (string)cmd3.Parameters["@cLast"].Value;

                    cFirst=(cmd3.Parameters["@cFirst"].Value == null ? "" : DBNull.Value.Equals(cmd3.Parameters["@cFirst"].Value) == true ? "" : (string)cmd3.Parameters["@cFirst"].Value);
                    cLast = (cmd3.Parameters["@cLast"].Value == null ? "" : DBNull.Value.Equals(cmd3.Parameters["@cLast"].Value) == true ? "" : (string)cmd3.Parameters["@cLast"].Value);
                    cRoleName = (cmd3.Parameters["@cRoleName"].Value == null ? "" : DBNull.Value.Equals(cmd3.Parameters["@cRoleName"].Value) == true ? "" : (string)cmd3.Parameters["@cRoleName"].Value);
                    nID = (cmd3.Parameters["@nID"].Value == null ? 0 : DBNull.Value.Equals(cmd3.Parameters["@nID"].Value) == true ? 0: (int)cmd3.Parameters["@nID"].Value);
                    nRoleID = (cmd3.Parameters["@nID"].Value == null ? 0 : DBNull.Value.Equals(cmd3.Parameters["@nRoleID"].Value) == true ? 0 : (int)cmd3.Parameters["@nRoleID"].Value);
                }




            }


            catch (Exception ex)
            {
                //utilities.errorLog(System.Reflection.MethodInfo.GetCurrentMethod().Name, ex);
                System.ArgumentException argEx = new System.ArgumentException("New Line", "", ex);
                throw argEx;
            }
            finally
            {
                if (conn1.State == ConnectionState.Open) conn1.Close();



            }







            if (nID != 0)
            { 
            this.returnValue = true;
                this.Close();
            }
            
        }


    }
}
