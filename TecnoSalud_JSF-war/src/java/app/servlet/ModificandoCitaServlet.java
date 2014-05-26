/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.servlet;

import app.dao.CitasFacadeLocal;
import app.dao.EspecialidadFacadeLocal;
import app.dao.HoraFacadeLocal;
import app.dao.MedicosFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.entity.Citas;
import app.entity.Especialidad;
import app.entity.Hora;
import app.entity.Medicos;
import app.entity.Pacientes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.Calendar;
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
public class ModificandoCitaServlet extends HttpServlet
{
    @EJB
    private EspecialidadFacadeLocal efl;
    
    @EJB
    private MedicosFacadeLocal mfl;
    
    @EJB
    private PacientesFacadeLocal pfl;
    
    @EJB
    private CitasFacadeLocal cfl;
    
    @EJB
    private HoraFacadeLocal hfl;

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
        
        Citas c = new Citas();
        Especialidad e;
        Medicos m;
        Pacientes p;
        Hora h;
        
        session = request.getSession(false);
        
        if(session == null)
        {
            rd = getServletContext().getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }
        c.setIdCitas(Integer.parseInt(request.getParameter("idCita")));
        c.setFecha(Date.valueOf(request.getParameter("fecha")));
        
        Time hora = Time.valueOf(request.getParameter("hora"));
        h = hfl.findByHora(hora);
        c.setIdHora(h);
        
        e = efl.findByNombre(request.getParameter("nomEspecialidad"));
        c.setIdEspecialidad(e);
 
        m = mfl.findById(Integer.parseInt(request.getParameter("idMedico")));
        c.setIdMedicos(m);
        
        c.setLocalizacion(request.getParameter("localizacion"));
        
        p = pfl.findByDni(request.getParameter("idPaciente"));
        c.setNushaPaciente(p);
        
        cfl.edit(c);
                
        rd = getServletContext().getRequestDispatcher("/deiver/Modificado.html");
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
