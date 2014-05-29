/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.inma;

import app.dao.MensajesFacadeLocal;
import app.entity.Mensajes;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author Inma
 */
@ManagedBean(name="muestraMensajesBean")
@RequestScoped
public class MuestraMensajeBean 
{
    //Aqui lo que hace es ver el mensaje determinado
    @EJB
    private MensajesFacadeLocal menFacadeLocal;
    private Mensajes mensajeSeleccionado;
    
    

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public Mensajes getMensajeSeleccionado() 
    {
        return mensajeSeleccionado;
    }

    public void setMensajeSeleccionado(Mensajes mensajeSeleccionado) 
    {
        this.mensajeSeleccionado = mensajeSeleccionado;
    }
    
    public MuestraMensajeBean()
    {
        
    }
    
    
}
