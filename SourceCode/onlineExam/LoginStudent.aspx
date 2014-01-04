<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginStudent.aspx.cs" Inherits="onlineExam.LoginStudent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Style/login.css" />
    <link rel="stylesheet" type="text/css" href="Style/grid.css" />
    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=btnSave]").bind("click", function () {
                var user = {};
                user.Username = $("[id*=txtRegUsername]").val();
                user.Password = $("[id*=txtRegPassword]").val();
                user.Email = $("[id*=txtRegEmail]").val();
                user.FullName = $("[id*=txtRegFullName]").val();
                $.ajax({
                    type: "POST",
                    url: "LoginStudent.aspx/SaveUser",
                    data: '{user: ' + JSON.stringify(user) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("User has been added successfully.");
                        var txtRegUsername = document.getElementById("txtRegUsername");
                        txtRegUsername.value = "";
                        var txtRegPassword = document.getElementById("txtRegPassword");
                        txtRegPassword.value = "";
                        var txtRegEmail = document.getElementById("txtRegEmail");
                        txtRegEmail.value = "";
                        var txtRegFullName = document.getElementById("txtRegFullName");
                        txtRegFullName.value = "";

                    }
                });
                return false;
            });
        });
    </script>
    <style type="text/css">
        cufon
        {
            text-indent: 0 !important;
        }
        .submit
        {
            background-color: #68b12f;
            background: -webkit-gradient(linear, left top, left bottom, from(#68b12f), to(#50911e));
            background: -webkit-linear-gradient(top, #68b12f, #50911e);
            background: -moz-linear-gradient(top, #68b12f, #50911e);
            background: -ms-linear-gradient(top, #68b12f, #50911e);
            background: -o-linear-gradient(top, #68b12f, #50911e);
            background: linear-gradient(top, #68b12f, #50911e);
            border: 1px solid #509111;
            border-bottom: 1px solid #5b992b;
            border-radius: 3px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            -ms-border-radius: 3px;
            -o-border-radius: 3px;
            box-shadow: inset 0 1px 0 0 #9fd574;
            -webkit-box-shadow: 0 1px 0 0 #9fd574 inset;
            -moz-box-shadow: 0 1px 0 0 #9fd574 inset;
            -ms-box-shadow: 0 1px 0 0 #9fd574 inset;
            -o-box-shadow: 0 1px 0 0 #9fd574 inset;
            color: white;
            font-weight: bold;
            padding: 6px 20px;
            text-align: center;
            text-shadow: 0 -1px 0 #396715;
        }
        .submit:hover
        {
            opacity: .85;
            cursor: pointer;
        }
        .submit:active
        {
            border: 1px solid #20911e;
            box-shadow: 0 0 10px 5px #356b0b inset;
            -webkit-box-shadow: 0 0 10px 5px #356b0b inset;
            -moz-box-shadow: 0 0 10px 5px #356b0b inset;
            -ms-box-shadow: 0 0 10px 5px #356b0b inset;
            -o-box-shadow: 0 0 10px 5px #356b0b inset;
        }
        @media screen,projection
        {
            cufon
            {
                display: inline !important;
                display: inline-block !important;
                position: relative !important;
                vertical-align: middle !important;
                font-size: 1px !important;
                line-height: 1px !important;
            }
            cufon cufontext
            {
                display: -moz-inline-box !important;
                display: inline-block !important;
                width: 0 !important;
                height: 0 !important;
                overflow: hidden !important;
                text-indent: -10000in !important;
            }
            cufon canvas
            {
                position: relative !important;
            }
        }
        @media print
        {
            cufon
            {
                padding: 0 !important;
            }
            cufon canvas
            {
                display: none !important;
            }
        }
    </style>
    <script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.main.js"></script>
    <script type="text/javascript" src="Scripts/cufon.js"></script>
    <script type="text/javascript" src="Scripts/cufon-fonts.js"></script>
    <script type="text/javascript" src="Scripts/cufon-settings.js"></script>
    <!--[if lt IE 8]><link rel="stylesheet" type="text/css" href="assets/css/ie.css" media="screen"/><![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="wrapper">
            <!-- main -->
            <div id="main">
                <div class="main-holder">
                    <!-- content -->
                    <div id="content">
                        <div class="content-area container_12">
                            <h1 class="logo vcard">
                                <a class="fn org url" rel="inner" href="Default.aspx"></a>
                            </h1>
                            <div class="content-holder">
                                <div class="content-frame loginSuccess-holder">
                                    <div class="login-box page-main page-active" style="opacity: 1;">
                                        <div class="heading-holder">
                                            <h2>
                                                <span>
                                                    <cufon class="cufon cufon-canvas" alt="Students" style="width: 270px; height: 50px;"><canvas width="298" height="51" style="width: 298px; height: 51px; top: 2px; left: -3px;"></canvas><cufontext>Students</cufontext></cufon>
                                                </span>
                                            </h2>
                                        </div>
                                        <div>
                                            <fieldset>
                                                <div class="row">
                                                    <label for="Username">
                                                        Username</label>
                                                    <span class="text">
                                                        <input runat="server" id="txtUsername" class="required" name="username" type="text"
                                                            value="" tabindex="1"></span>
                                                </div>
                                                <div class="row">
                                                    <a href="#" class="forgot">SIGN UP</a>
                                                    <label for="Password">
                                                        Password</label>
                                                    <span class="text">
                                                        <input runat="server" id="txtPassword" class="required" name="password" type="password"
                                                            value="" tabindex="2" style="display: inline-block;"><input type="text" style="display: none;"></span>
                                                </div>
                                                <div class="check-holder">
                                                    <div class="check-frame">
                                                        <input id="Show-password" name="show" type="checkbox" class="check">
                                                        <label for="Show-password">
                                                            Show password</label>
                                                    </div>
                                                </div>
                                                <div class="check-container">
                                                    <input id="Remember" type="checkbox" name="rememberme" class="check" value="1">
                                                    <label for="Remember">
                                                        Remember me</label>
                                                </div>
                                                <div style="margin: 10px 0 0 130px;">
                                                    <asp:Button ID="btnLogin" class="submit" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                                </div>
                                                <%--     <a href="#" class="button">
                                                    <cufon class="cufon cufon-canvas" alt="Login" style="width: 102px; height: 32px;"><canvas width="115" height="34" style="width: 115px; height: 34px; top: 1px; left: -3px;"></canvas><cufontext>Login</cufontext></cufon>
                                                </a>--%>
                                                <%-- <input type="submit" class="hidden" value="Login" tabindex="3">--%>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="login-box page-success" style="opacity: 0;">
                                        <div class="login-box-holder">
                                            <span class="success">Login successful</span>
                                        </div>
                                    </div>
                                    <div style=" margin:10px; color:Red; font-size:16px; ">
                                       
                                            <asp:Label ID="lblUyari" runat="server" Text=""></asp:Label>
                                      
                                    </div>
                                    <div class="login-box page-password" style="opacity: 0;">
                                        <%--<div class="heading-holder">
                                            <h2>
                                                <span>
                                                    <cufon class="cufon cufon-canvas" alt="Teachers" style="width: 270px; height: 50px;"><canvas width="298" height="51" style="width: 298px; height: 51px; top: 2px; left: -3px;"></canvas><cufontext>Teachers</cufontext></cufon>
                                                </span>
                                            </h2>
                                        </div>--%>
                                        <div>
                                            <fieldset>
                                                <div class="row">
                                                    <label for="register">
                                                        UserName</label>
                                                    <span class="text padding">
                                                        <input runat="server" id="txtRegUsername" name="email" class="required-email" type="text"
                                                            ></span>
                                                </div>
                                                <div class="row">
                                                    <label for="Password">
                                                        Password</label>
                                                    <span class="text">
                                                        <input runat="server" id="txtRegPassword" class="required" name="password" type="password"
                                                            value="" tabindex="2" style="display: inline-block;"  /></span>
                                                </div>
                                                <div class="row">
                                                    <label for="Password">
                                                        E-mail</label>
                                                    <span class="text">
                                                        <input runat="server" id="txtRegEmail" class="required" value="" tabindex="2" style="display: inline-block;"
                                                             /></span>
                                                </div>
                                                <div class="row">
                                                    <label for="Password">
                                                        Full Name</label>
                                                    <span class="text">
                                                        <input runat="server" id="txtRegFullName" class="required" value="" tabindex="2"
                                                            style="display: inline-block;" ></span>
                                                </div>
                                                <div style="margin: 10px 0 0 130px;">
                                                    <asp:Button ID="btnSave" class="submit" runat="server" Text="Save" OnClick="btnLogin_Click" />
                                                    <div style="margin-left: 101px; margin-top: -34px;">
                                                        <span class="nevermind"><a href="#">Oh, nevermind.</a></span></div>
                                                </div>
                                                <%--  <a href="#" class="button">
                                                    <cufon class="cufon cufon-canvas" alt="SEND" style="width: 85px; height: 32px;"><canvas width="99" height="34" style="width: 99px; height: 34px; top: 1px; left: -3px;"></canvas><cufontext>SEND</cufontext></cufon>
                                                </a>
                                                --%>
                                            </fieldset>
                                        </div>
                                        <%--   <div class="text-holder">
                                            <p>
                                                If we have it on file we’ll send it along.</p>

                                        </div>--%>
                                        <%--    <div>
                                            <fieldset>
                                                <div class="row">
                                                    <label for="email">
                                                        Email</label>
                                                    <span class="text padding">
                                                        <input id="email" name="email" class="required-email" type="text"></span>
                                                </div>
                                                <a href="#" class="button">
                                                    <cufon class="cufon cufon-canvas" alt="SEND" style="width: 85px; height: 32px;"><canvas width="99" height="34" style="width: 99px; height: 34px; top: 1px; left: -3px;"></canvas><cufontext>SEND</cufontext></cufon>
                                                </a>
                                                <input type="submit" class="hidden" value="SEND">
                                                <span class="nevermind"><a href="#">Oh, nevermind.</a></span>
                                            </fieldset>
                                        </div>--%>
                                    </div>
                                    <div class="login-box page-password-success" style="opacity: 0;">
                                        <div class="login-box-holder">
                                            <span class="success">Your login info has been emailed to you</span> <span class="return">
                                                <a class="home-back" href="#">Return to login?</a></span>
                                        </div>
                                    </div>
                                    <div class="login-box page-password-failure" style="opacity: 0;">
                                        <div class="login-box-holder">
                                            <span class="fail">That email is not register with us.</span> <span class="return"><a
                                                class="mail-back" href="#">Try again?</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- header -->
                    <div id="header">
                        <div class="header-area container_12 clearfix">
                            <div class="grid_12">
                                <!-- login -->
                                <a href="LoginTeacher.aspx" class="login-link"><span>
                                    <cufon class="cufon cufon-canvas" alt="Teacher " style="width: 61px; height: 16px;"><canvas width="75" height="16" style="width: 75px; height: 16px; top: 1px; left: -1px;"></canvas><cufontext>Teacher </cufontext></cufon>
                                    <cufon class="cufon cufon-canvas" alt="login" style="width: 37px; height: 16px;"><canvas width="46" height="16" style="width: 46px; height: 16px; top: 1px; left: -1px;"></canvas><cufontext>login</cufontext></cufon>
                                </span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer -->
            <div id="footer">
                <div class="footer-holder">
                    <div class="footer-frame">
                        <div class="footer-container">
                            <p>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
