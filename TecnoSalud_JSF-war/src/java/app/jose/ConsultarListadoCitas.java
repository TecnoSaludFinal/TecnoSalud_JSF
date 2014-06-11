/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.jose;

import app.dao.CitasFacadeLocal;
import app.dao.MedicosFacadeLocal;
import app.entity.Citas;
import app.entity.Medicos;
import app.entity.Pacientes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public class ConsultarListadoCitas extends HttpServlet {
@EJB
   private CitasFacadeLocal fachadaCitas;

@EJB
   private MedicosFacadeLocal fachadaMedico;
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
        Integer idRol = (Integer) session.getAttribute("id");
       

        
        List<Citas> listaCitas = null ;
        List<Medicos> listaMedico = null ;

       
       String accion = request.getParameter("do");
       String id = (String) request.getParameter("perfil");
       
       List <Medicos> listacompleta   = null;
        
       
      if(accion.equalsIgnoreCase("fec"))
          
      {
          String fecha = (String) request.getParameter("fecha");
           
            if (fecha == null)
            {
               
               
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/jose/buscarCitaporfecha.jsp");
                rd.forward(request, response);
 
            }
            else if (fecha != null)
          { //buscamos por fecha indicada
              if(idRol==1) //Si es un paciente el que esta realizando la busqueda.
              {
                   Pacientes p = (Pacientes) session.getAttribute("entidad");
                
                  session.setAttribute("entidad", p);
                  //listaCitas = ( List<Citas>) fachadaCitas.findByFecha(Date.valueOf(fecha));
                 listaCitas = ( List<Citas>) fachadaCitas.findByFechaNuhsa(Date.valueOf(fecha),p.getNuhsa());
                  request.setAttribute("listaCitas", listaCitas);
                  
              }
              else if (idRol ==2)
              {
                  Medicos m =(Medicos) session.getAttribute("entidad");
                  session.setAttribute("entidad", m);
                  listaCitas = ( List<Citas>) fachadaCitas.findByFechaIdMedico(Date.valueOf(fecha),m.getIdMedicos());
                  request.setAttribute("listaCitas", listaCitas);
                  
              }
              else
              {
               listaCitas = ( List<Citas>) fachadaCitas.findByFecha(Date.valueOf(fecha));
               request.setAttribute("listaCitas", listaCitas);
              }
           
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/jose/buscarCitaporfecha.jsp");
                rd.forward(request, response);
              
          }
          else
          {  
               RequestDispatcher rd;
               rd = getServletContext().getRequestDispatcher("/error.jsp");
               rd.forward(request, response);
          }
        
      } 
      else if(accion.equalsIgnoreCase("all"))
      {// busco citas para hoy
          
         Calendar Cal= Calendar.getInstance(); 
         String fec= Cal.get(Cal.YEAR)+"-"+(Cal.get(Cal.MONTH)+1)+"-"+Cal.get(Cal.DATE);
             if (fec!= null)
             {
              if(idRol==1) //Si es un paciente el que esta realizando la busqueda.
              {     
                  Pacientes p = (Pacientes) session.getAttribute("entidad");
                
                  session.setAttribute("entidad", p);
                  listaCitas = ( List<Citas>) fachadaCitas.findByFechaNuhsa(Date.valueOf(fec),p.getNuhsa());
              } 
              else if (idRol ==2)
              {
                  Medicos m =(Medicos) session.getAttribute("entidad");
                  session.setAttribute("entidad", m);
                  listaCitas = ( List<Citas>) fachadaCitas.findByFechaIdMedico(Date.valueOf(fec),m.getIdMedicos());

              }
              else 
              {
                  listaCitas = ( List<Citas>) fachadaCitas.findByFecha(Date.valueOf(fec));
               }
              
              if(listaCitas!= null)
                {
                request.setAttribute("listaCitas", listaCitas);
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/jose/buscarCitaporfecha.jsp");
                rd.forward(request, response);
                 }
             }
            else
            {
              RequestDispatcher rd;
              rd = getServletContext().getRequestDispatcher("/error.jsp");
              rd.forward(request, response);
            }
      }
      else if(accion.equalsIgnoreCase("pend")){
        Calendar Cal= Calendar.getInstance(); 
         String fec= Cal.get(Cal.YEAR)+"-"+(Cal.get(Cal.MONTH)+1)+"-"+Cal.get(Cal.DATE);
         
              if (fec!= null)
             {
              if(idRol==1) //Si es un paciente el que esta realizando la busqueda.
              {     
                  Pacientes p = (Pacientes) session.getAttribute("entidad");
                
                  session.setAttribute("entidad", p);
                  listaCitas = ( List<Citas>) fachadaCitas.findByPendienteNuhsa(Date.valueOf(fec),p.getNuhsa());
              } 
              else if (idRol ==2)
              {
                  Medicos m =(Medicos) session.getAttribute("entidad");
                  session.setAttribute("entidad", m);
                  listaCitas = ( List<Citas>) fachadaCitas.findByPendienteIdMedico(Date.valueOf(fec),m.getIdMedicos());

              }
              else 
              {      
                    
                listaCitas = ( List<Citas>) fachadaCitas.findByPendiente(Date.valueOf(fec));
            }
                if(listaCitas!= null)
                {
                request.setAttribute("listaCitas", listaCitas);
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/jose/buscarCitaporfecha.jsp");
                rd.forward(request, response);
                }
             }
            else
            {
              RequestDispatcher rd;
              rd = getServletContext().getRequestDispatcher("/error.jsp");
              rd.forward(request, response);
            }
      }
      else if(accion.equalsIgnoreCase("pasa"))
      {
         Calendar Cal= Calendar.getInstance(); 
         String fec= Cal.get(Cal.YEAR)+"-"+(Cal.get(Cal.MONTH)+1)+"-"+Cal.get(Cal.DATE);
                    
             if (fec!= null)
             {
              if(idRol==1) //Si es un paciente el que esta realizando la busqueda.
              {     
                  Pacientes p = (Pacientes) session.getAttribute("entidad");
                
                  session.setAttribute("entidad", p);
                  listaCitas = ( List<Citas>) fachadaCitas.findByPasadaNuhsa(Date.valueOf(fec),p.getNuhsa());
              } 
              else if (idRol ==2)
              {
                  Medicos m =(Medicos) session.getAttribute("entidad");
                  session.setAttribute("entidad", m);
                  listaCitas = ( List<Citas>) fachadaCitas.findByPasadaIdMedico(Date.valueOf(fec),m.getIdMedicos());

              }
              else 
              {             
                  listaCitas = ( List<Citas>) fachadaCitas.findByPasada(Date.valueOf(fec));
              }
                if(listaCitas!= null)
                {
                request.setAttribute("listaCitas", listaCitas);
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/jose/buscarCitaporfecha.jsp");
                rd.forward(request, response);
                    }
            }
            else
            {
              RequestDispatcher rd;
              rd = getServletContext().getRequestDispatcher("/error.jsp");
              rd.forward(request, response);
            }
      }
      else if(accion.equalsIgnoreCase("paci")){
          
            String ss = request.getParameter("ss");
            
           
            if (ss == null)
            {
               
               
                RequestDispatcher rd;
                rd = getServletContext().getRequestDispatcher("/jose/buscarCitaporpaciente.jsp");
                rd.forward(request, response);
 
            }
            else if (ss != null)
          { //buscamos por fecha indicada
              Integer paciente = Integer.parseInt(ss);
            listaCitas = ( List<Citas>) fachadaCitas.findAllByNuhsa(paciente);
            request.setAttribute("listaCitas", listaCitas);
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/jose/buscarCitaporpaciente.jsp");
            rd.forward(request, response);
              
          }
          else
          {  
              RequestDispatcher rd;
              rd = getServletContext().getRequestDispatcher("/error.jsp");
              rd.forward(request, response);
          }
          
      }
      else if(accion.equalsIgnoreCase("medi")){
          
        if(id==null)
        {
          String apellidos = (String) request.getParameter("apellidos");
          
          if (apellidos == null)
            {
                listacompleta= (List<Medicos>) fachadaMedico.findAll();
               
                RequestDispatcher rd;
                request.setAttribute("listacompleta", listacompleta);
                rd = getServletContext().getRequestDispatcher("/jose/buscarCitapormedico.jsp");
                rd.forward(request, response);
 
            }
         
            else if (apellidos != null && id==null)
          { //buscamos por fecha indicada
            
            listaMedico = (List<Medicos>)  fachadaMedico.findByNombre(apellidos);
              
            listaCitas = ( List<Citas>) fachadaCitas.findByNombre(apellidos);
            
            request.setAttribute("listaMedico", listaMedico);
            request.setAttribute("listaCitas", listaCitas);
            
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/jose/buscarCitapormedico.jsp");
            rd.forward(request, response);
            }  
          }
          else if(id != null)
          {  
              listaCitas = ( List<Citas>) fachadaCitas.findAllById_Med(Integer.parseInt(id));
            
            request.setAttribute("listaCitas", listaCitas);
            
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/jose/buscarCitapormedico.jsp");
            rd.forward(request, response);
            
          }else
          {
              RequestDispatcher rd;
              rd = getServletContext().getRequestDispatcher("/error.jsp");
              rd.forward(request, response);
          }
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
