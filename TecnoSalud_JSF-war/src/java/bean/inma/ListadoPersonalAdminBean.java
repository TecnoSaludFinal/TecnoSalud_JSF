/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.inma;

import app.dao.PersonalAdministrativoFacadeLocal;
import app.entity.PersonalAdministrativo;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author Inma
 */
@ManagedBean(name="listadoPersonalAdminBean")
@RequestScoped
public class ListadoPersonalAdminBean 
{
    @EJB
    private PersonalAdministrativoFacadeLocal pAdminFacadelocal;    
    private List <PersonalAdministrativo> listaPAdmin; 
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Cod e > Add Business Method")
    public List<PersonalAdministrativo> getListaPAdmin() {
        return listaPAdmin;
    }

    public void setListaPAdmin(List<PersonalAdministrativo> listaPAdmin) {
        this.listaPAdmin = listaPAdmin;
    }    
      
    @PostConstruct
    public void create()
    {
        listaPAdmin = this.pAdminFacadelocal.findAll();
    }    
    public ListadoPersonalAdminBean()
    {
        
    }
}