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
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nikhil Upadhyay
 */
public class transfer extends HttpServlet {

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
           ps=con.prepareStatement("select * from customer where customer_id='"+request.getParameter("id")+"'");
           rs=ps.executeQuery();
           if(rs.next())
           {
               int balance=rs.getInt("balance");
               int amount=Integer.parseInt(request.getParameter("amount"));
               
               if(balance>amount)
               {
                   
                   
                   balance=balance-amount;
                   PreparedStatement ps2=con.prepareStatement("insert into transations values('"+request.getParameter("id")+"','"+amount+"','"+new Date()+"','success','"+request.getParameter("transfer_acc")+"')");
                   int p=ps2.executeUpdate();
                   if(p>0)
                   {
                       PreparedStatement ps3=con.prepareStatement("update customer set balance='"+balance+"' where customer_id='"+request.getParameter("id")+"'");
                       int p2=ps3.executeUpdate();
                       if(p2>0)
                       {
                             out.print("<script>"
                                     + "alert('Transfer Success');"
                                     + "window.location='cust_details.jsp';"
                                     + "</script>");
                       }   
                   }
                   else
                   {
                       PreparedStatement ps3=con.prepareStatement("insert into transations values('"+request.getParameter("id")+"','"+amount+"','"+new Date()+"','failed','"+request.getParameter("transfer_acc")+"')");
                       out.print("<script>"
                                     + "alert('Transfer Failed');"
                                     + "window.location='cust_details.jsp';"
                                     + "</script>");
                   }
               }
           }
           else
           {
               out.print("<script>"
                       + "alert('Invalid Process');"
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

   