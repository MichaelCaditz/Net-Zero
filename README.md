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

Examples of calculations performed, either hourly or daily for a chosen time span,  chosen latitude and longitude, chosen tracking system (fixed at n altitude; single-axis tracking HNS, HEW, PNS or VERT; or 2-axis), specified demand, chosen rated PV kW, chosen rated storage battery capacity kWh:

* solar datetime
* numerical day of year
* hour angle
* civil time
* solar declination
* solar altitude
* solar azimuth
* air mass ratio
* expected insolation from TMY file
* actial PV tilt
* optimal PV tilt
* tilt error
* actual PV azimuth
* optimal PV azimuth
* azimuth error
* required PV kW
* PV kW deficiency (or surplus)
* chosen PV kW would accomodate . . .  kWh demand
* surplus or deficit energy supplied
* percent of demand supplied
* cumulative battery energy loss over time period
* battery remaining kWh
* battery remaining percent
* battery hours remaining
* solar angle of incidence
* clear sky beam normal to collector
* emperical beam (from TMY) normal to collector
* clear sky beam on horizontal collector
* clear sky diffuse radiation on horizontal collector
* emperical diffuse radiation (from TMY) radiation on horizontal collector
* clear sky reflected radiation 
* emperical reflected radiation (from TMY) 

* what-if scenarios of above data, using each of the other tracking systems
* various charts displaying selected data from above

The accuracy of the above calculations have been tested in an academic research environment. References are available upon request. The calculations are made in code using T-SQL trigonometric functions.

Does much more . . . to be continued . . . .

Limitations:

Uses outdated version of DevExpress controls. I don't have budget for subscription renewal at the moment.
Uses MSSQL bulk insert (for TMY file import) which is not permitted by many commercial MSSQL hosing services, such as Winhost. 


