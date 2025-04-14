-- Insert data for table `advisor`
INSERT INTO `advisor` (`advisorid`, `facultyid`, `studentid`) VALUES
(1, 101, 201),
(2, 102, 202),
(3, 103, 203),
(4, 104, 204),
(5, 105, 205),
(6, 106, 206);

-- Insert data for table `building`
INSERT INTO `building` (`buildingid`, `buildingdesc`, `orderby`, `isactive`) VALUES
(1, 'Science Building', 1, 1),
(2, 'Library Building', 2, 1),
(3, 'Administration Building', 3, 0),
(4, 'Burch Hall', 4, 1),
(5, 'Art Building', 5, 1),
(6, 'Music Building', 6, 1);

-- Insert data for table `course`
-- Updated to use IDs for building (buildingid), room (roomid), and time (timeid)
INSERT INTO `course` (`courseid`, `coursedesc`, `building`, `room`, `time`, `days`) VALUES
(1, 'Introduction to Computer Science', 1, 1, 1, 'MWF'),
(2, 'Database Systems', 2, 2, 1, 'TR'),
(3, 'Web Development', 1, 3, 2, 'MWF'),
(4, 'Operating Systems', 1, 4, 2, 'TR'),
(5, 'Computer Science II', 1, 5, 1, 'MW'),
(6, 'Art Appreciation', 5, 6, 1, 'TR'),
(7, 'Drawing I', 5, 7, 2, 'MWF'),
(8, 'Music Theory', 6, 8, 2, 'MW'),
(9, 'Music History', 6, 9, 3, 'TR'),
(10, 'English Composition I', 4, 10, 1, 'TR'),
(11, 'College Algebra', 4, 11, 2, 'MW');

-- Insert data for table `faculty`
INSERT INTO `faculty` (`id`, `firstname`, `lastname`, `office`, `email`, `phonenumber`, `facultyrole`) VALUES
(101, 'John', 'Doe', 'Office 101', 'jdoe@example.com', '1234567890', 'faculty'),
(102, 'Jane', 'Smith', 'Office 102', 'jsmith@example.com', '0987654321', 'advisor'),
(103, 'Alice', 'Johnson', 'Office 103', 'ajohnson@example.com', '1122334455', 'chair'),
(104, 'Josie', 'Smithy', 'Office 110', 'jsmithy@example.com', '0987654661', 'admin'),
(105, 'Jake', 'Brown', 'Office 106', 'jbrown@example.com', '1473859764', 'faculty'),
(106, 'Logan', 'Williams', 'Office 107', 'lwilliams@example.com', '1394003428', 'faculty'),
(107, 'James', 'Miller', 'Office 109', 'jmiller@example.com', '0345670385', 'faculty'),
(108, 'Laura', 'Jones', 'Office 105', 'ljones@example.com', '9845342343', 'faculty');

-- Insert data for table `internship`
INSERT INTO `internship` (`internid`, `interninfo`, `interntype`, `contact`, `startdate`, `enddate`) VALUES
(1, 'Software Development Internship', 'Paid', 'contact@example.com', '2025-06-01 09:00:00', '2025-08-31 17:00:00'),
(2, 'Data Analyst Internship', 'Unpaid', 'contact2@example.com', '2025-06-15 09:00:00', '2025-08-15 17:00:00'),
(3, 'Front End Developer Internship', 'Paid', 'contact3@example.com', '2025-10-31 09:00:00', '2025-12-10 17:00:00'),
(4, 'Back End Developer Internship', 'Unpaid', 'contact4@example.com', '2025-08-15 09:00:00', '2025-10-10 17:00:00'),
(5, 'Software Engineer Internship', 'Paid', 'contact5@example.com', '2025-04-08 08:00:00', '2025-05-10 17:00:00'),
(6, 'Mobile Engineer Internship', 'Paid', 'contact6@example.com', '2025-05-06 08:00:00', '2025-06-06 17:00:00');

-- Insert data for table `login`
INSERT INTO `login` (`userid`, `username`, `password`, `role`, `isactive`, `roleid`) VALUES
(1, 'student1', 'password123', 'student', 1, 201),
(2, 'student2', 'password321', 'student', 1, 202),
(3, 'student3', 'password789', 'student', 1, 203),
(4, 'faculty1', 'password456', 'faculty', 1, 101),
(5, 'faculty2', 'password100', 'faculty', 1, 106),
(6, 'faculty3', 'password101', 'faculty', 1, 108),
(7, 'admin1', 'adminpassword', 'admin', 1, NULL),
(8, 'admin2', 'adminpassword2', 'admin', 1, NULL),
(9, 'advisor1', 'advisorpassword', 'advisor', 1, 102),
(10, 'advisor2', 'advisorpassword2', 'advisor', 1, 103),
(11, 'advisor3', 'advisorpassword3', 'advisor', 1, 104);

-- Insert data for table `major`
INSERT INTO `major` (`majorid`, `majordesc`, `minordesc`, `orderby`) VALUES
(1, 'Computer Science', 'Mathematics', 1),
(2, 'Business Administration', 'Economics', 2),
(3, 'Psychology', '', 3),
(4, 'Chemistry', '', 4),
(5, 'Biology', '', 5),
(6, 'Sociology', '', 6);

-- Insert data for table `organization`
INSERT INTO `organization` (`orgid`, `orgname`, `orgpos`, `dpt`, `contact`) VALUES
(1, 'Computer Science Club', 'President', 'Computer Science', 'contact@csclub.com'),
(2, 'Business Club', 'Secretary', 'Business Administration', 'contact@businessclub.com'),
(3, 'Biology Club', 'President', 'Biology', 'contact@biologyclub.com'),
(4, 'Psychology Club', 'Secretary', 'Psychology', 'contact@psychologyclub.com'),
(5, 'Chemistry Club', 'President', 'Chemistry', 'contact@chemistryclub.com'),
(6, 'Sociology Club', 'President', 'Sociology', 'contact@sociologyclub.com');

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

-- Insert data for table `student`
INSERT INTO `student` (`studentid`, `firstname`, `lastname`, `email`, `classification`, `degree`, `major`, `minor`) VALUES
(201, 'Tom', 'Brown', 'tbrown@example.com', 'Sophomore', 'B.Sc. Computer Science', 'Computer Science', 'Mathematics'),
(202, 'Mary', 'Green', 'mgreen@example.com', 'Junior', 'B.A. Business', 'Business Administration', 'Economics'),
(203, 'James', 'White', 'jwhite@example.com', 'Freshman', 'B.Sc. Computer Science', 'Computer Science', 'Physics'),
(204, 'Dylan', 'Smith', 'dsmith@example.com', 'Senior', 'B.Sc. Sociology', 'Sociology', NULL),
(205, 'Jake', 'Simmons', 'jsimmons@example.com', 'Freshman', 'B.Sc. Psychology', 'Psychology', NULL),
(206, 'Robert', 'Addams', 'raddams@example.com', 'Junior', 'B.Sc. Biology', 'Biology', NULL);

-- Insert data for table `time`
INSERT INTO `time` (`timeid`, `timedesc`, `orderby`, `isactive`) VALUES
(1, 'Morning', 1, 1),
(2, 'Afternoon', 2, 1),
(3, 'Evening', 3, 0);
