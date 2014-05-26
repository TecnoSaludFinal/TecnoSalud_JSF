/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.Inicio;

import app.entity.Administrador;
import app.entity.Medicos;
import app.entity.Pacientes;
import app.entity.PersonalAdministrativo;
import java.io.IOException;
import java.io.PrintWriter;
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
public class GestionDatosPersonales extends HttpServlet
{

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
        Integer idRol;
        HttpSession session;
        
        Pacientes p;
        Medicos m;
        PersonalAdministrativo pa;
        Administrador a;

        session = request.getSession(false);
        
        if(session == null)
        {
            //Error
        }
        else
        {
            idRol = (Integer) session.getAttribute("id");
            if(idRol == 1)
            {
                p = (Pacientes) session.getAttribute("entidad");
                
                session.setAttribute("entidad", p);
                
                rd = getServletContext().getRequestDispatcher("/datosPersonales.jsp");//Listado paciente
            }
            else if(idRol == 2)
            {
                m = (Medicos) session.getAttribute("entidad");
                
                session.setAttribute("entidad", m);
                
                rd = getServletContext().getRequestDispatcher("/datosPersonales.jsp");//Listado paciente
            }
            else if(idRol == 3)
            {
                pa = (PersonalAdministrativo) session.getAttribute("entidad");
                
                session.setAttribute("entidad", pa);
                
                rd = getServletContext().getRequestDispatcher("/datosPersonales.jsp");//Listado paciente
            }
            else
            {
                a = (Administrador) session.getAttribute("entidad");
                
                session.setAttribute("entidad", a);
                
                rd = getServletContext().getRequestDispatcher("/datosPersonales.jsp");//Listado paciente
            }
            
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
