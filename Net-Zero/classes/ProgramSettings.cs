﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Net_Zero.classes
{
    class ProgramSettings
    {
        //static string database = "Net-Zero";
        //static string server = "Sager10";
        //// string server2 = Settings.Default.server2;
        //static string username = "sa";
        //static string password = "Sq!lsp!a123";


        //static string database = "DB_80510_netzero";
        //static string server = "s14.winhost.com";
        //string server2 = Settings.Default.server2;
        //static string username = "DB_80510_netzero_user";
        //static string password = "NZ8965!!";
        //static string passwordPublic = "**********";

        static string database = "NetZero";
        static string server = "BURRARD";
        // string server2 = Settings.Default.server2;
        static string username = @"MICHAELCADITZ\Michael";
        static string password = "LAKES!!1#";
        static string passwordPublic = "**********";
        static string integratedSecurity = "True";


        public static string net_zeroconnectionString =
            String.Format("data source='{0}';initial catalog={1};password={2};persist security info=True;user id={3};integrated security = {4};packet size=4096;Connection Timeout=90", server, database, password, username,integratedSecurity);


        public static string net_zeroconnectionStringPublic =
           String.Format("data source='{0}';initial catalog={1};user id={2}", server, database, username);

        

        // if (String.IsNullOrEmpty(server2)) server2 = server;

        //Primary GW
        // coolblueconnectionString = String.Format("data source='{0}';initial catalog={1};password={2};persist security info=True;user id={3};packet size=4096;Connection Timeout=90", server, database, password, username);

    }
}
