/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.deiver;

import app.dao.MensajesFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.entity.Mensajes;
import app.entity.Pacientes;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deiver
 */
@Named(value = "pacienteListadoMensaje")
@RequestScoped
public class PacienteListadoMensaje
{
    @EJB
    private MensajesFacadeLocal mensajesFacade;
    @EJB
    private PacientesFacadeLocal pacientesFacade;
    
    private List<Mensajes> listaMensajes;
    private Pacientes p;
    HttpSession session;
    
    public List<Mensajes> getListaMensajes()
    {
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        session = (HttpSession) context.getExternalContext().getSession(true);
        p = (Pacientes) session.getAttribute("entidad");
        
        listaMensajes = (List<Mensajes>) mensajesFacade.findAllByRemi(p.getDni());
        return listaMensajes;
    }

    public void setListaMensajes(List<Mensajes> listaMensajes) {
        this.listaMensajes = listaMensajes;
    }

    /**
     * Creates a new instance of PacienteListadoMensaje
     */
    public PacienteListadoMensaje() {
    }
    
}
