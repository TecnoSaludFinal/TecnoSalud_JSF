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
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JoseAntonio
 */
@ManagedBean(name="crearsolicituddatos")
@SessionScoped
public class CrearSolicitudBean {
    @EJB
    private MedicosFacadeLocal medicosFacade;
    @EJB
    private MensajesFacadeLocal mensajesFacade;
    
    private Integer id;
    private String contenido;
    private Date fecha = new Date();
    private String hora;
    private String remitente;
    private String destinatario;
    private String tipo_mensaje;
    private String estado;
    
    List<Mensajes> listaMensajes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(fecha);
        
        Integer hour = cal.get(Calendar.HOUR);
        Integer minu = cal.get(Calendar.MINUTE);
        Integer segu = cal.get(Calendar.SECOND);
        
        hora = hour+":"+minu+":"+segu;
        
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getRemitente() {
        
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        HttpSession sesion = (HttpSession) context.getExternalContext().getSession(true);
        Medicos p = (Medicos) sesion.getAttribute("entidad");
        remitente = p.getDni();
        
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getDestinatario() {
        destinatario= "Administrador";
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getTipo_mensaje() {
        tipo_mensaje= "CPM";
        
        return tipo_mensaje;
    }

    public void setTipo_mensaje(String tipo_mensaje) {
        this.tipo_mensaje = tipo_mensaje;
    }

    public String getEstado() {
        return estado ="P";
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<Mensajes> getListaMensajes() {
        return listaMensajes;
    }

    public void setListaMensajes(List<Mensajes> listaMensajes) {
        this.listaMensajes = listaMensajes;
    }
    
    
    public void Crear()
    {
        
       
        Mensajes m = new Mensajes();
        
        listaMensajes = (List<Mensajes>) mensajesFacade.findAll();
        id = listaMensajes.size() + 1;
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(fecha);
        Integer hour = cal.get(Calendar.HOUR);
        Integer minu = cal.get(Calendar.MINUTE) + 1;
        Integer segu = cal.get(Calendar.SECOND);
        String h = hour+":"+minu+":"+segu;
        
        m.setIdMensajes(id);
        m.setContenido(contenido);
        m.setFecha(fecha);
        m.setHora(h);
        m.setRemitente(remitente);
        m.setDestinatario(destinatario);
        m.setTipoMensaje(tipo_mensaje);
        m.setEstado(estado);
        
        mensajesFacade.create(m);
  }
   
    
    /**
     * Creates a new instance of CrearSolicitudBean
     */
    public CrearSolicitudBean() {
    }
    
}
