var tabs = document.querySelectorAll(".tabs ol li");
var tabs_wrap = document.querySelectorAll(".tab_wrap");

tabs.forEach(function(tab, tab_index){
    tab.addEventListener("click", function(){
        tabs.forEach(function(tab){
            tab.classList.remove("active");
        });
        tab.classList.add("active");

        tabs_wrap.forEach(function(content, content_index){
            if(content_index == tab_index){
                content.style.display ="block";

                if(tab_index === 0) {
                    loadAccounts('student');
                }
                else if(tab_index === 1) {
                    loadAllAccounts('all');
                }
            }
            else{
                content.style.display ="none";
            }
        });
    });
});

document.getElementById('contact-tab').addEventListener('click', function(e) {
    e.preventDefault();

    // Unhighlight all tabs
    tabs.forEach(function(tab) {
        tab.classList.remove("active");
    });
    tabs_wrap.forEach(function(content) {
        content.style.display = 'none';
    });

    // Show the contact content
    const contactWrap = document.getElementById('contact-content');
    contactWrap.style.display = 'block';

    // Fetch the contact info from the PHP backend
    fetch('../middleend/get_contacts.php') 
        .then(response => response.json())
        .then(data => {
            let html = '<div class="contact-grid">';
            data.forEach(contact => {
                const fullName = `${contact.firstname} ${contact.lastname}`;
                html += `
                    <div class="contact-card">
                        <strong>${fullName}</strong>
                        <div>Office: ${contact.office}</div>
                        <div>Email: ${contact.email}</div>
                        <div>Phone: ${contact.phonenumber}</div>
                    </div>
                `;
            });
            html += '</div>';
            document.getElementById('contact-info').innerHTML = html;
        })
        .catch(error => {
            document.getElementById('contact-info').innerHTML = '<p>Failed to load contacts.</p>';
            console.error('Error:', error);
        });
});

// Course Filter Function
function filterCourses() {
    const searchInput = document.getElementById('courseSearch').value.toLowerCase();
    const courseTable = document.getElementById('coursesTable');
    const rows = courseTable.getElementsByTagName('tr');

    for (let i = 1; i < rows.length; i++) { // Start at 1 to skip the header row
        const cells = rows[i].getElementsByTagName('td');
        let rowMatch = false;

        for (let j = 0; j < cells.length; j++) {
            if (cells[j].innerText.toLowerCase().includes(searchInput)) {
                rowMatch = true;
                break;
            }
        }

        rows[i].style.display = rowMatch ? "" : "none";
    }
}
// Filter Contacts
function filterContacts() {
    const searchInput = document.getElementById('contactSearch').value.toLowerCase();
    const contactCards = document.querySelectorAll('.contact-card');

    contactCards.forEach(card => {
        const name = card.querySelector('strong').innerText.toLowerCase();
        const match = name.includes(searchInput);
        card.style.display = match ? 'block' : 'none';
    });
}

//Tab for student name
const btns = document.querySelectorAll('.btn')
const tabContents = document.querySelectorAll(".student-info");


btns.forEach(btn => {
    btn.addEventListener("click", () =>{
        btns.forEach((btn) => btn.classList.remove("active"));
        tabContents.forEach(tabContents=> tabContents.classList.remove("active"));
        btn.classList.add("active");
        document.querySelector(btn.dataset.target).classList.add("active");
    });
});

// Student pin/add/drop courses
let generatedPIN = null;

let enrolledCourses = [
    { id: 1, name: "Math 101" },
    { id: 2, name: "History 205" }
  ];
  
  const allCourses = [
    { id: 1, name: "Math 101" },
    { id: 2, name: "History 205" },
    { id: 3, name: "CS 201" },
    { id: 4, name: "Biology 101" },
    { id: 5, name: "Art 110" }
  ];

function generatePIN() {
  generatedPIN = Math.floor(1000 + Math.random() * 9000); // 4-digit
  document.getElementById("generated-pin").innerText = `PIN: ${generatedPIN}`;
  document.getElementById("pin-error").innerText = "";
}

function verifyPIN() {
  const entered = document.getElementById("entered-pin").value;
  if (parseInt(entered) === generatedPIN) {
    document.getElementById("pin-section").style.display = "none";
    document.getElementById("course-manager-section").style.display = "block";
    loadCourseTables();
  } else {
    document.getElementById("pin-error").innerText = "Incorrect PIN. Try again.";
  }
}

function goBackToPin() {
  generatedPIN = null;
  document.getElementById("entered-pin").value = "";
  document.getElementById("generated-pin").innerText = "";
  document.getElementById("pin-section").style.display = "block";
  document.getElementById("course-manager-section").style.display = "none";
}
function loadCourseTables() {
    console.log("Loading course tables...");
    const studentTable = document.querySelector("#student-courses-table tbody");
    studentTable.innerHTML = "";
    enrolledCourses.forEach((course) => {
      const row = document.createElement("tr");
      row.innerHTML = `
        <td>${course.name}</td>
        <td><button class="drop-btn" data-courseid="${course.id}">Drop</button></td>
      `;
      studentTable.appendChild(row);
    });
  
    const allTable = document.querySelector("#all-courses-table tbody");
    allTable.innerHTML = "";
    allCourses.forEach(course => {
      if (!enrolledCourses.some(c => c.id === course.id)) {
        const row = document.createElement("tr");
        row.innerHTML = `
          <td>${course.name}</td>
          <td><button class="add-btn" data-courseid="${course.id}">Add</button></td>
        `;
        allTable.appendChild(row);
      }
    });
  
    attachCourseEventListeners(); // rebind buttons
  }

  function addCourse(id) {
    console.log("Clicked Add for course", id);

    fetch('enroll_course.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'courseid=' + encodeURIComponent(id)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Add the course to enrolledCourses and refresh the table
            const course = allCourses.find(c => c.id === id);
            if (course) {
                enrolledCourses.push(course);
                loadCourseTables();
            }
        } else {
            console.error("Failed to enroll:", data.message);
        }
    })
    .catch(error => {
        console.error("AJAX error:", error);
    });
}




function dropCourse(id) {
    enrolledCourses = enrolledCourses.filter(course => course.id !== id);
    loadCourseTables();
}

function attachCourseEventListeners() {
    console.log("Attaching event listeners...");
    document.querySelectorAll('.add-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            const courseId = parseInt(btn.dataset.courseid);
            addCourse(courseId);
        });
    });

    document.querySelectorAll('.drop-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            const courseId = parseInt(btn.dataset.courseid);
            dropCourse(courseId);
        });
    });
}

function loadUsers() {
    fetch('../middleend/get_users.php') 
        .then(response => response.text())
        .then(data => {
            document.getElementById("userList").innerHTML = data;
        })
        .catch(error => console.error('Error fetching users:', error));
}

window.loadAccounts = function(role) {
    const url = `../middleend/manage_user.php?role=${role}&context=limited`;

    console.log("Fetching:", url);
    fetch(url)
        .then(response => response.text())
        .then(data => {
            console.log("Response received:", data);
            document.getElementById("accountList").innerHTML = data;
        })
        .catch(error => console.error('Error fetching accounts:', error));
}

function loadAllAccounts(role) {
    fetch('../middleend/manage_user.php?role=all&context=full')

        .then(response => response.text())
        .then(data => {
            document.getElementById("allAccountList").innerHTML = data;
        })
        .catch(error => console.error('Error fetching accounts:', error));
}

function filterAccounts() {
    const input = document.getElementById("accountSearch").value.toLowerCase();
    const rows = document.querySelectorAll("#allAccountList table tr");

    for (let i = 1; i < rows.length; i++) {
        const rowText = rows[i].innerText.toLowerCase();
        rows[i].style.display = rowText.includes(input) ? "" : "none";
    }
}
// // Declare a global variable to store the studentId
// let currentStudentId = null;
// function showAdvisorList(studentId) {
//     currentStudentId = studentId;
    
//     var studentList = document.getElementById("studentList");
//     var advisorList = document.getElementById("advisorList");

//     console.log("showing advisor list");
//     console.log("studentList:", studentList);
//     console.log("advisorList:", advisorList);

//     if (studentList && advisorList) {
//         // Hide the student list and show the advisor list
//         studentList.style.display = "none";
//         advisorList.style.display = "block";
//     } else {
//         console.error("Required DOM elements not found!");
//     }
// }

// function showStudentList() {
//     var studentList = document.getElementById("studentList");
//     var advisorList = document.getElementById("advisorList");

//     console.log("showing student list");
//     console.log("studentList:", studentList);
//     console.log("advisorList:", advisorList);

//     if (studentList && advisorList) {
//         // Hide the advisor list and show the student list
//         advisorList.style.display = "none";
//         studentList.style.display = "block";
//     } else {
//         console.error("Required DOM elements not found!");
//     }

// }


// Function to show advisor list and pass student ID
function showAdvisorList(studentId) {
    // Store the student ID in the hidden input field
    document.getElementById('currentStudentId').value = studentId;

    // Hide the student list and show the advisor list
    document.getElementById('studentList').style.display = 'none';
    document.getElementById('advisorList').style.display = 'block';
}

// Function to go back to student list
function showStudentList() {
    document.getElementById('advisorList').style.display = 'none';
    document.getElementById('studentList').style.display = 'block';
}
function changeAdvisor(facultyid) {
    var studentId = document.getElementById('currentStudentId').value;
    console.log("Student ID: " + studentId);
    console.log("Faculty ID: " + facultyid);

    // Make an AJAX request to update the advisor
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '../middleend/update_advisor.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // On success, display the response from PHP
            alert(xhr.responseText); // You can also log this if needed
            console.log(xhr.responseText); // For debugging
        }
    };

    // Send studentId and facultyId to PHP for processing
    xhr.send('student_id=' + studentId + '&faculty_id=' + facultyid);
}
// // Function to change advisor when the user selects one
// function changeAdvisor() {
//     // Get the student ID and advisor ID
//     var studentId = document.getElementById('currentStudentId').value;
//     var advisorId = event.target.getAttribute('data-advisor-id');

//     // Use AJAX to update the advisor in the database
//     var xhr = new XMLHttpRequest();
//     xhr.open('POST', 'update_advisor.php', true);
//     xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
//     xhr.onreadystatechange = function() {
//         if (xhr.readyState === 4 && xhr.status === 200) {
//             // Handle the response (you can show a success message or handle errors here)
//             alert('Advisor changed successfully!');
            
//             // Optionally, reload the student list to reflect changes
//             showStudentList();
//         }
//     };

//     xhr.send('student_id=' + studentId + '&advisor_id=' + advisorId);
// }


function addUser() {
    window.location.href = '../middleend/add_user.php'
}

//window.onload = loadAccounts('students');
