/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.inma;

import app.entity.Especialidad;
import app.entity.Medicos;
import app.entity.Roles;
import app.dao.EspecialidadFacadeLocal;
import app.dao.MedicosFacadeLocal;
import app.dao.RolesFacadeLocal;
import app.entity.Administrador;
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
public class NuevoMedicoServletMuestra extends HttpServlet {

     @EJB
    private MedicosFacadeLocal facadeMedico;
    @EJB
    private EspecialidadFacadeLocal facadeEspecialidad;
    @EJB
    private RolesFacadeLocal facadeRoles;
    
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
        
        
         // Lista de medicos para el id      
         List <Medicos> m;
         m = (List <Medicos>)facadeMedico.findAll();
         
         Integer id_medico = (m.size()+1);
         
         String dni_m = (String)request.getParameter("dni");
         String nombre = (String)request.getParameter("nombre");
         String apellidos = (String)request.getParameter("apellidos");
         String id_especialidad = (String)request.getParameter("especialidad");
         String id_rol = (String)request.getParameter("rol");
         String contrasena = (String)request.getParameter("contrasena");                
         
         Medicos medico = new Medicos();
         medico.setDni(dni_m);
         medico.setNombre(nombre);
         medico.setApellidos(apellidos);
         medico.setContrasena(contrasena);
         medico.setIdMedicos(id_medico);         
         
         Especialidad esp;
         Roles r;
         
         esp = (Especialidad) facadeEspecialidad.findById(Integer.parseInt(id_especialidad));
         r = (Roles) facadeRoles.findById(Integer.parseInt(id_rol));
         
         medico.setIdEspecialidad(esp);
         medico.setIdRol(r);
                 
        
        facadeMedico.create(medico);
        
        
        rd= this.getServletContext().getRequestDispatcher("/inma/MedicoCreado.html");
        rd.forward (request, response);
        
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
