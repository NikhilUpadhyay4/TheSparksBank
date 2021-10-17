<%@page import="java.sql.*"%>
<%
           Connection con = null;
           PreparedStatement ps = null;
           ResultSet rs = null;
           try
           {
             Class.forName("com.mysql.jdbc.Driver");
           }
           catch(Exception ex)
           {
               ex.printStackTrace();
           }
           try
           {
           con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","");
           }
           catch(Exception ex)
           {
               
               ex.printStackTrace();
           }
%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Spark Bank Of India</title>
</head>
<style>
    .background{
        background: url("bank3.jpg") no-repeat center;
        width: 100vw;
    }
</style>
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
  
     <div class="container-fluid  ">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <center><h3 style="padding-top: 22px">Account Holder Details</h3></center>
                <br>
                <table class="table table-bordered table-responsive">
                    <tr>
                        <th>S.No</th>
                        <th>Customer Name</th>
                        <th>Account no</th>
                        <th>Email</th>
                        <th>Transfer History</th>
                        
                    </tr>
                    
                        <%
                            int i=1;
                            try
                            {
                                ps=con.prepareStatement("select * from customer");
                                rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    %>
                                    <tr>
                                        <th><%=i %></th>
                                        <th><%=rs.getString("name") %></th>
                                        <th><%=rs.getString("account_no") %></th>
                                        <th><%=rs.getString("email") %></th>
                                        <th><a href="cust_details.jsp?id=<%=rs.getInt("customer_id") %>" >Click here for history</a></th>
                                         </tr>
                                    <%
                                        
                                    i++;    
                                }
                            }
                            catch(Exception ex)
                            {
                                ex.printStackTrace();
                            }
                        %>
                    
                </table>
                
            </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    

</body>

</html>