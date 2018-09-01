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
    /// Interaction logic for PVMasterList.xaml
    /// </summary>
    public partial class PVMasterList : ThemedWindow
    {
        public PVMasterList()
        {
            InitializeComponent();
        }

        private void ThemedWindow_Loaded(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
            Net_Zero.MastersTableAdapters.getPVMasterTableAdapter mastersgetPVMasterTableAdapter = new Net_Zero.MastersTableAdapters.getPVMasterTableAdapter();


             mastersgetPVMasterTableAdapter.Fill(masters.getPVMaster);

            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVMasterViewSource")));
            getPVMasterViewSource.View.MoveCurrentToFirst();
        }

        private void SimpleButtonNewPVMaster_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
            int TransactID1 = 0;
            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVMasterViewSource")));

            Net_Zero.MastersTableAdapters.getPVMasterTableAdapter mastersgetPVMasterTableAdapter = new Net_Zero.MastersTableAdapters.getPVMasterTableAdapter();


          

            DataRowView drv = (DataRowView)getPVMasterViewSource.View.CurrentItem;
            //int accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["ID"]) == true ? 0 : (int)drv["ID"]);

            //int lineCurrent = 0;
            int wasnull = 0;
            wasnull = (getPVMasterViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: getPVViewSource is null";
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
                DataRowView drv1 = (DataRowView)getPVMasterViewSource.View.CurrentItem;
                //lineCurrent = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["ID"]) == true ? 0 : (int)drv1["ID"]);
            }



            if (getPVMasterViewSource.View != null)

            {
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
                //getPVViewSource.View.MoveCurrentToFirst();

                try
                {

                    using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                    {
                        //cmd3.Transaction = trans1;
                        cmd3.Parameters.Clear();
                        cmd3.CommandText = "dbo.USP_insertPVMaster";
                        
                        cmd3.Parameters.AddWithValue("@cModel", "Model");
                        cmd3.Parameters.AddWithValue("@cBrand", "Brand");
                        cmd3.Parameters.AddWithValue("@nPmax", 0);
                        cmd3.Parameters.AddWithValue("@nVmp", 0);
                        cmd3.Parameters.AddWithValue("@nImp", 0);
                        cmd3.Parameters.AddWithValue("@nVoc", 0);
                        cmd3.Parameters.AddWithValue("@nIsc", 0);
                        cmd3.Parameters.AddWithValue("@nWeight_kg", 0);
                        cmd3.Parameters.AddWithValue("@nLength_mm", 0);
                        cmd3.Parameters.AddWithValue("@nHeight_mm", 0);
                        cmd3.Parameters.AddWithValue("@nWidth_mm", 0);
                        cmd3.Parameters.AddWithValue("@cFrame", "");
                        cmd3.Parameters.AddWithValue("@cVendor", "");
                        cmd3.Parameters.AddWithValue("@nPrice", 0);
                        
                        cmd3.Parameters.AddWithValue("@cURL", "");
                       



                        SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                        retval.Direction = ParameterDirection.Output;
                        conn1.Open();
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
                    if (conn1.State == ConnectionState.Open) conn1.Close();

                    mastersgetPVMasterTableAdapter.Fill(masters.getPVMaster);

                }





                //getPVViewSource.View.MoveCurrentToNext();

            }
            
        }

        private void SimpleButtonSavePVMaster_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;

            SavePVMaster();

            

            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
            Net_Zero.MastersTableAdapters.getPVMasterTableAdapter mastersgetPVMasterTableAdapter = new Net_Zero.MastersTableAdapters.getPVMasterTableAdapter();


            mastersgetPVMasterTableAdapter.Fill(masters.getPVMaster);

            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVMasterViewSource")));

            string message20 = "Complete";
            string caption20 = "Net-Zero";

            MessageBoxButton buttons20 = MessageBoxButton.OK;
            MessageBoxImage icon20 = MessageBoxImage.Information;
            MessageBoxResult defaultResult20 = MessageBoxResult.OK;
            MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
            // Show message box
            // MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            // Displays the MessageBox.
            MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);
        }
        public void SavePVMaster()
        {

            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVMasterViewSource")));

            int nProjectsID = Settings.Default.nCurrentProjectID;

            DataRowView drv = (DataRowView)getPVMasterViewSource.View.CurrentItem;
            //int accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["ID"]) == true ? 0 : (int)drv["ID"]);

            //int lineCurrent = 0;
            int wasnull = 0;
            wasnull = (getPVMasterViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: getPVMasterViewSource is null";
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
                DataRowView drv1 = (DataRowView)getPVMasterViewSource.View.CurrentItem;
                //lineCurrent = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["ID"]) == true ? 0 : (int)drv1["ID"]);
            }




            if (getPVMasterViewSource.View != null)

            {
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
                getPVMasterViewSource.View.MoveCurrentToFirst();
                for (int i = 0; i - 1 < i++; i++)
                {

                    DataRowView drv3 = (DataRowView)getPVMasterViewSource.View.CurrentItem;
                    int nID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nID"]) == true ? 0 : (int)drv3["nID"]);
                    //MessageBox.Show(ID.ToString());

                    if (nID == 0)
                    {
                        break;
                    }

                    decimal nPrice = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nPrice"]) == true ? 0 : (decimal)drv3["nPrice"]);
                    // MessageBox.Show(nAmnt.ToString());



                    string cURL = (DBNull.Value.Equals(drv3["cURL"]) == true ? "" : (string)drv3["cURL"]);
                    string cVendor = (DBNull.Value.Equals(drv3["cVendor"]) == true ? "" : (string)drv3["cVendor"]);

                    string cFrame = (DBNull.Value.Equals(drv3["cFrame"]) == true ? "" : (string)drv3["cFrame"]);
                    string cBrand = (DBNull.Value.Equals(drv3["cBrand"]) == true ? "" : (string)drv3["cBrand"]);
                    string cModel = (DBNull.Value.Equals(drv3["cModel"]) == true ? "" : (string)drv3["cModel"]);


                    Boolean bDeleted = (drv3 == null ? false : DBNull.Value.Equals(drv3["bDeleted"]) == true ? false : (bool)drv3["bDeleted"]);


                    decimal nPmax = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nPmax"]) == true ? 0 : (decimal)drv3["nPmax"]);
                    decimal nVmp = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nVmp"]) == true ? 0 : (decimal)drv3["nVmp"]);
                    decimal nImp = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nImp"]) == true ? 0 : (decimal)drv3["nImp"]);
                    decimal nVoc = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nVoc"]) == true ? 0 : (decimal)drv3["nVoc"]);
                    decimal nIsc = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nIsc"]) == true ? 0 : (decimal)drv3["nIsc"]);
                    decimal nWeight_kg = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nWeight_kg"]) == true ? 0 : (decimal)drv3["nWeight_kg"]);
                    decimal nLength_mm = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nLength_mm"]) == true ? 0 : (decimal)drv3["nLength_mm"]);
                    decimal nHeight_mm = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nHeight_mm"]) == true ? 0 : (decimal)drv3["nHeight_mm"]);
                    decimal nWidth_mm = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nWidth_mm"]) == true ? 0 : (decimal)drv3["nWidth_mm"]);

                    /////write new record to dbo.split

                    //SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.coolblueconnectionString };
                    try
                    {

                        using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                        {
                            //cmd3.Transaction = trans1;
                            cmd3.Parameters.Clear();
                            cmd3.CommandText = "dbo.USP_updatePVMaster";
                            cmd3.Parameters.AddWithValue("@nID", nID);

                            cmd3.Parameters.AddWithValue("@cModel", cModel);
                            cmd3.Parameters.AddWithValue("@cBrand", cBrand);
                            cmd3.Parameters.AddWithValue("@nPmax", nPmax);
                            cmd3.Parameters.AddWithValue("@nVmp", nVmp);
                            cmd3.Parameters.AddWithValue("@nImp", nImp);
                            cmd3.Parameters.AddWithValue("@nVoc", nVoc);
                            cmd3.Parameters.AddWithValue("@nIsc", nIsc);
                            cmd3.Parameters.AddWithValue("@nWeight_kg", nWeight_kg);
                            cmd3.Parameters.AddWithValue("@nLength_mm", nLength_mm);
                            cmd3.Parameters.AddWithValue("@nHeight_mm", nHeight_mm);
                            cmd3.Parameters.AddWithValue("@nWidth_mm", nWidth_mm);
                            cmd3.Parameters.AddWithValue("@cFrame", cFrame);
                            cmd3.Parameters.AddWithValue("@cVendor", cVendor);
                            cmd3.Parameters.AddWithValue("@nPrice", nPrice);

                            cmd3.Parameters.AddWithValue("@cURL", cURL);

                            cmd3.Parameters.AddWithValue("@bDeleted", bDeleted);



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
                    getPVMasterViewSource.View.MoveCurrentToNext();
                }


                
            }

        }
    }
}
