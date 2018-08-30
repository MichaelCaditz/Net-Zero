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

            Net_Zero.Masters masters = ((Net_Zero.Masters)(this.FindResource("masters")));
            // TODO: Add code here to load data into the table getPVMaster.
            // This code could not be generated, because the mastersgetPVMasterTableAdapter.Fill method is missing, or has unrecognized parameters.
            Net_Zero.MastersTableAdapters.getPVMasterTableAdapter mastersgetPVMasterTableAdapter = new Net_Zero.MastersTableAdapters.getPVMasterTableAdapter();
            System.Windows.Data.CollectionViewSource getPVMasterViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getPVMasterViewSource")));
            getPVMasterViewSource.View.MoveCurrentToFirst();
        }
    }
}
