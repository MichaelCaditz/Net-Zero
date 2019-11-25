# Net-Zero
Off-grid PV plant sizing and metrics, residential or commercial, with storage.  Thesis project for MS-EM at NYIT, Vancouver. C# VS.net. MSSQL 2017 DB.  I am now making this open source.

Windows desktop client/server

Platform specifications:
C# 
Visual Studio 2019
WPF
DevExpress WPF controls v18.1
MSSQL 2017 Database
Visual Studio database project

What does this software do?

Estimates demand from list of appliances.
User selects geographical location of PV plant.
User selects tracking system from fixed, various types of one-axis tracking, or two-axis tracking. User can specify collector tilt angle.
Optional import of TMY file.
Displays expected daily or monthly insolation for selected geographical location, either from monthly averages or daily TMY data.
User selects sun-hours on which to size system.
Recommends total rated power of PV based on demand versus chosen sun-hours.
User chooses desired days of autonomy (how long energy demand can be met from storage with no energy input from PV).
Recommends rated battery storage capacity based on demand, PV power, and days of autonomy.
Calculates and charts energy balance (demand versus energy provided).
Estimates greenhouse emission savings of project.

The program performs multiple calculations related to the solar resource at a chosen geographical location, and energy balance, i.e., the abilty of a chosen system to accomodate the energy demand of the population.

Does much more . . . to be continued . . . .

Limitations:

Uses outdated version of DevExpress controls. I don't have budget for subscription renewal at the moment.
Uses MSSQL bulk insert (for TMY file import) which is not permitted by many commercial MSSQL hosing services, such as Winhost. 

