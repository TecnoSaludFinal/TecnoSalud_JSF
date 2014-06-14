/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.arkadiusz;

import app.dao.MensajesFacadeLocal;
import app.entity.Mensajes;
import app.entity.PersonalAdministrativo;
import java.util.List;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@Named(value = "mensajesLeidos")
@Dependent
public class MensajesLeidos {
    
    @EJB
    MensajesFacadeLocal mfl;
    
    private List<Mensajes> mensajesLeidos, mensajesNoLeidos;
    private PersonalAdministrativo prueba;
    private static Integer id_mensaje = 1;
    private Mensajes mess;

    public Mensajes getMess() {
        if(id_mensaje != 1)
        {
            mess = mfl.find(id_mensaje);
            mess.setEstado("S");
            mfl.edit(mess);
        }
        return mess;
        
    }

    public void setMess(Mensajes mess) {
        this.mess = mess;
    }
    
    
    public Integer getId_mensaje() {
        return id_mensaje;
    }

    public void setId_mensaje(Integer id_mensaje) {
        this.id_mensaje = id_mensaje;
    }

    public PersonalAdministrativo getPrueba() {
        return prueba;
    }

    public void setPrueba(PersonalAdministrativo prueba) {
        this.prueba = prueba;
    }
    /**
     * Creates a new instance of MensajesLeidos
     */
    public MensajesLeidos() {
        
    }
    
    public List<Mensajes> getMensajesLeidos()
    {     
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        HttpSession sesion = (HttpSession) context.getExternalContext().getSession(true);
        prueba = (PersonalAdministrativo) sesion.getAttribute("entidad");
        mensajesLeidos = mfl.findReaded(prueba.getDni());
        return mensajesLeidos;
    }
    
    public List<Mensajes> getMensajesNoLeidos()
    {     
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        HttpSession sesion = (HttpSession) context.getExternalContext().getSession(true);
        PersonalAdministrativo personal = (PersonalAdministrativo) sesion.getAttribute("entidad");
        mensajesNoLeidos = mfl.findNotReaded(personal.getDni());
        return mensajesNoLeidos;
    }
    
    
}
