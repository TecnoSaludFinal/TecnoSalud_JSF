/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.jose;

import app.dao.FormularioFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.entity.Formulario;
import app.entity.Pacientes;
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
 * @author JoseAntonio
 */
public class ConsultarFormularioSugerencia extends HttpServlet {
 @EJB
   private FormularioFacadeLocal fachadaFormulario;
  @EJB
   private PacientesFacadeLocal fachadaPacientes;
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
        Integer idRol = null;
        
        HttpSession session= request.getSession(false);
        
        dni =(String) session.getAttribute("dni");
        password = (String) session.getAttribute("password");
        
        session.setAttribute("dni", dni);
        session.setAttribute("password", password);
        
       
        
        //Fin session
        
        
       List<Formulario> listaFormulario = null ;
        
     //  Pacientes p = fachadaPacientes.findByDni(pac.getDni());
       
       //  String ns = (String) request.getParameter("nuhsa");
      
       
       String accion = (String) request.getParameter("do");
       String id = (String) request.getParameter("perfil");
        idRol = (Integer) session.getAttribute("id");
        
        
       
      if(accion.equalsIgnoreCase("personal"))
      {
          if (idRol == 1)
              
          { // en este caso cogo el nusha de la session actual
              Pacientes pac = (Pacientes) session.getAttribute("entidad");
                
             session.setAttribute("entidad", pac);
              listaFormulario = (List<Formulario>) fachadaFormulario.findByNUHSA(pac.getNuhsa());
          }
      }
          
      else if(accion.equalsIgnoreCase("espe"))
      {
            
             String ax = (String) request.getParameter("nuhsa"); 
             Integer ax1 = Integer.parseInt(ax);
             listaFormulario = (List<Formulario>) fachadaFormulario.findByNUHSA(ax1);
      }
            else if(accion.equalsIgnoreCase("all"))
      {
                listaFormulario = (List<Formulario>) fachadaFormulario.findAll();
       }
            else if(accion.equalsIgnoreCase("quejas")){
                Integer quejas = 1;
                listaFormulario = (List<Formulario>) fachadaFormulario.findByQuejas(quejas);
            }
            else if(accion.equalsIgnoreCase("sug")){
                Integer sugerencia = 2;
                listaFormulario = (List<Formulario>) fachadaFormulario.findBySugerencias(sugerencia);
            }
            else if(accion.equalsIgnoreCase("feli")){
                Integer felicitacion = 3;
                listaFormulario = (List<Formulario>) fachadaFormulario.findByFelicitaciones(felicitacion);
            }
        request.setAttribute("listaFormularios", listaFormulario);
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/jose/ConsultarFormulario.jsp");
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
