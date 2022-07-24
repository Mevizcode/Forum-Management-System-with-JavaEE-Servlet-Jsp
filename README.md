PROJECT NAME
   UPCUBE FORUM MANAGEMENT SYSTEM
DESCRIPTION -
This project offers the user with basic design and functionalities which include admin control, user panel,  login, register, logout, forget password, post a question / answer a question, display posted questions and answers and many more.
Photos attached below will give reader a brief overview of how the project is structured and key modules / functionalities within this project.

This project has been implemented using MVC Design Pattern in Java EE and MySQL Database System, Log4j is used to log all details from startup of application till shutdown, please read the logs for detailed info on errors, warning and info of the application behaviour.

REQUIREMENTS

Windows PC (i5 7th Gen or above)
java 8 or above
IDE (Intellij IDE is recommended)

--maven dependencies--
MySQL connector-java 8.0.28 
Log4j 1.2.17
Jstl 1.2

PROJECT STRUCTURE
![img_10.png](../Docs/img_10.png)
controllers (Admin Controllers/ User Controllers/ Posts Controllers)
![img_11.png](../Docs/img_11.png)
DAO(Data Access Object {UserDao, PostDao})
Entity (Posts, Thread, User, UserLog)
FILTER
LISTENERS
Utility
![img_12.png](../Docs/img_12.png)
![img_13.png](../Docs/img_13.png)



REGISTER
user can register then proceed to login!
![img_9.png](../Docs/img_9.png)
user cannot register if username or email is already taken 
![img.png](img.png)
if username and email not in use then user can register provided if he/she fills in all the fields correctly
![img_1.png](img_1.png)
LOGIN
Allows registered user to login
![img_8.png](../Docs/img_8.png)
FORGET PASSWORD
![img_19.png](../Docs/img_19.png)
![img_20.png](../Docs/img_20.png)
ADMIN DASHBOARD

![img_14.png](../Docs/img_14.png)
![img_7.png](../Docs/img_7.png)
 
In admin dashboard, Admin can view total user, total post, new user, online users are all display on the main dashboard
Plus list of recent added users, users with maximum active time are displayed as table;
Admin can query a user by username using the search bar
On the dashboard navbar, admin can navigate to main dashboard, add user, list users, user log activity;

ADD USER 
![img_15.png](../Docs/img_15.png)

LIST USERS
![img_16.png](../Docs/img_16.png)
![img_17.png](../Docs/img_17.png)

Admin can navigate using the pagination in the user list, view users details
Delete User
Update User

User LOG CHARTS
![img_18.png](../Docs/img_18.png)


USER HOME (index.jsp)
![img_21.png](../Docs/img_21.png)
User can post a new question 
![img_22.png](../Docs/img_22.png)
or click a question and answer it
![img_23.png](../Docs/img_23.png)
after submitting answer user can see all answers for this posts
![img_24.png](../Docs/img_24.png)
User can view his/her profile 
Update his/her account
![img_25.png](../Docs/img_25.png)
change password

Version 2.0.1 Loading ......
User
-- Display total posts, total thread, login activity per user
-- **Upload files**
-- Search a question
-- Total Question views
-- Total Answer per Question
-- Likes a question
and many more!!!

version 2.0.1 will be coded using spring framework
Crafted with love By #DAVID COLE #Year 2 CS Student at #SANMING UNIVERSITY, CHINA

