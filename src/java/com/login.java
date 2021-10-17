/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nikhil Upadhyay
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
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
           ps=con.prepareStatement("select * from customer where username='"+request.getParameter("username")+"' and password='"+request.getParameter("password")+"'");
           rs=ps.executeQuery();
           if(rs.next())
           {
               int id=rs.getInt("customer_id");
               HttpSession session=request.getSession();
               session.setAttribute("id",id);
               
               response.sendRedirect("transfer.jsp");
           }
           else
           {
               out.print("<script>"
                       + "alert('Login Failed');"
                       + "window.location='transfer-login.jsp';"
                       + "</script>");
           }
           }
           catch(Exception ex)
           {
               
               ex.printStackTrace();
           }     
        
        
        }
    }

   