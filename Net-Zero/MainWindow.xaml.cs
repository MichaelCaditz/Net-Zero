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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : ThemedWindow
    {
        public MainWindow()
        {
            
            InitializeComponent();
        }

        private void btnOpen_ItemClick(object sender, DevExpress.Xpf.Bars.ItemClickEventArgs e)
        {
            TextEditDemandTotal.EditValue = 198.66;
        }

        private void ThemedWindow_Loaded(object sender, RoutedEventArgs e)
        {
            Settings.Default.nCurrentProjectID = Settings.Default.nLastProjectID;
            int nLastProjectID = Settings.Default.nLastProjectID;
            int nCurrentProjectID = Settings.Default.nCurrentProjectID;

            Net_Zero.DemandDataSet demandDataSet = ((Net_Zero.DemandDataSet)(this.FindResource("demandDataSet")));
            // Load data into the table demandItems. You can modify this code as needed.
            Net_Zero.DemandDataSetTableAdapters.demandItemsTableAdapter demandDataSetdemandItemsTableAdapter = new Net_Zero.DemandDataSetTableAdapters.demandItemsTableAdapter();
            demandDataSetdemandItemsTableAdapter.Fill(demandDataSet.demandItems);
            System.Windows.Data.CollectionViewSource demandItemsViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("demandItemsViewSource")));
            demandItemsViewSource.View.MoveCurrentToFirst();



            Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));
            // TODO: Add code here to load data into the table getSummary.
            // This code could not be generated, because the summaryDataSetgetSummaryTableAdapter.Fill method is missing, or has unrecognized parameters.

            Net_Zero.SummaryDataSetTableAdapters.getSummaryTableAdapter summaryDataSetgetSummaryTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getSummaryTableAdapter();
            summaryDataSetgetSummaryTableAdapter.Fill(summaryDataSet.getSummary, nCurrentProjectID);


            System.Windows.Data.CollectionViewSource getSummaryViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getSummaryViewSource")));
            getSummaryViewSource.View.MoveCurrentToFirst();


            Net_Zero.Geography geography = ((Net_Zero.Geography)(this.FindResource("geography")));

            Net_Zero.GeographyTableAdapters.getAllCountriesTableAdapter geographygetAllCountriesTableAdapter = new Net_Zero.GeographyTableAdapters.getAllCountriesTableAdapter();
            geographygetAllCountriesTableAdapter.Fill(geography.getAllCountries);
            System.Windows.Data.CollectionViewSource getAllCountriesViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllCountriesViewSource")));
            getAllCountriesViewSource.View.MoveCurrentToFirst();


            Net_Zero.GeographyTableAdapters.getAllStateProvinceTableAdapter geographygetAllStateProvinceTableAdapter = new Net_Zero.GeographyTableAdapters.getAllStateProvinceTableAdapter();
            geographygetAllStateProvinceTableAdapter.Fill(geography.getAllStateProvince);
            System.Windows.Data.CollectionViewSource getAllCountriesgetAllStateProvinceViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllCountriesgetAllStateProvinceViewSource")));
            getAllCountriesgetAllStateProvinceViewSource.View.MoveCurrentToFirst();


            Net_Zero.GeographyTableAdapters.getAllCityTableAdapter geographygetAllCityTableAdapter = new Net_Zero.GeographyTableAdapters.getAllCityTableAdapter();
            geographygetAllCityTableAdapter.Fill(geography.getAllCity);

            Net_Zero.GeographyTableAdapters.getAllInsolationTableAdapter geographygetAllInsolationTableAdapter = new Net_Zero.GeographyTableAdapters.getAllInsolationTableAdapter();
            geographygetAllInsolationTableAdapter.Fill(geography.getAllInsolation);

            Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter summaryDataSetgetProjectTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter();
            summaryDataSetgetProjectTableAdapter.Fill(summaryDataSet.getProject, nCurrentProjectID);
            System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));
            getProjectViewSource.View.MoveCurrentToFirst();
            TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
            TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);



            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));
            Net_Zero.PVDataSetTableAdapters.getPVTableAdapter pVDataSetgetPVTableAdapter = new Net_Zero.PVDataSetTableAdapters.getPVTableAdapter();
            pVDataSetgetPVTableAdapter.Fill(pVDataSet.getPV, nCurrentProjectID);
            System.Windows.Data.CollectionViewSource getPVViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVViewSource")));
            getPVViewSource.View.MoveCurrentToFirst();
        }

        private void SimpleButton_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            int nCurrentProjectID = Settings.Default.nCurrentProjectID;
            Nullable<DateTime> beginDate;
            Nullable<DateTime> endDate;
            //beginDate = (DateEditStartDate.EditValue == null ? (Nullable<DateTime>)null : DBNull.Value.Equals(DateEditStartDate.EditValue) == true ? (Nullable<DateTime>)null :
            //   (DateTime)DateEditStartDate.EditValue);
            //endDate = (DateEditEndDate.EditValue == null ? (Nullable<DateTime>)null : DBNull.Value.Equals(DateEditEndDate.EditValue) == true ? (Nullable<DateTime>)null :
            //   (DateTime)DateEditEndDate.EditValue);

            beginDate = (DateEditStartDate.EditValue == null ? (Nullable<DateTime>)DateTime.Now : DBNull.Value.Equals(DateEditStartDate.EditValue) == true ? (Nullable<DateTime>)DateTime.Now :
              (DateTime)DateEditStartDate.EditValue);
            endDate = (DateEditEndDate.EditValue == null ? (Nullable<DateTime>)DateTime.Now.AddDays(365) : DBNull.Value.Equals(DateEditEndDate.EditValue) == true ? (Nullable<DateTime>)DateTime.Now.AddDays(365) :
               (DateTime)DateEditEndDate.EditValue);

            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.createDates";
                    cmd3.Parameters.AddWithValue("@projectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@beginDate", beginDate);
                    cmd3.Parameters.AddWithValue("@endDate", endDate);

                    //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    //retval.Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd3.ExecuteNonQuery();
                    //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
                }


                Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));
                // TODO: Add code here to load data into the table getSummary.
                // This code could not be generated, because the summaryDataSetgetSummaryTableAdapter.Fill method is missing, or has unrecognized parameters.

                Net_Zero.SummaryDataSetTableAdapters.getSummaryTableAdapter summaryDataSetgetSummaryTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getSummaryTableAdapter();
                summaryDataSetgetSummaryTableAdapter.Fill(summaryDataSet.getSummary, nCurrentProjectID);


                System.Windows.Data.CollectionViewSource getSummaryViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getSummaryViewSource")));
                getSummaryViewSource.View.MoveCurrentToFirst();

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

                
                //LocateNewLine(TransactID1);
            }

            //int nProjectsID = Settings.Default.nCurrentProjectID;

            decimal nChosenBattery = 0m;
            //int nCurrentProjectID = Settings.Default.nCurrentProjectID;



            nChosenBattery = (SpinEditnChosenBattery_1.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenBattery_1.EditValue) == true ? 0m : (decimal)SpinEditnChosenBattery_1.EditValue);



            SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.updateSummaryDates";
                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@dtStartDate", beginDate);
                    cmd3.Parameters.AddWithValue("@dtEndDate", endDate);



                    //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    //retval.Direction = ParameterDirection.Output;
                    conn1.Open();
                    cmd3.ExecuteNonQuery();
                    //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
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


                //Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));

                //Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter summaryDataSetgetProjectTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter();
                //summaryDataSetgetProjectTableAdapter.Fill(summaryDataSet.getProject, nCurrentProjectID);
                //System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));
                //getProjectViewSource.View.MoveCurrentToFirst();
                //TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
                //TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);
            }
        }

        private void SimpleButton_Click_1(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            int nCityID = 0;
            decimal nInsolation = 0;
            int nCurrentProjectID = Settings.Default.nCurrentProjectID;

            //string notes = "";
            //string account_no = "";
            //string address1 = "";
            //string address2 = "";
            //string city = "";
            //string state = "";
            //string state_other = "";
            //string zip = "";
            //string country = "";
            //string postal_code = "";
            //string areacode = "";
            //string phone = "";
            //string email = "";
            //string website = "";
            //string rep = "";
            //string name = "";
            System.Windows.Data.CollectionViewSource getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource")));
            Net_Zero.Geography geography = ((Net_Zero.Geography)(this.FindResource("geography")));


            //int accountCurrent = 0;
            int wasnull = 0;
            wasnull = (getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning:getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource is null";
                string caption = "CoolBlue";

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


                DataRowView drv = (DataRowView)getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource.View.CurrentItem;
                //accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["ID"]) == true ? 0 : (int)drv["ID"]);
                nCityID = (DBNull.Value.Equals(drv["nCityID"]) == true ? 0 : (int)drv["nCityID"]);
                nInsolation = (TextEditInsolation.EditValue == null ? 0 : DBNull.Value.Equals(TextEditInsolation.EditValue) == true ? 0m : (decimal)TextEditInsolation.EditValue);
                //account_no = (DBNull.Value.Equals(drv["account_no"]) == true ? "" : (string)drv["account_no"]);
                //address1 = (DBNull.Value.Equals(drv["address1"]) == true ? "" : (string)drv["address1"]);
                
            }






            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.updateCity";
                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@nCityID", nCityID);
                    cmd3.Parameters.AddWithValue("@nInsolation", nInsolation);
                    //cmd3.Parameters.AddWithValue("@account_no", account_no);
                    //cmd3.Parameters.AddWithValue("@address1", address1);
                    //cmd3.Parameters.AddWithValue("@address2", address2);
                    //cmd3.Parameters.AddWithValue("@city", city);
                    


                    //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    //retval.Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd3.ExecuteNonQuery();
                    //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
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

                //VendorDataSet.EnforceConstraints = false;

                //coolBlue.vendorDataSetTableAdapters.USP_getOneVendorTableAdapter vendorDataSetUSP_getOneVendorTableAdapter = new coolBlue.vendorDataSetTableAdapters.USP_getOneVendorTableAdapter();


                //vendorDataSetUSP_getOneVendorTableAdapter.Fill(VendorDataSet.USP_getOneVendor, nVendorID);

                //VendorDataSet.EnforceConstraints = true;

                //uSP_getLineDataGrid.

                //uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.MoveCurrentToPosition(0);

                //resetButtons();
                // LocateNewLine(TransactID1);
                //this.Close();
                Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));

                Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter summaryDataSetgetProjectTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter();
                summaryDataSetgetProjectTableAdapter.Fill(summaryDataSet.getProject, nCurrentProjectID);
                System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));
                getProjectViewSource.View.MoveCurrentToFirst();
                TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
                TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);
            }
        }

        private void ButtonSaveDerates_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            //int nCityID = 0;
            decimal  nMPPTFactor = 0m;
            decimal nBatteryEfficiency = 0m;
            decimal nControllerEfficiency = 0m;
            decimal nDaysAutonomy = 0m;
            decimal nVoltage = 0m;
            decimal nInverterDerate = 0m;
            decimal nMDoD = 0m;
            decimal nTDR = 0m;

            decimal nChosenInsolation = 0m;
            decimal nChosenBattery = 0m;
            decimal nDemandTotal = 0m;

            string cName = "";
            string cDesc = "";
            string cNote1 = "";
            string cNote2 = "";
            string cChosenTilt = "";

            Nullable<DateTime> dtDateDue; 


            // DataRowView drv = (DataRowView)getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource.View.CurrentItem;
            //accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["ID"]) == true ? 0 : (int)drv["ID"]);
            //nCityID = (DBNull.Value.Equals(drv["nCityID"]) == true ? 0 : (int)drv["nCityID"]);
            nMPPTFactor = (SpinEditnMPPTFactor.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnMPPTFactor.EditValue) == true ? 0m : (decimal)SpinEditnMPPTFactor.EditValue);
            nBatteryEfficiency = (SpinEditnBatteryEfficiency.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnBatteryEfficiency.EditValue) == true ? 0m : (decimal)SpinEditnBatteryEfficiency.EditValue);
            nControllerEfficiency = (SpinEditnControllerEfficiency.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnControllerEfficiency.EditValue) == true ? 0m : (decimal)SpinEditnControllerEfficiency.EditValue);
            nInverterDerate = (SpinEditnInverterDerate.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnInverterDerate.EditValue) == true ? 0m : (decimal)SpinEditnInverterDerate.EditValue);
            nVoltage = (SpinEditnVoltage.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnVoltage.EditValue) == true ? 0m : (decimal)SpinEditnVoltage.EditValue);
            nMDoD = (SpinEditnMDoD.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnMDoD.EditValue) == true ? 0m : (decimal)SpinEditnMDoD.EditValue);

            nTDR = (SpinEditnTDR.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnTDR.EditValue) == true ? 0m : (decimal)SpinEditnTDR.EditValue);

            nDaysAutonomy = (SpinEditnDaysAutonomy.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnDaysAutonomy.EditValue) == true ? 0m : (decimal)SpinEditnDaysAutonomy.EditValue);

            nChosenInsolation = (SpinEditnChosenInsolation.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenInsolation.EditValue) == true ? 0m : (decimal)SpinEditnChosenInsolation.EditValue);
            nChosenBattery = (SpinEditnChosenBattery.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenBattery.EditValue) == true ? 0m : (decimal)SpinEditnChosenBattery.EditValue);

            nDemandTotal = (SpinEditnDemandTotal.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnDemandTotal.EditValue) == true ? 0m : (decimal)SpinEditnDemandTotal.EditValue);


            cName = (TextEditcName.EditValue == null ? "" : DBNull.Value.Equals(TextEditcName.EditValue) == true ? "" : (string)TextEditcName.EditValue);
            cDesc = (TextEditcDesc.EditValue == null ? "" : DBNull.Value.Equals(TextEditcDesc.EditValue) == true ? "" : (string)TextEditcDesc.EditValue);

            cNote1 = (MemoEditcNote1.EditValue == null ? "" : DBNull.Value.Equals(MemoEditcNote1.EditValue) == true ? "" : (string)MemoEditcNote1.EditValue);
            cNote2 = (MemoEditcNote2.EditValue == null ? "" : DBNull.Value.Equals(MemoEditcNote2.EditValue) == true ? "" : (string)MemoEditcNote2.EditValue);
            cChosenTilt = (ComboBoxcChosenTilt.EditValue == null ? "" : DBNull.Value.Equals(ComboBoxcChosenTilt.EditValue) == true ? "" : (string)ComboBoxcChosenTilt.EditValue);
            dtDateDue = (DatePickerdtDateDue.EditValue == null ? (Nullable<DateTime>)DateTime.Now : DBNull.Value.Equals(DatePickerdtDateDue.EditValue) == true ? (Nullable<DateTime>)DateTime.Now :
              (DateTime)DatePickerdtDateDue.EditValue);


            //account_no = (DBNull.Value.Equals(drv["account_no"]) == true ? "" : (string)drv["account_no"]);

            int nCurrentProjectID = Settings.Default.nCurrentProjectID;







            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.updateDerates";
                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@nMPPTFactor", nMPPTFactor);
                    cmd3.Parameters.AddWithValue("@nBatteryEfficiency", nBatteryEfficiency);
                    cmd3.Parameters.AddWithValue("@nInverterDerate", nInverterDerate);
                    cmd3.Parameters.AddWithValue("@nControllerEfficiency", nControllerEfficiency);
                    cmd3.Parameters.AddWithValue("@nDaysAutonomy", nDaysAutonomy);
                    cmd3.Parameters.AddWithValue("@nVoltage", nVoltage);
                    cmd3.Parameters.AddWithValue("@nMDoD", nMDoD);
                    cmd3.Parameters.AddWithValue("@nTDR", nTDR);

                    cmd3.Parameters.AddWithValue("@nChosenInsolation", nChosenInsolation);
                    cmd3.Parameters.AddWithValue("@nChosenBattery", nChosenBattery);
                    cmd3.Parameters.AddWithValue("@nDemandTotal", nDemandTotal);
                    cmd3.Parameters.AddWithValue("@cName", cName);
                    cmd3.Parameters.AddWithValue("@cDesc", cDesc);
                    cmd3.Parameters.AddWithValue("@cNote1", cNote1);
                    cmd3.Parameters.AddWithValue("@cNote2", cNote2);
                    cmd3.Parameters.AddWithValue("@cChosenTilt", cChosenTilt);
                    cmd3.Parameters.AddWithValue("@dtDateDue", dtDateDue);
                    //cmd3.Parameters.AddWithValue("@address1", address1);



                    //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    //retval.Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd3.ExecuteNonQuery();
                    //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
                    Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));

                    Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter summaryDataSetgetProjectTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter();
                    summaryDataSetgetProjectTableAdapter.Fill(summaryDataSet.getProject, nCurrentProjectID);
                    System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));
                    getProjectViewSource.View.MoveCurrentToFirst();
                    TextEditnPVRequired.EditValue = Math.Round((Decimal) TextEditnPVRequired.EditValue, 2);
                    TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);

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

                
            }
        }

        private void SimpleButtonSaveChosenPV_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
          
            decimal nChosenPV = 0m;
            int nCurrentProjectID = Settings.Default.nCurrentProjectID;



            nChosenPV = (SpinEditnChosenPV_1.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenPV_1.EditValue) == true ? 0m : (decimal)SpinEditnChosenPV_1.EditValue);



            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.updateChosenPV";
                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@nChosenPV", nChosenPV);
                    


                    //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    //retval.Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd3.ExecuteNonQuery();
                    //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
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

                
                Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));

                Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter summaryDataSetgetProjectTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter();
                summaryDataSetgetProjectTableAdapter.Fill(summaryDataSet.getProject, nCurrentProjectID);
                System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));
                getProjectViewSource.View.MoveCurrentToFirst();
                TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
                TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);
            }
        }

        private void SimpleButton_Click_2(object sender, RoutedEventArgs e)
        {
            SpinEditnChosenPV_1.EditValue = TextEditnPVRequired.EditValue;
        }

        private void SimpleButtonSaveChosenBattery_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;

            decimal nChosenBattery = 0m;
            int nCurrentProjectID = Settings.Default.nCurrentProjectID;



            nChosenBattery = (SpinEditnChosenBattery_1.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenBattery_1.EditValue) == true ? 0m : (decimal)SpinEditnChosenBattery_1.EditValue);



            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.updateChosenBattery";
                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@nChosenBattery", nChosenBattery);



                    //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    //retval.Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd3.ExecuteNonQuery();
                    //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
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


                Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));

                Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter summaryDataSetgetProjectTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter();
                summaryDataSetgetProjectTableAdapter.Fill(summaryDataSet.getProject, nCurrentProjectID);
                System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));
                getProjectViewSource.View.MoveCurrentToFirst();
                TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
                TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);
            }
        }

        private void SimpleButtonBatteryToChosenBattery_Click(object sender, RoutedEventArgs e)
        {
            SpinEditnChosenBattery_1.EditValue = TextEditnBatteryCapacityFinal.EditValue;
        }

        private void SimpleButtonInfoTDRLeadAcid_Click(object sender, RoutedEventArgs e)
        {
            InfoTDRLeadAcid InfoTDRLeadAcid1 = new InfoTDRLeadAcid();
            

            InfoTDRLeadAcid1.ShowDialog();
        }

        private void DXTabControl_SelectionChanged(object sender, TabControlSelectionChangedEventArgs e)
        {

        }

        private void SimpleButtonSaveConfig_Click(object sender, RoutedEventArgs e)
        {
            coolBlue.RegisterDataSet registerDataSet = ((coolBlue.RegisterDataSet)(this.FindResource("registerDataSet")));

            int TransactID1 = 0;
            System.Windows.Data.CollectionViewSource uSP_getLineViewSource1 = ((System.Windows.Data.CollectionViewSource)(this.FindResource("uSP_getLineViewSource1")));
            System.Windows.Data.CollectionViewSource uSP_getAllAccountTypesUSP_getAllAccountsViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("uSP_getAllAccountTypesUSP_getAllAccountsViewSource")));
            System.Windows.Data.CollectionViewSource uSP_getLineUSP_getSplitViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("uSP_getLineUSP_getSplitViewSource")));



            DataRowView drv = (DataRowView)uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.CurrentItem;
            int accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["ID"]) == true ? 0 : (int)drv["ID"]);

            int lineCurrent = 0;
            int wasnull = 0;
            wasnull = (uSP_getLineViewSource1.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: uSP_getLineViewSource1 is null";
                string caption = "CoolBlue";

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
                DataRowView drv1 = (DataRowView)uSP_getLineViewSource1.View.CurrentItem;
                lineCurrent = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["ID"]) == true ? 0 : (int)drv1["ID"]);
            }





            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.coolblueconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.USP_deleteSplit";
                    cmd3.Parameters.AddWithValue("@nLine", lineCurrent);

                    //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    //retval.Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd3.ExecuteNonQuery();
                    //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
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



                //uSP_getLineDataGrid.

                //uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.MoveCurrentToPosition(0);

                //resetButtons();
                //LocateNewLine(TransactID1);
            }

            //write new records in dbo.split
            //int itwasnull = 0;
            //itwasnull = (uSP_getSplitDataGrid.)== null ? 1 : 0;
            //if (itwasnull == 0)


            //var selectedRow = uSP_getSplitDataGrid.GetRow(0);

            //var columnCell = uSP_getSplitDataGrid.GetCell(selectedRow, 0);

            //string content = (uSP_getSplitDataGrid.SelectedCells[0].Column.GetCellContent(0) as TextBlock).Text;
            //MessageBox.Show(content);
            //foreach (DataRowView dv in uSP_getSplitDataGrid.Items)
            //    {


            //            MessageBox.Show(dv[3].ToString());

            //    }
            // foreach (DataRowView drv3 in uSP_getLineUSP_getSplitViewSource.View)
            //{ 
            //int go = 0;

            // DataRowView drv3 = (DataRowView)uSP_getLineUSP_getSplitViewSource.View.CurrentItem;
            //int ID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["ID"]) == true ? 0 : (int)drv3["ID"]);
            //for (int i=0; i<5; i++)

            //if (ID == 0)
            //{
            //    go = 1;
            //}

            //while (go ==0)
            if (uSP_getLineUSP_getSplitViewSource.View != null)

            {
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.coolblueconnectionString };
                uSP_getLineUSP_getSplitViewSource.View.MoveCurrentToFirst();

                for (int i = 0; i - 1 < i++; i++)
                {
                    DataRowView drv3 = (DataRowView)uSP_getLineUSP_getSplitViewSource.View.CurrentItem;
                    int ID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["ID"]) == true ? 0 : (int)drv3["ID"]);
                    //MessageBox.Show(ID.ToString());

                    if (ID == 0)
                    {
                        break;
                    }


                    decimal nAmnt = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nAmount"]) == true ? 0 : (decimal)drv3["nAmount"]);
                    // MessageBox.Show(nAmnt.ToString());

                    int nSubCatID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nSubCatID"]) == true ? 0 : (int)drv3["nSubCatID"]);
                    int nXferAccountID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nXferAccountID"]) == true ? 0 : (int)drv3["nXferAccountID"]);
                    Boolean bXfer = (drv3 == null ? false : DBNull.Value.Equals(drv3["bXfer"]) == true ? false : (bool)drv3["bXfer"]);

                    int nVendorsID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nVendorsID"]) == true ? 0 : (int)drv3["nVendorsID"]);
                    string cMemo = (DBNull.Value.Equals(drv3["cMemo"]) == true ? "" : (string)drv3["cMemo"]);
                    int nTagID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nTagID"]) == true ? 0 : (int)drv3["nTagID"]);
                    int nClassID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nClassID"]) == true ? 0 : (int)drv3["nClassID"]);
                    int nAccountID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nAccountID"]) == true ? 0 : (int)drv3["nAccountID"]);
                    decimal nOriginalAmount = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nOriginalAmount"]) == true ? 0 : (decimal)drv3["nOriginalAmount"]);
                    int nCurrencyID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nCurrencyID"]) == true ? 0 : (int)drv3["nCurrencyID"]);
                    int nAccountID_C = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nAccountID_C"]) == true ? 0 : (int)drv3["nAccountID_C"]);
                    int nAccountID_D = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nAccountID_D"]) == true ? 0 : (int)drv3["nAccountID_D"]);
                    decimal nAmount_C = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nAmount_C"]) == true ? 0 : (decimal)drv3["nAmount_C"]);
                    decimal nAmount_D = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nAmount_D"]) == true ? 0 : (decimal)drv3["nAmount_D"]);
                    /////write new record to dbo.split

                    //SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.coolblueconnectionString };
                    try
                    {

                        using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                        {
                            //cmd3.Transaction = trans1;
                            cmd3.Parameters.Clear();
                            cmd3.CommandText = "dbo.USP_insertSplit";
                            cmd3.Parameters.AddWithValue("@lineID", lineCurrent);
                            cmd3.Parameters.AddWithValue("@subCatID", nSubCatID);
                            cmd3.Parameters.AddWithValue("@xferAccountID", nXferAccountID);
                            cmd3.Parameters.AddWithValue("@bXfer", bXfer);
                            cmd3.Parameters.AddWithValue("@amount", nAmnt);
                            cmd3.Parameters.AddWithValue("@vendorsID", nVendorsID);
                            cmd3.Parameters.AddWithValue("@memo", cMemo);
                            cmd3.Parameters.AddWithValue("@tagID", nTagID);
                            cmd3.Parameters.AddWithValue("@classID", nClassID);
                            cmd3.Parameters.AddWithValue("@accountID", accountCurrent);
                            cmd3.Parameters.AddWithValue("@originalAmount", nOriginalAmount);
                            cmd3.Parameters.AddWithValue("@currencyID", nCurrencyID);
                            cmd3.Parameters.AddWithValue("@nAccountID_C", nAccountID_C);
                            cmd3.Parameters.AddWithValue("@nAccountID_D", nAccountID_D);
                            cmd3.Parameters.AddWithValue("@nAmount_C", nAmount_C);
                            cmd3.Parameters.AddWithValue("@nAmount_D", nAmount_D);



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

                        //registerDataSet.EnforceConstraints = false;

                        //registerDataSetUSP_getSplitTableAdapter.Fill(registerDataSet.USP_getSplit, accountCurrent);
                        //registerDataSetUSP_getLineTableAdapter.Fill(registerDataSet.USP_getLine, accountCurrent);
                        //registerDataSet.EnforceConstraints = true;

                        ////uSP_getLineDataGrid.

                        ////uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.MoveCurrentToPosition(0);

                        ////resetButtons();
                        //LocateNewLine(TransactID1);
                    }






























                    uSP_getLineUSP_getSplitViewSource.View.MoveCurrentToNext();
                }
            }









            registerDataSet.EnforceConstraints = false;

            registerDataSetUSP_getSplitTableAdapter.Fill(registerDataSet.USP_getSplit, accountCurrent);
            registerDataSetUSP_getLineTableAdapter.Fill(registerDataSet.USP_getLine, accountCurrent);
            //registerDataSet.EnforceConstraints = true;

            decimal sumDr = 0;
            foreach (DataRow dr in registerDataSet.USP_getLine.Rows)
            {

                sumDr += (decimal)dr["totalDr"];

            }

            decimal sumCr = 0;
            foreach (DataRow dr in registerDataSet.USP_getLine.Rows)
            {

                sumCr += (decimal)dr["totalCr"];

            }

            decimal sumTotal = sumDr - sumCr;

            TextEditTotalDr.EditValue = sumDr;
            TextEditTotalCr.EditValue = sumCr;
            TextEditBalance.EditValue = sumTotal;


        }
    }
}
