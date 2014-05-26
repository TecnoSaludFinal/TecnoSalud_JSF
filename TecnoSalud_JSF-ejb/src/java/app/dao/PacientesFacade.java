/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package app.dao;

import java.util.List;
import app.entity.Pacientes;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Deiver
 */
@Stateless
public class PacientesFacade extends AbstractFacade<Pacientes> implements PacientesFacadeLocal {
    @PersistenceContext(unitName = "TecnoSalud_JSF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PacientesFacade() {
        super(Pacientes.class);
    }
    
    @Override
    public Pacientes findByDni(String dni, String pass)
    {
        Pacientes p;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT p FROM Pacientes p WHERE p.dni = :dni AND p.contrasena = :pass")
                    .setParameter("dni", dni)
                    .setParameter("pass", pass);
            //q = em.createNamedQuery("Pacientes.findByDni").setParameter("dni", dni); //No funciona
            p = (Pacientes) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return p;   
    }
    
    @Override
    public Pacientes findByNuhsa(Integer nuhsa)
    {
        Pacientes p;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT p FROM Pacientes p WHERE p.nuhsa = :nuhsa").setParameter("nuhsa", nuhsa);
            //q = em.createNamedQuery("Pacientes.findByDni").setParameter("dni", dni); //No funciona
            p = (Pacientes) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return p;   
    }
    
    @Override
    public Pacientes findByDni(String dni)
    {
        Pacientes p;
        Query q;
        
        try
        {
            q = em.createQuery("SELECT p FROM Pacientes p WHERE p.dni = :dni")
                    .setParameter("dni", dni);
                    
            //q = em.createNamedQuery("Pacientes.findByDni").setParameter("dni", dni); //No funciona
            p = (Pacientes) q.getSingleResult();
        }
        catch(NoResultException e)
        {
            return null;
        }
        return p;   
    }
    
    @Override
    public List<Pacientes> findAll_fecha()
    {
        List<Pacientes> p;
        Query q;
        q = em.createQuery("SELECT p FROM Pacientes p ORDER BY p.fechaNacimiento ASC");
        p = q.getResultList();
        return p;
    }    
}
