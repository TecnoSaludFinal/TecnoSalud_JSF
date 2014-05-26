/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.servlet;

import app.dao.CitasFacadeLocal;
import app.dao.EspecialidadFacadeLocal;
import app.dao.HoraFacadeLocal;
import app.dao.PersonalAdministrativoFacadeLocal;
import app.entity.Citas;
import app.entity.Especialidad;
import app.entity.Hora;
import app.entity.Pacientes;
import app.entity.PersonalAdministrativo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deiver
 */
public class EnviarAnandirCitaServlet extends HttpServlet
{
    @EJB
    private EspecialidadFacadeLocal efl;
    
    @EJB
    private HoraFacadeLocal hfl;
    
    @EJB
    private PersonalAdministrativoFacadeLocal pafl;

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
            throws ServletException, IOException
    {
        RequestDispatcher rd;
        HttpSession session;
        PersonalAdministrativo pa;
                
        List<Especialidad> e = (List<Especialidad>) efl.findAll();
        List<Hora> h = (List<Hora>) hfl.findAll();
        
        request.setAttribute("listaEspe", e);
        request.setAttribute("listaHora", h);
        
        session = request.getSession(false);
        
        if(session == null)
        {
            rd = getServletContext().getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }
        else
        {
            PersonalAdministrativo p = (PersonalAdministrativo) session.getAttribute("entidad");//Recoge null
        
            pa = pafl.findByDni(p.getDni());
        
            request.setAttribute("pa", pa);
            
            rd = getServletContext().getRequestDispatcher("/deiver/AnadirCita.jsp");
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
