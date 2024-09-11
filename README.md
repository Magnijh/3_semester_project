# DRP3-Project
The project was made to help Migatorinc manage their employees time, absence and vacation all in one system. This system can work for other companies to, it is built to be customizable with different departments to sort the employees and managers by. The end product will be a Time management system that takes care of hours, absence and vacation so there is less for managers to think about.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine, with a working database. There will be included a query that will insert dummy data into the database if need for demonstration purposes. This readme will not describe how to set it up on a server but we recommend smarterASP.net since they make it fast, easy and reliable.

### Prerequisites
* MSSQL 2016 or newer
* Visual Studio or other C# IDE

### Installing

If you want to run on local databases
*	Publish the database, the file is found in the “Profiles” folder.
*	Open the file in “PostPublish” copy the insert commands and run them in a query. 
*	Change connection string in “SqlComm.cs” and “SqlDatabaseStrategy.cs”
Want to use our online databases, they will be running until February 2021.
*	Run the program as is.
Now you can run I local with IIS Express or publish to a webserver. 
If you want to run it on a server, we recommend SmarterASP.Net.

### Users in dummy data
Here is a list of users that is included in the dummy data.

Manager Account:
* Username: hg
* Password: hg

HR Account:
* Username: oi
* Password: oi

Worker Accounts:
* Username: ks, kp, ph
* Password: ks, kp, ph

## Authors
* **Caseper Zabinski**
* **Dennis Kilic**
* **Jacob Norlyk Kjergaard**
* **Kristian Bengtson**
* **Magni Jógvansson Hansen**
* **Nikolai Eriksen Kure**

## License
This project is licensed under the MIT License.
