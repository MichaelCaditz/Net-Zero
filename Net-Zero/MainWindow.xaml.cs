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
            summaryDataSetgetSummaryTableAdapter.Fill(summaryDataSet.getSummary,1001);


            System.Windows.Data.CollectionViewSource getSummaryViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getSummaryViewSource")));
            getSummaryViewSource.View.MoveCurrentToFirst();



     
           


        }
    }
}
