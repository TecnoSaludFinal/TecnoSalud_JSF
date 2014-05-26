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
@Table(name = "FORMULARIO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Formulario.findAll", query = "SELECT f FROM Formulario f"),
    @NamedQuery(name = "Formulario.findByIdFormulario", query = "SELECT f FROM Formulario f WHERE f.idFormulario = :idFormulario"),
    @NamedQuery(name = "Formulario.findByComentario", query = "SELECT f FROM Formulario f WHERE f.comentario = :comentario"),
    @NamedQuery(name = "Formulario.findByFecha", query = "SELECT f FROM Formulario f WHERE f.fecha = :fecha")})
public class Formulario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_FORMULARIO")
    private Integer idFormulario;
    @Size(max = 1000)
    @Column(name = "COMENTARIO")
    private String comentario;
    @Column(name = "FECHA")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @JoinColumn(name = "ID_TIPOFORM", referencedColumnName = "ID_TIPOFORM")
    @ManyToOne(optional = false)
    private TipoFormulario idTipoform;
    @JoinColumn(name = "NUHSA_PACIENTE", referencedColumnName = "NUHSA")
    @ManyToOne(optional = false)
    private Pacientes nuhsaPaciente;

    public Formulario() {
    }

    public Formulario(Integer idFormulario) {
        this.idFormulario = idFormulario;
    }

    public Integer getIdFormulario() {
        return idFormulario;
    }

    public void setIdFormulario(Integer idFormulario) {
        this.idFormulario = idFormulario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public TipoFormulario getIdTipoform() {
        return idTipoform;
    }

    public void setIdTipoform(TipoFormulario idTipoform) {
        this.idTipoform = idTipoform;
    }

    public Pacientes getNuhsaPaciente() {
        return nuhsaPaciente;
    }

    public void setNuhsaPaciente(Pacientes nuhsaPaciente) {
        this.nuhsaPaciente = nuhsaPaciente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFormulario != null ? idFormulario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Formulario)) {
            return false;
        }
        Formulario other = (Formulario) object;
        if ((this.idFormulario == null && other.idFormulario != null) || (this.idFormulario != null && !this.idFormulario.equals(other.idFormulario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.Formulario[ idFormulario=" + idFormulario + " ]";
    }
    
}
