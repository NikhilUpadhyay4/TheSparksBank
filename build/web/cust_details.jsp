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
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
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
             int id=(int)session.getAttribute("id");
              con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","");
              ps=con.prepareStatement("select * from customer where customer_id='"+id+"'");
              rs=ps.executeQuery();
              if(rs.next())
              {
                  %>
                  <table class="table table-bordered">
                      <tr>
                          <th>Account No</th>
                          <td><%=rs.getString("account_no")%></td>
                      </tr>
                      <tr>
                          <th>Balance</th>
                          <td><%=rs.getInt("balance")%></td>
                      </tr>
                  </table>
                  <br>
                  <a href="#" id="tt">Transaction Details</a>    
                  <%
              }
             }
              catch(Exception ex)
              {
                  ex.printStackTrace();
              }
             %>
             <br>
             <br>
             <div id="ss" style="display:none;">
              <table class="table table-bordered">
                  <tr>
                      <th>S.No</th>
                      <th>Amount</th>
                      <th>To</th>
                      <th>Date</th>
                      <th>Status</th>
                  </tr>
               <%
             try
             {
                 int i=1;
              int id=(int)session.getAttribute("id");
              con = DriverManager.getConnection("jdbc:mysql://localhost/bank","root","");
              PreparedStatement ps2=con.prepareStatement("select * from transations where customer_id='"+id+"'");
              ResultSet rs2=ps2.executeQuery();
              while(rs2.next())
              {
                  %>
                  <tr>
                      <td><%=i %></td>
                      <td><%=rs2.getString("amount") %></td>
                      <td><%=rs2.getString("to_acc") %></td>
                      <td><%=rs2.getString("transation_data") %></td>
                      <td><%=rs2.getString("transation_status") %></td>
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
            </div>
            <div class="col-sm-2"></div>
        </div>
    </div>
           
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ"
        crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      
        <script>
            $(document).ready(function()
            {
                 $("#tt").click(function()
                 {
                      $("#ss").show();
                 });   
            });
        </script>
  </html>
