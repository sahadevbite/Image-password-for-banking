/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.Apply2;
import uk.ac.dundee.computing.aec.instagrim.models.CRequest2;
import uk.ac.dundee.computing.aec.instagrim.lib.Keyspaces;


/**
 *
 * @author Administrator
 */
@WebServlet(name = "Requ", urlPatterns = {"/Requ"})
public class CrtRequ extends HttpServlet {
    Cluster cluster=null;
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }




    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String Acc=request.getParameter("Acc");
        String Reqno=request.getParameter("Reqno");
        String DOR = request.getParameter("DOR");
        String TOR = request.getParameter("TOR");
        String Comm = request.getParameter("Comm");
        
       
    
        CRequest2 rs=new CRequest2();
        rs.setCluster(cluster);
        rs.CRequest(Acc,Reqno,DOR,TOR,Comm);
        
        request.setAttribute("Acc", Acc);
        request.setAttribute("Reqno", Reqno);
        RequestDispatcher rd=request.getRequestDispatcher("Index2.jsp");
    rd.forward(request,response);
        
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
