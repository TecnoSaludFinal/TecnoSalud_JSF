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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "PACIENTES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pacientes.findAll", query = "SELECT p FROM Pacientes p"),
    @NamedQuery(name = "Pacientes.findByNuhsa", query = "SELECT p FROM Pacientes p WHERE p.nuhsa = :nuhsa"),
    @NamedQuery(name = "Pacientes.findByNombre", query = "SELECT p FROM Pacientes p WHERE p.nombre = :nombre"),
    @NamedQuery(name = "Pacientes.findByApellidos", query = "SELECT p FROM Pacientes p WHERE p.apellidos = :apellidos"),
    @NamedQuery(name = "Pacientes.findByDni", query = "SELECT p FROM Pacientes p WHERE p.dni = :dni"),
    @NamedQuery(name = "Pacientes.findByDireccion", query = "SELECT p FROM Pacientes p WHERE p.direccion = :direccion"),
    @NamedQuery(name = "Pacientes.findByFechaNacimiento", query = "SELECT p FROM Pacientes p WHERE p.fechaNacimiento = :fechaNacimiento"),
    @NamedQuery(name = "Pacientes.findByContrasena", query = "SELECT p FROM Pacientes p WHERE p.contrasena = :contrasena")})
public class Pacientes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "NUHSA")
    private Integer nuhsa;
    @Size(max = 50)
    @Column(name = "NOMBRE")
    private String nombre;
    @Size(max = 100)
    @Column(name = "APELLIDOS")
    private String apellidos;
    @Size(max = 9)
    @Column(name = "DNI")
    private String dni;
    @Size(max = 100)
    @Column(name = "DIRECCION")
    private String direccion;
    @Column(name = "FECHA_NACIMIENTO")
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;
    @Size(max = 45)
    @Column(name = "CONTRASENA")
    private String contrasena;
    @JoinColumn(name = "ID_ROL", referencedColumnName = "ID_ROL")
    @ManyToOne(optional = false)
    private Roles idRol;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "nuhsaPaciente")
    private Collection<PeticionCita> peticionCitaCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "nuhsaPaciente")
    private Collection<HistorialMedico> historialMedicoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "nuhsaPaciente")
    private Collection<Formulario> formularioCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "nushaPaciente")
    private Collection<Citas> citasCollection;

    public Pacientes() {
    }

    public Pacientes(Integer nuhsa) {
        this.nuhsa = nuhsa;
    }
    
    public Pacientes(Integer nuhsa, String nombre, String apellidos, String dni, String direccion, Date fecha, String clave)
    {
        this.nuhsa = nuhsa;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.dni = dni;
        this.direccion = direccion;
        this.fechaNacimiento = fecha;
        this.contrasena = clave;
        this.idRol = new Roles(1);
    }

    public Integer getNuhsa() {
        return nuhsa;
    }

    public void setNuhsa(Integer nuhsa) {
        this.nuhsa = nuhsa;
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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Roles getIdRol() {
        return idRol;
    }

    public void setIdRol(Roles idRol) {
        this.idRol = idRol;
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
    public Collection<Formulario> getFormularioCollection() {
        return formularioCollection;
    }

    public void setFormularioCollection(Collection<Formulario> formularioCollection) {
        this.formularioCollection = formularioCollection;
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
        hash += (nuhsa != null ? nuhsa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pacientes)) {
            return false;
        }
        Pacientes other = (Pacientes) object;
        if ((this.nuhsa == null && other.nuhsa != null) || (this.nuhsa != null && !this.nuhsa.equals(other.nuhsa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.Pacientes[ nuhsa=" + nuhsa + " ]";
    }
    
}
