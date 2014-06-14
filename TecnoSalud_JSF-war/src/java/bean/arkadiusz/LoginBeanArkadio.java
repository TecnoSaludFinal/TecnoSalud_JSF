/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.arkadiusz;

import app.entity.PersonalAdministrativo;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@Named(value = "loginBeanArkadio")
@Dependent
public class LoginBeanArkadio {

    private Integer id;
    private String nombre;
    private String apellidos;
    private String dni;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }
    
  
    public LoginBeanArkadio() {
    }
    @PostConstruct
    public void sacaDatos()
    {
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        HttpSession sesion = (HttpSession) context.getExternalContext().getSession(true);
        PersonalAdministrativo personal = (PersonalAdministrativo) sesion.getAttribute("entidad");
    
        id = personal.getIdPersonalAdmin();
        nombre = personal.getNombre();
        apellidos = personal.getApellidos();
        dni = personal.getDni();
    }
    
    
}
