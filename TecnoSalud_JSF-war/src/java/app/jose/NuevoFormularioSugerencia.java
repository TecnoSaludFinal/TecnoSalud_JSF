/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.jose;

import app.dao.FormularioFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.dao.TipoFormularioFacadeLocal;
import app.entity.Formulario;
import app.entity.HistorialMedico;
import app.entity.Pacientes;
import app.entity.TipoFormulario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class NuevoFormularioSugerencia extends HttpServlet {
@EJB
 private TipoFormularioFacadeLocal fachadaTipoFormulario;
  @EJB
 private PacientesFacadeLocal fachadaPacientes;
  
    @EJB
 private FormularioFacadeLocal fachadaFormulario;
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
        
        
        //Fin session
        
       Pacientes p = (Pacientes) session.getAttribute("entidad");
                
       session.setAttribute("entidad", p);
        
       Formulario formulario = new Formulario();
       String coment = (String) request.getParameter("Comentario");
       String tipoformulario = (String) request.getParameter("listaFormulario");
       String ns = request.getParameter("Nusha");
       String fecha = (String) request.getParameter("fec");
       
          
     
       //Pacientes p = (Pacientes) fachadaPacientes.findByNuhsa(p2.getNuhsa());
     TipoFormulario tipoform = (TipoFormulario) fachadaTipoFormulario.findById(Integer.parseInt(tipoformulario));
       
        formulario.setComentario(coment);
        formulario.setIdTipoform(tipoform);
        formulario.setNuhsaPaciente(p);
        formulario.setFecha(Date.valueOf(fecha));
        formulario.setIdFormulario(fachadaFormulario.findAll().size()+1);
              //  (Integer.parseInt((fachadaPacientes.findAll().size()+1)));
      
       
        fachadaFormulario.create(formulario);
       
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/jose/Peticion.jsp");
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
