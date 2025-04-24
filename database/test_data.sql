-- Insert data for table 'advisor'
INSERT INTO `advisor` (`advisorid`, `facultyid`, `studentid`) VALUES
(1, 101, 1000),
(2, 102, 1001),
(3, 103, 1002),
(4, 104, 1003),
(5, 105, 1004),
(6, 106, 1005);

-- Insert data for table `building`
INSERT INTO `building` (`buildingid`, `buildingdesc`, `orderby`, `isactive`) VALUES
(1, 'Science Building', 1, 1),
(2, 'Library Building', 2, 1),
(3, 'Administration Building', 3, 0),
(4, 'Burch Hall', 4, 1),
(5, 'Art Building', 5, 1),
(6, 'Music Building', 6, 1);

-- Insert data for table 'organization'
INSERT INTO `organization` (`orgid`, `orgname`, `orgpos`, `dpt`, `contact`) VALUES
(1, 'Computer Science Club', 'President', 'Computer Science', 'contact@csclub.com'),
(2, 'Business Club', 'Secretary', 'Business Administration', 'contact@businessclub.com'),
(3, 'Biology Club', 'President', 'Biology', 'contact@biologyclub.com'),
(4, 'Psychology Club', 'Secretary', 'Psychology', 'contact@psychologyclub.com'),
(5, 'Chemistry Club', 'President', 'Chemistry', 'contact@chemistryclub.com'),
(6, 'Sociology Club', 'President', 'Sociology', 'contact@sociologyclub.com');

-- Insert data for table `internship`
INSERT INTO `internship` (`internid`, `interninfo`, `interntype`, `contact`, `startdate`, `enddate`) VALUES
(1, 'Software Development Internship', 'Paid', 'contact@example.com', '2025-06-01 09:00:00', '2025-08-31 17:00:00'),
(2, 'Data Analyst Internship', 'Unpaid', 'contact2@example.com', '2025-06-15 09:00:00', '2025-08-15 17:00:00'),
(3, 'Front End Developer Internship', 'Paid', 'contact3@example.com', '2025-10-31 09:00:00', '2025-12-10 17:00:00'),
(4, 'Back End Developer Internship', 'Unpaid', 'contact4@example.com', '2025-08-15 09:00:00', '2025-10-10 17:00:00'),
(5, 'Software Engineer Internship', 'Paid', 'contact5@example.com', '2025-04-08 08:00:00', '2025-05-10 17:00:00'),
(6, 'Mobile Engineer Internship', 'Paid', 'contact6@example.com', '2025-05-06 08:00:00', '2025-06-06 17:00:00');

-- Insert data for table `faculty`
INSERT INTO `faculty` (`id`, `firstname`, `lastname`, `office`, `email`, `phonenumber`, `facultyrole`) VALUES
(101, 'John', 'Doe', 'Office 101', 'jdoe@example.com', '1234567890', 'faculty'),
(102, 'Jane', 'Smith', 'Office 102', 'jsmith@example.com', '0987654321', 'advisor'),
(103, 'Alice', 'Johnson', 'Office 103', 'ajohnson@example.com', '1122334455', 'chair'),
(104, 'Josie', 'Smithy', 'Office 110', 'jsmithy@example.com', '0987654661', 'admin'),
(105, 'Jake', 'Brown', 'Office 106', 'jbrown@example.com', '1473859764', 'faculty'),
(106, 'Logan', 'Williams', 'Office 107', 'lwilliams@example.com', '1394003428', 'faculty'),
(107, 'James', 'Miller', 'Office 109', 'jmiller@example.com', '0345670385', 'faculty'),
(108, 'Laura', 'Jones', 'Office 105', 'ljones@example.com', '9845342343', 'faculty')
(109, 'Jacob', 'Flores', 'Office 206', 'jflores@example.com', '6827193842', 'advisor');
-- Insert data for table `student`
INSERT INTO `student` (`studentid`, `firstname`, `lastname`, `email`, `classification`, `degree`, `major`, `minor`, `orgid`, `internid`) VALUES
(1000, 'Tom', 'Brown', 'tbrown@example.com', 'Sophomore', 'B.Sc. Computer Science', 'Computer Science', 'Mathematics', NULL, NULL),
(1001, 'Mary', 'Green', 'mgreen@example.com', 'Junior', 'B.A. Business', 'Business Administration', 'Economics', 1, NULL),
(1002, 'James', 'White', 'jwhite@example.com', 'Freshman', 'B.Sc. Computer Science', 'Computer Science', 'Physics', 3, 1),
(1003, 'Dylan', 'Smith', 'dsmith@example.com', 'Senior', 'B.Sc. Sociology', 'Sociology', NULL, NULL, 3),
(1004, 'Jake', 'Simmons', 'jsimmons@example.com', 'Freshman', 'B.Sc. Psychology', 'Psychology', NULL, NULL, NULL),
(1005, 'Robert', 'Addams', 'raddams@example.com', 'Junior', 'B.Sc. Biology', 'Biology', NULL, NULL, NULL),
(1006, 'Mason', 'Reed', 'mreed@example.com', 'Senior', 'M.A. Master of Arts','Psychology', NULL, NULL, NULL), 
(1007, 'Emily', 'Watson', 'ewatson@example.com', 'Sophmore', 'M.A. Master of Arts', 'Communication', NULL, NULL, NULL);

-- Insert data for table `course`
INSERT INTO `course` (`courseid`, `coursedesc`, `building`, `room`, `time`, `days`, `facultyid`) VALUES
(1, 'Introduction to Computer Science', 'Science Building', 'Room 101', '9:00 AM - 10:30 AM', 'MWF', 101),
(2, 'Database Systems', 'Library Building', 'Room 202', '11:00 AM - 12:30 PM', 'TR', 102),
(3, 'Web Development', 'Science Building', 'Room 303', '2:00 PM - 3:30 PM', 'MWF', 103),
(4, 'Operating Systems', 'Science Building', 'Room 201', '12:45 PM - 2:00 PM', 'TR', 104),
(5, 'Computer Science II', 'Science Building', 'Room 208', '9:30 AM - 10:30', 'MW', 105),
(6, 'Art Appreciation', 'Art Building', 'Room 101', '11:00 AM - 12:00 PM', 'TR', 106),
(7, 'Drawing I', 'Art Building', 'Room 206', '1:00 PM - 2:00 PM', 'MWF', 107),
(8, 'Music Theory', 'Music Building', 'Room 204', '2:00 PM - 3:00 PM', 'MW', 108),
(9, 'Music History', 'Music Building', 'Room 201', '9:30 PM - 10:45 PM', 'TR', 101),
(10, 'English Composition I', 'Burch Hall', 'Room 102', '10:00 AM - 11:00 AM', 'TR', 102),
(11, 'College Algebra', 'Burch Hall', 'Room 104', '1:30 PM - 2:30 PM', 'MW', 103);

-- Insert data for table `enrollment`
INSERT INTO `enrollment` (`enrollmentid`, `facultyid`, `studentid`, `courseid`) VALUES 
(1, 101, 1000, 1), 
(2, 102, 1001, 2), 
(3, 103, 1001, 3), 
(4, 104, 1000, 4), 
(5, 105, 1002, 5), 
(6, 106, 1002, 6);

-- Insert data for table `login`
INSERT INTO `login` (`userid`, `username`, `password`, `role`, `isactive`, `roleid`, `email`, `firstname`, `lastname`) VALUES
(1, 'student1', 'password123', 'student', 1, 1001, 'mgreen@example.com', 'Mary', 'Green'),
(2, 'student2', 'password321', 'student', 1, 1002, 'jwhite@example.com', 'James', 'White'),
(3, 'student3', 'password789', 'student', 1, 1003, 'dsmith@example.com', 'Dylan', 'Smith'),
(4, 'faculty1', 'password456', 'faculty', 1, 101, 'jdoe@example.com', 'John', 'Doe'),
(5, 'faculty2', 'password100', 'faculty', 1, 106, 'lwilliams@example.com', 'Logan', 'Willaims'),
(6, 'faculty3', 'password101', 'faculty', 1, 108, 'ljones@example.com', 'Laura', 'Jones'),
(7, 'admin1', 'adminpassword', 'admin', 1, NULL, 'admin1@example.com', 'admin1', 'admin1'),
(8, 'admin2', 'adminpassword2', 'admin', 1, NULL, 'admin2@example.com', 'admin2', 'admin2' ),
(9, 'advisor1', 'advisorpassword', 'advisor', 1, 102, 'jsmith@example.com', 'Jane', 'Smith'),
(10, 'advisor2', 'advisorpassword2', 'advisor', 1, 103, 'ajohnson@example.com', 'Alice', 'Johnson'),
(11, 'advisor3', 'advisorpassword3', 'advisor', 1, 104, 'jsmithy@example.com', 'Josie', 'Smithy');

-- Insert data for table 'major'
INSERT INTO `major` (`majorid`, `majordesc`, `minordesc`, `orderby`) VALUES
(1, 'Computer Science', 'Mathematics', 1),
(2, 'Business Administration', 'Economics', 2),
(3, 'Psychology', '', 3),
(4, 'Chemistry', '', 4),
(5, 'Biology', '', 5),
(6, 'Sociology', '', 6);

-- Insert data for table `room`
INSERT INTO `room` (`roomid`, `roomdesc`, `orderby`, `isactive`, `buildingid`) VALUES
(1, 'Room 101', 1, 1, 1),
(2, 'Room 202', 2, 1, 2),
(3, 'Room 303', 3, 0, 1),
(4, 'Room 201', 4, 1, 1),
(5, 'Room 208', 5, 1, 1),
(6, 'Room 101', 6, 1, 5),
(7, 'Room 206', 7, 1, 5),
(8, 'Room 204', 8, 1, 6),
(9, 'Room 201', 9, 1, 6),
(10, 'Room 102', 10, 1, 4),
(11, 'Room 104', 11, 1, 4);

-- Insert data for table `time`
INSERT INTO `time` (`timeid`, `timedesc`, `orderby`, `isactive`) VALUES
(1, '8:00 am – 9:15 am', 1, 1),
(2, '9:30 am – 10:45 am', 2, 1),
(3, '11:00 am – 12:15 pm', 3, 0),
(4, '12:30 pm – 1:45 pm', 4, 0), 
(5, '2:00 pm – 3:15 pm', 5, 0), 
(6, '3:30 pm – 4:45 pm', 6, 0);






