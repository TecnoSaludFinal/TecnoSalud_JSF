/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.arkadiusz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import app.entity.Pacientes;
import app.entity.PersonalAdministrativo;
import java.sql.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import app.dao.PacientesFacadeLocal;

/**
 *
 * @author Administrator
 */

@WebServlet(name = "CrearPaciente", urlPatterns = {"/CrearPaciente"})
public class CrearPaciente extends HttpServlet {
    @EJB
    private PacientesFacadeLocal pacienteDao;
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
        response.setContentType("text/html;charset=UTF-8");
        
        String nombre = null, apellido = null, dni = null, direccion = null, clave = null;
        Date fecha = null;
        Integer nuhsa = null;
        PersonalAdministrativo personal;
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
            if(pacienteDao.find(nuhsa) == null)
            {
                Pacientes paciente = new Pacientes(nuhsa,nombre,apellido,dni,direccion,fecha,clave);
                pacienteDao.create(paciente);
        
                HttpSession session = request.getSession(false);
        
                personal = (PersonalAdministrativo) session.getAttribute("entidad");//Recoge null
                session.setAttribute("entidad", personal);
        
                rd = this.getServletContext().getRequestDispatcher("/ListadoPacientes");
                rd.forward (request, response);
            }
            else
            {
                String error = "NUHSA error - Usuario existe";
                request.setAttribute("error", error);
                rd = this.getServletContext().getRequestDispatcher("/arkadiusz/crear_paciente.jsp");
                rd.forward (request, response);
            }
        }
        else
        {
                String error = "Rellena todos areas";
                request.setAttribute("error", error);
                rd = this.getServletContext().getRequestDispatcher("/arkadiusz/crear_paciente.jsp");
                rd.forward (request, response);
        }
        
     }
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request,response);
      }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
