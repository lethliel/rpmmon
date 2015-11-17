# rpmmon 
Online RPM Live Monitoring System

## Synopsis
Small webapplication to monitor packages deleted and installed on the system

## Used technologies
The used webframework is perldancer. It is leighweight, easy to use and in my opinion most suitable for small applications. It does not need a big Webserver application. 

To get the installed packages the library RPM2  is used and the return is stored in a File. (Using DB_File). This is our starting point, which can be re-initialized at any time using the init-call. The differences are always determined using this starting point.
The functions are sourced to the control module rpmmon_control.pm

To view the findings a simple HTML Template is used. 

## How to start?
There is a Vagrantfile in this project which will provide a OpenSusSE 13.2 box with automated provisioning of all needed libraries and the rpmmon itself. 
Just make sure that there is a working internet connection.

The rpmmon application is not started at bootup. Just ssh into the vagrant environment (vagrant ssh) and start it with:
/home/vagrant/rpmmon/start

Now you can reach the application with:
http://127.0.0.1:8080/rpmmon

## Annotations

You can re-initialize the starting point by clicking 'Reset DBs' or by calling http://127.0.0.1:8080/init
