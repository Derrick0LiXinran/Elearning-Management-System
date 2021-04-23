# README

Ruby version - 2.7.1
Database creation - run rails db:migrate followed by rails db:setup to create the database

# Sample Account Details

- ![#f03c15](https://via.placeholder.com/15/f03c15/000000?text=+) **NOTE!!!!! If the website is broken, please email xli56@ncsu.edu**


Admin Email: admin@ncsu.edu   
Admin Password: admin

Student Email: xli56@ncsu.edu   
Password: admin

Teacher Email: xchen33@ncsu.edu   
Password: admin


# Website Address

http://100.25.155.73:3000


# Description

This application is a course registration system that allows for students to purchase courses,
teachers to register to teach courses, and a system for students to give feedback to teachers. 

Student:

  Students can create their account by "Register as a student". Then they will receive a conformation email which tells them that "they have successfully registered." After login, students will have access to "Course Catalog", "Credit Card Information", "View Purchased History", "Feedbacks", "Edit" and "Log out". 
  
  The "Course Catalog" tab will list all the courses which is available for the major of the login student. Students can add any available courses to the shopping cart in the "course Catalog" page. Student also have the right to choose their preferred teachers for the courses they are purchasing if their teachers have registered for that courses. All the available teacher will be listed with the purchasing courses. Next, student can view and edit their cart by clicking on the "view cart" tab. 
  
  In the "cart" page, students can checkout the courses they want to purchase. When students are checking out, they will receive an email containing a one time password for conforming identity of the students. They will have chances for requesting another one time password in case they miss the first one.
  
  The "Credit Card Information" gives students an opportunity to update or edit their payment information.  
  
  The "View Purchased History" tab will show the purchased history of the account since it had been created. 
  
  The "Feedbacks" tab will contain all the feedbacks given by all the students towards their teachers. Students can give feedback by clicking on "New Feedback" at this page. Students will receive a conformation email for their feedback. 
  
  The "Edit" tab is used for editing student information, such as name, email, major and so on. 
 
  The "Log out" tab is used for logging out, and will turn back to welcome page. 
  
  
Teacher:

  Teachers' accounts can be added only by the admin. 
  
  After login, teachers will have access to "View available courses", "Mentored history", "View Feedbacks", "Edit" and "Log out".
  
  The "View available courses" tab will list all the courses that are available for the login teacher. Teachers can register the courses that they want to teach in next semester. After they register for certain courses, they are listing as the available teachers for those courses. 
  
  The "Mentored history" will show all the students who had mentored by the login teacher. 
  
  The "View Feedbacks" page will show all the feedbacks related to the login teacher.
  
  Teacher can edit their information using "Edit" tab. 
  
  The "Log out" tab is used for log out and will turn back to the welcome page.
  
  
  Admin:
  
  
  Admins have access to "Course List", "Student Page", "Teacher Page", "Feedback Page", "Edit" and "Log Out", after they logged in. 
    
  The "Course List" shows all the available courses which can be purchased by students and be registered by teachers. The "New Course" tab is used for creating a new course categorized by major and discipline. ONLY admins can create and destroy courses.  
    
  The "Student Page" lists all the registered students. 
    
  The "Teacher Page" lists all the teachers registered by admins.
    
  The "Feedback Page" lists all the feedbacks given by students. ONLY admins can destroy feedbacks. 
    
  The "Edit" tab is used for updating admins information.
     
  The "Log out" is used for logging out and will go back to welcome page.
  
  
  Test:
  We are adding Rspec test as students controller and credit card info model. We have 15 test cases in total, and we are able to pass all of them by running Rspec.
  
  
  
  
  
  

