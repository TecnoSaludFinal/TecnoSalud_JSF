/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.inma;

import app.dao.PersonalAdministrativoFacadeLocal;
import app.entity.Administrador;
import app.entity.PersonalAdministrativo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Inma
 */
@WebServlet(name = "BorraDefinitivoServlet", urlPatterns = {"/BorraDefinitivoServlet"})
public class BorraDefinitivoServlet extends HttpServlet {
    
     @EJB
    private PersonalAdministrativoFacadeLocal facadePersonalAdmin;

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
        response.setContentType("text/html;charset=UTF-8");
        
         RequestDispatcher rd;
        //HttpSession
        HttpSession session;
        session = request.getSession(false);
        String dni;
        String password;
        
         
        if(session == null)
        {
             rd= this.getServletContext().getRequestDispatcher("/error.jsp");
             rd.forward (request, response);
        }
        else
        {
            Administrador a = (Administrador) session.getAttribute("entidad");
            Integer idRol = (Integer) session.getAttribute("id");
            
            session.setAttribute("entidad", a);
            session.setAttribute("id", idRol);
        }       
        
        String padmin;           
        
        padmin = (String) request.getParameter("id_personal_admin");
               
        PersonalAdministrativo userp = (PersonalAdministrativo) facadePersonalAdmin.findById(Integer.parseInt(padmin));
        
     // Eliminamos ese personal
        facadePersonalAdmin.remove(userp);
        
        List<PersonalAdministrativo> lista = (List<PersonalAdministrativo>) facadePersonalAdmin.findAll();
        for(int i=0;i<lista.size();i++)
        {
            PersonalAdministrativo Modpc = lista.get(i); 
            facadePersonalAdmin.actualizar(Modpc, i);
        }
     
     // Conexion entre servido y JSP   
        
        rd= this.getServletContext().getRequestDispatcher("/inma/Borrado.jsp");
        rd.forward(request, response);
        
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
