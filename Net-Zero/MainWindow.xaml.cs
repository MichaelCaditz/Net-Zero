﻿using System;
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
            //TextEditDemandTotal.EditValue = 198.66;
        }

        private void ThemedWindow_Loaded(object sender, RoutedEventArgs e)
        {
            this.Title = "Net - Zero     Autonomous and Backup PV System Design     " + ProgramSettings.net_zeroconnectionStringPublic;
            Settings.Default.nCurrentProjectID = Settings.Default.nLastProjectID;
            int nLastProjectID = Settings.Default.nLastProjectID;
            int nCurrentProjectID = Settings.Default.nCurrentProjectID;

            Net_Zero.DemandDataSet demandDataSet = ((Net_Zero.DemandDataSet)(this.FindResource("demandDataSet")));
            Net_Zero.DemandDataSetTableAdapters.demandItemsTableAdapter demandDataSetdemandItemsTableAdapter = new Net_Zero.DemandDataSetTableAdapters.demandItemsTableAdapter();
            demandDataSetdemandItemsTableAdapter.Fill(demandDataSet.demandItems, nCurrentProjectID);
            System.Windows.Data.CollectionViewSource demandItemsViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("demandItemsViewSource")));
            demandItemsViewSource.View.MoveCurrentToFirst();



            Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));
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
           
            TextEditnPVRequired.EditValue = (TextEditnPVRequired.EditValue == null ? 0m : DBNull.Value.Equals(TextEditnPVRequired.EditValue) == true ? 0m :
               Math.Round((Decimal)TextEditnPVRequired.EditValue, 2));
            TextEditnDemandTotal.EditValue = (TextEditnDemandTotal.EditValue == null ? 0m : DBNull.Value.Equals(TextEditnDemandTotal.EditValue) == true ? 0m :
              Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2));


            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));
            Net_Zero.PVDataSetTableAdapters.getPVTableAdapter pVDataSetgetPVTableAdapter = new Net_Zero.PVDataSetTableAdapters.getPVTableAdapter();
            pVDataSetgetPVTableAdapter.Fill(pVDataSet.getPV, nCurrentProjectID);
            System.Windows.Data.CollectionViewSource getPVViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVViewSource")));
            getPVViewSource.View.MoveCurrentToFirst();


            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));

            Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter batterygetBatterySeriesStringTableAdapter = new Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter();
            batterygetBatterySeriesStringTableAdapter.Fill(battery.getBatterySeriesString, nCurrentProjectID);
            System.Windows.Data.CollectionViewSource getBatterySeriesStringViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatterySeriesStringViewSource")));
            getBatterySeriesStringViewSource.View.MoveCurrentToFirst();


            // TODO: Add code here to load data into the table getBattery.
            // This code could not be generated, because the batterygetBatteryTableAdapter.Fill method is missing, or has unrecognized parameters.
            Net_Zero.BatteryTableAdapters.getBatteryTableAdapter getBatteryTableAdapter = new Net_Zero.BatteryTableAdapters.getBatteryTableAdapter();
            getBatteryTableAdapter.Fill(battery.getBattery, nCurrentProjectID);
            //System.Windows.Data.CollectionViewSource getBatteryViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryViewSource")));


            System.Windows.Data.CollectionViewSource getBatterySeriesStringgetBatteryViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatterySeriesStringgetBatteryViewSource")));
            //getBatterySeriesStringgetBatteryViewSource.View.MoveCurrentToFirst();
            decimal nSumCapacity = (battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null) == null ? 0m :
                       DBNull.Value.Equals(battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null)) == true ? 0m : (decimal)battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null));
            decimal nSumPVkW = (pVDataSet.getPV.Compute("Sum(nTotPmax)", null) == null ? 0m :
                       DBNull.Value.Equals(pVDataSet.getPV.Compute("Sum(nTotPmax)", null)) == true ? 0m : (decimal)pVDataSet.getPV.Compute("Sum(nTotPmax)/1000", null));
            decimal nSumPDemand = (demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null) == null ? 0m :
                       DBNull.Value.Equals(demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null)) == true ? 0m : (decimal)demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null));

            SpinEditComputedDemandTotal.EditValue = nSumPDemand;
            SpinEditnCapacityAchieved.EditValue = nSumCapacity;
            SpinEditnCapacityAchievedPVkW.EditValue = nSumPVkW;



            LinearGauge1.Scales[0].StartValue = 0;
            LinearGauge1.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumCapacity);
            LinearGauge1.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenBatteryCapacity.EditValue);

            LinearGaugePV.Scales[0].StartValue = 0;
            LinearGaugePV.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumPVkW);
            LinearGaugePV.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenPVkW.EditValue);

            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
            Net_Zero.MastersTableAdapters.getPVMasterTableAdapter mastersgetPVMasterTableAdapter = new Net_Zero.MastersTableAdapters.getPVMasterTableAdapter();
            mastersgetPVMasterTableAdapter.Fill(masters.getPVMaster);
            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVMasterViewSource")));
            getPVMasterViewSource.View.MoveCurrentToFirst();
            Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter mastersgetBatteryMasterTableAdapter = new Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter();
            mastersgetBatteryMasterTableAdapter.Fill(masters.getBatteryMaster);
            System.Windows.Data.CollectionViewSource getBatteryMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryMasterViewSource")));
            getBatteryMasterViewSource.View.MoveCurrentToFirst();




            DataRowView drv3 = (DataRowView)getProjectViewSource.View.CurrentItem;
            int nID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nID"]) == true ? 0 : (int)drv3["nID"]);
           
           // decimal nPrice = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nPrice"]) == true ? 0 : (decimal)drv3["nPrice"]);
            // MessageBox.Show(nAmnt.ToString());

            //int nQty = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nQty"]) == true ? 0 : (int)drv3["nQty"]);
            //bool bDeleted = true;
            string cChosenTilt = (DBNull.Value.Equals(drv3["cChosenTilt"]) == true ? "" : (string)drv3["cChosenTilt"]);
            string cName = (DBNull.Value.Equals(drv3["cName"]) == true ? "" : (string)drv3["cName"]);
            string predictedHeader= "Expected Insol. kWh/m2 for Tilt=" + cChosenTilt + "; Az: South";
            GridColumnPredictedInsolation.Header = predictedHeader;
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


                string message20 = "Analysis complete";
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
        }

        

        public void savePVLocation()
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            int nCityID = 0;
            decimal nInsolation = 0;
            int nCurrentProjectID = Settings.Default.nCurrentProjectID;


            System.Windows.Data.CollectionViewSource getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource")));
            Net_Zero.Geography geography = ((Net_Zero.Geography)(this.FindResource("geography")));


            //int accountCurrent = 0;
            int wasnull = 0;
            wasnull = (getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                //// MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                //string message = "Warning:getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource is null";
                //string caption = "CoolBlue";

                //MessageBoxButton buttons = MessageBoxButton.OK;
                //MessageBoxImage icon = MessageBoxImage.Information;
                //MessageBoxResult defaultResult = MessageBoxResult.OK;
                //MessageBoxOptions options = MessageBoxOptions.RtlReading;
                //// Show message box
                //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                //// Displays the MessageBox.
                //MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                //if (result == MessageBoxResult.OK)
                //{

                //    // Closes the parent form.

                //    //this.Close();

                //}
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

        public void saveProjectDetails()
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            //int nCityID = 0;
            decimal nMPPTFactor = 0m;
            decimal nBatteryEfficiency = 0m;
            decimal nControllerEfficiency = 0m;
            decimal nDaysAutonomy = 0m;
            decimal nVoltage = 0m;
            decimal nInverterDerate = 0m;
            decimal nMDoD = 0m;
            decimal nTDR = 0m;

            decimal nChosenInsolation = 0m;
            decimal nChosenBattery = 0m;
            decimal nChosenPV = 0m;
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
            nChosenPV = (SpinEditnChosenPV.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenPV.EditValue) == true ? 0m : (decimal)SpinEditnChosenPV.EditValue);

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
                    cmd3.Parameters.AddWithValue("@nChosenPV", nChosenPV);
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


                DataRowView drv = (DataRowView)getProjectViewSource.View.CurrentItem;
                decimal nPVRequired = (DBNull.Value.Equals(drv["nPVRequired"]) == true ? 0m : (decimal)drv["nPVRequired"]);
                TextEditnPVRequired.EditValue = nPVRequired;
                TextEditnPVRequired.EditValue = (TextEditnPVRequired.EditValue == null ? 0m : DBNull.Value.Equals(TextEditnPVRequired.EditValue) == true ? 0m :
               Math.Round((Decimal)TextEditnPVRequired.EditValue, 2));
                TextEditnDemandTotal.EditValue = (TextEditnDemandTotal.EditValue == null ? 0m : DBNull.Value.Equals(TextEditnDemandTotal.EditValue) == true ? 0m :
                  Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2));
                //string message20 = "Update complete";
                //string caption20 = "Net-Zero";
                //MessageBoxButton buttons20 = MessageBoxButton.OK;
                //MessageBoxImage icon20 = MessageBoxImage.Information;
                //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
                //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
                //// Show message box
                //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                //// Displays the MessageBox.
                //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);


            }
        }

        public void savePVComputation()
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

                //string message20 = "Update complete";
                //string caption20 = "Net-Zero";
                //MessageBoxButton buttons20 = MessageBoxButton.OK;
                //MessageBoxImage icon20 = MessageBoxImage.Information;
                //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
                //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
                //// Show message box
                //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                //// Displays the MessageBox.
                //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);
            }
        }

        private void SimpleButton_Click_2(object sender, RoutedEventArgs e)
        {
            SpinEditnChosenPV_1.EditValue = TextEditnPVRequired.EditValue;
        }

        public void saveBatteryComputation()
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

                //string message20 = "Update complete";
                //string caption20 = "Net-Zero";
                //MessageBoxButton buttons20 = MessageBoxButton.OK;
                //MessageBoxImage icon20 = MessageBoxImage.Information;
                //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
                //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
                //// Show message box
                //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                //// Displays the MessageBox.
                //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);
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

        public void SavePV(bool deleteFlag)
        {

            System.Windows.Data.CollectionViewSource getPVViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVViewSource")));

            int nProjectsID = Settings.Default.nCurrentProjectID;

            DataRowView drv = (DataRowView)getPVViewSource.View.CurrentItem;
            //int accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["ID"]) == true ? 0 : (int)drv["ID"]);

            //int lineCurrent = 0;
            int wasnull = 0;
            wasnull = (getPVViewSource.View == null ? 1 : 0);
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
                DataRowView drv1 = (DataRowView)getPVViewSource.View.CurrentItem;
                //lineCurrent = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["ID"]) == true ? 0 : (int)drv1["ID"]);
            }




            if (getPVViewSource.View != null)

            {
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
                getPVViewSource.View.MoveCurrentToFirst();

                for (int i = 0; i - 1 < i++; i++)
                {
                    DataRowView drv3 = (DataRowView)getPVViewSource.View.CurrentItem;
                    int nID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nID"]) == true ? 0 : (int)drv3["nID"]);
                    //MessageBox.Show(ID.ToString());
                    if (nID == 0)
                    {
                        break;
                    }

                    decimal nPrice = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nPrice"]) == true ? 0 : (decimal)drv3["nPrice"]);
                    // MessageBox.Show(nAmnt.ToString());

                    int nQty = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nQty"]) == true ? 0 : (int)drv3["nQty"]);
                    bool bDeleted = true;
                    string cURL = (DBNull.Value.Equals(drv3["cURL"]) == true ? "" : (string)drv3["cURL"]);
                    string cVendor = (DBNull.Value.Equals(drv3["cVendor"]) == true ? "" : (string)drv3["cVendor"]);

                    string cFrame = (DBNull.Value.Equals(drv3["cFrame"]) == true ? "" : (string)drv3["cFrame"]);
                    string cBrand = (DBNull.Value.Equals(drv3["cBrand"]) == true ? "" : (string)drv3["cBrand"]);
                    string cModel = (DBNull.Value.Equals(drv3["cModel"]) == true ? "" : (string)drv3["cModel"]);


                    if (deleteFlag == false)
                    {bDeleted = (drv3 == null ? false : DBNull.Value.Equals(drv3["bDeleted"]) == true ? false : (bool)drv3["bDeleted"]); }


                    decimal nPmax = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nPmax"]) == true ? 0 : (decimal)drv3["nPmax"]);
                    decimal nVmp = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nVmp"]) == true ? 0 : (decimal)drv3["nVmp"]);
                    decimal nImp = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nImp"]) == true ? 0 : (decimal)drv3["nImp"]);
                    decimal nVoc = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nVoc"]) == true ? 0 : (decimal)drv3["nVoc"]);
                    decimal nIsc = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nIsc"]) == true ? 0 : (decimal)drv3["nIsc"]);
                    decimal nWeight_kg = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nWeight_kg"]) == true ? 0 : (decimal)drv3["nWeight_kg"]);
                    decimal nLength_mm = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nLength_mm"]) == true ? 0 : (decimal)drv3["nLength_mm"]);
                    decimal nHeight_mm = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nHeight_mm"]) == true ? 0 : (decimal)drv3["nHeight_mm"]);
                    decimal nWidth_mm = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nWidth_mm"]) == true ? 0 : (decimal)drv3["nWidth_mm"]);
                    decimal nTilt_deg = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nTilt_deg"]) == true ? 0 : (decimal)drv3["nTilt_deg"]);
                    decimal nOrientation_deg = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nOrientation_deg"]) == true ? 0 : (decimal)drv3["nOrientation_deg"]);

                    /////write new record to dbo.split

                    //SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.coolblueconnectionString };
                    try
                    {

                        using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                        {
                            //cmd3.Transaction = trans1;
                            cmd3.Parameters.Clear();
                            cmd3.CommandText = "dbo.USP_updatePV";
                            cmd3.Parameters.AddWithValue("@nID", nID);
                            cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
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
                            cmd3.Parameters.AddWithValue("@nTilt_deg", nTilt_deg);
                            cmd3.Parameters.AddWithValue("@nOrientation_deg", nOrientation_deg);
                            cmd3.Parameters.AddWithValue("@cURL", cURL);
                            cmd3.Parameters.AddWithValue("@nQty", nQty);
                            cmd3.Parameters.AddWithValue("@bDeleted", bDeleted);



                            // SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                            // retval.Direction = ParameterDirection.Output;
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



                    getPVViewSource.View.MoveCurrentToNext();
                }
            }
        }




        public void savePVConfiguration()
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;

            SavePV(false);


            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));



            // registerDataSet.EnforceConstraints = false;

            Net_Zero.PVDataSetTableAdapters.getPVTableAdapter pVDataSetgetPVTableAdapter = new Net_Zero.PVDataSetTableAdapters.getPVTableAdapter();
            pVDataSetgetPVTableAdapter.Fill(pVDataSet.getPV, nProjectsID);
            //registerDataSet.EnforceConstraints = true;

            Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter batterygetBatterySeriesStringTableAdapter = new Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter();
            batterygetBatterySeriesStringTableAdapter.Fill(battery.getBatterySeriesString, nProjectsID);


            //Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            decimal nSumCapacity = (battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null) == null ? 0m :
                      DBNull.Value.Equals(battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null)) == true ? 0m : (decimal)battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null));
            decimal nSumPVkW = (pVDataSet.getPV.Compute("Sum(nTotPmax)", null) == null ? 0m :
                       DBNull.Value.Equals(pVDataSet.getPV.Compute("Sum(nTotPmax)", null)) == true ? 0m : (decimal)pVDataSet.getPV.Compute("Sum(nTotPmax)/1000", null));

            SpinEditnCapacityAchieved.EditValue = nSumCapacity;
            SpinEditnCapacityAchievedPVkW.EditValue = nSumPVkW;



            LinearGauge1.Scales[0].StartValue = 0;
            LinearGauge1.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumCapacity);
            LinearGauge1.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenBatteryCapacity.EditValue);

            LinearGaugePV.Scales[0].StartValue = 0;
            LinearGaugePV.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumPVkW);
            LinearGaugePV.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenPVkW.EditValue);

            //string message20 = "Update complete";
            //string caption20 = "Net-Zero";
            //MessageBoxButton buttons20 = MessageBoxButton.OK;
            //MessageBoxImage icon20 = MessageBoxImage.Information;
            //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
            //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
            //// Show message box
            //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            //// Displays the MessageBox.
            //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);

        }

        public void saveBatterySeriesConfiguration()
        {
            int TransactID1 = 0;
            System.Windows.Data.CollectionViewSource getBatterySeriesStringViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatterySeriesStringViewSource")));

            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));


            int nProjectsID = Settings.Default.nCurrentProjectID;

            int wasnull = 0;
            wasnull = (getBatterySeriesStringViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: getBatterySeriesStringViewSource is null";
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
                DataRowView drv = (DataRowView)getBatterySeriesStringViewSource.View.CurrentItem;
                //accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);
            }






            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "[dbo].[USP_insertBatterySeriesString]";

                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@cName", "Series String");

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
                Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter batterygetBatterySeriesStringTableAdapter = new Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter();

                batterygetBatterySeriesStringTableAdapter.Fill(battery.getBatterySeriesString, nProjectsID);
                //registerDataSetUSP_getLineTableAdapter.Fill(registerDataSet.USP_getLine, accountCurrent);
                // registerDataSet.EnforceConstraints = true;

                //uSP_getLineDataGrid.

                //uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.MoveCurrentToPosition(0);

                //resetButtons();
                LocateNewLineBatterySeriesString(TransactID1);
            }

        }
        public void LocateNewLineBatterySeriesString(int IDToFind)
        {
            //int IDToFind = Convert.ToInt32(txt_IdUnique.Text);

            if (IDToFind > -1)
            {
                foreach (DataRowView drv in (BindingListCollectionView)GridControlBatterySeriesString.ItemsSource)
                    if ((int)drv["nID"] == IDToFind)
                    {
                        // This is the data row view record you want...
                        GridControlBatterySeriesString.SelectedItem = drv;
                        break;
                    }
            }
        }

        private void SimpleButtonNewString_Click(object sender, RoutedEventArgs e)
        {
            int TransactID1 = 0;
            System.Windows.Data.CollectionViewSource getBatterySeriesStringViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatterySeriesStringViewSource")));

            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));


            int nProjectsID = Settings.Default.nCurrentProjectID;

            int wasnull = 0;
            wasnull = (getBatterySeriesStringViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: getBatterySeriesStringViewSource is null";
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
                DataRowView drv = (DataRowView)getBatterySeriesStringViewSource.View.CurrentItem;
                //accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);
            }






            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "[dbo].[USP_insertBatterySeriesString]";

                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@cName", "Series String");

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
                Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter batterygetBatterySeriesStringTableAdapter = new Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter();

                batterygetBatterySeriesStringTableAdapter.Fill(battery.getBatterySeriesString, nProjectsID);
                //registerDataSetUSP_getLineTableAdapter.Fill(registerDataSet.USP_getLine, accountCurrent);
                // registerDataSet.EnforceConstraints = true;

                //uSP_getLineDataGrid.

                //uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.MoveCurrentToPosition(0);

                //resetButtons();
                LocateNewLineBatterySeriesString(TransactID1);
            }

        }

        private void SimpleButtonNewBattery_Click(object sender, RoutedEventArgs e)
        {

            SaveBattery(false);

            decimal nPrice = 0m;
            // MessageBox.Show(nAmnt.ToString());


            string cURL = "";
            string cNote = "";
            string cVendor = "";
            string cBrand = "Brand";
            string cModel = "Model";
            //Boolean bDeleted = (drv3 == null ? false : DBNull.Value.Equals(drv3["bDeleted"]) == true ? false : (bool)drv3["bDeleted"]);
            decimal nVolts = 0m;
            decimal nCapacity_Ah = 0m;

            int TransactID1 = 0;
            System.Windows.Data.CollectionViewSource getBatterySeriesStringViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatterySeriesStringViewSource")));

            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));


            int nProjectsID = Settings.Default.nCurrentProjectID;
            int stringCurrent = 0;

            int wasnull = 0;
            wasnull = (getBatterySeriesStringViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: getBatterySeriesStringViewSource is null";
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
                DataRowView drv = (DataRowView)getBatterySeriesStringViewSource.View.CurrentItem;
                stringCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);
            }

            System.Windows.Data.CollectionViewSource getBatteryMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryMasterViewSource")));


            int wasnull1 = 0;
            wasnull1 = (getBatteryMasterViewSource.View == null ? 1 : 0);
            if (wasnull1 == 1)
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
                if (CheckEditAddBlankBattery.EditValue is false)
                {
                    DataRowView drv3 = (DataRowView)getBatteryMasterViewSource.View.CurrentItem;  
                    nPrice = (drv3 == null ? 0m : DBNull.Value.Equals(drv3["nPrice"]) == true ? 0m : (decimal)drv3["nPrice"]);
                    // MessageBox.Show(nAmnt.ToString());


                    cURL = (DBNull.Value.Equals(drv3["cURL"]) == true ? "" : (string)drv3["cURL"]);
                    cNote = (DBNull.Value.Equals(drv3["cNote"]) == true ? "" : (string)drv3["cNote"]);
                    cVendor = (DBNull.Value.Equals(drv3["cVendor"]) == true ? "" : (string)drv3["cVendor"]);
                    cBrand = (DBNull.Value.Equals(drv3["cBrand"]) == true ? "" : (string)drv3["cBrand"]);
                    cModel = (DBNull.Value.Equals(drv3["cModel"]) == true ? "" : (string)drv3["cModel"]);
                    // bDeleted = (drv3 == null ? false : DBNull.Value.Equals(drv3["bDeleted"]) == true ? false : (bool)drv3["bDeleted"]);
                    nVolts = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nVolts"]) == true ? 0 : (decimal)drv3["nVolts"]);
                    nCapacity_Ah = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nCapacity_Ah"]) == true ? 0 : (decimal)drv3["nCapacity_Ah"]);
                }
            }







            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {

                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "[dbo].[USP_insertBattery]";

                    cmd3.Parameters.AddWithValue("@nBatterySeriesStringID", stringCurrent);
                    cmd3.Parameters.AddWithValue("@nPrice", nPrice);

                    cmd3.Parameters.AddWithValue("@cNote", cNote);
                    cmd3.Parameters.AddWithValue("@cBrand", cBrand);
                    cmd3.Parameters.AddWithValue("@nQty", 1);

                    cmd3.Parameters.AddWithValue("@cModel", cModel);
                    cmd3.Parameters.AddWithValue("@nVolts", nVolts);
                    cmd3.Parameters.AddWithValue("@nCapacity_Ah", nCapacity_Ah);

                    cmd3.Parameters.AddWithValue("@cVendor", cVendor);
                    cmd3.Parameters.AddWithValue("@cURL", cURL);


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
                Net_Zero.BatteryTableAdapters.getBatteryTableAdapter getBatteryTableAdapter = new Net_Zero.BatteryTableAdapters.getBatteryTableAdapter();
                getBatteryTableAdapter.Fill(battery.getBattery, nProjectsID);
                //resetButtons();
                LocateNewLineBattery(TransactID1);
            }

        }
        public void LocateNewLineBattery(int IDToFind)
        {
            //int IDToFind = Convert.ToInt32(txt_IdUnique.Text);

            if (IDToFind > -1)
            {
                foreach (DataRowView drv in (BindingListCollectionView)GridControlBatterySeriesString.ItemsSource)
                    if ((int)drv["nID"] == IDToFind)
                    {
                        // This is the data row view record you want...
                        GridControlBattery.SelectedItem = drv;
                        break;
                    }
            }
        }

        public void SaveBattery(bool deleteFlag)
        {
            System.Windows.Data.CollectionViewSource getBatterySeriesStringViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatterySeriesStringViewSource")));

            System.Windows.Data.CollectionViewSource getBatterySeriesStringgetBatteryViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatterySeriesStringgetBatteryViewSource")));





            int nProjectsID = Settings.Default.nCurrentProjectID;
            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));
            int TransactID1 = 0;
            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));
            Boolean bDeleted = true;

            //DataRowView drv = (DataRowView)getBatterySeriesStringViewSource.View.CurrentItem;
            // int seriesCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);

            //int lineCurrent = 0;
            int wasnull = 0;
            wasnull = (getBatterySeriesStringViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: getBatterySeriesStringViewSource is null";
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
                DataRowView drv = (DataRowView)getBatterySeriesStringViewSource.View.CurrentItem;
                int seriesCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);
            }





            //SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            //try
            //{

            //    using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
            //    {
            //        //cmd3.Transaction = trans1;
            //        cmd3.Parameters.Clear();
            //        cmd3.CommandText = "dbo.USP_deletePV";
            //        cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);

            //        //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
            //        //retval.Direction = ParameterDirection.Output;
            //        conn.Open();
            //        cmd3.ExecuteNonQuery();
            //        //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
            //    }

            //}


            //catch (Exception ex)
            //{
            //    //utilities.errorLog(System.Reflection.MethodInfo.GetCurrentMethod().Name, ex);
            //    System.ArgumentException argEx = new System.ArgumentException("Save PV", "", ex);
            //    throw argEx;
            //}
            //finally
            //{
            //    if (conn.State == ConnectionState.Open) conn.Close();



            //    //uSP_getLineDataGrid.

            //    //uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.MoveCurrentToPosition(0);

            //    //resetButtons();
            //    //LocateNewLine(TransactID1);
            //}

            ////write new records in dbo.split
            ////int itwasnull = 0;
            ////itwasnull = (uSP_getSplitDataGrid.)== null ? 1 : 0;
            ////if (itwasnull == 0)


            ////var selectedRow = uSP_getSplitDataGrid.GetRow(0);

            ////var columnCell = uSP_getSplitDataGrid.GetCell(selectedRow, 0);

            ////string content = (uSP_getSplitDataGrid.SelectedCells[0].Column.GetCellContent(0) as TextBlock).Text;
            ////MessageBox.Show(content);
            ////foreach (DataRowView dv in uSP_getSplitDataGrid.Items)
            ////    {


            ////            MessageBox.Show(dv[3].ToString());

            ////    }
            //// foreach (DataRowView drv3 in uSP_getLineUSP_getSplitViewSource.View)
            ////{ 
            ////int go = 0;

            //// DataRowView drv3 = (DataRowView)uSP_getLineUSP_getSplitViewSource.View.CurrentItem;
            ////int ID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["ID"]) == true ? 0 : (int)drv3["ID"]);
            ////for (int i=0; i<5; i++)

            ////if (ID == 0)
            ////{
            ////    go = 1;
            ////}

            ////while (go ==0)
            if (getBatterySeriesStringgetBatteryViewSource.View != null)

            {
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
                getBatterySeriesStringgetBatteryViewSource.View.MoveCurrentToFirst();

                for (int i = 0; i - 1 < i++; i++)
                {
                    DataRowView drv3 = (DataRowView)getBatterySeriesStringgetBatteryViewSource.View.CurrentItem;
                    int nID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nID"]) == true ? 0 : (int)drv3["nID"]);
                    //MessageBox.Show(ID.ToString());

                    if (nID == 0)
                    {
                        break;
                    }


                    decimal nPrice = (drv3 == null ? 0m : DBNull.Value.Equals(drv3["nPrice"]) == true ? 0m : (decimal)drv3["nPrice"]);
                    // MessageBox.Show(nAmnt.ToString());

                    int nQty = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nQty"]) == true ? 0 : (int)drv3["nQty"]);
                    int nBatterySeriesStringID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nBatterySeriesStringID"]) == true ? 0 : (int)drv3["nBatterySeriesStringID"]);

                    string cURL = (DBNull.Value.Equals(drv3["cURL"]) == true ? "" : (string)drv3["cURL"]);
                    string cNote = (DBNull.Value.Equals(drv3["cNote"]) == true ? "" : (string)drv3["cNote"]);
                    string cVendor = (DBNull.Value.Equals(drv3["cVendor"]) == true ? "" : (string)drv3["cVendor"]);
                    string cBrand = (DBNull.Value.Equals(drv3["cBrand"]) == true ? "" : (string)drv3["cBrand"]);
                    string cModel = (DBNull.Value.Equals(drv3["cModel"]) == true ? "" : (string)drv3["cModel"]);
                    if (deleteFlag == false)
                    { bDeleted = (drv3 == null ? false : DBNull.Value.Equals(drv3["bDeleted"]) == true ? false : (bool)drv3["bDeleted"]); }
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
                            cmd3.CommandText = "[dbo].[USP_updateBattery]";
                            cmd3.Parameters.AddWithValue("@nID", nID);
                            cmd3.Parameters.AddWithValue("@nPrice", nPrice);
                            cmd3.Parameters.AddWithValue("@nQty", nQty);
                            cmd3.Parameters.AddWithValue("@cNote", cNote);
                            cmd3.Parameters.AddWithValue("@cBrand", cBrand);
                            cmd3.Parameters.AddWithValue("@nBatterySeriesStringID", nBatterySeriesStringID);
                            cmd3.Parameters.AddWithValue("@bDeleted", bDeleted);
                            cmd3.Parameters.AddWithValue("@cModel", cModel);
                            cmd3.Parameters.AddWithValue("@nVolts", nVolts);
                            cmd3.Parameters.AddWithValue("@nCapacity_Ah", nCapacity_Ah);

                            cmd3.Parameters.AddWithValue("@cVendor", cVendor);
                            cmd3.Parameters.AddWithValue("@cURL", cURL);


                            // SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
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

                        //registerDataSet.EnforceConstraints = false;

                        //registerDataSetUSP_getSplitTableAdapter.Fill(registerDataSet.USP_getSplit, accountCurrent);
                        //registerDataSetUSP_getLineTableAdapter.Fill(registerDataSet.USP_getLine, accountCurrent);
                        //registerDataSet.EnforceConstraints = true;

                        ////uSP_getLineDataGrid.

                        ////uSP_getAllAccountTypesUSP_getAllAccountsViewSource.View.MoveCurrentToPosition(0);

                        ////resetButtons();
                        //LocateNewLine(TransactID1);
                    }




                    getBatterySeriesStringgetBatteryViewSource.View.MoveCurrentToNext();
                }
            }




        }

        public void SaveString(bool deleteFlag)
        {
            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));
            int nProjectsID = Settings.Default.nCurrentProjectID;

            SaveString(false);




            // registerDataSet.EnforceConstraints = false;

            Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter batterygetBatterySeriesStringTableAdapter = new Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter();
            batterygetBatterySeriesStringTableAdapter.Fill(battery.getBatterySeriesString, nProjectsID);


            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            decimal nSumCapacity = (battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null) == null ? 0m :
                      DBNull.Value.Equals(battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null)) == true ? 0m : (decimal)battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null));
            decimal nSumPVkW = (pVDataSet.getPV.Compute("Sum(nTotPmax)", null) == null ? 0m :
                       DBNull.Value.Equals(pVDataSet.getPV.Compute("Sum(nTotPmax)", null)) == true ? 0m : (decimal)pVDataSet.getPV.Compute("Sum(nTotPmax)/1000", null));

            SpinEditnCapacityAchieved.EditValue = nSumCapacity;
            SpinEditnCapacityAchievedPVkW.EditValue = nSumPVkW;



            LinearGauge1.Scales[0].StartValue = 0;
            LinearGauge1.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumCapacity);
            LinearGauge1.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenBatteryCapacity.EditValue);

            LinearGaugePV.Scales[0].StartValue = 0;
            LinearGaugePV.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumPVkW);
            LinearGaugePV.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenPVkW.EditValue);

            //string message20 = "Update complete";
            //string caption20 = "Net-Zero";

            //MessageBoxButton buttons20 = MessageBoxButton.OK;
            //MessageBoxImage icon20 = MessageBoxImage.Information;
            //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
            //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
            //// Show message box
            //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            //// Displays the MessageBox.
            //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);





        }


        public void SaveChosenDemand()
        {

            int nProjectsID = Settings.Default.nCurrentProjectID;
            //int nCityID = 0;
            decimal nMPPTFactor = 0m;
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


            // nMPPTFactor = (SpinEditnMPPTFactor.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnMPPTFactor.EditValue) == true ? 0m : (decimal)SpinEditnMPPTFactor.EditValue);
            //nBatteryEfficiency = (SpinEditnBatteryEfficiency.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnBatteryEfficiency.EditValue) == true ? 0m : (decimal)SpinEditnBatteryEfficiency.EditValue);
            //nControllerEfficiency = (SpinEditnControllerEfficiency.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnControllerEfficiency.EditValue) == true ? 0m : (decimal)SpinEditnControllerEfficiency.EditValue);
            //nInverterDerate = (SpinEditnInverterDerate.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnInverterDerate.EditValue) == true ? 0m : (decimal)SpinEditnInverterDerate.EditValue);
            //nVoltage = (SpinEditnVoltage.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnVoltage.EditValue) == true ? 0m : (decimal)SpinEditnVoltage.EditValue);
            //nMDoD = (SpinEditnMDoD.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnMDoD.EditValue) == true ? 0m : (decimal)SpinEditnMDoD.EditValue);

            //nTDR = (SpinEditnTDR.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnTDR.EditValue) == true ? 0m : (decimal)SpinEditnTDR.EditValue);

            //nDaysAutonomy = (SpinEditnDaysAutonomy.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnDaysAutonomy.EditValue) == true ? 0m : (decimal)SpinEditnDaysAutonomy.EditValue);

            //nChosenInsolation = (SpinEditnChosenInsolation.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenInsolation.EditValue) == true ? 0m : (decimal)SpinEditnChosenInsolation.EditValue);
            //nChosenBattery = (SpinEditnChosenBattery.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenBattery.EditValue) == true ? 0m : (decimal)SpinEditnChosenBattery.EditValue);

            nDemandTotal = (SpinEditChosenDemandTotal.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditChosenDemandTotal.EditValue) == true ? 0m : (decimal)SpinEditChosenDemandTotal.EditValue);


            //cName = (TextEditcName.EditValue == null ? "" : DBNull.Value.Equals(TextEditcName.EditValue) == true ? "" : (string)TextEditcName.EditValue);
            //cDesc = (TextEditcDesc.EditValue == null ? "" : DBNull.Value.Equals(TextEditcDesc.EditValue) == true ? "" : (string)TextEditcDesc.EditValue);

            //cNote1 = (MemoEditcNote1.EditValue == null ? "" : DBNull.Value.Equals(MemoEditcNote1.EditValue) == true ? "" : (string)MemoEditcNote1.EditValue);
            //cNote2 = (MemoEditcNote2.EditValue == null ? "" : DBNull.Value.Equals(MemoEditcNote2.EditValue) == true ? "" : (string)MemoEditcNote2.EditValue);
            //cChosenTilt = (ComboBoxcChosenTilt.EditValue == null ? "" : DBNull.Value.Equals(ComboBoxcChosenTilt.EditValue) == true ? "" : (string)ComboBoxcChosenTilt.EditValue);
            //dtDateDue = (DatePickerdtDateDue.EditValue == null ? (Nullable<DateTime>)DateTime.Now : DBNull.Value.Equals(DatePickerdtDateDue.EditValue) == true ? (Nullable<DateTime>)DateTime.Now :
            //  (DateTime)DatePickerdtDateDue.EditValue);


            //account_no = (DBNull.Value.Equals(drv["account_no"]) == true ? "" : (string)drv["account_no"]);

            int nCurrentProjectID = Settings.Default.nCurrentProjectID;







            SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "dbo.updateChosenDemand";
                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    //cmd3.Parameters.AddWithValue("@nMPPTFactor", nMPPTFactor);
                    //cmd3.Parameters.AddWithValue("@nBatteryEfficiency", nBatteryEfficiency);
                    //cmd3.Parameters.AddWithValue("@nInverterDerate", nInverterDerate);
                    //cmd3.Parameters.AddWithValue("@nControllerEfficiency", nControllerEfficiency);
                    //cmd3.Parameters.AddWithValue("@nDaysAutonomy", nDaysAutonomy);
                    //cmd3.Parameters.AddWithValue("@nVoltage", nVoltage);
                    //cmd3.Parameters.AddWithValue("@nMDoD", nMDoD);
                    //cmd3.Parameters.AddWithValue("@nTDR", nTDR);

                    //cmd3.Parameters.AddWithValue("@nChosenInsolation", nChosenInsolation);
                    //cmd3.Parameters.AddWithValue("@nChosenBattery", nChosenBattery);
                    cmd3.Parameters.AddWithValue("@nDemandTotal", nDemandTotal);
                    //cmd3.Parameters.AddWithValue("@cName", cName);
                    //cmd3.Parameters.AddWithValue("@cDesc", cDesc);
                    //cmd3.Parameters.AddWithValue("@cNote1", cNote1);
                    //cmd3.Parameters.AddWithValue("@cNote2", cNote2);
                    //cmd3.Parameters.AddWithValue("@cChosenTilt", cChosenTilt);
                    //cmd3.Parameters.AddWithValue("@dtDateDue", dtDateDue);
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
                    TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
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




        //private void SimpleButtonSaveChosenPV_Click(object sender, RoutedEventArgs e)
        //{
        //    int nProjectsID = Settings.Default.nCurrentProjectID;

        //    decimal nChosenPV = 0m;
        //    int nCurrentProjectID = Settings.Default.nCurrentProjectID;



        //    nChosenPV = (SpinEditnChosenPV_1.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenPV_1.EditValue) == true ? 0m : (decimal)SpinEditnChosenPV_1.EditValue);



        //    SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
        //    try
        //    {

        //        using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
        //        {
        //            //cmd3.Transaction = trans1;
        //            cmd3.Parameters.Clear();
        //            cmd3.CommandText = "dbo.updateChosenPV";
        //            cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
        //            cmd3.Parameters.AddWithValue("@nChosenPV", nChosenPV);



        //            //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
        //            //retval.Direction = ParameterDirection.Output;
        //            conn.Open();
        //            cmd3.ExecuteNonQuery();
        //            //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
        //        }




        //    }


        //    catch (Exception ex)
        //    {
        //        //utilities.errorLog(System.Reflection.MethodInfo.GetCurrentMethod().Name, ex);
        //        System.ArgumentException argEx = new System.ArgumentException("New Line", "", ex);
        //        throw argEx;
        //    }
        //    finally
        //    {
        //        if (conn.State == ConnectionState.Open) conn.Close();


        //        Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));

        //        Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter summaryDataSetgetProjectTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter();
        //        summaryDataSetgetProjectTableAdapter.Fill(summaryDataSet.getProject, nCurrentProjectID);
        //        System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));
        //        getProjectViewSource.View.MoveCurrentToFirst();
        //        TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
        //        TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);
        //    }
        //}

        //private void SimpleButton_Click_2(object sender, RoutedEventArgs e)
        //{
        //    SpinEditnChosenPV_1.EditValue = TextEditnPVRequired.EditValue;
        //}

        //private void SimpleButtonSaveChosenBattery_Click(object sender, RoutedEventArgs e)
        //{
        //    int nProjectsID = Settings.Default.nCurrentProjectID;

        //    decimal nChosenBattery = 0m;
        //    int nCurrentProjectID = Settings.Default.nCurrentProjectID;



        //    nChosenBattery = (SpinEditnChosenBattery_1.EditValue == null ? 0m : DBNull.Value.Equals(SpinEditnChosenBattery_1.EditValue) == true ? 0m : (decimal)SpinEditnChosenBattery_1.EditValue);



        //    SqlConnection conn = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
        //    try
        //    {

        //        using (SqlCommand cmd3 = new SqlCommand() { Connection = conn, CommandType = CommandType.StoredProcedure })
        //        {
        //            //cmd3.Transaction = trans1;
        //            cmd3.Parameters.Clear();
        //            cmd3.CommandText = "dbo.updateChosenBattery";
        //            cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
        //            cmd3.Parameters.AddWithValue("@nChosenBattery", nChosenBattery);



        //            //SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
        //            //retval.Direction = ParameterDirection.Output;
        //            conn.Open();
        //            cmd3.ExecuteNonQuery();
        //            //TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
        //        }




        //    }


        //    catch (Exception ex)
        //    {
        //        //utilities.errorLog(System.Reflection.MethodInfo.GetCurrentMethod().Name, ex);
        //        System.ArgumentException argEx = new System.ArgumentException("New Line", "", ex);
        //        throw argEx;
        //    }
        //    finally
        //    {
        //        if (conn.State == ConnectionState.Open) conn.Close();


        //        Net_Zero.SummaryDataSet summaryDataSet = ((Net_Zero.SummaryDataSet)(this.FindResource("summaryDataSet")));

        //        Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter summaryDataSetgetProjectTableAdapter = new Net_Zero.SummaryDataSetTableAdapters.getProjectTableAdapter();
        //        summaryDataSetgetProjectTableAdapter.Fill(summaryDataSet.getProject, nCurrentProjectID);
        //        System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));
        //        getProjectViewSource.View.MoveCurrentToFirst();
        //        TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
        //        TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);
        //    }

        //}
        public void SaveDemand()
        {


            System.Windows.Data.CollectionViewSource demandItemsViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("demandItemsViewSource")));

            //System.Windows.Data.CollectionViewSource getBatterySeriesStringgetBatteryViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatterySeriesStringgetBatteryViewSource")));





            int nProjectsID = Settings.Default.nCurrentProjectID;
            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));
            int TransactID1 = 0;
            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));

            Net_Zero.DemandDataSet demandDataSet = ((Net_Zero.DemandDataSet)(this.FindResource("demandDataSet")));

            //DataRowView drv = (DataRowView)getBatterySeriesStringViewSource.View.CurrentItem;
            // int seriesCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);

            //int lineCurrent = 0;
            int wasnull = 0;
            wasnull = (demandItemsViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: demandItemsViewSource is null";
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
                DataRowView drv = (DataRowView)demandItemsViewSource.View.CurrentItem;
                int seriesCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);
            }






            if (demandItemsViewSource.View != null)

            {
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
                demandItemsViewSource.View.MoveCurrentToFirst();

                //getBatterySeriesStringViewSource.View.MoveCurrentToFirst();

                for (int i = 0; i - 1 < i++; i++)
                {
                    DataRowView drv3 = (DataRowView)demandItemsViewSource.View.CurrentItem;
                    int nID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nID"]) == true ? 0 : (int)drv3["nID"]);
                    //MessageBox.Show(ID.ToString());

                    if (nID == 0)
                    {
                        break;
                    }
                   
                    //MessageBox.Show(ID.ToString());


                    //decimal nPrice = (drv3 == null ? 0m : DBNull.Value.Equals(drv3["nPrice"]) == true ? 0m : (decimal)drv3["nPrice"]);
                    // MessageBox.Show(nAmnt.ToString());

                    //int nProjectsID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nProjectsID"]) == true ? 0 : (int)drv3["nProjectsID"]);
                    int nQty = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nQty"]) == true ? 0 : (int)drv3["nQty"]);
                    //string cName = (DBNull.Value.Equals(drv3["cName"]) == true ? "" : (string)drv3["cName"]);
                    string cNote = (DBNull.Value.Equals(drv3["cNote"]) == true ? "" : (string)drv3["cNote"]);
                    string cDesc = (DBNull.Value.Equals(drv3["cDesc"]) == true ? "" : (string)drv3["cDesc"]);

                    Boolean bDeleted = (drv3 == null ? false : DBNull.Value.Equals(drv3["bDeleted"]) == true ? false : (bool)drv3["bDeleted"]);
                    decimal nPowerW = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nPowerW"]) == true ? 0 : (decimal)drv3["nPowerW"]);
                    decimal nHours = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nHours"]) == true ? 0 : (decimal)drv3["nHours"]);
                    decimal nOnOffFactor = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nOnOffFactor"]) == true ? 0 : (decimal)drv3["nOnOffFactor"]);


                    /////write new record to dbo.split

                    //SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.coolblueconnectionString };
                    try
                    {

                        using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                        {
                            //cmd3.Transaction = trans1;
                            cmd3.Parameters.Clear();
                            cmd3.CommandText = "[dbo].[USP_updateDemand]";
                            cmd3.Parameters.AddWithValue("@nID", nID);
                            cmd3.Parameters.AddWithValue("@cDesc", cDesc);
                            cmd3.Parameters.AddWithValue("@nQty", nQty);
                            cmd3.Parameters.AddWithValue("@nHours", nHours);
                            cmd3.Parameters.AddWithValue("@nPowerW", nPowerW);


                            cmd3.Parameters.AddWithValue("@cNote", cNote);
                            cmd3.Parameters.AddWithValue("@nOnOffFactor", nOnOffFactor);
                            cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                            cmd3.Parameters.AddWithValue("@bDeleted", bDeleted);



                            // SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
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


                        //LocateNewLine(TransactID1);
                    }




                    demandItemsViewSource.View.MoveCurrentToNext();
                }


            }


        }


       public void saveBatteryConfiguration()
        {
            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));
            int nProjectsID = Settings.Default.nCurrentProjectID;

            SaveBattery(false);




            // registerDataSet.EnforceConstraints = false;

            Net_Zero.BatteryTableAdapters.getBatteryTableAdapter getBatteryTableAdapter = new Net_Zero.BatteryTableAdapters.getBatteryTableAdapter();
            getBatteryTableAdapter.Fill(battery.getBattery, nProjectsID);
            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            decimal nSumCapacity = (battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null) == null ? 0m :
                      DBNull.Value.Equals(battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null)) == true ? 0m : (decimal)battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null));
            decimal nSumPVkW = (pVDataSet.getPV.Compute("Sum(nTotPmax)", null) == null ? 0m :
                       DBNull.Value.Equals(pVDataSet.getPV.Compute("Sum(nTotPmax)", null)) == true ? 0m : (decimal)pVDataSet.getPV.Compute("Sum(nTotPmax)/1000", null));

            SpinEditnCapacityAchieved.EditValue = nSumCapacity;
            SpinEditnCapacityAchievedPVkW.EditValue = nSumPVkW;



            LinearGauge1.Scales[0].StartValue = 0;
            LinearGauge1.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumCapacity);
            LinearGauge1.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenBatteryCapacity.EditValue);

            LinearGaugePV.Scales[0].StartValue = 0;
            LinearGaugePV.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumPVkW);
            LinearGaugePV.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenPVkW.EditValue);

            //string message20 = "Update complete";
            //string caption20 = "Net-Zero";
            //MessageBoxButton buttons20 = MessageBoxButton.OK;
            //MessageBoxImage icon20 = MessageBoxImage.Information;
            //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
            //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
            //// Show message box
            //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            //// Displays the MessageBox.
            //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);
        }

        private void SimpleButtonSaveString_Click(object sender, RoutedEventArgs e)
        {
            

        }

        private void SimpleButtonNewPV_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));
            int TransactID1 = 0;
            System.Windows.Data.CollectionViewSource getPVViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVViewSource")));


            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
            //Net_Zero.MastersTableAdapters.getPVMasterTableAdapter mastersgetPVMasterTableAdapter = new Net_Zero.MastersTableAdapters.getPVMasterTableAdapter();


            

            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVMasterViewSource")));

            string cModel = "Model";
            string cBrand = "Brand";
           decimal nPmax = 0m;
            decimal nVmp = 0m;
            decimal nImp = 0m;
            decimal nVoc = 0m;
            decimal nIsc = 0m;
            decimal nWeight_kg = 0m;
            decimal nLength_mm = 0m;
            decimal nHeight_mm = 0m;
            decimal nWidth_mm = 0m;
            string cFrame = "";
            string cVendor = "";
            decimal nPrice = 0m;
            decimal nTilt_deg = 0m;
            decimal nOrientation_deg = 0m;
            string cURL = "";
            int nQty = 1;





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

               
            }

            

            if (getPVViewSource.View != null)

            {

                if (CheckEditAddBlankPV.EditValue is false)

                {


                    DataRowView drv1 = (DataRowView)getPVMasterViewSource.View.CurrentItem;

                    cModel = (DBNull.Value.Equals(drv1["cModel"]) == true ? "" : (string)drv1["cModel"]);
                    cBrand = (DBNull.Value.Equals(drv1["cBrand"]) == true ? "" : (string)drv1["cBrand"]);
                    cVendor = (DBNull.Value.Equals(drv1["cVendor"]) == true ? "" : (string)drv1["cVendor"]);
                    cFrame = (DBNull.Value.Equals(drv1["cFrame"]) == true ? "" : (string)drv1["cFrame"]);
                    cURL = (DBNull.Value.Equals(drv1["cURL"]) == true ? "" : (string)drv1["cURL"]);
                    nPmax = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nPmax"]) == true ? 0 : (decimal)drv1["nPmax"]);
                    nVmp = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nVmp"]) == true ? 0 : (decimal)drv1["nVmp"]);
                    nImp = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nImp"]) == true ? 0 : (decimal)drv1["nImp"]);
                    nVoc = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nVoc"]) == true ? 0 : (decimal)drv1["nVoc"]);
                    nIsc = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nIsc"]) == true ? 0 : (decimal)drv1["nIsc"]);
                    nWeight_kg = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nWeight_kg"]) == true ? 0 : (decimal)drv1["nWeight_kg"]);
                    nLength_mm = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nLength_mm"]) == true ? 0 : (decimal)drv1["nLength_mm"]);
                    nHeight_mm = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nHeight_mm"]) == true ? 0 : (decimal)drv1["nHeight_mm"]);
                    nWidth_mm = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nWidth_mm"]) == true ? 0 : (decimal)drv1["nWidth_mm"]);
                    nPrice = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nPrice"]) == true ? 0 : (decimal)drv1["nPrice"]);
                   // nTilt_deg = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nTilt_deg"]) == true ? 0 : (decimal)drv1["nTilt_deg"]);

                   // nOrientation_deg = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nOrientation_deg"]) == true ? 0 : (decimal)drv1["nOrientation_deg"]);

                    

                   // nQty = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["nQty"]) == true ? 0 : (int)drv1["ID"]);
                }

                
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
                //getPVViewSource.View.MoveCurrentToFirst();
 
                    try
                    {

                        using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                        {
                            //cmd3.Transaction = trans1;
                            cmd3.Parameters.Clear();
                            cmd3.CommandText = "dbo.USP_insertPV";
                            cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
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
                            cmd3.Parameters.AddWithValue("@nTilt_deg", nTilt_deg);
                            cmd3.Parameters.AddWithValue("@nOrientation_deg", nOrientation_deg);
                            cmd3.Parameters.AddWithValue("@cURL", cURL);
                            cmd3.Parameters.AddWithValue("@nQty", nQty);



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

                    Net_Zero.PVDataSetTableAdapters.getPVTableAdapter pVDataSetgetPVTableAdapter = new Net_Zero.PVDataSetTableAdapters.getPVTableAdapter();
                    pVDataSetgetPVTableAdapter.Fill(pVDataSet.getPV, nProjectsID);
                }


                


                    //getPVViewSource.View.MoveCurrentToNext();
                
            }
        }

        private void SimpleButtonNewDemand_Click(object sender, RoutedEventArgs e)
        {
            int nProjectsID = Settings.Default.nCurrentProjectID;
            Net_Zero.DemandDataSet demandDataSet = ((Net_Zero.DemandDataSet)(this.FindResource("demandDataSet")));
            int TransactID1 = 0;
            System.Windows.Data.CollectionViewSource demandItemsViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("demandItemsViewSource")));



            DataRowView drv = (DataRowView)demandItemsViewSource.View.CurrentItem;
            //int accountCurrent = (drv == null ? 0 : DBNull.Value.Equals(drv["ID"]) == true ? 0 : (int)drv["ID"]);

            //int lineCurrent = 0;
            int wasnull = 0;
            wasnull = (demandItemsViewSource.View == null ? 1 : 0);
            if (wasnull == 1)
            {

                // MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                string message = "Warning: demandItemsViewSource is null";
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
                DataRowView drv1 = (DataRowView)demandItemsViewSource.View.CurrentItem;
                //lineCurrent = (drv1 == null ? 0 : DBNull.Value.Equals(drv1["ID"]) == true ? 0 : (int)drv1["ID"]);
            }



            if (demandItemsViewSource.View != null)

            {
                SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
                //getPVViewSource.View.MoveCurrentToFirst();

                try
                {

                    using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                    {
                        //cmd3.Transaction = trans1;
                        cmd3.Parameters.Clear();
                        cmd3.CommandText = "dbo.USP_insertDemandItem";
                        cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                        cmd3.Parameters.AddWithValue("@cDesc", "Description");
                        cmd3.Parameters.AddWithValue("@nQty" ,1);
                        cmd3.Parameters.AddWithValue("@nHours", 24);
                        cmd3.Parameters.AddWithValue("@nPowerW", 0);
                        cmd3.Parameters.AddWithValue("@cNote", "Note");
                        cmd3.Parameters.AddWithValue("@nOnOffFactor", 1);
                        



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

                    Net_Zero.DemandDataSetTableAdapters.demandItemsTableAdapter demandDataSetdemandItemsTableAdapter = new Net_Zero.DemandDataSetTableAdapters.demandItemsTableAdapter();
                    demandDataSetdemandItemsTableAdapter.Fill(demandDataSet.demandItems, nProjectsID);

                }





                //getPVViewSource.View.MoveCurrentToNext();

            }
        }

       public void saveDemand()
        {
            Net_Zero.DemandDataSet demandDataSet = ((Net_Zero.DemandDataSet)(this.FindResource("demandDataSet")));
            int nProjectsID = Settings.Default.nCurrentProjectID;

            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));


            SaveDemand();
            SaveChosenDemand();



            // registerDataSet.EnforceConstraints = false;


            Net_Zero.DemandDataSetTableAdapters.demandItemsTableAdapter demandDataSetdemandItemsTableAdapter = new Net_Zero.DemandDataSetTableAdapters.demandItemsTableAdapter();
            demandDataSetdemandItemsTableAdapter.Fill(demandDataSet.demandItems, nProjectsID);

            Net_Zero.BatteryTableAdapters.getBatteryTableAdapter getBatteryTableAdapter = new Net_Zero.BatteryTableAdapters.getBatteryTableAdapter();
            getBatteryTableAdapter.Fill(battery.getBattery, nProjectsID);
            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            decimal nSumPDemand= (demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null) == null ? 0m :
                       DBNull.Value.Equals(demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null)) == true ? 0m : (decimal)demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null));

            SpinEditComputedDemandTotal.EditValue = nSumPDemand;

            decimal nSumCapacity = (battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null) == null ? 0m :
                      DBNull.Value.Equals(battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null)) == true ? 0m : (decimal)battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null));
            decimal nSumPVkW = (pVDataSet.getPV.Compute("Sum(nTotPmax)", null) == null ? 0m :
                       DBNull.Value.Equals(pVDataSet.getPV.Compute("Sum(nTotPmax)", null)) == true ? 0m : (decimal)pVDataSet.getPV.Compute("Sum(nTotPmax)/1000", null));

            SpinEditnCapacityAchieved.EditValue = nSumCapacity;
            SpinEditnCapacityAchievedPVkW.EditValue = nSumPVkW;



            LinearGauge1.Scales[0].StartValue = 0;
            LinearGauge1.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumCapacity);
            LinearGauge1.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenBatteryCapacity.EditValue);

            LinearGaugePV.Scales[0].StartValue = 0;
            LinearGaugePV.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumPVkW);
            LinearGaugePV.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenPVkW.EditValue);

            //string message20 = "Update complete";
            //string caption20 = "Net-Zero";
            //MessageBoxButton buttons20 = MessageBoxButton.OK;
            //MessageBoxImage icon20 = MessageBoxImage.Information;
            //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
            //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
            //// Show message box
            //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            //// Displays the MessageBox.
            //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);
        }

        private void SimpleButton_Click_3(object sender, RoutedEventArgs e)
        {
            SpinEditChosenDemandTotal.EditValue = SpinEditComputedDemandTotal.EditValue;
        }

        private void BarButtonItemPVMasterList_ItemClick(object sender, DevExpress.Xpf.Bars.ItemClickEventArgs e)
        {
            PVMasterList PVMasterList1 = new PVMasterList();


            PVMasterList1.ShowDialog();
            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
            Net_Zero.MastersTableAdapters.getPVMasterTableAdapter mastersgetPVMasterTableAdapter = new Net_Zero.MastersTableAdapters.getPVMasterTableAdapter();
            mastersgetPVMasterTableAdapter.Fill(masters.getPVMaster);
            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVMasterViewSource")));
            getPVMasterViewSource.View.MoveCurrentToFirst();
           
        }

        private void BarButtonItemBatteryMasterList_ItemClick(object sender, DevExpress.Xpf.Bars.ItemClickEventArgs e)
        {
            BatteryMasterList BatteryMasterList1 = new BatteryMasterList();


            BatteryMasterList1.ShowDialog();
            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
          
            Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter mastersgetBatteryMasterTableAdapter = new Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter();
            mastersgetBatteryMasterTableAdapter.Fill(masters.getBatteryMaster);
            System.Windows.Data.CollectionViewSource getBatteryMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryMasterViewSource")));
            getBatteryMasterViewSource.View.MoveCurrentToFirst();
        }

        private void SimpleButton_Click_4(object sender, RoutedEventArgs e)
        {

        }

        private void TableView_RowUpdated(object sender, DevExpress.Xpf.Grid.RowEventArgs e)
        {
            Net_Zero.DemandDataSet demandDataSet = ((Net_Zero.DemandDataSet)(this.FindResource("demandDataSet")));


            decimal nSumPDemand = (demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null) == null ? 0m :
                       DBNull.Value.Equals(demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null)) == true ? 0m : (decimal)demandDataSet.demandItems.Compute("Sum(nEnergykWh)", null));

            SpinEditComputedDemandTotal.EditValue = nSumPDemand;


            
        }

        private void SimpleButtonAutoConfigurePV_Click(object sender, RoutedEventArgs e)
        {
            string message = "Warning: This will delete all PVs currently in project list above and replace with automatically configured list. Do you want to proceed?";
            string caption = "Net-Zero";

            MessageBoxButton buttons = MessageBoxButton.YesNo;
            MessageBoxImage icon = MessageBoxImage.Warning;
            MessageBoxResult defaultResult = MessageBoxResult.No;
            MessageBoxOptions options = MessageBoxOptions.None;
            // Show message box
            // MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            // Displays the MessageBox.
            MessageBoxResult result1 = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            if (result1 == MessageBoxResult.No)
            {

                return;

            }


            int nProjectsID = Settings.Default.nCurrentProjectID;

            SavePV(true);

            SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
            {
                //cmd3.Transaction = trans1;
                cmd3.Parameters.Clear();
                cmd3.CommandText = "[dbo].[USP_autoPV]";
                cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
               




               // SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                //retval.Direction = ParameterDirection.Output;
                conn1.Open();
                cmd3.ExecuteNonQuery();
               // TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
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

            


            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));



            // registerDataSet.EnforceConstraints = false;

            Net_Zero.PVDataSetTableAdapters.getPVTableAdapter pVDataSetgetPVTableAdapter = new Net_Zero.PVDataSetTableAdapters.getPVTableAdapter();
            pVDataSetgetPVTableAdapter.Fill(pVDataSet.getPV, nProjectsID);
            //registerDataSet.EnforceConstraints = true;

            Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter batterygetBatterySeriesStringTableAdapter = new Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter();
            batterygetBatterySeriesStringTableAdapter.Fill(battery.getBatterySeriesString, nProjectsID);


            //Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            decimal nSumCapacity = (battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null) == null ? 0m :
                      DBNull.Value.Equals(battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null)) == true ? 0m : (decimal)battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null));
            decimal nSumPVkW = (pVDataSet.getPV.Compute("Sum(nTotPmax)", null) == null ? 0m :
                       DBNull.Value.Equals(pVDataSet.getPV.Compute("Sum(nTotPmax)", null)) == true ? 0m : (decimal)pVDataSet.getPV.Compute("Sum(nTotPmax)/1000", null));

            SpinEditnCapacityAchieved.EditValue = nSumCapacity;
            SpinEditnCapacityAchievedPVkW.EditValue = nSumPVkW;



            LinearGauge1.Scales[0].StartValue = 0;
            LinearGauge1.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumCapacity);
            LinearGauge1.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenBatteryCapacity.EditValue);

            LinearGaugePV.Scales[0].StartValue = 0;
            LinearGaugePV.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumPVkW);
            LinearGaugePV.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenPVkW.EditValue);

            string message20 = "Auto-configure complete";
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

        private void SimpleButtonAutoConfigureBattery_Click(object sender, RoutedEventArgs e)
        {
            string message = "Warning: This will delete all batteries currently in project list above and replace with automatically configured list. Do you want to proceed?";
            string caption = "Net-Zero";

            MessageBoxButton buttons = MessageBoxButton.YesNo;
            MessageBoxImage icon = MessageBoxImage.Warning;
            MessageBoxResult defaultResult = MessageBoxResult.No;
            MessageBoxOptions options = MessageBoxOptions.None;
            // Show message box
            // MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            // Displays the MessageBox.
            MessageBoxResult result1 = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            if (result1 == MessageBoxResult.No)
            {

                return;

            }


            int nProjectsID = Settings.Default.nCurrentProjectID;

            SaveBattery(true);
            SaveString(true);

            SqlConnection conn1 = new SqlConnection() { ConnectionString = ProgramSettings.net_zeroconnectionString };
            try
            {

                using (SqlCommand cmd3 = new SqlCommand() { Connection = conn1, CommandType = CommandType.StoredProcedure })
                {
                    //cmd3.Transaction = trans1;
                    cmd3.Parameters.Clear();
                    cmd3.CommandText = "[dbo].[USP_autoBattery]";
                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);





                    // SqlParameter retval = cmd3.Parameters.Add("@transactIdentity", SqlDbType.Int);
                    //retval.Direction = ParameterDirection.Output;
                    conn1.Open();
                    cmd3.ExecuteNonQuery();
                    // TransactID1 = (int)cmd3.Parameters["@transactIdentity"].Value;
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




            Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            Net_Zero.Battery battery = ((Net_Zero.Battery)(this.FindResource("battery")));



            // registerDataSet.EnforceConstraints = false;

            //Net_Zero.PVDataSetTableAdapters.getPVTableAdapter pVDataSetgetPVTableAdapter = new Net_Zero.PVDataSetTableAdapters.getPVTableAdapter();
           // pVDataSetgetPVTableAdapter.Fill(pVDataSet.getPV, nProjectsID);
            //registerDataSet.EnforceConstraints = true;

            Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter batterygetBatterySeriesStringTableAdapter = new Net_Zero.BatteryTableAdapters.getBatterySeriesStringTableAdapter();
            batterygetBatterySeriesStringTableAdapter.Fill(battery.getBatterySeriesString, nProjectsID);
            Net_Zero.BatteryTableAdapters.getBatteryTableAdapter getBatteryTableAdapter = new Net_Zero.BatteryTableAdapters.getBatteryTableAdapter();
            getBatteryTableAdapter.Fill(battery.getBattery, nProjectsID);
           // Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

           // decimal nSumCapacity = (battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null) == null ? 0m :
                      //DBNull.Value.Equals(battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null)) == true ? 0m : (decimal)battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null));
            //decimal nSumPVkW = (pVDataSet.getPV.Compute("Sum(nTotPmax)", null) == null ? 0m :
                      // DBNull.Value.Equals(pVDataSet.getPV.Compute("Sum(nTotPmax)", null)) == true ? 0m : (decimal)pVDataSet.getPV.Compute("Sum(nTotPmax)/1000", null));

            //SpinEditnCapacityAchieved.EditValue = nSumCapacity;
            //SpinEditnCapacityAchievedPVkW.EditValue = nSumPVkW;



            //Net_Zero.PVDataSet pVDataSet = ((Net_Zero.PVDataSet)(this.FindResource("pVDataSet")));

            decimal nSumCapacity = (battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null) == null ? 0m :
                      DBNull.Value.Equals(battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null)) == true ? 0m : (decimal)battery.getBatterySeriesString.Compute("Sum(nTotCapacity)", null));
            decimal nSumPVkW = (pVDataSet.getPV.Compute("Sum(nTotPmax)", null) == null ? 0m :
                       DBNull.Value.Equals(pVDataSet.getPV.Compute("Sum(nTotPmax)", null)) == true ? 0m : (decimal)pVDataSet.getPV.Compute("Sum(nTotPmax)/1000", null));

            SpinEditnCapacityAchieved.EditValue = nSumCapacity;
            //SpinEditnCapacityAchievedPVkW.EditValue = nSumPVkW;



            LinearGauge1.Scales[0].StartValue = 0;
            LinearGauge1.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumCapacity);
            LinearGauge1.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenBatteryCapacity.EditValue);

            LinearGaugePV.Scales[0].StartValue = 0;
            LinearGaugePV.Scales[0].LevelBars[0].Value = Convert.ToDouble(nSumPVkW);
            LinearGaugePV.Scales[0].EndValue = Convert.ToDouble(SpinEditnChosenPVkW.EditValue);

            string message20 = "Auto-configure battery complete";
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

        public void saveDemandLocation()
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

                //// MessageBox.Show("Warning: uSP_getLineViewSource is null", "CoolBlue");
                //string message = "Warning:getAllCountriesgetAllStateProvincegetAllCitygetAllInsolationViewSource is null";
                //string caption = "CoolBlue";

                //MessageBoxButton buttons = MessageBoxButton.OK;
                //MessageBoxImage icon = MessageBoxImage.Information;
                //MessageBoxResult defaultResult = MessageBoxResult.OK;
                //MessageBoxOptions options = MessageBoxOptions.RtlReading;
                //// Show message box
                //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                //// Displays the MessageBox.
                //MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                //if (result == MessageBoxResult.OK)
                //{

                //    // Closes the parent form.

                //    //this.Close();

                //}
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
                    cmd3.CommandText = "dbo.updateCityDemand";
                    cmd3.Parameters.AddWithValue("@nProjectsID", nProjectsID);
                    cmd3.Parameters.AddWithValue("@nCityID", nCityID);
                   // cmd3.Parameters.AddWithValue("@nInsolation", nInsolation);
                  


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
                //TextEditnPVRequired.EditValue = Math.Round((Decimal)TextEditnPVRequired.EditValue, 2);
                //TextEditnDemandTotal.EditValue = Math.Round((Decimal)TextEditnDemandTotal.EditValue, 2);

                //string message20 = "Demand location saved";
                //string caption20 = "Net-Zero";
                //MessageBoxButton buttons20 = MessageBoxButton.OK;
                //MessageBoxImage icon20 = MessageBoxImage.Information;
                //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
                //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
                //// Show message box
                //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

                //// Displays the MessageBox.
                //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);
            }
        }

        private void DXTabItem_GotFocus(object sender, RoutedEventArgs e)
        {


            // Net_Zero.Geography geography = ((Net_Zero.Geography)(this.FindResource("geography")));
            //  Net_Zero.GeographyTableAdapters.getAllCountriesTableAdapter geographygetAllCountriesTableAdapter = new Net_Zero.GeographyTableAdapters.getAllCountriesTableAdapter();
            // geographygetAllCountriesTableAdapter.Fill(geography.getAllCountries);
            //System.Windows.Data.CollectionViewSource getAllCountriesViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllCountriesViewSource")));

            System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));

            DataRowView drv3 = (DataRowView)getProjectViewSource.View.CurrentItem;
            int nCountryID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nCountryID"]) == true ? 0 : (int)drv3["nCountryID"]);
            LocateNewLineCountry(nCountryID);
            int nStateProvinceID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nStateProvinceID"]) == true ? 0 : (int)drv3["nStateProvinceID"]);
            LocateNewLineStateProvince(nStateProvinceID);
            int nCityID = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nCityID"]) == true ? 0 : (int)drv3["nCityID"]);
            LocateNewLineCity(nCityID);


            //getAllCountriesViewSource.View.MoveCurrentToPosition(40);


            //Net_Zero.GeographyTableAdapters.getAllStateProvinceTableAdapter geographygetAllStateProvinceTableAdapter = new Net_Zero.GeographyTableAdapters.getAllStateProvinceTableAdapter();
            //geographygetAllStateProvinceTableAdapter.Fill(geography.getAllStateProvince);
            //System.Windows.Data.CollectionViewSource getAllCountriesgetAllStateProvinceViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllCountriesgetAllStateProvinceViewSource")));
            //getAllCountriesgetAllStateProvinceViewSource.View.MoveCurrentToFirst();


            //Net_Zero.GeographyTableAdapters.getAllCityTableAdapter geographygetAllCityTableAdapter = new Net_Zero.GeographyTableAdapters.getAllCityTableAdapter();
            //geographygetAllCityTableAdapter.Fill(geography.getAllCity);
            //System.Windows.Data.CollectionViewSource getAllCountriesgetAllStateProvincegetAllCityViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllCountriesgetAllStateProvincegetAllCityViewSource")));
            //getAllCountriesgetAllStateProvincegetAllCityViewSource.View.MoveCurrentToFirst();

            //Net_Zero.GeographyTableAdapters.getAllInsolationTableAdapter geographygetAllInsolationTableAdapter = new Net_Zero.GeographyTableAdapters.getAllInsolationTableAdapter();
            //geographygetAllInsolationTableAdapter.Fill(geography.getAllInsolation);


            //string message20 = "PV location";
            //string caption20 = "Net-Zero";
            //MessageBoxButton buttons20 = MessageBoxButton.OK;
            //MessageBoxImage icon20 = MessageBoxImage.Information;
            //MessageBoxResult defaultResult20 = MessageBoxResult.OK;
            //MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
            //// Show message box
            //// MessageBoxResult result = MessageBox.Show(message, caption, buttons, icon, defaultResult, options);

            //// Displays the MessageBox.
            //MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);
        }
        public void LocateNewLineCountry(int IDToFind)
        {
            //int IDToFind = Convert.ToInt32(txt_IdUnique.Text);

            if (IDToFind > 0)
            {
                foreach (DataRowView drv in (BindingListCollectionView) TreeListControlCountry.ItemsSource)
                    if ((int)drv["nID"] == IDToFind)
                    {
                        // This is the data row view record you want...
                        TreeListControlCountry.SelectedItem = drv;
                        TreeListControlCountry.CurrentItem = drv;
                        break;
                    }
            }
        }
        public void LocateNewLineStateProvince(int IDToFind)
        {
            //int IDToFind = Convert.ToInt32(txt_IdUnique.Text);

            if (IDToFind > 0)
            {
                foreach (DataRowView drv in (BindingListCollectionView)TreeListControlStateProvince.ItemsSource)
                    if ((int)drv["nID"] == IDToFind)
                    {
                        // This is the data row view record you want...
                        TreeListControlStateProvince.SelectedItem = drv;
                        TreeListControlStateProvince.CurrentItem = drv;
                        break;
                    }
            }
        }
        public void LocateNewLineCity(int IDToFind)
        {
            //int IDToFind = Convert.ToInt32(txt_IdUnique.Text);

            if (IDToFind > 0)
            {
                foreach (DataRowView drv in (BindingListCollectionView)TreeListControlCity.ItemsSource)
                    if ((int)drv["nID"] == IDToFind)
                    {
                        // This is the data row view record you want...
                        TreeListControlCity.SelectedItem = drv;
                        TreeListControlCity.CurrentItem = drv;
                        break;
                    }
            }
        }

        private void DXTabItemDemandLocation_GotFocus(object sender, RoutedEventArgs e)
        {
            System.Windows.Data.CollectionViewSource getProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getProjectViewSource")));

            DataRowView drv3 = (DataRowView)getProjectViewSource.View.CurrentItem;
            int nCountryIDDemand = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nCountryIDDemand"]) == true ? 0 : (int)drv3["nCountryIDDemand"]);
            LocateNewLineCountryDemand(nCountryIDDemand);
            int nStateProvinceIDDemand = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nStateProvinceIDDemand"]) == true ? 0 : (int)drv3["nStateProvinceIDDemand"]);
            LocateNewLineStateProvinceDemand(nStateProvinceIDDemand);
            int nCityIDDemand = (drv3 == null ? 0 : DBNull.Value.Equals(drv3["nCityIDDemand"]) == true ? 0 : (int)drv3["nCityIDDemand"]);
            LocateNewLineCityDemand(nCityIDDemand);
        }
        public void LocateNewLineCountryDemand(int IDToFind)
        {
            //int IDToFind = Convert.ToInt32(txt_IdUnique.Text);

            if (IDToFind > -1)
            {
                foreach (DataRowView drv in (BindingListCollectionView)TreeListControlCountryDemand.ItemsSource)
                    if ((int)drv["nID"] == IDToFind)
                    {
                        // This is the data row view record you want...
                        TreeListControlCountryDemand.SelectedItem = drv;
                        TreeListControlCountryDemand.CurrentItem = drv;
                        break;
                    }
            }
        }
        public void LocateNewLineStateProvinceDemand(int IDToFind)
        {
            //int IDToFind = Convert.ToInt32(txt_IdUnique.Text);

            if (IDToFind > -1)
            {
                foreach (DataRowView drv in (BindingListCollectionView)TreeListControlStateProvinceDemand.ItemsSource)
                    if ((int)drv["nID"] == IDToFind)
                    {
                        // This is the data row view record you want...
                        TreeListControlStateProvinceDemand.SelectedItem = drv;
                        TreeListControlStateProvinceDemand.CurrentItem = drv;
                        break;
                    }
            }
        }
        public void LocateNewLineCityDemand(int IDToFind)
        {
            //int IDToFind = Convert.ToInt32(txt_IdUnique.Text);

            if (IDToFind > -1)
            {
                foreach (DataRowView drv in (BindingListCollectionView)TreeListControlCityDemand.ItemsSource)
                    if ((int)drv["nID"] == IDToFind)
                    {
                        // This is the data row view record you want...
                        TreeListControlCityDemand.SelectedItem = drv;
                        TreeListControlCityDemand.CurrentItem = drv;
                        break;
                    }
            }
        }

        private void bnExit_ItemClick(object sender, DevExpress.Xpf.Bars.ItemClickEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }

        private void btnClose_ItemClick(object sender, DevExpress.Xpf.Bars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void btnSave_ItemClick(object sender, DevExpress.Xpf.Bars.ItemClickEventArgs e)
        {

            string message20 = "";
            string caption20 = "Net-Zero";
            MessageBoxButton buttons20 = MessageBoxButton.OK;
            MessageBoxImage icon20 = MessageBoxImage.Information;
            MessageBoxResult defaultResult20 = MessageBoxResult.OK;
            MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
                
            switch (DXTabControlMain.SelectedContainer.Header.ToString())
                {

                case "Project Details":
                    saveProjectDetails();



                   message20 = "Project Details saved.";

                  

                   
                    break;
                case "PV Location":
                    savePVLocation();

                    message20 = "PV location information saved.";

                    break;

                case "Demand Location":
                    saveDemandLocation();

                    message20 = "Demand location information saved.";

                    break;

                case "Demand":
                    saveDemand();

                    message20 = "Demand information saved.";

                    break;

                case "PV Computation":
                    savePVComputation();

                    message20 = "PV computation information saved.";

                    break;

                case "Battery Computation":
                    saveBatteryComputation();

                    message20 = "Battery computation information saved.";

                    break;

                case "PV Configuration":
                    savePVConfiguration();

                    message20 = "PV configuration saved.";

                    break;

                case "Battery Configuration":
                    saveBatterySeriesConfiguration();
                    saveBatteryConfiguration();

                    message20 = "Battery configuration saved.";

                    break;


                default:
                    message20 = "No data to sace on this tab.";
                    break;
            }
            MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);
        }

        private void btnSaveProject_ItemClick(object sender, DevExpress.Xpf.Bars.ItemClickEventArgs e)
        {

            saveAll();

            string message20 = "Project saved.";
            string caption20 = "Net-Zero";
            MessageBoxButton buttons20 = MessageBoxButton.OK;
            MessageBoxImage icon20 = MessageBoxImage.Information;
            MessageBoxResult defaultResult20 = MessageBoxResult.OK;
            MessageBoxOptions options20 = MessageBoxOptions.RtlReading;
            MessageBoxResult result = MessageBox.Show(message20, caption20, buttons20, icon20, defaultResult20, options20);


        }
        public void saveAll()
        {
            saveProjectDetails();
            savePVLocation();
            saveDemandLocation();
            saveDemand();
            savePVComputation();
            saveBatteryComputation();
            savePVConfiguration();
            saveBatterySeriesConfiguration();
            saveBatteryConfiguration();
        }
    }
}
