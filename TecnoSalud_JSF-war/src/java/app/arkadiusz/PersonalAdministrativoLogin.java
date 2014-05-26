/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.arkadiusz;

import app.entity.PersonalAdministrativo;
import app.dao.PersonalAdministrativoFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class PersonalAdministrativoLogin extends HttpServlet {
    @EJB
    private PersonalAdministrativoFacadeLocal paf1;
    boolean login = false;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password; 
        RequestDispatcher rd;
        PersonalAdministrativo pers;
        Integer dni;
        HttpSession session;
        dni = Integer.valueOf((String) request.getParameter("dni"));
        password = request.getParameter("pass");
        PrintWriter out = response.getWriter();
 
        pers = paf1.find(dni);
        
        if(dni == null || password == null )
        {      
            String error = "Rellena formulario";
            request.setAttribute("error", error);
        
            rd = getServletContext().getRequestDispatcher("/indexPaciente.jsp");
            rd.forward(request, response);
        }
        else if(pers == null)
        {
            String error = "Usuario no existe";
            request.setAttribute("error", error);
        
            rd = getServletContext().getRequestDispatcher("/indexPaciente.jsp");
            rd.forward(request, response);
        }
/*login*/ else if(dni == pers.getIdPersonalAdmin() && password.equals(pers.getContrasena()))
        {
            request.getSession().setAttribute("entidad", pers);
            session = request.getSession();
            
            rd = getServletContext().getRequestDispatcher("/arkadiusz/bienvenido.jsp");
            rd.forward(request, response);
        }
        else 
        {
            String error = "Contrasena no esta correcta";
            request.setAttribute("error", error);
            rd = getServletContext().getRequestDispatcher("/indexPaciente.jsp");
            rd.forward(request, response);        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
