/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.servlet;

import app.dao.AdministradorFacadeLocal;
import app.dao.CitasFacadeLocal;
import app.dao.MedicosFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.dao.PersonalAdministrativoFacadeLocal;
import app.dao.PeticionCitaFacadeLocal;
import app.entity.Administrador;
import app.entity.Citas;
import app.entity.Medicos;
import app.entity.Pacientes;
import app.entity.PersonalAdministrativo;
import app.entity.PeticionCita;
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
public class ListadoCitasServlet extends HttpServlet
{
    @EJB
    private CitasFacadeLocal cfl;
    
    @EJB
    private PacientesFacadeLocal pfl;
    
    @EJB
    private MedicosFacadeLocal mfl;
    
    @EJB
    private PersonalAdministrativoFacadeLocal pafl;
    
    @EJB
    private AdministradorFacadeLocal afl;
    
    @EJB
    private PeticionCitaFacadeLocal pcfl;

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
        
        Integer idRol;
        Pacientes p;
        Medicos m;
        PersonalAdministrativo pa;
        Administrador a;

        session = request.getSession(false);
        
        if(session == null)
        {
            rd = getServletContext().getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }
        else
        {
            idRol = (Integer) session.getAttribute("id");
            
            if(idRol == 1)
            {
                p = (Pacientes) session.getAttribute("entidad");
                
                session.setAttribute("entidad", p);
                
                List<Citas> citas;
                List<PeticionCita> petCitas;

                petCitas = (List<PeticionCita>) pcfl.findAllByNuhsa(p.getNuhsa());
                citas = (List<Citas>) cfl.findAllByNuhsa(p.getNuhsa());

                request.setAttribute("citas", citas);
                request.setAttribute("petCitas", petCitas);

                rd = getServletContext().getRequestDispatcher("/deiver/ListadoCitas.jsp");//Listado paciente
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
                
                List<Citas> citas;
                List<PeticionCita> petCitas;

                petCitas = (List<PeticionCita>) pcfl.findAll();
                citas = (List<Citas>) cfl.findAll();

                request.setAttribute("citas", citas);
                request.setAttribute("petCitas", petCitas);
                
                rd = getServletContext().getRequestDispatcher("/deiver/ListadoCitasPAdmin.jsp");//Listado paciente
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
            throws ServletException, IOException
    {
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
