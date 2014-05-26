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
@Table(name = "HISTORIAL_MEDICO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HistorialMedico.findAll", query = "SELECT h FROM HistorialMedico h"),
    @NamedQuery(name = "HistorialMedico.findByFecha", query = "SELECT h FROM HistorialMedico h WHERE h.fecha = :fecha"),
    @NamedQuery(name = "HistorialMedico.findByDescripcion", query = "SELECT h FROM HistorialMedico h WHERE h.descripcion = :descripcion"),
    @NamedQuery(name = "HistorialMedico.findByIdHistorial", query = "SELECT h FROM HistorialMedico h WHERE h.idHistorial = :idHistorial")})
public class HistorialMedico implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "FECHA")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 1000)
    @Column(name = "DESCRIPCION")
    private String descripcion;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_HISTORIAL")
    private Integer idHistorial;
    @JoinColumn(name = "NUHSA_PACIENTE", referencedColumnName = "NUHSA")
    @ManyToOne(optional = false)
    private Pacientes nuhsaPaciente;
    @JoinColumn(name = "ID_MEDICOS", referencedColumnName = "ID_MEDICOS")
    @ManyToOne(optional = false)
    private Medicos idMedicos;
    @JoinColumn(name = "ID_HORA", referencedColumnName = "ID_HORA")
    @ManyToOne
    private Hora idHora;
    @JoinColumn(name = "ID_ESPECIALIDAD", referencedColumnName = "ID_ESPECIALIDAD")
    @ManyToOne(optional = false)
    private Especialidad idEspecialidad;

    public HistorialMedico() {
    }

    public HistorialMedico(Integer idHistorial) {
        this.idHistorial = idHistorial;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getIdHistorial() {
        return idHistorial;
    }

    public void setIdHistorial(Integer idHistorial) {
        this.idHistorial = idHistorial;
    }

    public Pacientes getNuhsaPaciente() {
        return nuhsaPaciente;
    }

    public void setNuhsaPaciente(Pacientes nuhsaPaciente) {
        this.nuhsaPaciente = nuhsaPaciente;
    }

    public Medicos getIdMedicos() {
        return idMedicos;
    }

    public void setIdMedicos(Medicos idMedicos) {
        this.idMedicos = idMedicos;
    }

    public Hora getIdHora() {
        return idHora;
    }

    public void setIdHora(Hora idHora) {
        this.idHora = idHora;
    }

    public Especialidad getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(Especialidad idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idHistorial != null ? idHistorial.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HistorialMedico)) {
            return false;
        }
        HistorialMedico other = (HistorialMedico) object;
        if ((this.idHistorial == null && other.idHistorial != null) || (this.idHistorial != null && !this.idHistorial.equals(other.idHistorial))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.HistorialMedico[ idHistorial=" + idHistorial + " ]";
    }
    
}
