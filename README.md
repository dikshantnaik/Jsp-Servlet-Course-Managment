# Course Managment Using JSP And Servlet 
### Secong Year Advance Java Project

## How to Setup :

● git clone https://github.com/dikshantnaik/Jsp-Servlet-Course-Managment.git
or Download this project 

● Open this project in your Netbean and Setup Tomcat Server

● Import jsp-project.sql Database into your Mysql using phpmyadmin
Database name should be *jsp-project*  
● Run the Project


## index.jsp
● Dynamic index page which changes on login <br />
● Navbar,Landing Content,Enrolled Course is Displayed when Logged-in <br />
● If user have enrolled any course it’ll be shown on index.jsp <br />
● All the Course Cards are loaded Dynamically from Database <br />
![image](https://user-images.githubusercontent.com/45972990/153235615-8268057f-09a4-4dc9-9f8c-e1bd4f900a08.png)
![image](https://user-images.githubusercontent.com/45972990/153235694-efbb18c2-a75a-4fef-9566-992f493faa5e.png)
![image](https://user-images.githubusercontent.com/45972990/153235862-c57e14f7-d682-4a7a-ad4a-3b7f6a152f37.png)
## Courses.jsp 
A page where all the course will be shown which was not shown on the index page.
You can also Search for course it’ll match the Database with that keyword and show the Result 
If you want to see the Course Details click the course tab and it’ll redirect you to The Individual Course page 

![image](https://user-images.githubusercontent.com/45972990/153239399-dd27c8dc-34bd-4748-b1d9-1cf42e605d93.png)

## Register.jsp
Register yourself here with your information.
The password will be saved as Hash using SHA256 Algorithm

![image](https://user-images.githubusercontent.com/45972990/153235965-381d811d-b011-4d7c-af5e-c40902255ae0.png)
## Login.jsp
Login using your username and password which you set during registration.
You can also tick Remember me to save your info in cookies permanently 

![image](https://user-images.githubusercontent.com/45972990/153235923-b41fe006-f9c0-4851-8487-9b1eb50ed951.png)
## Enroled Course at Index after login
This page is used as an import and will be shown on index.jsp when user login..
In this section all the Course the user has Enabled will be shown after successful payment

![image](https://user-images.githubusercontent.com/45972990/153236128-ed4afd2c-ade1-4e7d-9cc3-eeb49b6f0ad5.png)
# Course.jsp : Indivdual Course Details
Check the details about the individual course including price,description and Reviews from another users
![image](https://user-images.githubusercontent.com/45972990/153237016-3765eb66-5306-4ffd-9442-e93967f4f771.png)
![image](https://user-images.githubusercontent.com/45972990/153237108-ddd01272-4153-4f65-806c-cfab66d50147.png)
## Cart.jsp
Here You’ll see all the Course which the user wishes to buy .User can delete any item from the cart and enroll if he likes the course he has chosen ..It’ll redirect him to the payment page to pay the course amount .
![image](https://user-images.githubusercontent.com/45972990/153237229-c95d946e-2a40-43f0-ad95-8ac95add43cd.png)
## Payment.jsp
This page is used before enrolling in a course to make a payment . All the data seen here is dynamically changed based on Total /fee amount.After successful payment the course is enrolled and the payment data is saved in the database
![image](https://user-images.githubusercontent.com/45972990/153237320-6cb0d588-c871-4a36-88ae-a69ee2877d47.png)
## Tables in this project
![image](https://user-images.githubusercontent.com/45972990/153237465-323eeadc-6d09-4ef6-979e-1eda588ab0e8.png)
## Student Table
![image](https://user-images.githubusercontent.com/45972990/153237634-e5e8f6a2-510e-48fb-a22e-d7b98fb62606.png)
## available_course table
![image](https://user-images.githubusercontent.com/45972990/153237525-4b294d80-8745-47a8-a207-e816e31c0c54.png)
## Review Table
![image](https://user-images.githubusercontent.com/45972990/153237695-5facc803-eb3d-4814-b17a-0eba7677c08d.png)
## Cart Table
![image](https://user-images.githubusercontent.com/45972990/153238095-a72a003a-f131-4d26-baf3-af9fa11a905e.png)
## Payment table;
![image](https://user-images.githubusercontent.com/45972990/153238344-096539f6-dee7-4379-89fe-758b1efece8a.png)
## Enrolled Course 
![image](https://user-images.githubusercontent.com/45972990/153238738-6bb820b9-d9d7-439b-9ed0-382f2a5ddf53.png)
