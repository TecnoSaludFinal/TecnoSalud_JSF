/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.servlet;

import app.dao.HoraFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.dao.PeticionCitaFacadeLocal;
import app.dao.TipoCitaFacadeLocal;
import app.entity.Hora;
import app.entity.Pacientes;
import app.entity.PeticionCita;
import app.entity.TipoCita;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
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
 * @author Deiver
 */
public class AnadirPeticionCitaServlet extends HttpServlet
{
    @EJB
    private PeticionCitaFacadeLocal pcfl;
    
    @EJB
    private PacientesFacadeLocal pfl;
    
    @EJB
    private TipoCitaFacadeLocal tcfl;
    
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
        HttpSession session;
        RequestDispatcher rd;
        
        session = request.getSession(false);
        
        if(session == null)
        {
            rd = getServletContext().getRequestDispatcher("/error.jsp");
        }
        else
        {//Try catch
            Pacientes paci = (Pacientes) session.getAttribute("entidad");
            
            String fecha, comentario, tipoCita;
            Integer hora;
            Integer numElem = pcfl.findAll().size();

            tipoCita = request.getParameter("cita");
            fecha = request.getParameter("fecha");
            hora = Integer.parseInt(request.getParameter("hora"));
            comentario = request.getParameter("comentario");

            PeticionCita peticion = new PeticionCita();

            Pacientes p = (Pacientes) pfl.findByDni(paci.getDni());
            peticion.setNuhsaPaciente(p);

            TipoCita tc = tcfl.findByNombre(tipoCita);
            peticion.setIdTipo(tc);

            Hora h = hfl.findByIdHora(hora);
            peticion.setIdHora(h);

            peticion.setFecha(Date.valueOf(fecha));

            peticion.setComentario(comentario);

            peticion.setIdPeticion(numElem+1);

            pcfl.create(peticion);

            rd = getServletContext().getRequestDispatcher("/deiver/Modificado.html");
        }
        
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
