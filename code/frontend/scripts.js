var tabs = document.querySelectorAll(".tabs ol li");
var tabs_wrap = document.querySelectorAll(".tab_wrap");

tabs.forEach(function(tab, tab_index){
    tab.addEventListener("click", function(){
        tabs.forEach(function(tab){
            tab.classList.remove("active");
        })
        tab.classList.add("active");

        tabs_wrap.forEach(function(content, content_index){
            if(content_index == tab_index){
                content.style.display ="block";

                if(tab_index === 0) {
                    loadUsers();
                }
                else if(tab_index === 1) {
                    loadAccounts();
                }
            }
            else{
                content.style.display ="none";
            }
        })
    })
})

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

function loadUsers() {
    fetch('../middleend/get_users.php') 
        .then(response => response.text())
        .then(data => {
            document.getElementById("userList").innerHTML = data;
        })
        .catch(error => console.error('Error fetching users:', error));
}

function loadAccounts(role = 'student') {
    fetch('../middleend/manage_user.php?role=${role}') 
        .then(response => response.text())
        .then(data => {
            document.getElementById("accountList").innerHTML = data;
        })
        .catch(error => console.error('Error loading accounts:', error));
}

function addUser() {
    window.location.href = '../middleend/add_user.php'
}

window.onload = loadUsers;
//window.onload = manageUsers;