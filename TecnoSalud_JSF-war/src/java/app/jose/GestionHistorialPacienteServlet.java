/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.jose;

import app.dao.HistorialMedicoFacadeLocal;
import app.dao.HoraFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.entity.HistorialMedico;
import app.entity.Hora;
import app.entity.Pacientes;
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
 * @author JoseAntonio
 */
@WebServlet(name = "GestionHistorialPacienteServlet", urlPatterns = {"/gestionHistorialPaciente"})
public class GestionHistorialPacienteServlet extends HttpServlet {
 @EJB
    private HistorialMedicoFacadeLocal fachadaHistorialMedico;
  @EJB
   private PacientesFacadeLocal fachadaPacientes;
  
   @EJB
   private HoraFacadeLocal fachadaHora;
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //Inicio session
        
        String dni,password;
        
        HttpSession session= request.getSession(false);
        
        dni =(String) session.getAttribute("dni2");
        password = (String) session.getAttribute("password2");
        
        session.setAttribute("dni2", dni);
        session.setAttribute("password2", password);
        
        //Fin session
        
        
        
        RequestDispatcher rd;
        
        List<HistorialMedico> listaHistorial ;
        List<Hora> listaHora;
        String valor;
        
       
        String accion = request.getParameter("do");
        
        
        String ns = (String) request.getParameter("perfil");
         Integer nuhsa = Integer.parseInt(ns);
        
       
        
        if(accion.equalsIgnoreCase("cons")){
            
            listaHistorial   = (List<HistorialMedico>) fachadaHistorialMedico.findByNUHSA(nuhsa);
                
            request.setAttribute("lista", listaHistorial);
            valor="cons";
            request.setAttribute("valor", valor);
            
            rd = getServletContext().getRequestDispatcher("/jose/DatosPaciente.jsp");
            

    } else if(accion.equalsIgnoreCase("editar")){
            
            listaHistorial   = (List<HistorialMedico>) fachadaHistorialMedico.findByNUHSA(nuhsa);
            
            listaHora =  (List<Hora>) fachadaHora.findAll();
                
            request.setAttribute("lista", listaHistorial);
            request.setAttribute("listaHora", listaHora);
            valor="edit";
            request.setAttribute("valor", valor);
            rd = getServletContext().getRequestDispatcher("/jose/DatosPaciente.jsp");
    }
    else
    {
        rd = getServletContext().getRequestDispatcher("/error.jsp");
    }
        rd.forward(request, response);
}
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
