/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.entity;

import java.io.Serializable;
import java.text.DateFormat;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Deiver
 */
@Entity
@Table(name = "MENSAJES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mensajes.findAll", query = "SELECT m FROM Mensajes m"),
    @NamedQuery(name = "Mensajes.findByIdMensajes", query = "SELECT m FROM Mensajes m WHERE m.idMensajes = :idMensajes"),
    @NamedQuery(name = "Mensajes.findByContenido", query = "SELECT m FROM Mensajes m WHERE m.contenido = :contenido"),
    @NamedQuery(name = "Mensajes.findByFecha", query = "SELECT m FROM Mensajes m WHERE m.fecha = :fecha"),
    @NamedQuery(name = "Mensajes.findByHora", query = "SELECT m FROM Mensajes m WHERE m.hora = :hora"),
    @NamedQuery(name = "Mensajes.findByRemitente", query = "SELECT m FROM Mensajes m WHERE m.remitente = :remitente"),
    @NamedQuery(name = "Mensajes.findByDestinatario", query = "SELECT m FROM Mensajes m WHERE m.destinatario = :destinatario"),
    @NamedQuery(name = "Mensajes.findByTipoMensaje", query = "SELECT m FROM Mensajes m WHERE m.tipoMensaje = :tipoMensaje"),
    @NamedQuery(name = "Mensajes.findByEstado", query = "SELECT m FROM Mensajes m WHERE m.estado = :estado")})
public class Mensajes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_MENSAJES")
    private Integer idMensajes;
    @Size(max = 1000)
    @Column(name = "CONTENIDO")
    private String contenido;
    @Column(name = "FECHA")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 8)
    @Column(name = "HORA")
    private String hora;
    @Size(max = 100)
    @Column(name = "REMITENTE")
    private String remitente;
    @Size(max = 100)
    @Column(name = "DESTINATARIO")
    private String destinatario;
    @Size(max = 10)
    @Column(name = "TIPO_MENSAJE")
    private String tipoMensaje;
    @Size(max = 1)
    @Column(name = "ESTADO")
    private String estado;

    public Mensajes() {
    }

    public Mensajes(Integer idMensajes) {
        this.idMensajes = idMensajes;
    }

    public Integer getIdMensajes() {
        return idMensajes;
    }

    public void setIdMensajes(Integer idMensajes) {
        this.idMensajes = idMensajes;
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
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getRemitente() {
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getTipoMensaje() {
        return tipoMensaje;
    }

    public void setTipoMensaje(String tipoMensaje) {
        this.tipoMensaje = tipoMensaje;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMensajes != null ? idMensajes.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mensajes)) {
            return false;
        }
        Mensajes other = (Mensajes) object;
        if ((this.idMensajes == null && other.idMensajes != null) || (this.idMensajes != null && !this.idMensajes.equals(other.idMensajes))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.Mensajes[ idMensajes=" + idMensajes + " ]";
    }

    public void setFecha(DateFormat dateFormat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
