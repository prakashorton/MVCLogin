$(document).ready(function () {
    $("#btnRegister").click(function () {
        const registerData = {
            "Name": $("#name").val(),
            "EmailId": $("#email").val(),
            "UserName": $("#username").val(),
            "Password": $("#password").val(),
            "Role": $("#role").val()
        };

        if (registerData.Name && registerData.EmailId && registerData.UserName && registerData.Password && registerData.Role) {
            if (ValidateEmail()) {
                $.ajax({
                    type: 'POST',
                    url: 'RegisterUser',
                    data: JSON.stringify(registerData),
                    success: function (data) {
                        ClearRegister();
                        alert(`Registered Successfully : ${data.Id}!`);
                    },
                    error: function (err) {
                        $("#username").val("");
                        $("#username").focus();
                        alert(registerData.UserName + " ..!!! User name already exists");
                    },
                    contentType: "application/json",
                    dataType: 'json'
                });
            } else {
                alert("Please enter valid email id.!!!");
            }            
        }
        else {
            alert("Please select all information to proceed.!!!")
        }        
    });

    function ClearRegister() {
        $("#name").val("");
        $("#email").val("");
        $("#username").val("");
        $("#password").val("");
        $("#role").val("-1");
    }

    function ValidateEmail(mail) {
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
            return (true)
        };
        return (false)
    }

    $("#btnSignOut").click(function () {
        window.location.href = '/Home/Login';
    });

    $("#btnLogin").click(function () {
        const userName = $("#Lusername").val(),
            password = $("#Lpassword").val(),
            loginData = {
                "UserName": userName,
                "Password": password
            };

        if (loginData.UserName && loginData.Password) {
            $.ajax({
                type: 'POST',
                url: 'CheckLogin',
                data: JSON.stringify(loginData),
                success: function (data) {
                    if (data) {
                        window.location.href = '/Home/Main?userName=' + loginData.UserName;
                    }
                    else
                        alert(`Login failed.! Try again`)
                },
                error: function (err) {
                    alert("Error in login.!!!")
                },
                contentType: "application/json",
                dataType: 'json'
            });
        }
        else {
            alert("Please enter username and password to proceed.!!!")
        }        
    });
});
