/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.jose;

import app.dao.EspecialidadFacade;
import app.dao.EspecialidadFacadeLocal;
import app.dao.HistorialMedicoFacadeLocal;
import app.dao.HoraFacadeLocal;
import app.dao.MedicosFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.entity.Especialidad;
import app.entity.HistorialMedico;
import app.entity.Hora;
import app.entity.Medicos;
import app.entity.Pacientes;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.sql.Time;
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
 * @author JoseAntonio
 */

public class EditarHistorialPacienteServlet extends HttpServlet {
 @EJB
 private HistorialMedicoFacadeLocal fachadaHistorialMedico;
  @EJB
 private PacientesFacadeLocal fachadaPacientes;
 @EJB
 private HoraFacadeLocal fachadaHora;
  @EJB
 private MedicosFacadeLocal fachadaMedicos;
    @EJB
 private EspecialidadFacadeLocal fachadaEspecialidad;
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
        
        //Inicio session
        
        String dni,password;
        
        HttpSession session= request.getSession(false);
        
        dni =(String) session.getAttribute("dni");
        password = (String) session.getAttribute("password");
        
        session.setAttribute("dni", dni);
        session.setAttribute("password", password);
         Integer idRol = (Integer) session.getAttribute("id");
         
         Medicos me = (Medicos) session.getAttribute("entidad");
                
       session.setAttribute("entidad", me);
        
        //Fin session
        
      // Medicos me = fachadaMedicos.findById(me.getIdMedicos());
       HistorialMedico historial = new HistorialMedico();
       String ns = (String) request.getParameter("nuhsaid");
       String fec = (String) request.getParameter("fecha");
       Integer ho = Integer.parseInt(request.getParameter("hora"));
       String h1 = (String) request.getParameter("diagnostico");
       //Integer medi = 1;
       //Integer especialidad = 1;
       String id = (String) request.getParameter("id");
       
     
       Pacientes p = (Pacientes) fachadaPacientes.findByNuhsa(Integer.parseInt(ns));
       Hora h = (Hora) fachadaHora.findByIdHora(ho);
       //Medicos me = (Medicos) fachadaMedicos.findById(me.getIdMedicos());
      // Especialidad espec = (Especialidad) fachadaEspecialidad.findById(especialidad);
                    
       
           //Busqueda en la base de datos

       
       
       // falta añadir el nombre del medico que hace el nuevo diagnostico
       historial.setIdMedicos(me);
       historial.setIdEspecialidad(me.getIdEspecialidad());
      historial.setNuhsaPaciente(p);
      historial.setFecha(Date.valueOf(fec));
      historial.setIdHora(h);
      historial.setDescripcion(h1);
      historial.setIdHistorial(fachadaHistorialMedico.findAll().size()+1);
      
       
     fachadaHistorialMedico.create(historial);
       
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/jose/Modificado.html");
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
