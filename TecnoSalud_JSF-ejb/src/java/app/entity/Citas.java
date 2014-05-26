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
@Table(name = "CITAS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Citas.findAll", query = "SELECT c FROM Citas c"),
    @NamedQuery(name = "Citas.findByIdCitas", query = "SELECT c FROM Citas c WHERE c.idCitas = :idCitas"),
    @NamedQuery(name = "Citas.findByFecha", query = "SELECT c FROM Citas c WHERE c.fecha = :fecha"),
    @NamedQuery(name = "Citas.findByLocalizacion", query = "SELECT c FROM Citas c WHERE c.localizacion = :localizacion")})
public class Citas implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_CITAS")
    private Integer idCitas;
    @Column(name = "FECHA")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 50)
    @Column(name = "LOCALIZACION")
    private String localizacion;
    @JoinColumn(name = "NUSHA_PACIENTE", referencedColumnName = "NUHSA")
    @ManyToOne(optional = false)
    private Pacientes nushaPaciente;
    @JoinColumn(name = "ID_MEDICOS", referencedColumnName = "ID_MEDICOS")
    @ManyToOne(optional = false)
    private Medicos idMedicos;
    @JoinColumn(name = "ID_HORA", referencedColumnName = "ID_HORA")
    @ManyToOne(optional = false)
    private Hora idHora;
    @JoinColumn(name = "ID_ESPECIALIDAD", referencedColumnName = "ID_ESPECIALIDAD")
    @ManyToOne(optional = false)
    private Especialidad idEspecialidad;

    public Citas() {
    }

    public Citas(Integer idCitas) {
        this.idCitas = idCitas;
    }

    public Integer getIdCitas() {
        return idCitas;
    }

    public void setIdCitas(Integer idCitas) {
        this.idCitas = idCitas;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getLocalizacion() {
        return localizacion;
    }

    public void setLocalizacion(String localizacion) {
        this.localizacion = localizacion;
    }

    public Pacientes getNushaPaciente() {
        return nushaPaciente;
    }

    public void setNushaPaciente(Pacientes nushaPaciente) {
        this.nushaPaciente = nushaPaciente;
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
        hash += (idCitas != null ? idCitas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Citas)) {
            return false;
        }
        Citas other = (Citas) object;
        if ((this.idCitas == null && other.idCitas != null) || (this.idCitas != null && !this.idCitas.equals(other.idCitas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.Citas[ idCitas=" + idCitas + " ]";
    }
    
}
