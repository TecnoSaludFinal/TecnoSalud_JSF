/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.deiver;

import app.dao.PacientesFacadeLocal;
import app.entity.Pacientes;
import app.entity.Roles;
import java.sql.Date;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deiver
 */
@Named(value = "pacienteDatosPersonales")
@RequestScoped
public class PacienteDatosPersonales
{
    @EJB
    private PacientesFacadeLocal pacientesFacade;
    
    HttpSession session;
    private Pacientes p;

    /**
     * Creates a new instance of PacienteDatosPersonales
     */
    public PacienteDatosPersonales(){
    }

    public Pacientes getP()
    {
        p = (Pacientes) pacientesFacade.findByDni("11111111P");
        return p;
    }

    public void setP(Pacientes p) {
        this.p = p;
    }
}
