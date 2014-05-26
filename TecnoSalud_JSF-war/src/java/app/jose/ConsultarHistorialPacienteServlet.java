/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.jose;

import app.entity.HistorialMedico;
import app.entity.Medicos;
import app.entity.Pacientes;
import app.dao.HistorialMedicoFacadeLocal;
import app.dao.MedicosFacadeLocal;
import app.dao.PacientesFacade;
import app.dao.PacientesFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

/**
 *
 * @author JoseAntonio
 */
@WebServlet(name = "ConsultarHistorialPacienteServlet", urlPatterns = {"/consultarHistorial"})
public class ConsultarHistorialPacienteServlet extends HttpServlet {
 @EJB
 private HistorialMedicoFacadeLocal fachadaHistorialMedico;
 @EJB
 private PacientesFacadeLocal fachadaPacientes;
 
 

    
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

       //Inicio session
         RequestDispatcher rd = null;
         String dni,password;
         Integer idRol;
         Pacientes p;
         Medicos m;
        
        HttpSession session= request.getSession(false);
        
        dni =(String) session.getAttribute("dni");
        password = (String) session.getAttribute("password");
        
        session.setAttribute("dni", dni);
        session.setAttribute("password", password);
        
        //Fin session
        
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
                
                
                List<HistorialMedico> listaHistorial ;

      
                listaHistorial = (List<HistorialMedico>) fachadaHistorialMedico.findByNUHSA(p.getNuhsa());
                request.setAttribute("lista", listaHistorial);
                rd = getServletContext().getRequestDispatcher("/jose/ConsultarHistorialPacienteVista.jsp");
             
            }
             else  if (idRol == 2)
             {
                
               m = (Medicos) session.getAttribute("entidad");
               session.setAttribute("entidad", m);
                  List<Pacientes> listaPacientes ;
                  List<HistorialMedico> listaHistorial ;
                
                String ns = (String) request.getParameter("nuhsa");
                    if(ns==null)
                        {
                             rd = getServletContext().getRequestDispatcher("/jose/ConsultarHistorialPaciente.jsp");
                        }
                    else
                        {
                            
                            //ME DA UN FALLO AQUI AL CONVERTIR
                            String nsa = (String) request.getParameter("nuhsa");
                            Integer nuhsa = Integer.parseInt(nsa);

                            listaHistorial = (List<HistorialMedico>) fachadaHistorialMedico.findByNUHSA(nuhsa);
                            request.setAttribute("lista", listaHistorial);
                            rd = getServletContext().getRequestDispatcher("/jose/ConsultarHistorialPacienteVista.jsp");
                        }

               } 
             
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
