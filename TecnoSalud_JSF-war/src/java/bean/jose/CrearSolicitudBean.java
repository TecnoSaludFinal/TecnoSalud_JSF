/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.jose;

import app.dao.MedicosFacadeLocal;
import app.dao.MensajesFacadeLocal;
import app.entity.Administrador;
import app.entity.Medicos;
import app.entity.Mensajes;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JoseAntonio
 */
@ManagedBean(name="crearsolicituddatos")
@RequestScoped
public class CrearSolicitudBean {
    @EJB
    private MedicosFacadeLocal medicosFacade;
    @EJB
    private MensajesFacadeLocal mensajesFacade;
    
    private String asunto;
    private String descripcion;
    private Integer medicoId;
    private Date fecnac=new Date();

    public Date getFecnac() {
        return fecnac;
    }

    public void setFecnac(Date fecnac) {
        this.fecnac = fecnac;
    }


    
    List<Medicos> medicos;
    Administrador admin;

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getMedicoId() {
        return medicoId;
    }

    public void setMedicoId(Integer medicoId) {
        this.medicoId = medicoId;
    }
    
    public String doNavigation() throws ParseException
    {
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        HttpSession sesion = (HttpSession) context.getExternalContext().getSession(true);
        Integer numElem = mensajesFacade.findAll().size();
        Medicos p = (Medicos) sesion.getAttribute("entidad");

        //EnviarSolicitud enviar = new EnviarSolicitud();
      //  enviar.enviar(admin.getEmail(), asunto, descripcion);
        Mensajes mens = new Mensajes();
        
       
       Date fecha=new Date(); 
 
             
       
        mens.setIdMensajes(numElem+1);
        mens.setContenido(descripcion);
        mens.setFecha();
        mens.setHora();
        mens.setDestinatario("Administrador");
        mens.setRemitente(p.getDni());
        mens.setTipoMensaje("CambioDatosPersonales");
        mens.setEstado("P");
        
        
        mensajesFacade.create(mens);
        
        
        return "CrearSolicitudBean";
        
    }

    
    
    /**
     * Creates a new instance of CrearSolicitudBean
     */
    public CrearSolicitudBean() {
    }
    
}
