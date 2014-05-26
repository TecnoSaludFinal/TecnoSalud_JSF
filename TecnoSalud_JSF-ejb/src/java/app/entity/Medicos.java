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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "MEDICOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medicos.findAll", query = "SELECT m FROM Medicos m"),
    @NamedQuery(name = "Medicos.findByIdMedicos", query = "SELECT m FROM Medicos m WHERE m.idMedicos = :idMedicos"),
    @NamedQuery(name = "Medicos.findByNombre", query = "SELECT m FROM Medicos m WHERE m.nombre = :nombre"),
    @NamedQuery(name = "Medicos.findByApellidos", query = "SELECT m FROM Medicos m WHERE m.apellidos = :apellidos"),
    @NamedQuery(name = "Medicos.findByContrasena", query = "SELECT m FROM Medicos m WHERE m.contrasena = :contrasena"),
    @NamedQuery(name = "Medicos.findByDni", query = "SELECT m FROM Medicos m WHERE m.dni = :dni")})
public class Medicos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_MEDICOS")
    private Integer idMedicos;
    @Size(max = 50)
    @Column(name = "NOMBRE")
    private String nombre;
    @Size(max = 100)
    @Column(name = "APELLIDOS")
    private String apellidos;
    @Size(max = 45)
    @Column(name = "CONTRASENA")
    private String contrasena;
    @Size(max = 9)
    @Column(name = "DNI")
    private String dni;
    @JoinColumn(name = "ID_ROL", referencedColumnName = "ID_ROL")
    @ManyToOne(optional = false)
    private Roles idRol;
    @JoinColumn(name = "ID_ESPECIALIDAD", referencedColumnName = "ID_ESPECIALIDAD")
    @ManyToOne(optional = false)
    private Especialidad idEspecialidad;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idMedicos")
    private Collection<HistorialMedico> historialMedicoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idMedicos")
    private Collection<Citas> citasCollection;

    public Medicos() {
    }

    public Medicos(Integer idMedicos) {
        this.idMedicos = idMedicos;
    }

    public Integer getIdMedicos() {
        return idMedicos;
    }

    public void setIdMedicos(Integer idMedicos) {
        this.idMedicos = idMedicos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Roles getIdRol() {
        return idRol;
    }

    public void setIdRol(Roles idRol) {
        this.idRol = idRol;
    }

    public Especialidad getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(Especialidad idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
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
        hash += (idMedicos != null ? idMedicos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Medicos)) {
            return false;
        }
        Medicos other = (Medicos) object;
        if ((this.idMedicos == null && other.idMedicos != null) || (this.idMedicos != null && !this.idMedicos.equals(other.idMedicos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.Medicos[ idMedicos=" + idMedicos + " ]";
    }
    
}
