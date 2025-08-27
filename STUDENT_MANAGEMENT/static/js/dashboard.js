function logout() {
    window.location.href = "/logout";
}

function fetchStudents() {
    fetch('/get_students')
        .then(response => response.json())
        .then(data => {
            let table = document.getElementById("studentTable");
            table.innerHTML = "";
            data.forEach(student => {
                let row = `<tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.age}</td>
                    <td>${student.grade}</td>
                    <td>
                        <button class="edit-btn" onclick="editStudent(${student.id})">✏️ Edit</button>
                        <button class="delete-btn" onclick="deleteStudent(${student.id})">🗑 Delete</button>
                    </td>
                </tr>`;
                table.innerHTML += row;
            });
        });
}

function deleteStudent(id) {
    if (confirm("Are you sure you want to delete this student?")) {
        fetch('/delete_student', {
            method: 'POST',
            body: new URLSearchParams({ 'id': id }),
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        }).then(() => fetchStudents());
    }
}
