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


namespace Net_Zero
{
    /// <summary>
    /// Interaction logic for BatteryMasterList.xaml
    /// </summary>
    public partial class BatteryMasterList : ThemedWindow
    {
        public BatteryMasterList()
        {
            InitializeComponent();
        }

        private void ThemedWindow_Loaded(object sender, RoutedEventArgs e)
        {

            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
           

            Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter mastersgetBatteryMasterTableAdapter = new Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter();
            mastersgetBatteryMasterTableAdapter.Fill(masters.getBatteryMaster);
            System.Windows.Data.CollectionViewSource getBatteryMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryMasterViewSource")));
            getBatteryMasterViewSource.View.MoveCurrentToFirst();
        }

        private void SimpleButtonNewBatteryMaster_Click(object sender, RoutedEventArgs e)
        {
            int TransactID1 = 0;
            System.Windows.Data.CollectionViewSource getBatteryMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryMasterViewSource")));

            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));


            int nProjectsID = Settings.Default.nCurrentProjectID;
            int stringCurrent = 0;

            int wasnull = 0;
            wasnull = (getBatteryMasterViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: getBatteryMasterViewSource is null";
                string caption = "Net-Zero";

                MessageBoxButton buttons = MessageBoxButton.OK;
                MessageBoxImage icon = MessageBoxImage.Information;
                MessageBoxResult defaultResult = MessageBoxResult.OK;
                MessageBoxOptions options = MessageBoxOptions.RtlReading;
                // Show message box
                // MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                // Displays the MessageBox.
                MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                if (result == MessageBoxResult.OK)
                {

                    // Closes the parent form.

                    //this.Close();

                }
                return;
            }
            else
            {
                DataRowView drv = (DataRowView)getBatteryMasterViewSource.View.CurrentItem;
                stringCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);
            }






            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "[dbo].[USP_insertBatteryMaster]";

                   // cmd3.Parameters.AddWithValue("@nBatterySeriesStringID", stringCurrent);
                    // cmd3.Parameters.AddWithValue("@cName", "Series String");

                    SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    retval.Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd3.ExecuteNonQuery();
                    TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
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
                if (conn.State == ConnectionState.Open) conn.Close();

                //registerDataSet.EnforceConstraints = false;
                Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter mastersgetBatteryMasterTableAdapter = new Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter();
                mastersgetBatteryMasterTableAdapter.Fill(masters.getBatteryMaster);                //resetButtons();
                //LocateNewLineBattery(TransactID1);
            }
        }
    }
}
