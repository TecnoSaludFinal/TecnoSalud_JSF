/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Deiver
 */
@Entity
@Table(name = "HORA")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Hora.findAll", query = "SELECT h FROM Hora h"),
    @NamedQuery(name = "Hora.findByIdHora", query = "SELECT h FROM Hora h WHERE h.idHora = :idHora"),
    @NamedQuery(name = "Hora.findByHora", query = "SELECT h FROM Hora h WHERE h.hora = :hora"),
    @NamedQuery(name = "Hora.findByDisponibilidad", query = "SELECT h FROM Hora h WHERE h.disponibilidad = :disponibilidad")})
public class Hora implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_HORA")
    private Integer idHora;
    @Basic(optional = false)
    @NotNull
    @Column(name = "HORA")
    @Temporal(TemporalType.TIME)
    private Date hora;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "DISPONIBILIDAD")
    private String disponibilidad;
    @OneToMany(mappedBy = "idHora")
    private Collection<PeticionCita> peticionCitaCollection;
    @OneToMany(mappedBy = "idHora")
    private Collection<HistorialMedico> historialMedicoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idHora")
    private Collection<Citas> citasCollection;

    public Hora() {
    }

    public Hora(Integer idHora) {
        this.idHora = idHora;
    }

    public Hora(Integer idHora, Date hora, String disponibilidad) {
        this.idHora = idHora;
        this.hora = hora;
        this.disponibilidad = disponibilidad;
    }

    public Integer getIdHora() {
        return idHora;
    }

    public void setIdHora(Integer idHora) {
        this.idHora = idHora;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public String getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    @XmlTransient
    public Collection<PeticionCita> getPeticionCitaCollection() {
        return peticionCitaCollection;
    }

    public void setPeticionCitaCollection(Collection<PeticionCita> peticionCitaCollection) {
        this.peticionCitaCollection = peticionCitaCollection;
    }

    @XmlTransient
    public Collection<HistorialMedico> getHistorialMedicoCollection() {
        return historialMedicoCollection;
    }

    public void setHistorialMedicoCollection(Collection<HistorialMedico> historialMedicoCollection) {
        this.historialMedicoCollection = historialMedicoCollection;
    }

    @XmlTransient
    public Collection<Citas> getCitasCollection() {
        return citasCollection;
    }

    public void setCitasCollection(Collection<Citas> citasCollection) {
        this.citasCollection = citasCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idHora != null ? idHora.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Hora)) {
            return false;
        }
        Hora other = (Hora) object;
        if ((this.idHora == null && other.idHora != null) || (this.idHora != null && !this.idHora.equals(other.idHora))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.Hora[ idHora=" + idHora + " ]";
    }
    
}
