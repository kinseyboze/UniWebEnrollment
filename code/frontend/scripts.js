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

// Simulated course data for now (replace with PHP/DB later)
const enrolledCourses = ["Math 101", "History 205"];
const allCourses = ["Math 101", "History 205", "CS 201", "Biology 101", "Art 110"];

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
    const studentTable = document.querySelector("#student-courses-table tbody");
    studentTable.innerHTML = "";
    enrolledCourses.forEach((course, i) => {
      const row = document.createElement("tr");
      row.innerHTML = `<td>${course.name}</td>
                       <td><button class="drop-btn" data-courseid="${course.id}">Drop</button></td>`;
      studentTable.appendChild(row);
    });
  
    const allTable = document.querySelector("#all-courses-table tbody");
    allTable.innerHTML = "";
    allCourses.forEach(course => {
      if (!enrolledCourses.some(c => c.id === course.id)) {
        const row = document.createElement("tr");
        row.innerHTML = `<td>${course.name}</td>
                         <td><button class="add-btn" data-courseid="${course.id}">Add</button></td>`;
        allTable.appendChild(row);
      }
    });
  
    attachCourseEventListeners();
  }

function dropCourse(index) {
  const dropped = enrolledCourses.splice(index, 1);
  loadCourseTables(); // Refresh
}

function addCourse(course) {
  enrolledCourses.push(course);
  loadCourseTables(); // Refresh
}
