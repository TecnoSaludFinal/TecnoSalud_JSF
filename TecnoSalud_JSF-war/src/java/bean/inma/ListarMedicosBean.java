/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.inma;

import app.dao.MedicosFacade;
import app.entity.Medicos;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author Inma
 */

@Named(value = "listarMedicosBean")
@RequestScoped
public class ListarMedicosBean 
{

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
     @EJB
        private MedicosFacade facadeMedicos;        
        private List<Medicos> listaMe;

    //   private String zipSeleccionado;
    public List<Medicos> getListaMe() 
    {
        return listaMe;
    }

    public void setListaMe(List<Medicos> listaMe) 
    {
        this.listaMe = listaMe;
    }
              
    
    
    //ANtes de que se carge el beans, se va a llamar a este metodo, que lo vamos  autilizar para añadir la lista de medicos
    @PostConstruct
    public void create()
    {
        //Lo utilizamos para hacer la lectura del medico
        listaMe = this.facadeMedicos.findAll();
    }
    
      
}
