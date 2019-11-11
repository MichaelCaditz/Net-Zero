# NetZero
Off-grid PV plant sizing and metrics, residential or commercial, with storage.  Thesis project for MS-EM at NYIT, Vancouver. C# VS.net. MSSQL 2017 DB.  I am now making this open source.

Windows desktop client/server

Platform specifications:
C# 
Visual Studio 2019
WPF
DevExpress WPFcontrols v18.1
MSSQL 2017 Database
Visual Studio database project

What does this software do?

Estimates demand from list of appliances.
User selects geograpical location of PV plant.
Optional import of TMY file.
Displays expected daily or monthly insolation for selected geographical location, either from motnhly averages or daily TMY data.
User selects sun-hours on which to size system.
Recommends total rated power of PV based on demand versus chosen sun-hours.
User chooses days of autonomy.
Recommends rated battery storage capacity based on demand, PV power, and days of autonomy.
