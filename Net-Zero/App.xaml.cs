using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Windows;

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
                //MainWindow mainWindow1 = new MainWindow();
                app.Run(new MainWindow());
               // mainWindow1.Show();
                //System.Windows.Application.Current.Shutdown();
                //this.Close();

            }
           


            
            //logon1.ShowDialog();
            ////if (logon1.DialogResult.HasValue && logon1.DialogResult.Value == false)
            //if (logon1.returnValue == true)
            //{
            //    MainWindow mainWindow1 = new MainWindow();
            //    mainWindow1.Show();
            //    //System.Windows.Application.Current.Shutdown();
            //    //this.Close();

            //}
        }
    }
}
