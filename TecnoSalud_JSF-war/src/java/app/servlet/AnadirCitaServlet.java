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
import app.dao.PersonalAdministrativoFacadeLocal;
import app.dao.PeticionCitaFacadeLocal;
import app.dao.TipoCitaFacadeLocal;
import app.entity.Citas;
import app.entity.Especialidad;
import app.entity.Hora;
import app.entity.Medicos;
import app.entity.Pacientes;
import app.entity.PersonalAdministrativo;
import app.entity.PeticionCita;
import app.entity.TipoCita;
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
public class AnadirCitaServlet extends HttpServlet
{
    @EJB
    private CitasFacadeLocal cfl;
    
    @EJB
    private PacientesFacadeLocal pfl;
    
    @EJB
    private TipoCitaFacadeLocal tcfl;
    
    @EJB
    private HoraFacadeLocal hfl;
    
    @EJB
    private MedicosFacadeLocal mfl;
    
    @EJB
    private EspecialidadFacadeLocal efl;
    
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
        
        session = request.getSession(false);
        
        if(session == null)
        {
            rd = getServletContext().getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }
        else
        {
        
            PersonalAdministrativo pers = (PersonalAdministrativo) session.getAttribute("entidad");

            PersonalAdministrativo pa;
            pa = pafl.findByDni(pers.getDni());

            request.setAttribute("pa", pa);


            String fecha, medico, nuhsa, especialidad, consulta;
            Integer numElem = cfl.findAll().size();

            nuhsa = request.getParameter("nuhsa");
            medico = request.getParameter("medico");
            fecha = request.getParameter("fecha");

            Integer hora = Integer.parseInt(request.getParameter("hora"));
            especialidad = request.getParameter("especialidad");
            consulta = request.getParameter("localizacion");

            Citas cita = new Citas();

            Pacientes p = (Pacientes) pfl.findByNuhsa(Integer.parseInt(nuhsa));
            cita.setNushaPaciente(p);

            Medicos m = mfl.findById(Integer.parseInt(medico));
            cita.setIdMedicos(m);

            cita.setFecha(Date.valueOf(fecha));

            Hora h = hfl.findByIdHora(hora);
            cita.setIdHora(h);

            Especialidad e = (Especialidad) efl.findByNombre(especialidad);
            cita.setIdEspecialidad(e);

            cita.setLocalizacion(consulta);

            cita.setIdCitas(numElem+1);

            cfl.create(cita);

            rd = getServletContext().getRequestDispatcher("/deiver/index.jsp");
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
