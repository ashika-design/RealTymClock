# RealTymClock

Introduction: 
Real Time Clock (RTC) is an important device for good relation with world. The first application is to 
display the real time on 24h basis and it can be easily converted to accommodate a 12h clock as well. 
The RTC can display in hours, minutes and seconds. This design is more involved in the traffic 
controller design. The display system needs to be populated with all the six, seven-segment LEDs for 
the real time clock applications.
The main applications of RTC are 
 Real Time Display
 Stop Watch 
 Industrial timer
 Photographic timer
 Medical Application using three alarm setting
Design Process of RTC:
The basic digital clock contained hours, minutes and seconds. Each one has MSB and LSB.

![Screenshot (310)](https://github.com/user-attachments/assets/51d20016-e649-49c8-8a5d-aec77e7f3242)

The above seven segments are illustrated the “00-00-00” values of hours, HRM (hours of MSB value) 
and HRL (Hours of LSB value). Next will declared minutes as MIN_M and MIN_L. The seconds are 
declared as SEC_M and SEC_L. The basic digital block contain two designs, • Counter • Seven 
Segmentation These are the main building blocks of digital clock. Counter will count the number in 
decimal as 23:59:59. This is the 24h clock operation and it can easily convert to accommodate a 12h 
clock.


![Screenshot (312)](https://github.com/user-attachments/assets/3a0bc7b3-feed-43a3-b6d5-81948a6775df)

The basic counter is count the hours, minutes and seconds and set as 00:00:00 when it will reach 
23:59:59.

![Screenshot (312)](https://github.com/user-attachments/assets/4e5679ac-9076-4308-b695-d0409ce41810)




