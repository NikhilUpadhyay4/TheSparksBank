<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
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
        <table class="table table-bordered">
            <tr>
                <th>Customer Id</th>
                <th>Amount</th>
                <th>Transaction Data</th>
                <th>Transaction_status</th>
                <th>to Account</th>
            </tr>
             <%
        Connection con = null;
        Statement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            int id = (int) session.getAttribute("id");
            con = DriverManager.getConnection("jdbc:mysql://localhost/bank", "root", "");
            ps = con.createStatement();
            rs = ps.executeQuery("select * from transations");
            while (rs.next()) {
    %>
            <tr>
                <td><%=rs.getInt("customer_id")%></td>
                <td><%=rs.getString("amount")%></td>
                <td><%=rs.getString("transation_data")%></td>
                <td><%=rs.getString("transation_status")%></td>
                <td><%=rs.getString("to_acc")%></td>
            </tr>
            <%

                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>
        </table>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ"
    crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</html>
