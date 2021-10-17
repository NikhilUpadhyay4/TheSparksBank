<%@page import="java.sql.*"%>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/bank", "root", "");
    } catch (Exception ex) {

        ex.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">

        <title>Application Form</title>
    </head>

    <body>
        <style>
            .heigth1{
                height: 80vh;
                margin: auto;
                max-width: 50vw;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            body{
                background: url("back4.jpg") no-repeat center;
            }
        </style>

        <nav class="navbar navbar-expand-lg navbar-light bg-light " style="padding:0">
            <div class="container-fluid">
                <a class="navbar-brand img-thumbnail" href="https://www.thesparksfoundationsingapore.org/"><img src="./logo_small.png"  width="25px" alt=""></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="./index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="https://www.thesparksfoundationsingapore.org/">About</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Contact Us</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Customer.jsp">Users</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Transfershow.jsp">Transfer</a>
                        </li>



                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>

        <div class="heigth1" >
            <form action="login" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1"style="font-size:22px" ><b>User Name</b></label>
                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username" autocomplete="off" placeholder="Enter User name">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" style="font-size:22px"><b>Password</b></label>
                    <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
                </div> 
                <button type="submit" class="btn btn-primary" style="margin-top: 17px ">Login</button>
            </form>
        </div>
        <!-- <footer class="container d-flex justify-content-center">
             <p class="float-end"><a href="#">Back to top</a></p>
             <p>© 2010–2021 Bank of AKTU, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
         </footer>-->

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ"
        crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.min.js" integrity="sha384-PsUw7Xwds7x08Ew3exXhqzbhuEYmA2xnwc8BuD6SEr+UmEHlX8/MCltYEodzWA4u" crossorigin="anonymous"></script>
        -->
    </body>

</html>