/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.inma;

import app.dao.CitasFacadeLocal;
import app.dao.MedicosFacadeLocal;
import app.entity.Administrador;
import app.entity.Citas;
import app.entity.Medicos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
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
@WebServlet(name = "BorraDefinitivoServletM", urlPatterns = {"/BorraDefinitivoServletM"})
public class BorraDefinitivoServletM extends HttpServlet {
    
     
     @EJB
    private MedicosFacadeLocal facadeMedicos;
     @EJB
     private CitasFacadeLocal facadeCitas;
    

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

        
        Medicos medico;
        String id_medicos;
        
        id_medicos = (String)request.getParameter("id_med");
        
        medico = (Medicos) facadeMedicos.findById(Integer.parseInt(id_medicos));
        
       // Hago una lista de las citas que este medico tiene   
        List <Citas> listaCitas = (List <Citas>) facadeCitas.findAllById_Med(Integer.parseInt(id_medicos));
        
        if (listaCitas == null)
        {
                //Si la lista de citas está vacía, significa que el médico no tiene citas, con lo que podemos eliminarlo
                // Una vez que hemos encontrado el medico, mandamos el campo MEDICO a traves de M al JSP
                // Eliminamos ese medico
                facadeMedicos.remove(medico);

                List<Medicos> lista = (List<Medicos>) facadeMedicos.findAll();
                for(int i=0;i<lista.size();i++)
                {
                    Medicos Modpc = lista.get(i); 
                    facadeMedicos.actualizar(Modpc, i);
                }

               // Conexion entre servido y JSP   
                rd= this.getServletContext().getRequestDispatcher("/inma/Borrado.jsp");
                rd.forward(request, response);
        }
        else
        {
            //Si la lista no está vacia, no podemos eliminar al médico hasta que no reasignemos esas citas a otro medico
            // Cojo el valor de id_especialidad de este  medico y lo utilizo
            // para buscar otro medico de esa misma especialidad , y asignarle sus citas
            // Para ello me devuelve una lista de los medicos que tienen esa especialidad        
            List <Medicos> m = (List <Medicos>)facadeMedicos.findByIdAllEspecialidad(medico.getIdEspecialidad().getNombre());
            
            Integer num = m.size()+1;
            Random rr = new Random ();            
            Citas c;
            Medicos mm;
            for(int i=0;i<listaCitas.size();i++)
            {
                
                int ale = rr.nextInt(num-1)+1;
                if(ale != medico.getIdMedicos())
                {
                    c = listaCitas.get(i);
                    for(int j=0;j<m.size();j++)
                    {
                        //Devolvemos el MEDICO que tiene este id (ale)
                        mm = (Medicos) facadeMedicos.findById(ale);
                        c.setIdMedicos(mm);
                        facadeCitas.edit(c);
                    }
                }  
            }
  
            // Eliminamos ese medico
            facadeMedicos.remove(medico);
 
            List<Medicos> lista = (List<Medicos>) facadeMedicos.findAll();
            for(int i=0;i<lista.size();i++)
            {
                   Medicos Modpc = lista.get(i); 
                   facadeMedicos.actualizar(Modpc, i);
            }
               

     // Conexion entre servido y JSP   
        
       rd= this.getServletContext().getRequestDispatcher("/inma/Borrado.jsp");
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
