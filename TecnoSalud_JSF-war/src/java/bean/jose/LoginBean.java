/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.jose;

import app.dao.MedicosFacadeLocal;
import app.entity.Medicos;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JoseAntonio
 */
@ManagedBean(name="loginBean")
@SessionScoped
public class LoginBean {
    @EJB
    private MedicosFacadeLocal medicosFacade;
    private String medico;
    private String nombre;
    private String apellidos;
    private String Especialidad;
    private String dni;
    private Integer id;
    

   
    

    public String getMedico() {
        return medico;
    }

    public void setMedico(String medico) {
        this.medico = medico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEspecialidad() {
        return Especialidad;
    }

    public void setEspecialidad(String Especialidad) {
        this.Especialidad = Especialidad;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
   
    
    /**
     * Creates a new instance of LoginBean
     */
    
    
    public LoginBean() {
    }
    

@PostConstruct
    public void create()
    {
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        HttpSession sesion = (HttpSession) context.getExternalContext().getSession(true);
        Medicos p = (Medicos) sesion.getAttribute("entidad");
                
                //  sesion.setAttribute("entidad", p);
        
       // Medicos med = (Medicos) medicosFacade.findByDni(p.getDni());
        
            this.id = p.getIdMedicos();
            this.dni = p.getDni();
            this.nombre = p.getNombre();
            this.apellidos = p.getApellidos();
            this.Especialidad = p.getIdEspecialidad().getNombre();
            
        }
        
      
        
        
        public String doNavigation()
    {
       return "loginBean";
    
}
}
  
    


