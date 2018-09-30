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
using System.Windows.Shapes;
using DevExpress.Xpf.Core;


namespace Net_Zero
{
    /// <summary>
    /// Interaction logic for ProjectList.xaml
    /// </summary>
    public partial class ProjectList : ThemedWindow
    {
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
    }
}
