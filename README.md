# UniWeb Enrollment System

This project is a web-based enrollment system designed for universities and colleges. It allows students to enroll in courses and manage their schedules, and gives faculty members the ability to manage their courses and students. Different types of users (students, faculty, advisors, chairs, and administrators) have different levels of access and functionality within the system.

The system is built using PHP for server-side logic, HTML/CSS and JavaScript for the frontend, and MySQL for the backend database. It runs locally using XAMPP.

## Features

- Role-based access for students, faculty, advisors, chairs, and administrators
- Student course enrollment and withdrawal
- Faculty access to view and manage enrolled students
- Advisor view of student schedules and course availability
- Chair and admin functionalities to manage courses, buildings, rooms, and users
- Secure login and logout
- Structured database for storing user, course, and building data

## Folder Overview

- `assets/`: Contains static resources including stylesheets, images, and JavaScript files.
- `code/frontend/`: Contains PHP and HTML files that render the frontend UI for different user roles.
- `code/middleend/`: Contains PHP scripts that handle database operations, form processing, and backend logic.
- `database/`: Contains SQL files for database setup and test data.
- `index.php`: Main entry point of the application.
- `Git_Guide.md`: Guide for using Git with this project.

## File Structure

```plaintext
.
├── assets
│   ├── assets.txt.txt
│   ├── css
│   │   └── style.css
│   ├── images
│   │   ├── background.jpg
│   │   └── cameron.png
│   └── js
├── code
│   ├── frontend
│   │   ├── admin_home.php
│   │   ├── advisor.php
│   │   ├── chair_home.php
│   │   ├── faculty_home.php
│   │   ├── forgot-password.php
│   │   ├── login.html
│   │   ├── scripts.js
│   │   └── student_home.php
│   └── middleend
│       ├── add_building.php
│       ├── add_course.php
│       ├── add_internship.php
│       ├── add_organization.php
│       ├── add_room.php
│       ├── add_user.php
│       ├── chair_functionality.php
│       ├── db_connect.php
│       ├── delete_building.php
│       ├── delete_course.php
│       ├── delete_user.php
│       ├── edit_building.php
│       ├── edit_course.php
│       ├── edit_room.php
│       ├── edit_user.php
│       ├── enroll_course.php
│       ├── get_buildings.php
│       ├── get_contacts.php
│       ├── get_courses.php
│       ├── get_internships.php
│       ├── get_organizations.php
│       ├── get_users.php
│       ├── manage_building.php
│       ├── manage_course.php
│       ├── manage_user.php
│       ├── process_login.php
│       ├── process_logout.php
│       ├── update_advisor.php
│       ├── view_rooms.php
│       ├── withdraw_course.php
│       └── withdraw_student.php
├── database
│   ├── database.txt.txt
│   ├── test_data.sql
│   └── uniwebenrollment_db.sql
├── Git_Guide.md
└── index.php
└── README.md
```

## Technologies Used

- PHP
- MySQL
- HTML
- CSS
- JavaScript
- XAMPP (Apache and MySQL for local hosting)

## Setup Instructions

1. Download and install XAMPP if it is not already installed.
2. Clone this repository or download the project files.
3. Place the project folder in the `htdocs` directory inside your XAMPP installation.
4. Open the XAMPP Control Panel and start both Apache and MySQL.
5. Open phpMyAdmin in your browser by navigating to `http://localhost/phpmyadmin`.
6. Create a new database (e.g., `uniwebenrollment`).
7. Import `uniwebenrollment_db.sql` from the `database/` folder to set up the schema.
8. (Optional) Import `test_data.sql` if you want sample data for testing.
9. Navigate to `http://localhost/index.php` to begin using the application.

## Notes

- Make sure file and folder names are not accidentally duplicated or renamed (e.g., `assets.txt.txt` and `database.txt.txt` may be placeholders or accidental duplicates).
- This is a local development project and does not include production-level security or deployment configurations.
