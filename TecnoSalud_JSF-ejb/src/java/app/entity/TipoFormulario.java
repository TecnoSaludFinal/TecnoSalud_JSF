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
@Table(name = "TIPO_FORMULARIO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TipoFormulario.findAll", query = "SELECT t FROM TipoFormulario t"),
    @NamedQuery(name = "TipoFormulario.findByIdTipoform", query = "SELECT t FROM TipoFormulario t WHERE t.idTipoform = :idTipoform"),
    @NamedQuery(name = "TipoFormulario.findByTipo", query = "SELECT t FROM TipoFormulario t WHERE t.tipo = :tipo")})
public class TipoFormulario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_TIPOFORM")
    private Integer idTipoform;
    @Size(max = 25)
    @Column(name = "TIPO")
    private String tipo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idTipoform")
    private Collection<Formulario> formularioCollection;

    public TipoFormulario() {
    }

    public TipoFormulario(Integer idTipoform) {
        this.idTipoform = idTipoform;
    }

    public Integer getIdTipoform() {
        return idTipoform;
    }

    public void setIdTipoform(Integer idTipoform) {
        this.idTipoform = idTipoform;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @XmlTransient
    public Collection<Formulario> getFormularioCollection() {
        return formularioCollection;
    }

    public void setFormularioCollection(Collection<Formulario> formularioCollection) {
        this.formularioCollection = formularioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoform != null ? idTipoform.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoFormulario)) {
            return false;
        }
        TipoFormulario other = (TipoFormulario) object;
        if ((this.idTipoform == null && other.idTipoform != null) || (this.idTipoform != null && !this.idTipoform.equals(other.idTipoform))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.TipoFormulario[ idTipoform=" + idTipoform + " ]";
    }
    
}
