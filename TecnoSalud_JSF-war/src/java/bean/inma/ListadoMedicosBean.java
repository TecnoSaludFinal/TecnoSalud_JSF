/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.inma;

import app.dao.MedicosFacade;
import app.dao.MedicosFacadeLocal;
import app.entity.Medicos;
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
@ManagedBean(name="listadoMedicosBean")
@RequestScoped
public class ListadoMedicosBean 
{
    @EJB
    private MedicosFacadeLocal medicosFacadelocal;
    
    private List <Medicos> listaMedicos; 
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Cod e > Add Business Method")
    
   

    public List<Medicos> getListaMedicos() 
    {
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        listaMedicos = (List<Medicos>) medicosFacadelocal.findAll();
        
        return listaMedicos;
    }
    public void setListaMedicos(List<Medicos> listaMedicos) 
    {
        this.listaMedicos = listaMedicos;
    }   
    
    @PostConstruct
    public void create()
    {
        //Lo utilizamos para hacer la lectura del supermercado
        listaMedicos = this.medicosFacadelocal.findAll();
    }    
    public ListadoMedicosBean()
    {
        
    }
}
