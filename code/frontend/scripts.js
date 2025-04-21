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
