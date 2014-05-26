/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "PETICION_CITA")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PeticionCita.findAll", query = "SELECT p FROM PeticionCita p"),
    @NamedQuery(name = "PeticionCita.findByIdPeticion", query = "SELECT p FROM PeticionCita p WHERE p.idPeticion = :idPeticion"),
    @NamedQuery(name = "PeticionCita.findByFecha", query = "SELECT p FROM PeticionCita p WHERE p.fecha = :fecha"),
    @NamedQuery(name = "PeticionCita.findByComentario", query = "SELECT p FROM PeticionCita p WHERE p.comentario = :comentario")})
public class PeticionCita implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_PETICION")
    private Integer idPeticion;
    @Column(name = "FECHA")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 255)
    @Column(name = "COMENTARIO")
    private String comentario;
    @JoinColumn(name = "ID_TIPO", referencedColumnName = "ID_TIPO")
    @ManyToOne(optional = false)
    private TipoCita idTipo;
    @JoinColumn(name = "NUHSA_PACIENTE", referencedColumnName = "NUHSA")
    @ManyToOne(optional = false)
    private Pacientes nuhsaPaciente;
    @JoinColumn(name = "ID_HORA", referencedColumnName = "ID_HORA")
    @ManyToOne
    private Hora idHora;

    public PeticionCita() {
    }

    public PeticionCita(Integer idPeticion) {
        this.idPeticion = idPeticion;
    }

    public Integer getIdPeticion() {
        return idPeticion;
    }

    public void setIdPeticion(Integer idPeticion) {
        this.idPeticion = idPeticion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public TipoCita getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(TipoCita idTipo) {
        this.idTipo = idTipo;
    }

    public Pacientes getNuhsaPaciente() {
        return nuhsaPaciente;
    }

    public void setNuhsaPaciente(Pacientes nuhsaPaciente) {
        this.nuhsaPaciente = nuhsaPaciente;
    }

    public Hora getIdHora() {
        return idHora;
    }

    public void setIdHora(Hora idHora) {
        this.idHora = idHora;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPeticion != null ? idPeticion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PeticionCita)) {
            return false;
        }
        PeticionCita other = (PeticionCita) object;
        if ((this.idPeticion == null && other.idPeticion != null) || (this.idPeticion != null && !this.idPeticion.equals(other.idPeticion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.PeticionCita[ idPeticion=" + idPeticion + " ]";
    }
    
}
