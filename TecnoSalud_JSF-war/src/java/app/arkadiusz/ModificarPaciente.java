/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.arkadiusz;

import app.entity.Pacientes;
import app.entity.PersonalAdministrativo;
import app.dao.PacientesFacadeLocal;
import java.io.IOException;
import java.sql.Date;
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
 * @author Administrator
 */
@WebServlet(name = "ModificarPaciente", urlPatterns = {"/ModificarPaciente"})
public class ModificarPaciente extends HttpServlet {
    @EJB
    private PacientesFacadeLocal pacienteDao;
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
        String nombre = null, apellido = null, dni = null, direccion = null, clave = null;
        PersonalAdministrativo personal;
        Date fecha = null;
        Integer nuhsa = null;
        RequestDispatcher rd;
        
        try
        {
            nuhsa = Integer.valueOf(request.getParameter("nuhsa"));
            nombre = request.getParameter("name");
            apellido = request.getParameter("surname");
            dni = request.getParameter("dni");
            direccion = request.getParameter("direction");
            fecha = Date.valueOf(request.getParameter("birthday"));
            clave = request.getParameter("password");
        }
        catch(IllegalArgumentException e)
        {
            String error = "Nuhsa incluye solamente NUMEROS o rellena formulario ENTERO";
            request.setAttribute("error", error);
            rd = this.getServletContext().getRequestDispatcher("/arkadiusz/crear_paciente.jsp");
            rd.forward (request, response);
        }
        if(nombre != null && apellido != null && dni != null && direccion != null && fecha!= null && clave != null)
        {
        
            Pacientes paciente = new Pacientes(nuhsa,nombre,apellido,dni,direccion,fecha,clave);
        
            pacienteDao.edit(paciente);
       
            HttpSession session = request.getSession(false);
        
            personal = (PersonalAdministrativo) session.getAttribute("entidad");//Recoge null
            session.setAttribute("entidad", personal);
        
            rd = this.getServletContext().getRequestDispatcher("/ListadoPacientes");
            rd.forward (request, response);
        }
        else
        {
                String error = "Rellena todos areas";
                request.setAttribute("error", error);
                rd = this.getServletContext().getRequestDispatcher("/arkadiusz/crear_paciente.jsp");
                rd.forward (request, response);
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
