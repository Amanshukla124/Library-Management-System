document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("login-form");
    const errorMessage = document.getElementById("error-message");

    loginForm.addEventListener("submit", function (event) {
        event.preventDefault();  // Prevent default form submission

        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        // Send login request via AJAX
        fetch("/login", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ username: username, password: password })
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === "success") {
                window.location.href = data.redirect_url;  // Redirect to dashboard
            } else {
                errorMessage.textContent = data.message;  // Show error message
                errorMessage.style.color = "red";  // Highlight error
            }
        })
        .catch(error => console.error("Error:", error));
    });
});
