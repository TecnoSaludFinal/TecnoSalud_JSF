/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.inma;

import app.dao.MedicosFacade;
import app.dao.MedicosFacadeLocal;
import app.entity.Medicos;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author Inma
 */
@Named(value = "medicoBean")
@RequestScoped
public class MedicoBean 
{
    @EJB
    private MedicosFacadeLocal facadeMedico;
    private Medicos medicoSeleccionado;
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public Medicos getMedicoSeleccionado() 
    {
        return medicoSeleccionado;
    }

    public void setMedicoSeleccionado(Medicos medicoSeleccionado) 
    {
        this.medicoSeleccionado = medicoSeleccionado;
    }

    
}
