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
    /// Interaction logic for logon.xaml
    /// </summary>
    public partial class logon : ThemedWindow
    {

        public bool returnValue { get; set; }
        public logon()
        {
            InitializeComponent();
        }

        private void btnQuit_Click(object sender, RoutedEventArgs e)
        {
            returnValue = false;
            this.Close();
        }

        private void btnLogon_Click(object sender, RoutedEventArgs e)
        {
            this.returnValue = true;
            this.Close();
        }


    }
}
