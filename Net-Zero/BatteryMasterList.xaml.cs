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
            // TODO: Add code here to load data into the table getBatteryMaster.
            // This code could not be generated, because the mastersgetBatteryMasterTableAdapter.Fill method is missing, or has unrecognized parameters.
            Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter mastersgetBatteryMasterTableAdapter = new Net_Zero.MastersTableAdapters.getBatteryMasterTableAdapter();
            System.Windows.Data.CollectionViewSource getBatteryMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getBatteryMasterViewSource")));
            getBatteryMasterViewSource.View.MoveCurrentToFirst();
        }
    }
}
