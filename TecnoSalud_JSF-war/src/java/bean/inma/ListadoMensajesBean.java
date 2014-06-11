/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.inma;

import app.dao.MensajesFacadeLocal;
import app.entity.Mensajes;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

/**
 *
 * @author Inma
 */
@ManagedBean(name="listadoMensajesBean")
@RequestScoped
public class ListadoMensajesBean 
{
    @EJB
    private MensajesFacadeLocal menFacadelocal;    
    private List <Mensajes> listaMen; 
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public List<Mensajes> getListaMen() 
    {
         FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        listaMen = (List<Mensajes>) menFacadelocal.findAll();
        
        
        return listaMen;
    }

    public void setListaMen(List<Mensajes> listaMen) 
    {
        this.listaMen = listaMen;
    }
    @PostConstruct
    public void create()
    {
        listaMen = this.menFacadelocal.findAll();
    }    
    public ListadoMensajesBean()
    {
        
    }
    
}
