/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Deiver
 */
@Entity
@Table(name = "TIPO_CITA")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoCita.findAll", query = "SELECT t FROM TipoCita t"),
    @NamedQuery(name = "TipoCita.findByIdTipo", query = "SELECT t FROM TipoCita t WHERE t.idTipo = :idTipo"),
    @NamedQuery(name = "TipoCita.findByNombre", query = "SELECT t FROM TipoCita t WHERE t.nombre = :nombre")})
public class TipoCita implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_TIPO")
    private Integer idTipo;
    @Size(max = 15)
    @Column(name = "NOMBRE")
    private String nombre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idTipo")
    private Collection<PeticionCita> peticionCitaCollection;

    public TipoCita() {
    }

    public TipoCita(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public Integer getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public Collection<PeticionCita> getPeticionCitaCollection() {
        return peticionCitaCollection;
    }

    public void setPeticionCitaCollection(Collection<PeticionCita> peticionCitaCollection) {
        this.peticionCitaCollection = peticionCitaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipo != null ? idTipo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoCita)) {
            return false;
        }
        TipoCita other = (TipoCita) object;
        if ((this.idTipo == null && other.idTipo != null) || (this.idTipo != null && !this.idTipo.equals(other.idTipo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.TipoCita[ idTipo=" + idTipo + " ]";
    }
    
}
