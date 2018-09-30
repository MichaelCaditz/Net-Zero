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
    /// Interaction logic for ProjectList.xaml
    /// </summary>
    public partial class ProjectList : ThemedWindow
    {

        public int nProjectID { get; set; }
        public ProjectList()
        {
            InitializeComponent();


        }

        private void ThemedWindow_Loaded(object sender, RoutedEventArgs e)
        {



            Net_Zero.AllProjectsDataSet allProjectsDataSet = ((Net_Zero.AllProjectsDataSet)(this.FindResource("allProjectsDataSet")));
            // TODO: Add code here to load data into the table getAllProject.
            // This code could not be generated, because the allProjectsDataSetgetAllProjectTableAdapter.Fill method is missing, or has unrecognized parameters.


            Net_Zero.AllProjectsDataSetTableAdapters.getAllProjectTableAdapter allProjectsDataSetgetAllProjectTableAdapter = new Net_Zero.AllProjectsDataSetTableAdapters.getAllProjectTableAdapter();
            allProjectsDataSetgetAllProjectTableAdapter.Fill(allProjectsDataSet.getAllProject);



            System.Windows.Data.CollectionViewSource getAllProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllProjectViewSource")));
            getAllProjectViewSource.View.MoveCurrentToFirst();
        }

        private void SimpleButtonOpen_Click(object sender, RoutedEventArgs e)
        {

            System.Windows.Data.CollectionViewSource getAllProjectViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("getAllProjectViewSource")));

            DataRowView drv = (DataRowView)getAllProjectViewSource.View.CurrentItem;
            nProjectID = (drv == null ? 0 : DBNull.Value.Equals(drv["nID"]) == true ? 0 : (int)drv["nID"]);
            
            DialogResult = true;
            this.Close();
        }

        private void SimpleButtonCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
