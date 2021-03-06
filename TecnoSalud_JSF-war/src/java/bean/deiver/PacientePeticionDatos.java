/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.deiver;

import app.dao.MensajesFacadeLocal;
import app.entity.Mensajes;
import app.entity.Pacientes;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deiver
 */
@ManagedBean(name = "pacientePeticionDatos")
@SessionScoped
public class PacientePeticionDatos
{
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
    
    

    /**
     * Creates a new instance of PacientePeticionDatos
     */
    public PacientePeticionDatos() {
    }

    public MensajesFacadeLocal getMensajesFacade() {
        return mensajesFacade;
    }

    public void setMensajesFacade(MensajesFacadeLocal mensajesFacade) {
        this.mensajesFacade = mensajesFacade;
    }

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

    public java.util.Date getFecha() {
        return fecha;
    }

    public void setFecha(java.util.Date fecha) {
        this.fecha = fecha;
    }

    public String getHora()
    {
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
        HttpSession session = (HttpSession) context.getExternalContext().getSession(true);
        Pacientes p = (Pacientes) session.getAttribute("entidad");
        
        remitente = p.getDni();
        
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getDestinatario() {
        destinatario = "PA";
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getTipo_mensaje() {
        tipo_mensaje = "cambioDato";
        return tipo_mensaje;
    }

    public void setTipo_mensaje(String tipo_mensaje) {
        this.tipo_mensaje = tipo_mensaje;
    }

    public String getEstado() {
        estado = "P";
        return estado;
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
    
    public String Crear()
    {
        if(remitente.isEmpty())
        {
            return "entidadNula";
        }
        Mensajes m = new Mensajes();

        listaMensajes = (List<Mensajes>) mensajesFacade.findAll();
        id = listaMensajes.size() + 1;

        Calendar cal = Calendar.getInstance();
        cal.setTime(fecha);

        Integer hour = cal.get(Calendar.HOUR);
        Integer minu = cal.get(Calendar.MINUTE);
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
        
        return "modificado";
    }
}
