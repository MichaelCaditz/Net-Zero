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

        private void SimpleButtonSaveBatteryMaster_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;

            SaveBatteryMaster();



            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
            Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter mastersgetBatteryMasterTableAdapter = new Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter();


            mastersgetBatteryMasterTableAdapter.Fill(masters.getBatteryMaster);

            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryMasterViewSource")));

        }
        public void SaveBatteryMaster()
        {

            System.Windows.Data.CollectionViewSource getBatteryMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryMasterViewSource")));

            int nProjectsID = Settings.Default.nCurrentProjectID;

            DataRowView drv = (DataRowView)getBatteryMasterViewSource.View.CurrentItem;
            //int accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["ID"]) == true ? 0 : (int)drv["ID"]);

            //int lineCurrent = 0;
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
                DataRowView drv1 = (DataRowView)getBatteryMasterViewSource.View.CurrentItem;
                //lineCurrent = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["ID"]) == true ? 0 : (int)drv1["ID"]);
            }




            if (getBatteryMasterViewSource.View != null)

            {
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
                getBatteryMasterViewSource.View.MoveCurrentToFirst();
                for (int i = 0; i - 1 < i++; i++)
                {

                    DataRowView drv3 = (DataRowView)getBatteryMasterViewSource.View.CurrentItem;
                    int nID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nID"]) == true ? 0 : (int)drv3["nID"]);
                    //MessageBox.Show(ID.ToString());

                    if (nID == 0)
                    {
                        break;
                    }

                    decimal nPrice = (drv3 == null ? 0m : DBNull.Value.Equals(drv3["nPrice"]) == true ? 0m : (decimal)drv3["nPrice"]);
                    // MessageBox.Show(nAmnt.ToString());


                    string cURL = (DBNull.Value.Equals(drv3["cURL"]) == true ? "" : (string)drv3["cURL"]);
                    string cNote = (DBNull.Value.Equals(drv3["cNote"]) == true ? "" : (string)drv3["cNote"]);
                    string cVendor = (DBNull.Value.Equals(drv3["cVendor"]) == true ? "" : (string)drv3["cVendor"]);
                    string cBrand = (DBNull.Value.Equals(drv3["cBrand"]) == true ? "" : (string)drv3["cBrand"]);
                    string cModel = (DBNull.Value.Equals(drv3["cModel"]) == true ? "" : (string)drv3["cModel"]);
                    Boolean bDeleted = (drv3 == null ? false : DBNull.Value.Equals(drv3["bDeleted"]) == true ? false : (bool)drv3["bDeleted"]);
                    decimal nVolts = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nVolts"]) == true ? 0 : (decimal)drv3["nVolts"]);
                    decimal nCapacity_Ah = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nCapacity_Ah"]) == true ? 0 : (decimal)drv3["nCapacity_Ah"]);

                    /////write new record to dbo.split

                    //SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.coolblueconnectionString };
                    try
                    {

                        using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                        {
                            //cmd3.Transaction = trans1;
                            cmd3.Parameters.Clear();
                            cmd3.CommandText = "[dbo].[USP_updateBatteryMaster]";
                            cmd3.Parameters.AddWithValue("@nID", nID);
                            cmd3.Parameters.AddWithValue("@nPrice", nPrice);
                          
                            cmd3.Parameters.AddWithValue("@cNote", cNote);
                            cmd3.Parameters.AddWithValue("@cBrand", cBrand);
                           
                            cmd3.Parameters.AddWithValue("@bDeleted", bDeleted);
                            cmd3.Parameters.AddWithValue("@cModel", cModel);
                            cmd3.Parameters.AddWithValue("@nVolts", nVolts);
                            cmd3.Parameters.AddWithValue("@nCapacity_Ah", nCapacity_Ah);

                            cmd3.Parameters.AddWithValue("@cVendor", cVendor);
                            cmd3.Parameters.AddWithValue("@cURL", cURL);



                            //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                            //retval.Direction = ParameterDirection.Output;
                            conn1.Open();
                            cmd3.ExecuteNonQuery();

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

                        //registerDataSet.EnforceConstraints = false;

                        //registerDataSetUSP_getSplitTableAdapter.Fill(registerDataSet.USP_getSplit, accountCurrent);
                        //registerDataSetUSP_getLineTableAdapter.Fill(registerDataSet.USP_getLine, accountCurrent);
                        //registerDataSet.EnforceConstraints = true;

                        ////uSP_getLineDataGrid.

                        ////uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.MoveCurrentToPosition(0);

                        ////resetButtons();
                        //LocateNewLine(TransactID1);
                    }
                    getBatteryMasterViewSource.View.MoveCurrentToNext();
                }



            }

        }
    }
}
