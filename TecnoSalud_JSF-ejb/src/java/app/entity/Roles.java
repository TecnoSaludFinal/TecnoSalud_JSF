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
@Table(name = "ROLES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Roles.findAll", query = "SELECT r FROM Roles r"),
    @NamedQuery(name = "Roles.findByIdRol", query = "SELECT r FROM Roles r WHERE r.idRol = :idRol"),
    @NamedQuery(name = "Roles.findByTipoRol", query = "SELECT r FROM Roles r WHERE r.tipoRol = :tipoRol")})
public class Roles implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_ROL")
    private Integer idRol;
    @Size(max = 50)
    @Column(name = "TIPO_ROL")
    private String tipoRol;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRol")
    private Collection<Pacientes> pacientesCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRol")
    private Collection<Medicos> medicosCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRol")
    private Collection<Administrador> administradorCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idRol")
    private Collection<PersonalAdministrativo> personalAdministrativoCollection;

    public Roles() {
    }

    public Roles(Integer idRol) {
        this.idRol = idRol;
    }

    public Integer getIdRol() {
        return idRol;
    }

    public void setIdRol(Integer idRol) {
        this.idRol = idRol;
    }

    public String getTipoRol() {
        return tipoRol;
    }

    public void setTipoRol(String tipoRol) {
        this.tipoRol = tipoRol;
    }

    @XmlTransient
    public Collection<Pacientes> getPacientesCollection() {
        return pacientesCollection;
    }

    public void setPacientesCollection(Collection<Pacientes> pacientesCollection) {
        this.pacientesCollection = pacientesCollection;
    }

    @XmlTransient
    public Collection<Medicos> getMedicosCollection() {
        return medicosCollection;
    }

    public void setMedicosCollection(Collection<Medicos> medicosCollection) {
        this.medicosCollection = medicosCollection;
    }

    @XmlTransient
    public Collection<Administrador> getAdministradorCollection() {
        return administradorCollection;
    }

    public void setAdministradorCollection(Collection<Administrador> administradorCollection) {
        this.administradorCollection = administradorCollection;
    }

    @XmlTransient
    public Collection<PersonalAdministrativo> getPersonalAdministrativoCollection() {
        return personalAdministrativoCollection;
    }

    public void setPersonalAdministrativoCollection(Collection<PersonalAdministrativo> personalAdministrativoCollection) {
        this.personalAdministrativoCollection = personalAdministrativoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idRol != null ? idRol.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Roles)) {
            return false;
        }
        Roles other = (Roles) object;
        if ((this.idRol == null && other.idRol != null) || (this.idRol != null && !this.idRol.equals(other.idRol))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.Roles[ idRol=" + idRol + " ]";
    }
    
}
