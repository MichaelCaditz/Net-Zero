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
using DevExpress.Xpf.Map;
using DevExpress.Charts.Designer;
using DevExpress.Xpf.Editors;
using Net_Zero.Infoscreens;

namespace Net_Zero
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        App()
        {
            InitializeComponent();
        }

        [STAThread]
        static void Main()
        {
            
            logon logon1 = new logon();
            logon1.ShowDialog();
            App app = new App();



            //if (logon1.DialogResult.HasValue && logon1.DialogResult.Value == false)
            if (logon1.returnValue == true)
            {







            app.Run(new MainWindow());
            

            }
           


        }
    }
}
