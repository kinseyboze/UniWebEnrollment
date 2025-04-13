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