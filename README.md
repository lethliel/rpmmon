# rpmmon 
Online RPM Live Monitoring System

## Synopsis
Small webapplication to monitor packages deleted and installed on the system

## Used technologies
The used webframework is perldancer. It is leighweight, easy to use and in my opinion most suitable for small applications. It does not need a big Webserver application. 

To get the installed packages a simple system call is used and the return is stored in a File. (Using DB_File). Also the determined newly and delted 
packages are stored in files. It keeps the findings persistent until the init function is called. So the application can be started and it shows the difference since last stopped.

To view the findings a simple HTML Template is used. 

## How to start?
There is a Vagrantfile in this project which will provide a OpenSusSE 13.2 box with automated provisioning of all needed libraries and the rpmmon itself. It is started in background and can be accessed via http://127.0.0.1:8080/rpmmon 
Just make sure that there is a working internet connection.

If somehow the startscript is not running: SSH into Box. Goto /home/vagrant/rpmmon and start it with ./start

## Annotations

On first use you have to Initialize the Databases with the "Reset DBs" Button or by calling http://127.0.0.1:8080/init otherwise all packages will be determined as new for the originator DB is not build yet. 

Please click "Start Monitoring" to start the monitoring. It will not start automatically. The refresh interval is 10 seconds. 

