/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Deiver
 */
@Entity
@Table(name = "PERSONAL_ADMINISTRATIVO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PersonalAdministrativo.findAll", query = "SELECT p FROM PersonalAdministrativo p"),
    @NamedQuery(name = "PersonalAdministrativo.findByIdPersonalAdmin", query = "SELECT p FROM PersonalAdministrativo p WHERE p.idPersonalAdmin = :idPersonalAdmin"),
    @NamedQuery(name = "PersonalAdministrativo.findByNombre", query = "SELECT p FROM PersonalAdministrativo p WHERE p.nombre = :nombre"),
    @NamedQuery(name = "PersonalAdministrativo.findByApellidos", query = "SELECT p FROM PersonalAdministrativo p WHERE p.apellidos = :apellidos"),
    @NamedQuery(name = "PersonalAdministrativo.findByContrasena", query = "SELECT p FROM PersonalAdministrativo p WHERE p.contrasena = :contrasena"),
    @NamedQuery(name = "PersonalAdministrativo.findByEmail", query = "SELECT p FROM PersonalAdministrativo p WHERE p.email = :email"),
    @NamedQuery(name = "PersonalAdministrativo.findByDni", query = "SELECT p FROM PersonalAdministrativo p WHERE p.dni = :dni")})
public class PersonalAdministrativo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_PERSONAL_ADMIN")
    private Integer idPersonalAdmin;
    @Size(max = 50)
    @Column(name = "NOMBRE")
    private String nombre;
    @Size(max = 100)
    @Column(name = "APELLIDOS")
    private String apellidos;
    @Size(max = 45)
    @Column(name = "CONTRASENA")
    private String contrasena;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 45)
    @Column(name = "EMAIL")
    private String email;
    @Size(max = 9)
    @Column(name = "DNI")
    private String dni;
    @JoinColumn(name = "ID_ROL", referencedColumnName = "ID_ROL")
    @ManyToOne(optional = false)
    private Roles idRol;

    public PersonalAdministrativo() {
    }

    public PersonalAdministrativo(Integer idPersonalAdmin) {
        this.idPersonalAdmin = idPersonalAdmin;
    }

    public Integer getIdPersonalAdmin() {
        return idPersonalAdmin;
    }

    public void setIdPersonalAdmin(Integer idPersonalAdmin) {
        this.idPersonalAdmin = idPersonalAdmin;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPersonalAdmin != null ? idPersonalAdmin.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PersonalAdministrativo)) {
            return false;
        }
        PersonalAdministrativo other = (PersonalAdministrativo) object;
        if ((this.idPersonalAdmin == null && other.idPersonalAdmin != null) || (this.idPersonalAdmin != null && !this.idPersonalAdmin.equals(other.idPersonalAdmin))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "app.entity.PersonalAdministrativo[ idPersonalAdmin=" + idPersonalAdmin + " ]";
    }
    
}
