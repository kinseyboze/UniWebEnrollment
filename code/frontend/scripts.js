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

document.getElementById('email-tab').addEventListener('click', function(e) {
    e.preventDefault();

    // Unhighlight all tabs
    tabs.forEach(function(tab) {
        tab.classList.remove("active");
    });
    tabs_wrap.forEach(function(content) {
        content.style.display = 'none';
    });

    // Highlight the clicked tab and show the corresponding content
    const emailTab = document.getElementById('email-tab');
    emailTab.classList.add('active');

    // Show the email content
    const emailWrap = document.getElementById('email-content');
    emailWrap.style.display = 'block';

    // Fetch contacts from the backend
    fetch('../middleend/get_contacts.php') 
        .then(response => response.json())
        .then(data => {
            const recipientSelect = document.getElementById('email-recipient');
            recipientSelect.innerHTML = ''; // Clear any existing options

            // Create an option for each contact
            data.forEach(contact => {
                const option = document.createElement('option');
                option.value = contact.email;  // Use email as the value
                option.textContent = `${contact.firstname} ${contact.lastname}`;  // Display name
                recipientSelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error fetching contacts:', error);
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

function loadAccounts(role) {
    const container = document.getElementById("accountList");
    if (!container) return; // exit

    fetch(`../middleend/manage_user.php?role=${role}`)
        .then(response => response.text())
        .then(data => {
            container.innerHTML = data;
        })
        .catch(error => console.error('Error fetching accounts:', error));
}

function loadAllAccounts() {
    const container = document.getElementById("allAccountList");
    if (!container) return; // exit

    fetch('../middleend/manage_user.php?role=all&context=full')
        .then(response => response.text())
        .then(data => {
            container.innerHTML = data;
        })
        .catch(error => console.error('Error fetching accounts:', error));
}

window.addEventListener("load", function () {
    const hasAccountList = document.getElementById("accountList");
    const hasAllAccountList = document.getElementById("allAccountList");
    const hasBuildingList = document.getElementById("buildingList");

    // Only calls loadAccounts if accountList exists
    if (hasAccountList) {
        loadAccounts('student');
    }

    // Only calls loadAllAccounts if allAccountList exists
    if (hasAllAccountList) {
        loadAllAccounts();
    }

    // Only calls loadBuildings if buildingList exists
    if (hasBuildingList) {  
        loadBuildings();
    }
});

function filterAccounts() {
    const input = document.getElementById("accountSearch").value.toLowerCase();
    const rows = document.querySelectorAll("#allAccountList table tr");

    for (let i = 1; i < rows.length; i++) {
        const rowText = rows[i].innerText.toLowerCase();
        rows[i].style.display = rowText.includes(input) ? "" : "none";
    }
}


function showAdvisorList(studentId) {
    // Store the student ID in the hidden input field
    document.getElementById('currentStudentId').value = studentId;

    document.getElementById('studentList').style.display = 'none';
    document.getElementById('advisorList').style.display = 'block';
}
function showOrganizationList() {
    document.getElementById('organizationList').style.display = 'block';
    document.getElementById('organizationAdd').style.display = 'none';
}
function showOrganizationAdd() {
    document.getElementById('organizationAdd').style.display = 'block';
    document.getElementById('organizationList').style.display = 'none';
    setupAddOrganizationForm();
}
function showInternshipAdd() {
    document.getElementById('internshipList').style.display = 'none';
    document.getElementById('internshipAdd').style.display = 'block';
    setupInternshipForm();
}

function showInternshipList() {
    document.getElementById('internshipList').style.display = 'block';
    document.getElementById('internshipAdd').style.display = 'none';
}
function setupInternshipForm() {
    const form = document.getElementById("addInternshipForm");

    if (!form) return;

    form.addEventListener("submit", function(event) {
        event.preventDefault();

        const formData = new FormData(form);

        fetch('../middleend/add_internship.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {

            form.reset();
            
            showInternshipList();
        })
        .catch(error => console.error("Error:", error));
    });
}
function setupAddOrganizationForm() {
    const form = document.getElementById("addOrganizationForm");

    if (!form) return;

    form.addEventListener("submit", function(event) {
        event.preventDefault(); 

        const formData = new FormData(form);

        fetch("../middleend/add_organization.php", {
            method: "POST",
            body: formData
        })
        .then(response => response.text())
        .then(data => {

            // clear the form
            form.reset();

            showOrganizationList();
        })
        .catch(error => {
            document.getElementById("orgAddMessage").innerHTML = "Error: " + error;
        });
    });
}


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
            alert(xhr.responseText); 
            console.log(xhr.responseText); 
        }
    };

    // Send studentId and facultyId to PHP for processing
    xhr.send('student_id=' + studentId + '&faculty_id=' + facultyid);
}

function addUser() {
    window.location.href = '../middleend/add_user.php'
}

function loadBuildings() {
    fetch('../middleend/get_buildings.php')
        .then(response => response.text())
        .then(data => {
            document.getElementById('buildingList').innerHTML = data;
        })
        .catch(error => console.error('Error loading buildings:', error));
}

function editBuilding(id) {
    window.location.href = `../middleend/edit_building.php?id=${id}`;
}

function deleteBuilding(id) {
    if (confirm("Are you sure you want to delete this building?")) {
        window.location.href = `../middleend/delete_building.php?id=${id}`;
    }
}

function viewRooms(buildingId) {
    window.location.href = `../middleend/manage_room.php?buildingid=${buildingId}`;
}

function addRoom(buildingId) {
    window.location.href = `../middleend/add_room.php?buildingid=${buildingId}`;
}

// used to direct user to the correct tab within the page
window.addEventListener("DOMContentLoaded", function () {
    const hash = window.location.hash.replace("#", ""); // e.g., "accounts"

    if (hash) {
        const tabButton = document.getElementById("tab-" + hash);
        if (tabButton) {
            tabButton.click();
        }
    }
 });
 
 //Student info
document.querySelectorAll(".btn[data-target]").forEach(button => {
    button.addEventListener("click", () => {
        const targetId = button.getAttribute("data-target");
        document.querySelectorAll(".student-info").forEach(info => {
            info.style.display = "none";
        });
        const target = document.querySelector(targetId);
        if (target) target.style.display = "block";
    });
});

