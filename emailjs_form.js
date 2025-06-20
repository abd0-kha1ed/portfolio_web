function sendEmail(name, email, message) {
    emailjs.send("service_trawkg3", "template_984x1rb", {
        name: name,
        email: email,
        message: message,
        title: "Portfolio Contact"
    }, "Rw1ba00Vl6XaruwD5")
    .then(function(response) {
        console.log("SUCCESS!", response.status, response.text);
        alert("Message sent successfully!");
    }, function(error) {
        console.log("FAILED...", error);
        alert("Failed to send message.");
    });
}
