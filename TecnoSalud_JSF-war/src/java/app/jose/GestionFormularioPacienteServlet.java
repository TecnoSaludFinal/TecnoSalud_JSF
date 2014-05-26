/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.jose;

import app.dao.FormularioFacadeLocal;
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
public class GestionFormularioPacienteServlet extends HttpServlet {
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
        response.setContentType("text/html;charset=UTF-8");
        
        //Inicio session
        
        String dni,password;
        
        HttpSession session= request.getSession(false);
        
        dni =(String) session.getAttribute("dni");
        password = (String) session.getAttribute("password");
        
        session.setAttribute("dni", dni);
        session.setAttribute("password", password);
        
        //Fin session
        
        RequestDispatcher rd = null;
        
        List<Formulario> listaFormulario ;
        String valor = null;
       
        
        String accion = request.getParameter("do");
      
        String id = (String) request.getParameter("perfil");
        
        Integer idRol = (Integer) session.getAttribute("id");
        Integer idForm = Integer.parseInt(id);
        
        
     if(accion.equalsIgnoreCase("cons"))
     {    
        
         
        if(idRol==1) //Si es un paciente el que esta realizando la busqueda.
              {
                   Pacientes p = (Pacientes) session.getAttribute("entidad");
                   session.setAttribute("entidad", p); 
                  listaFormulario   = (List<Formulario>) fachadaFormulario.findById(Integer.parseInt(id));
                 //listaCitas = ( List<Citas>) fachadaCitas.findByFechaNuhsa(Date.valueOf(fecha),p.getNuhsa());
                  request.setAttribute("listaCitas", listaFormulario);
                  valor="cons";
                  request.setAttribute("lista", listaFormulario);
                  request.setAttribute("valor", valor);
                  rd = getServletContext().getRequestDispatcher("/jose/DatosFormulario.jsp");
                  
              }
        else if(idRol==4) //Si es un paciente el que esta realizando la busqueda.
              {
                   
                  listaFormulario   = (List<Formulario>) fachadaFormulario.findById(Integer.parseInt(id));
                 //listaCitas = ( List<Citas>) fachadaCitas.findByFechaNuhsa(Date.valueOf(fecha),p.getNuhsa());
                  request.setAttribute("listaCitas", listaFormulario);
                  valor="cons";
                  request.setAttribute("lista", listaFormulario);
                  request.setAttribute("valor", valor);
                  rd = getServletContext().getRequestDispatcher("/jose/DatosFormulario.jsp");
                  
              }
        
         
    } 
     else if(accion.equalsIgnoreCase("elim"))
    {
        if(idRol ==1)
        {
            Pacientes p = (Pacientes) session.getAttribute("entidad");
            session.setAttribute("entidad", p);
            
            Formulario form = (Formulario) fachadaFormulario.findByNUHSAform(p.getNuhsa(),Integer.parseInt(id));
        
            fachadaFormulario.remove(form);
            
            List<Formulario> lista = (List<Formulario>) fachadaFormulario.findAll();
            
        for(int i=0;i<lista.size();i++)
        {
            Formulario Modpc = lista.get(i); 
            fachadaFormulario.actualizar(Modpc, i);
        }
        
            rd = getServletContext().getRequestDispatcher("/jose/Eliminado.html");
        }
        else if(idRol ==4)
        {
            Formulario form = (Formulario) fachadaFormulario.findByIdFormulario2(idForm);
            
            fachadaFormulario.remove(form);
            
            List<Formulario> lista = (List<Formulario>) fachadaFormulario.findAll();
            
        for(int i=0;i<lista.size();i++)
        {
            Formulario Modpc = lista.get(i); 
            fachadaFormulario.actualizar(Modpc, i);
        }
        
            rd = getServletContext().getRequestDispatcher("/jose/Eliminado.html");
        }
        

    }
    else
    {
        rd = getServletContext().getRequestDispatcher("/error.jsp");
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

