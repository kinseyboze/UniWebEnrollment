-- Insert data for table `advisor`
INSERT INTO `advisor` (`advisorid`, `facultyid`, `studentid`) VALUES
(1, 101, 201),
(2, 102, 202),
(3, 103, 203);

-- Insert data for table `building`
INSERT INTO `building` (`buildingid`, `buildingdesc`, `orderby`, `isactive`) VALUES
(1, 'Science Building', 1, 1),
(2, 'Library Building', 2, 1),
(3, 'Administration Building', 3, 0);

-- Insert data for table `course`
INSERT INTO `course` (`courseid`, `coursedesc`, `building`, `room`, `time`, `days`) VALUES
(1, 'Introduction to Computer Science', 'Science Building', 'Room 101', '9:00 AM - 10:30 AM', 'MWF'),
(2, 'Database Systems', 'Library Building', 'Room 202', '11:00 AM - 12:30 PM', 'TR'),
(3, 'Web Development', 'Science Building', 'Room 303', '2:00 PM - 3:30 PM', 'MWF');

-- Insert data for table `faculty`
INSERT INTO `faculty` (`id`, `firstname`, `lastname`, `office`, `email`, `phonenumber`, `facultyrole`) VALUES
(101, 'John', 'Doe', 'Office 101', 'jdoe@example.com', '1234567890', 'faculty'),
(102, 'Jane', 'Smith', 'Office 102', 'jsmith@example.com', '0987654321', 'advisor'),
(103, 'Alice', 'Johnson', 'Office 103', 'ajohnson@example.com', '1122334455', 'chair'),
(104, 'Josie', 'Smithy', 'Office 110', 'jsmithy@example.com', '0987654661', 'admin');

-- Insert data for table `internship`
INSERT INTO `internship` (`internid`, `interninfo`, `interntype`, `contact`, `startdate`, `enddate`) VALUES
(1, 'Software Development Internship', 'Paid', 'contact@example.com', '2025-06-01 09:00:00', '2025-08-31 17:00:00'),
(2, 'Data Analyst Internship', 'Unpaid', 'contact2@example.com', '2025-06-15 09:00:00', '2025-08-15 17:00:00');

-- Insert data for table `login`
INSERT INTO `login` (`userid`, `username`, `password`, `role`, `isactive`, `roleid`) VALUES
(1, 'student1', 'password123', 'student', 1, 201),
(2, 'faculty1', 'password456', 'faculty', 1, 101),
(3, 'admin1', 'adminpassword', 'admin', 1, NULL),
(4, 'advisor1', 'advisorpassword', 'advisor', 1, 102);

-- Insert data for table `major`
INSERT INTO `major` (`majorid`, `majordesc`, `minordesc`, `orderby`) VALUES
(1, 'Computer Science', 'Mathematics', 1),
(2, 'Business Administration', 'Economics', 2);

-- Insert data for table `organization`
INSERT INTO `organization` (`orgid`, `orgname`, `orgpos`, `dpt`, `contact`) VALUES
(1, 'Computer Science Club', 'President', 'Computer Science', 'contact@csclub.com'),
(2, 'Business Club', 'Secretary', 'Business Administration', 'contact@businessclub.com');

-- Insert data for table `room`
INSERT INTO `room` (`roomid`, `roomdesc`, `orderby`, `isactive`, `buildingid`) VALUES
(1, 'Room 101', 1, 1, 1),
(2, 'Room 202', 2, 1, 2),
(3, 'Room 303', 3, 0, 1);

-- Insert data for table `student`
INSERT INTO `student` (`studentid`, `firstname`, `lastname`, `email`, `classification`, `degree`, `major`, `minor`) VALUES
(201, 'Tom', 'Brown', 'tbrown@example.com', 'Sophomore', 'B.Sc. Computer Science', 'Computer Science', 'Mathematics'),
(202, 'Mary', 'Green', 'mgreen@example.com', 'Junior', 'B.A. Business', 'Business Administration', 'Economics'),
(203, 'James', 'White', 'jwhite@example.com', 'Freshman', 'B.Sc. Computer Science', 'Computer Science', 'Physics');

-- Insert data for table `time`
INSERT INTO `time` (`timeid`, `timedesc`, `orderby`, `isactive`) VALUES
(1, 'Morning', 1, 1),
(2, 'Afternoon', 2, 1),
(3, 'Evening', 3, 0);
