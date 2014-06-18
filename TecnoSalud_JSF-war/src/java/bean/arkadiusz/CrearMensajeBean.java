/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bean.arkadiusz;

import app.dao.AdministradorFacadeLocal;
import app.dao.MensajesFacadeLocal;
import app.dao.PacientesFacadeLocal;
import app.entity.Administrador;
import app.entity.Mensajes;
import app.entity.Pacientes;
import app.entity.PersonalAdministrativo;
import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.SelectItem;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JoseAntonio
 */
@ManagedBean(name="crearMensajeArkadio")
@RequestScoped
public class CrearMensajeBean implements Serializable{
    @EJB
    private AdministradorFacadeLocal afl;
    @EJB
    private PacientesFacadeLocal pfl;
    @EJB
    private MensajesFacadeLocal mfl;
    
    private String hora;
    private String destinatario, contenido, remitente, estado;
    private static String ayuda_ajax;
    private String tipo_mensaje;
    private Date fecha = new Date();

    List<Mensajes> listaMensajes;
    List<Administrador> lista = new ArrayList<Administrador>();
    
    private static boolean disabled = true;

    public boolean isDisabled() {
        return disabled;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }
    
    public List<Administrador> getLista() {
       
        if("0".equals(ayuda_ajax))
        {
            disabled = true;
        }
        if("1".equals(ayuda_ajax))
        {
            disabled = false;
            for(Administrador nameAdm: afl.findAll())
            {
                lista.add(nameAdm);
            }
            
        }
        else if("2".equals(ayuda_ajax))
        {
            disabled = false;
            List<Pacientes> lista_pacientes;
            lista_pacientes = pfl.findAll();
            Administrador[] admin = new Administrador[lista_pacientes.size()];
            
            for(int i = 0; i< lista_pacientes.size(); i++)
            {
                admin[i] = new Administrador();
                admin[i].setApellidos(lista_pacientes.get(i).getApellidos());
                admin[i].setNombre(lista_pacientes.get(i).getNombre());
                admin[i].setDni(lista_pacientes.get(i).getDni());
                lista.add(admin[i]);
            }
        }
        return lista;
    }

    
    
    public void setLista(List<Administrador> lista) {
        this.lista = lista;
    }
    
    public String getAyuda_ajax() {
        return ayuda_ajax;
    }

    public void setAyuda_ajax(String ayuda_ajax) {
        this.ayuda_ajax = ayuda_ajax;
    }
    
    public String getDate()
    {
      SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
      String fecha2 = sdf.format(fecha);
      return fecha2;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
              
        this.fecha = fecha;
    }    
    
    
    public void setDestinatario(String destinatario)
    {
        this.destinatario = destinatario;
    }
    
    public String getDestinatario()
    {
        return destinatario;
    }
    
    public void setContenido(String contenido)
    {
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        HttpSession sesion = (HttpSession) context.getExternalContext().getSession(true);
        PersonalAdministrativo personal = (PersonalAdministrativo) sesion.getAttribute("entidad");
        remitente = personal.getDni();
        this.contenido = contenido;
    }
    
    public String getContenido()
    {
        return contenido;
    }
    
    public String getTipo_mensaje() {
        
        if("1".equals(ayuda_ajax))
        {
            disabled = false;
        }
        else if("2".equals(ayuda_ajax))
        {
            tipo_mensaje ="PM";
            disabled = true;
        }
        else
        {
            disabled = true;
        }
        return tipo_mensaje;
    }

    public void setTipo_mensaje(String tipo_mensaje) {
        this.tipo_mensaje = tipo_mensaje;
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
    
    
    public CrearMensajeBean() {
    }
    
    
    public String getRemitente() {
        FacesContext context = javax.faces.context.FacesContext.getCurrentInstance();
        HttpSession sesion = (HttpSession) context.getExternalContext().getSession(true);
        PersonalAdministrativo personal = (PersonalAdministrativo) sesion.getAttribute("entidad");
        remitente = personal.getDni();
        
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }
    
    public String getEstado() {
        estado = "P";
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public void doMensaje() throws IOException
    {
        if(ayuda_ajax == "2")
        {
            tipo_mensaje = "PM";
        }
        
        Mensajes message = new Mensajes();
        int id;
    
        
        
        listaMensajes = (List<Mensajes>) mfl.findAll();
        id = listaMensajes.size() + 1;
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(fecha);
        Integer hour = cal.get(Calendar.HOUR);
        Integer minu = cal.get(Calendar.MINUTE) + 1;
        Integer segu = cal.get(Calendar.SECOND);
        String h = hour+":"+minu+":"+segu;
        /*
        valores de TipoMensaje
        PM - peticion modificar los datos
        WP - wiadomosc prywatna // mensaje privada
        */
        estado = "P";
        remitente = getRemitente();
        message.setIdMensajes(id);
        message.setContenido(contenido);
        message.setEstado(estado);
        message.setTipoMensaje(tipo_mensaje);
        message.setRemitente(remitente);
        message.setDestinatario(destinatario);
        message.setFecha(fecha);
        message.setHora(h);
        
        mfl.create(message);
        FacesContext.getCurrentInstance().getExternalContext().redirect("/TecnoSalud_JSF-war/faces/arkadiusz_jsf/ListarMensajesArkadioLeidos.xhtml");
        
    }
    
    
}
